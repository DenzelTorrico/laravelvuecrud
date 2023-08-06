<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Tesis;
use Illuminate\Http\Request;

class TesisController extends Controller
{
    public function index(){
        $tesis = Tesis::with("StateTesis")->get();

        return response()->json($tesis);
    }
}
