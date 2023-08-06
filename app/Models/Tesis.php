<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Crypt;

class Tesis extends Model
{
    use HasFactory;

    protected $table = "tesis";
    protected $fillable = [
        "titulo",
        "created_at",
        "updated_at"
    ];

    public function StateTesis(){
        return $this->hasMany(StateTesis::class,"id_tesis","id");
    }
   
}
