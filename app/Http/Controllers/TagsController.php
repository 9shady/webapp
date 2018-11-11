<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TagsController extends Controller
{
    public function index(\App\Tag $tag){
     $post = $tag->posts;
     return view('post.index')->with('post',$post);
    }

}
