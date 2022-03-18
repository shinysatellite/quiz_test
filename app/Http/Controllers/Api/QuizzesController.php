<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Type;
use App\Models\Question;
use App\Models\Answer;
use App\Models\Result;
use App\Models\User;

class QuizzesController extends Controller
{
    //
    public function getQuizeType(Type $type) {
        $types = $type->get();
        
        return response()->json([
            'success'=> true,
            'types' => $types
        ]);
    }

    public function store(Request $request) {

        $type = $request->get('type');
        $success = true;

        try {
            $question = new Question;
            $question->type_id = $type;
            $question->text = $request->get('question');
            $question->correct_answer = $request->get('correct_answer');
            $question->limit_time = $request->get('limit_time');
            $question->save();

            if($type == 2) {
                $answers = $request->get('answers');
                $answerArr = array();
                foreach ($answers as $item) {
                    array_push($answerArr, new Answer(['text' => $item['text'], 'value' => $item['value']]));
                }
                $question->answers()->saveMany($answerArr);
            }

        } catch (Exception $e) {
            $success = false;
            report($e);
        }
        return response()->json([
            'success' => $success,
        ]);
    }

    public function getLists() {
        $questions = Question::get();

        return response()->json([
            'success'=> true,
            'quizzes' => $questions
        ]);
    }

    public function getActiveLists() {
        $questions = Question::where('active', 1)->with('answers')->get();

        return response()->json([
            'success'=> true,
            'quizzes' => $questions
        ]);
    }

    public function activeQuiz(Request $request){
        
        $success = true;
        $id = $request->get('id');

        try {
            $question = Question::find($id);
 
            $question->active = $request->get('value');
    
            $question->save();
        } catch (Exception $e) {
            $success = false;
            report($e);
        }

        return response()->json([
            'success' => $success,
        ]);
    }
}
