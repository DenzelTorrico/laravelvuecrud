<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StateTesis extends Model
{
    use HasFactory;

    protected $table = "state_tesis";
    protected $fillable = [
        "id_tesis",
        "estado",
        "fecha_estado",
        "tipo",
        "created_at",
        "updated_at",
    ];

    protected $appends = ["state_date"];

    public function getStateDateAttribute()
    {
        Carbon::setLocale('es');
    
        if (!isset($this->attributes['fecha_estado']) || !$this->attributes['fecha_estado']) {
            return $this->estado . ' Sin fecha';
        }
    
        // Formatea la fecha al estilo: "12 de julio del 2023"
        $formattedDate = Carbon::parse($this->attributes['fecha_estado'])->isoFormat('D [de] MMMM [del] Y');
    
        // Combina el estado y la fecha
        return $this->estado . ' ' . $formattedDate;
    }
    

    public function tesis()
    {
        return $this->belongsTo(Tesis::class, 'id_tesis', 'id');
    }


}
