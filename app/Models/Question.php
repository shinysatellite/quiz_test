<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $table = 'questions';

    protected $fillable = ['title', 'type_id', 'text', 'limit_time'];

    public function type()
    {
        return $this->belongsTo(Type::class);
    }

    public function answers()
    {
        return $this->hasMany(Answer::class);
    }
}
