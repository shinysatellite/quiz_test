<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Type;

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
}
