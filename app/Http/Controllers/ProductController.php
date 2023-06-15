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

    
    
    
}
