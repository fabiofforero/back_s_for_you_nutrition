<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GestorPedido extends Model
{
    // Indica la tabla asociada
    protected $table = 'gestor_pedidos';

    // La llave primaria
    protected $primaryKey = 'Id';

    // Desactiva timestamps si no los usas
    public $timestamps = false;

    // Permitir asignación masiva para estos campos
    protected $fillable = [
        'Id_persona', 
        'Fecha_contratacion', 
        'Salario'
    ];
}
