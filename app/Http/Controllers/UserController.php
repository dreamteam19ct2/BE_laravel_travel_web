<?php

namespace App\Http\Controllers;


use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequests;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\RegisterRequests;

class UserController extends Controller
{

    public function login(LoginRequests $request)
    {
        $validated = $request -> validated();
        if(auth()->attempt($validated)){
            $user = Auth::user();
            $token = $user -> createToken("travel")->accessToken;
            return response()->json(["user" => $user,'token' => $token,'message'=>"login success"],200);
        }
        else{
            return response()->json(['message'=>"login err"],211);
        }
    }


    public function register(RegisterRequests $request)
    {
        $validated = $request -> validated();
        $validated['password'] = bcrypt( $validated['password'] );
        $validated['system_role'] = 1;
        $user = User::create($validated);
        return response()->json(["user" => $user,'message'=>"register success"],200);

    }


    public function get_user()
    {
        $user = auth()->user();
        return response()->json(['user'=>$user],200);
    }
}
