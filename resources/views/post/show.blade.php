@extends('layouts.app')
@section('content')
 
 <h2>{{$posts->title}}</h2>
 @if(count($posts->tags)>0)
    <ul>
        @foreach($posts->tags as $tag)
        
          <li>
          
          <a href = "/webapp/public/tags/{{$tag->name}}">
            {{$tag->name}}  </a>
           
          </li> 

        @endforeach   
    </ul>
 @endif
 <hr>
 
   
 
     <div class="container">
      <p>{{$posts->body}}</p>
     </div>
  
  <small>Written on {{$posts->created_at}} by {{$posts->user->name}}</small>        
  <br><br>
  <hr>
  <a class="btn btn-primary" href="/webapp/public/posts" >Go Back</a>
 @if(!Auth::guest())
   @if(Auth::user()->id == $posts->user_id)
  <a class="btn btn-primary" href="/webapp/public/posts/{{$posts->id}}/edit">Edit Post</a>
  
  {!!Form::open(['action' => ['PostsController@destroy', $posts->id] , 'method' => 'Post', 'class' =>  'float-right']) !!}    
   {{Form::hidden('_method','DELETE')}}
   {{Form::submit('Delete',['class'=>'btn btn-danger',])}}

  {!!Form::close()  !!}
 
  @endif
  @endif
  
 
  @endsection