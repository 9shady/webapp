@extends('layouts.app')
@section('content')
<h2>POSTS</h2>
<hr>
  @if($post->count() >0)
   @foreach($post as $post)
  <div style= "width:100%" class="card">
    <div class="row">
      <div class="col-md-4 col-sm-4">
      <img style= "width:50%"  src="/webapp/public/storage/cover_images/{{$post->cover_image}}">
      </div>
      <div class="col-md-4 col-sm-4">
          <h3><a href="/webapp/public/posts/{{$post->id}}"> {{$post->title}} </h3>
            <small>Written on {{$post->created_at}} by {{$post->user->name}}</small>   
          
      </div>
   
   </div>
   @endforeach
  

  
  @else

  <p>No Posts Found</p> 
 @endif


@endsection