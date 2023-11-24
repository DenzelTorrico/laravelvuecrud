<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Inertia\Inertia;

use function Termwind\render;

class ControllerCategory extends Controller
{
    public function index(){
        return Inertia::render("Categoria");
    }
    public function getcategorys(){
            $categoria = Category::all();

            return response()->json($categoria);
    }
}
