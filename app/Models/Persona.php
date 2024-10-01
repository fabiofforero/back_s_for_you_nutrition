<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    protected $table = 'persona'; // Nombre de la tabla
    protected $primaryKey = 'Id'; // Clave primaria
    public $timestamps = false; // Desactivar timestamps si no los estás usando

    protected $fillable = [
        'Documento',
        'Nombres',
        'Apellidos',
        'Telefono',
        'Email',
        'Direccion',
    ];
}
