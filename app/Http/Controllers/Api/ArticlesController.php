<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;
use Validator;

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

    public function storeArticle(Request $request) {
        $request_data=$request->only(['title','description','content','category_id']);

        $validator= Validator::make($request_data,[
            "title"=>['required','string'],
            "description"=>['required','string'],
            "content"=>['required','string'],
            "category_id"=>['required','integer'],
        ]);
if($validator->fails()) {
    return response()->json([
        "status"=>false,
        "errors"=>$validator->messages()

    ])->setStatusCode (422);
}



      $article=  Post::create([
            "title"=>$request->title,
            "description"=>$request->description,
            "content"=>$request->content,
            "category_id"=>$request->category_id,

        ]);
            return response ()->json([
                "status"=>true,
                "article"=>$article
            ])->setStatusCode (201,'Статья добавлена');;


    }
}
