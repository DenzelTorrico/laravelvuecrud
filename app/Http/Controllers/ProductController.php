<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index(){
        return Inertia::render('Producto');
    }
    public function GetProduct()
    {
        $productos = Product::paginate(5); // Obtener los productos paginados con 10 elementos por página
    
        return response()->json($productos);
    }
    
    public function GetProductoFilter(Request $request)
{
    $search = $request->input("search");

    return response()->json(Product::BuscarSearch($search));
}

public function GetProductoFilterGroup(Request $request){
  

    $producto = Product::query();
    if($request->has("marca")){
        $producto->where("brand",$request->get("marca"));
    }

    if($request->has("precio")){
        $producto->where("price",$request->get("precio"));
    }

    if($request->has("categoria")){
        $producto->where("category", $request->get("categoria"));
    }

    if($request->has("color")){
        $producto->where("color", $request->get("color"));
    }
   
    $productosFiltrados = $producto->paginate(5);

    return response()->json($productosFiltrados);
   // return response()->json($productosFiltrados);
}

    
    
    
}
