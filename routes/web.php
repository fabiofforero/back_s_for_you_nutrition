<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/
$router->get('/clientes', 'ClienteController@index');
$router->get('/clientes/{id}', 'ClienteController@show');
$router->post('/clientes', 'ClienteController@store');
$router->put('/clientes/{id}', 'ClienteController@update');
$router->delete('/clientes/{id}', 'ClienteController@destroy');

$router->get('/personas', 'PersonaController@index');
$router->post('/personas', 'PersonaController@store');
$router->get('/personas/{id}', 'PersonaController@show');
$router->put('/personas/{id}', 'PersonaController@update');
$router->delete('/personas/{id}', 'PersonaController@destroy');

$router->get('/gestor-pedidos', 'GestorPedidoController@index');
$router->get('/gestor-pedidos/{id}', 'GestorPedidoController@show');
$router->post('/gestor-pedidos', 'GestorPedidoController@store');
$router->put('/gestor-pedidos/{id}', 'GestorPedidoController@update');
$router->delete('/gestor-pedidos/{id}', 'GestorPedidoController@destroy');


$router->get('/', function () use ($router) {
    return $router->app->version();
});
