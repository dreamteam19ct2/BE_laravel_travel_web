<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegisterRequests;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class RegisterController extends Controller
{
    public function create(RegisterRequests  $request){
        $data = new User();
        $check = DB::table('users')->where('email', $request->email)->count();
        if($check > 0){
            return with('Email ton tai');
        }
        $data['username'] =$request->username;
        Session::put('username', $data['username']);
        $data['email'] =$request->email;
        Session::put('email', $data['email']);
        $data['password'] =$request->password;
        Session::put('password', $data['password']);
        $repass = $request->repassword;

        if($repass != $data['password']){
            return with('Password nhập lại không chính xác');
        }
        else{
            $data = [
                'username' => Session::get('username'),
                'email' => Session::get('email'),
                'password' => bcrypt(Session::get('password')),
                'system_role' => 1,
            ];
            User::create($data);
            return with('Oke');
        }



    }

    public function get_user(){
        $users = DB::table('users')->get();
        return response()->json($users);
    }


}
