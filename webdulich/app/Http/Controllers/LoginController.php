<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Http\Requests\LoginRequests;
use App\Models\User;

class LoginController extends Controller
{
    public function login(LoginRequests $request)
    {
        $email = $request->input('email');
        $password = $request->input('password');

        if (Auth::attempt(['email' => $email, 'password' => $password])) {
            $user = User::where('email', $email)->first();
            Auth::login($user);
            return response()->json(["user" => $user,'message'=>"Login ok"],200);

        }

        return response()->json(['message'=>"Login err"],401);
    }

}
