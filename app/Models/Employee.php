<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;

    protected $fillable = [
        "name",
        "email",
        "phone",
        "departament_id"
    ];

    public function departament()
    {
        return $this->belongsTo(Departament::class, 'departament_id');
    }
}
