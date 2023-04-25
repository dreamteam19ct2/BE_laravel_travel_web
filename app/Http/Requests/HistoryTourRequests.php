<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class HistoryTourRequests extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'tour_id' => 'required',
            'id_user' => 'required',
            'price' => 'required',
            'tour_name' => 'required',
            'date_history'=> 'required',
            'status_tour'=> 'required',
            'people'=> 'required'
        ];
    }
}
