import 'package:crudclientes/domain/modelo/modelo.dart';
import 'package:crudclientes/ui/pages/widget.dart';
import 'package:flutter/material.dart';

class AdicionarClientes extends StatefulWidget {
  final Cliente gestioncliente;
  const AdicionarClientes({super.key, required this.gestioncliente});

  @override
  State<AdicionarClientes> createState() => _AdicionarClientesState();
}

class _AdicionarClientesState extends State<AdicionarClientes> {
  List<Cliente> _clienteAdd = [];
  TextEditingController controlnombre = TextEditingController();
  TextEditingController controlapellido = TextEditingController();
  TextEditingController controltelefono = TextEditingController();

  @override
  void initState() {
    controlnombre.text = widget.gestioncliente.nombre;
    controlapellido.text = widget.gestioncliente.apellido;
    controltelefono.text = widget.gestioncliente.telefono;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('adicionar clientes')),
      body: Column(
        children: [
          Textos(
            controlartextos: controlnombre,
            etiqueta: 'Nombres',
          ),
          Textos(
            controlartextos: controlapellido,
            etiqueta: 'Apellidos',
          ),
          Textos(
            controlartextos: controltelefono,
            etiqueta: 'Telefono',
          ),
          // Boton
          ElevatedButton(
            //Paso # 3
            //En el Boton Enviar Datos

            onPressed: () {
              if (controlnombre.text.isNotEmpty &&
                  controlapellido.text.isNotEmpty &&
                  controltelefono.text.isNotEmpty) {
                // Agregar a la lista los valores de cada texto

                _clienteAdd.add(Cliente(
                    nombre: controlnombre.text,
                    apellido: controlapellido.text,
                    telefono: controltelefono.text));

                // Devuelvo los datos de la lista _clientesadd

                Navigator.pop(context, _clienteAdd);
              }
            },
            child: const Text('Guardar Datos'),
          ),
        ],
      ),
    );
  }
}
