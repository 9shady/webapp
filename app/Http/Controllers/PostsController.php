<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Post;
class PostsController extends Controller
{

      /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['index', 'show']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $post= Post::orderby('created_at','desc')->get();
        return view('post.index')->with('post',$post);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {   
        return view('post.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request , [
            'title' => 'required',
            'body' => 'required',
            'cover_image' => 'image|nullable|max:1999'
        ]);
        //handle file upload
        if($request->hasFile('cover_image')){
  $fileNameWithExt = $request->file('cover_image')->getClientOriginalName();
  $fileName = pathinfo($fileNameWithExt, PATHINFO_FILENAME);
  $extension = $request->file('cover_image')->getClientOriginaExtension();
  $fileNameToStore = $filename.'_'.time().'.'.$extension;
  $path = $request->file('cover_image')->storedAs('public/cover_images', $fileNameToStore);

       
        } else{
            $fileNameToStore = 'noimage.jpg';
        }
 

      $post = new Post;
      $post->title = $request->input('title');
      $post->body = $request->input('body');
      $post->user_id= auth()->user()->id;
      $post->cover_image = $fileNameToStore;
      $post->save();

    return redirect('/posts')->with('success', 'Post Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {   $posts = Post::find($id);
        return view('post.show')->with('posts',$posts);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $post = Post::find($id);
        if(auth()->user()->id !== $post->user_id)
        {  
            return redirect('/posts')->with('error', 'Unauthorised Page');
        }
        return view('post.edit')->with('post', $post);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request , [
            'title' => 'required',
            'body' => 'required',
            'custom' => 'image|max:1999'
        ]);
  
        if($request->hasFile('cover_image')){
            $fileNameWithExt = $request->file('cover_image')->getClientOriginalName();
            $fileName = pathinfo($fileNameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('cover_image')->getClientOriginaExtension();
            $fileNameToStore = $filename.'_'.time().'.'.$extension;
            $path = $request->file('cover_image')->storedAs('public/cover_images', $fileNameToStore);
        }
      $post = Post::find($id);
      $post->title = $request->input('title');
      $post->body = $request->input('body');
      if($request->hasFile('cover_image')){
     $post->cover_image = $fileNameToStore ;
      }
      $post->save();

    return redirect('/posts')->with('success', 'Post Updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::find($id);
        if(auth()->user()->id !== $post->user_id)
        {  
            return redirect('/posts')->with('error', 'Unauthorised Page');
        }
        $post->delete();
        return redirect('/posts')->with('success', 'Post Deleted');
    }
}
