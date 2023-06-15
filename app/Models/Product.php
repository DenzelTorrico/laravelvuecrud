<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
            "name",
            "description",
            "price",
            "stock",
            "active",
            "brand",
            "color",
            "category",
            "fecha"
    ];

    public static function BuscarSearch($search){
        $productos = self::where("color", "LIKE", "%{$search}%")
        ->orWhere("brand", "LIKE", "%{$search}%")
        ->orWhere("category", "LIKE", "%{$search}%")
        ->paginate(5);
        return $productos;
    }
}
