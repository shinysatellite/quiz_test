<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    protected $table = 'answers';

    protected $fillable = ['question_id', 'text', 'value'];

    public function questions()
    {
        return $this->belongsTo(Question::class, 'question_id');
    }
}
