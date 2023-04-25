<?php

namespace App\Http\Controllers;


use App\Http\Requests\HistoryTourRequests;
use App\Models\HistoryTour;
use Illuminate\Http\Request;

class HistoryTourController extends Controller
{
    //
    public function history_tour(HistoryTourRequests $request){

        $history_tour = HistoryTour::create([
            'user_id' => $request->id_user,
            'tour_id' => $request->tour_id,
            'tour_name' => $request->tour_name,
            'price' => $request->price,
            'date_history' => $request->date_history,
            'status_tour' => $request->status_tour,
            'people'=> $request->people
        ]);
        return response()->json(["user_id" => $history_tour->user_id ,"data_tour"=>$history_tour,'MSG'=>"View tour success"],200);
    }

    public function get_bookingtour(Request $request){

        $user_id = $request->user_id;
        $historyTour = HistoryTour::where('user_id', $user_id)->get();
        return response()->json($historyTour);
    }


    public function get_confirm_tour(Request $request){

        $confirm = 'waiting';
        $historyTour = HistoryTour::where('status_tour', $confirm)->get();
        return response()->json($historyTour);
    }

    public function confirm_tour(Request $request){

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
    public function cancel_confirm_tour(Request $request){

        $id = $request->id;
        $HistoryTour_id = HistoryTour::find($id);

        if (!$HistoryTour_id) {
            return response()->json(['message'=>"Tour not found"],404);
        }
        else{
            $HistoryTour_id-> status_tour = "cancel";
            $HistoryTour_id->save();

            return response()->json(['message' => 'tour cancel'], 200);
        }
    }

}
