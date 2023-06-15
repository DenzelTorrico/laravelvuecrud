<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'name' => $this->faker->randomElement([
                'Camiseta',
                'Teléfono móvil',
                'Libro',
                'Zapatos',
                'Gafas de sol',
                'Bolso',
                'Reloj',
                'Pantalones',
                'Perfume',
                'Guitarra',
                'Cámara',
                'Silla',
                'Mesa',
                'Cuchillo',
                'Taza',
                'Lámpara',
                'Teclado',
                'Monitor',
                'Altavoz',
                'Bicicleta',
                'Camiseta',
                'Pantalones',
                'Vestido',
                'Zapatos',
                'Abrigo',
                'Calcetines',
                'Sombrero',
                'Bufanda',
                'Gorro',
                'Chaqueta',
                'Lavadora',
                'Nevera',
                'Horno',
                'Televisor',
                'Aspiradora',
                'Batidora',
                'Plancha',
                'Licuadora',
                'Secadora',
                'Microondas'
            
            ]),
            'description' => $this->faker->paragraph,
            'price' => $this->faker->randomFloat(2, 10, 1000),
            'stock' => $this->faker->numberBetween(0, 100),
            'active' => $this->faker->boolean,
            'category' => $this->faker->randomElement(['Electronics', 'Clothing', 'Books', 'Home']),
            'brand' => $this->faker->company,
            'color' => $this->faker->colorName,
            'fecha' => $this->faker->year,        ];
    }
}
