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


    public function check_user(){
        $guard = app(Guard::class);
        $user = $guard->user();
        dd($guard);
    }


    public function create_tour(TourRequest $request){


        $data = new TourModel();

        $data['tour_name'] =$request->tour_name;
        Session::put('tour_name', $data['tour_name']);
        $data['img'] =$request->img;
        Session::put('img', $data['img']);
        $data['description'] =$request->description;
        Session::put('description', $data['description']);
        $data['date_start'] =$request->date_start;
        Session::put('date_start', $data['date_start']);
        $data['date_end'] =$request->date_end;
        Session::put('date_end', $data['date_end']);
        $data['max_people'] =$request->max_people;
        Session::put('max_people', $data['max_people']);
        $data['price'] =$request->price;
        Session::put('price', $data['price']);
        $data['detail'] =$request->detail;
        Session::put('detail', $data['detail']);
        $data['type_tour'] =$request->type_tour;
        Session::put('type_tour', $data['type_tour']);
        $data['location'] =$request->location;
        Session::put('location', $data['location']);


            $data = [
                'tour_name' => Session::get('tour_name'),
                'img' => Session::get('img'),
                'description' => Session::get('description'),
                'date_start' => Session::get('date_start'),
                'date_end' => Session::get('date_end'),
                'max_people' => Session::get('max_people'),
                'price' => Session::get('price'),
                'detail' => Session::get('detail'),
                'type_tour' => Session::get('type_tour'),
                'location' => Session::get('location'),
            ];
            TourModel::create($data);
            return with('Oke');

    }



}
