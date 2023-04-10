<?php

namespace App\Http\Controllers;

use App\Http\Requests\TourRequest;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Middleware\Authenticate;
use App\Models\TourModel;
use Illuminate\Contracts\Auth\Guard;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;

class TourController extends Controller
{
    //


    public function create_tour(TourRequest $request){

       if (Auth::check()) {
            $user = Auth::id();
           // dd($user);
           TourModel::create($request->all());
           return response()->json(["user" => $user,'message'=>"them tour thanh cong"],200);

        } else {
                return "chua xac thuc";
        }



    }



}
