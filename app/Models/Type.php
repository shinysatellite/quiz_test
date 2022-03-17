<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Type extends Model
{
    protected $table = 'types';

    protected $fillable = ['title'];

    public function questions()
    {
        return $this->hasMany(User::class);
    }
}
