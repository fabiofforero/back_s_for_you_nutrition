<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SeccionMenu extends Model
{
    // Define la tabla si no sigue la convención
    protected $table = 'seccion_menu'; // Asegúrate de que este sea el nombre correcto de tu tabla

    // Define los atributos que son asignables masivamente
    protected $fillable = [
        'Nombre',
        'Descripcion',
        'Calorias',
        'Id_producto',
        'Id_ingrediente_adicional',
    ];

    // Si no estás usando timestamps (created_at y updated_at), añade esto
    public $timestamps = false;
}

