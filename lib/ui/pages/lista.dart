import 'package:crudclientes/ui/pages/crear.dart';
import 'package:flutter/material.dart';
import '../../domain/modelo/Cliente.dart';

class ListarClientes extends StatefulWidget {
  const ListarClientes({Key? key}) : super(key: key);

  @override
  State<ListarClientes> createState() => _ListarClientesState();
}

class _ListarClientesState extends State<ListarClientes> {
  final List _clientes = listaClientes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
      ),
      body: ListView.builder(
          itemCount: _clientes.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {
                _eliminarclientes(context, _clientes[index]);
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdicionarClientes(
                        gestioncliente: _clientes[index]), //Llamar la Vista
                  ),
                ).then((resultado) //Espera por un Resultado
                    {
                  if (resultado != null) {
                    _clientes[index] = resultado[
                        0]; //Adiciona a la lista lo que recupera de la vista TextoEjercicio
                    setState(() {});
                  }
                });
              },
              leading: CircleAvatar(
                  child: Text(_clientes[index].nombre.substring(0, 1) +
                      _clientes[index].apellido.substring(0, 1))),
              title: Text(
                  _clientes[index].nombre + " " + _clientes[index].apellido),
              subtitle: Text(_clientes[index].telefono),
              trailing: const Icon(Icons.call),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AdicionarClientes(
                  gestioncliente: Cliente(
                      nombre: '',
                      apellido: '',
                      telefono: '')), //Llamar la Vista
            ),
          ).then((resultado) //Espera por un Resultado
              {
            if (resultado != null) {
              _clientes.addAll(
                  resultado); //Adiciona a la lista lo que recupera de la vista TextoEjercicio
              setState(() {});
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _eliminarclientes(context, Cliente elcliente) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Eliminar Cliente'),
              content: Text('Desea Realmente Eliminar a ${elcliente.nombre}'),
              actions: [
                TextButton(
                    onPressed: () {
                      _clientes.remove(elcliente);
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ));
  }
}
