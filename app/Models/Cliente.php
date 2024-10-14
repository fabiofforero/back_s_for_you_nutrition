<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    protected $table = 'cliente'; // Asegúrate de que este nombre sea correcto

    protected $fillable = [
        'Id_persona',
        'Id_tipo_compra',
        'Puntos_fidelizacion',
        'Descuento_inicial',
    ];

    // Si hay una relación con el modelo Persona
    public function persona()
    {
        return $this->belongsTo(Persona::class, 'Id_persona');
    }
}

