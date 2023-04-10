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

        $data['username'] =$request->username;
        $data['email'] =$request->email;
        $data['password'] =$request->password;


        User::createe($data);
        return response()->json(['message'=>"Register ok"],200);
    }

    public function get_user(){
        $users = DB::table('users')->get();
        return response()->json($users);
    }


}
