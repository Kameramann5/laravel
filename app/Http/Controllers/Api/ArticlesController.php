<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;

class ArticlesController extends Controller
{
public function showArticles()
{

 $articles=Post::all();
 return response()->json($articles);
}
    public function showArticle($id)
    {

        $article= Post::find($id);
        if(!$article) {
            return  response()->json([
                "status"=>false,
            "message"=>"Пост не найден"
            ])->setStatusCode (404,'Пост не найден');
        }
        return response()->json($article);
    }
}
