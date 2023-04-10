<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequests;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\RegisterRequests;

class UserController extends Controller
{
    //
    // public $logsuccess = 200;
    // public $logerr = 211;


    public function login(LoginRequests $request)
    {

        // if (Auth::attempt(
        //     [
        //         'email' => request('email'),
        //         'password' => request('password')
        //     ]
        // )) {
        //     $user = Auth::user();
        //     $success['token'] = $user->createToken('MyApp')->accessToken;

        //     return response()->json(
        //         [
        //             'success' => $success
        //         ],
        //         $this->successStatus
        //     );
        // }
        // else {
        //     return response()->json(
        //         [
        //             'error' => 'Unauthorised'
        //         ], 401);
        // }
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

        // $validator = Validator::make($request->all(),
        //     [
        //         'username' => 'required',
        //         'email' => 'required',
        //         'password' => 'required',
        //         'c_password' => 'required|same:password',
        //         'system_role' => 'required',
        //     ]
        // );

        // if ($validator->fails()) {
        //     return response()->json(
        //         [
        //             'error' => $validator->errors()
        //         ], 401);
        // }

        // $input = $request->all();
        // $input['password'] = bcrypt($input['password']);
        // $user = User::create($input);
        // $success['token'] = $user->createToken('MyApp')->accessToken;
        // $success['username'] = $user->username;
        // return response()->json(
        //     [
        //         'success' => $success
        //     ],
        //     $this->successStatus
        // );
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
