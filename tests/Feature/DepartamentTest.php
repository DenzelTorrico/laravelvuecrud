<?php

namespace Tests\Feature;

use App\Models\Departament;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class DepartamentTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    use RefreshDatabase;

     public function testCreateDepartament(){
            $departament = new Departament();
            $departament->name = "Antisuyo";
            $departament->save();
            $this->assertInstanceOf(Departament::class, $departament, 'La variable no es una instancia de Departament');
        
            $this->assertDatabaseHas('departaments', ['name' => 'Antisuyo']);

        }
}
