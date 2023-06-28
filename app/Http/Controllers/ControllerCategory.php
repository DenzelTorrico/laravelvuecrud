<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

use function Termwind\render;

class ControllerCategory extends Controller
{
    public function index(){
        return Inertia::render("Categoria");
    }
}
