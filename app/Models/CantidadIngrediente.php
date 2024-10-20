<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CantidadIngrediente extends Model
{
    protected $table = 'cantidad ingrediente'; 
    protected $primaryKey = 'Id';
    public $timestamps = false;

    protected $fillable = [
        'Id_ingrediente', 'Id_producto', 'Cantidad_usar', 'Unidad_de_medida'
    ];

    // Relación con el modelo Ingrediente
    public function ingrediente()
    {
        return $this->belongsTo(Ingrediente::class, 'Id_ingrediente');
    }

    // Relación con el modelo Producto
    public function producto()
    {
        return $this->belongsTo(Producto::class, 'Id_producto');
    }
}
