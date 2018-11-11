@extends('layouts.app')
@section('content')
<h2>Create Post</h2>
<hr>
{!! Form::open(['action' => 'PostsController@store', 'method'=> 'Post', 'enctype' => 'multipart/form-data']) !!}
<div class= "form-group">  
{{Form::label('title', 'Title')}} 
{{Form::text('title', '', ['class' => 'form-control' ,'placeholder'=> 'Title' ])}}
<br><br>
{{Form::label('body', 'Content')}} 
{{Form::textarea('body', '', ['class' => 'form-control', 'id' => 'article-ckeditor'  ,'placeholder'=> 'Body Text' ])}}
</div>
<div class="form-group">
{{Form::file('cover_image')}}
</div>
{{Form::submit('submit',['class'=>'btn btn-primary'])}}
{!! Form::close() !!}


@endsection