<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\Auth;
use App\Http\Middleware\Authenticate;
use App\Http\Requests\HistoryTourRequests;
use App\Models\HistoryTour;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

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
                    $history_tour->status_tour = 'in_progress';
                    $history_tour->save();

                    return response()->json(["user_id" => $user,"data_tour"=>$history_tour,'MSG'=>"View tour success"],200);

                }
            }
        }
        else {
            return response()->json(['MSG'=>"Unauthorized"],401);
        }
    }
    public function get_bookingtour(Request $request){

        if (Auth::check()) {
            $user = Auth::user();
            $historyTour = HistoryTour::where('user_id', $user->id)->get();

            if ($historyTour->isEmpty()) {
                return response()->json(['message'=>"Not Oder Tour"],404);
            }else{
                return response()->json($historyTour);
            }
        } else {
            return response()->json(['message' => 'Unauthorized'], 401);
        }
    }
    public function get_confirm_tour(){
        if (Auth::check()) {
            $user = Auth::id();
            $current_user = DB::table('users')->where([
                ['system_role', '=', 2],['id', '=', $user],])->first();
            if (!$current_user){
                return response()->json(['MSG'=>" You Are Not ADMIN "],405);
            }else{
                $confirm = 'in_progress';
                $historyTour = HistoryTour::where('status_tour', $confirm)->get();
                return response()->json($historyTour);
            }

        }
        else {
            return response()->json(['MSG'=>"Unauthorized"],401);
        }
    }

    public function confirm_tour(Request $request){
        if (Auth::check()) {
            $user = Auth::id();
            $current_user = DB::table('users')->where([
                ['system_role', '=', 2],['id', '=', $user],])->first();
            if (!$current_user){
                return response()->json(['MSG'=>" You Are Not ADMIN "],405);
            }else{
                $confirm = 'waiting for confirmation from admin';
                $historyTour = HistoryTour::where('status_tour', $confirm)->get();

                if($historyTour->isEmpty()){
                    return response()->json(['MSG'=>"No tour to confirm"],405);
                }
                else{
                    $id = $request->id;
                    $HistoryTour_id = HistoryTour::find($id);

                    if (!$HistoryTour_id) {
                        return response()->json(['message'=>"Tour not found"],404);
                    }
                    else{

                        $HistoryTour_id-> status_tour = "comfirm";
                        $HistoryTour_id->save();

                        return response()->json(['message' => 'tour confirm'], 200);
                    }
                }
            }

        }
        else {
            return response()->json(['MSG'=>"Unauthorized"],401);
        }
    }

}
