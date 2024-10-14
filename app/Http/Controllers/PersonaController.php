<?php

namespace App\Http\Controllers;

use App\Models\Persona;
use Illuminate\Http\Request;

class PersonaController extends Controller
{
    public function index()
    {
        return Persona::all(); // Obtener todas las personas
    }

    public function store(Request $request)
    {
        $request->validate([
            'Documento' => 'required|integer',
            'Nombres' => 'required|string|max:50',
            'Apellidos' => 'required|string|max:50',
            'Telefono' => 'required|integer',
            'Email' => 'required|email|max:150',
            'Direccion' => 'required|string|max:150',
            'Id_ciudad' => 'required|integer',
        ]);

        $persona = Persona::create($request->all());
        return response()->json($persona, 201); // Retornar la nueva persona creada
    }

    public function show($id)
    {
        return Persona::findOrFail($id); // Obtener una persona por ID
    }

    public function update(Request $request, $id)
    {
        $persona = Persona::findOrFail($id);
        $persona->update($request->all());
        return response()->json($persona); // Retornar la persona actualizada
    }

    public function destroy($id)
    {
        Persona::destroy($id); // Eliminar una persona
        return response()->json(null, 204); // Retornar respuesta vacía
    }
}
