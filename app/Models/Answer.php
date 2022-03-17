<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    protected $table = 'questions';

    protected $fillable = ['title'];

    public function questions()
    {
        return $this->hasMany(User::class);
    }
}
