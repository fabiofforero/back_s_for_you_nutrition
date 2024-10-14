<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    protected $table = 'persona'; // Nombre de la tabla en la base de datos
    protected $primaryKey = 'Id'; // Llave primaria
    public $timestamps = false; // Si no usas created_at y updated_at

    protected $fillable = [
        'Documento',
        'Nombres',
        'Apellidos',
        'Telefono',
        'Email',
        'Direccion',
        'Id_ciudad'
    ];
}
