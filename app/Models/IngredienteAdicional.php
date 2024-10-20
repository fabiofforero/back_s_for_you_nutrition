<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class IngredienteAdicional extends Model
{
    protected $table = 'ingrediente_adicional'; // Asegúrate de que este sea el nombre correcto de tu tabla

    protected $fillable = [
        'Nombre',
        'Precio',
        'Cantidad',
        'Unidad_medida',
        'Id_ingrediente',
    ];

    public $timestamps = false;
}
