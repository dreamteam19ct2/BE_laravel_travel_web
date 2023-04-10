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
            $current_user = DB::table('users')->where([
                ['system_role', '=', 2],['id', '=', $user],])->first();
            if (!$current_user){
                return response()->json(['message'=>"Method Not Allowed"],405);
            }else{
                TourModel::create($request->all());
                return response()->json(["user_id" => $user,'message'=>"create tour success"],200);
            }
        } else {
            return response()->json(['message'=>"Unauthorized"],401);
        }
    }
    public function get_tour(){
        $tour = DB::table('tour')->get();
        return response()->json($tour);   //
    }


}
