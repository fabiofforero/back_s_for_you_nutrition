<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MetodoPago extends Model
{
    
    protected $table = 'metodo_pago'; 

    
    protected $fillable = [
        'Descripcion',
    ];

    
    public $timestamps = false;
}
