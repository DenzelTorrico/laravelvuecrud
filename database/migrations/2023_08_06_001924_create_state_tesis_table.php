<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('state_tesis', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("id_tesis");
            $table->enum("estado", ["Aprobado", "Desaprobado", "Observado", "Levantamiento"]);
            $table->date("fecha_estado");
            $table->enum("tipo",["tematico","metodologico"]);
            $table->foreign("id_tesis")->references("id")->on("tesis")->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('state_tesis');
    }
};
