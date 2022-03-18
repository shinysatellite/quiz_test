<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Result extends Model
{
    protected $table = 'results';

    protected $fillable = ['user_id', 'score', 'take_time', 'unanswered_count'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
