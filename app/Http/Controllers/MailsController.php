<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Mail\Welcome;

class MailsController extends Controller
{
    //
    public function index()
    {
      $user_id = auth()->user()->id;
      $user = User::find($user_id);
      \Mail::to($user)->send(new Welcome($user));

      return redirect('/dashboard')->with('success', 'Verification Mail Send');

    }
}
