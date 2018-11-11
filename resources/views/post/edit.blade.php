@extends('layouts.app')
@section('content')
<h2>Edit Post</h2>
<hr>
{!! Form::open(['action' => ['PostsController@update', $post->id ], 'method'=> 'Post']) !!}
<div class= "form-group">  
{{Form::label('title', 'Title')}} 
{{Form::text('title', $post->title, ['class' => 'form-control' ,'placeholder'=> 'Title' ])}}
<br><br>
{{Form::label('body', 'Content')}} 
{{Form::textarea('body', $post->body , ['class' => 'form-control', 'id' => 'article-ckeditor'  ,'placeholder'=> 'Body Text' ])}}
</div>
<div class="form-group">
        {{Form::file('cover_image')}}
</div>
{{Form::hidden('_method','PUT')}}
{{Form::submit('submit',['class'=>'btn btn-primary'])}}
{!! Form::close() !!}


@endsection