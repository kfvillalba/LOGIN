class Cliente {
  var nombre;
  var apellido;
  var telefono;

  Cliente({this.nombre, this.apellido, this.telefono});
}

List<Cliente> listaClientes = [
  Cliente(nombre: 'henry', apellido: 'Guerrero', telefono: '3126688555'),
  Cliente(nombre: 'giseth', apellido: 'mendoza', telefono: '3126104584'),
  Cliente(nombre: 'carmenza', apellido: 'vargas', telefono: '3114302247'),
  Cliente(nombre: 'luisa', apellido: 'montaño', telefono: '3126104584')
];
