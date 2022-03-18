<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Result;
use App\Models\User;

class ResultsController extends Controller
{
    
    public function saveTest(Request $request) {
        $success = true;
        $user = User::find($request->get('id'));

        try {
                
            $result = new Result;
            $result->user_id = $user->id;
            $result->score = $request->get('score');
            $result->take_time = $request->get('take_time');
            $result->unanswered_count = $request->get('unanswered_count');
            $result->save();    
        } catch (Exception $e) {
            $success = false;
            report($e);
        }

        return response()->json([
            'success' => $success,
        ]);
    }

    public function getResultLists() {
        $results = Result::with('user')->orderBy('score')->get();
        
        return response()->json([
            'success'=> true,
            'results' => $results
        ]);
    }
}
