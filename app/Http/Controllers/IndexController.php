<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{
    public function index()
    {
        $posts = Auth::check()
            ? Post::where('user_id', Auth::id())->paginate(10)
            : collect();

        return view('home', compact('posts'));
    }
}
