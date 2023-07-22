<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class ControllerEstado extends Controller
{
    public function index(){
        return Inertia::render("State");
    }
}
