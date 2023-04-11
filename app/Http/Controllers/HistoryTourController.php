<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\Auth;
use App\Http\Middleware\Authenticate;
use App\Http\Requests\HistoryTourRequests;
use App\Models\HistoryTour;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class HistoryTourController extends Controller
{
    //
    public function history_tour(HistoryTourRequests $request){

        if (Auth::check()) {
            $user = Auth::id();
            $current_user = DB::table('users')->where([
                ['system_role', '=', 1],['id', '=', $user],])->first();
            if (!$current_user){
                return response()->json(['MSG'=>"Method Not Allowed"],405);
            }else{
                $tours = DB::table('tour')->select('id', 'tour_name', 'price')->where([['id', '=',$request->input('id_tour')]])->first();
                //dd($tours);

                if(!$tours){
                    return response()->json(['MSG'=>"Method Not Allowed"],405);
                }
                else{
                    $history_tour = new HistoryTour();
                    $history_tour->user_id = $current_user->id;
                    $history_tour->tour_id = $tours->id;
                    $history_tour->tour_name = $tours->tour_name;
                    $history_tour->price = $tours->price;
                    $history_tour->date_history = Carbon::now()->format('Y-m-d');
                    $history_tour->save();

                    return response()->json(["user_id" => $user,"data_tour"=>$history_tour,'MSG'=>"View tour success"],200);

                }
            }
        }
        else {
            return response()->json(['MSG'=>"Unauthorized"],401);
        }
    }
    public function get_bookingtour(HistoryTourRequests $request){
        $tours = DB::table('tour')->select('id', 'tour_name', 'price')->where([['id', '=', $request]])->get();
        return response()->json($tours);
    }
    public function get_profileuser(){
        $user = Auth::id();
        $current_user = DB::table('users')->where([
            ['system_role', '=', 1],['id', '=', $user],])->first();
        $profile = DB::table('users')->select('id', 'full_name',  'phone', 'address', 'email')->where([['id', '=', $current_user]])->get();
        return response()->json($profile);
    }
}
