<?php

use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Models\Departament;
use App\Models\Employee;
use Illuminate\Foundation\Application;
use Illuminate\Http\Client\Request;
use Illuminate\Http\Request as HttpRequest;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::get("crud",function(){

   
    //$saludos = "hola";
    return Inertia::render('Crud');
})->middleware(["auth", "verified"])->name("crud");

Route::get("/productos",[ProductController::class,"index"])->name("productos");
Route::get("/getproductos",[ProductController::class,"GetProduct"]);
Route::Get("/getproductosfilter",[ProductController::class,"GetProductoFilter"]);
/*Route::get("productos", function(){
    return Inertia::render("Producto");
})->name("productos");
*/

Route::get("/departamentos",function(){
    $departamentos = Departament::all();

    return $departamentos;
});

Route::delete("/departamentos/{id}",function($id){
    $departamentos = Departament::find($id);
    if($departamentos){
        $departamentos->delete();
        return json_encode("ok");
    }else{
        return json_encode("no encontrado");
    }
   
});

Route::get(("departamentos/actualizar/{id}"),function($id){
    $departamento = Departament::find($id);
    //return 
    return inertia("Update",["departamento"=>$departamento]);
})->middleware(["auth", "verified"])->name("update");

Route::put(("departamentos/update"),function(HttpRequest $request){
    $departamento = Departament::find($request[0]);

   
    if($departamento){
        $departamento->name = $request[1];
        $departamento->save();
        return json_encode("OK");
    }else{
        return json_encode("No se ha encontrado el departamento");
    }
});

Route::get("departamentos/insertar",function(){
    return Inertia::render("Insertar");
})->middleware(["auth", "verified"])->name("insertar");

Route::post("departamentos/insertar",function(HttpRequest $request){
    $departamento = new Departament();
    $departamento->name =  $request->name;
    $departamento->save();
    return json_encode("OK");

});



/* Empleados */

route::get("empleados", function(){
    $departamento = Departament::all();
    return inertia("Empleados",["departamento"=>$departamento]);
})->name("empleados");

Route::get("crudempleados",function(){

    $empleados = Employee::with('departament')->paginate(10);

    return response()->json($empleados);
});

Route::delete("empleados/{id}",function($id){
    $empleados = Employee::find($id);
   if($empleados){
        $empleados->delete();
        return response()->json("DELETED");
   }else{
    return response()->json("ERROR");
   }

});

Route::post("empleados",function(HttpRequest $request){
    $empleado = new Employee();
    $empleado->name = $request->name;
    $empleado->email = $request->email;
    $empleado->phone = $request->phone;
    $empleado->departament_id = $request->departamento;
    if ($empleado->save()) {
        // Inserción exitosa
        return response()->json("OK");
    } else {
        // Error al insertar
        return response()->json("ERROR");
    }


   
    
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
