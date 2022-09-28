// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crudclientes/domain/modelo/Cliente.dart';
import 'package:flutter/material.dart';
import '../../domain/modelo/ClienteLogIn.dart';
import 'SingIn.dart';
import 'lista.dart';

class LogIng extends StatefulWidget {
  const LogIng({super.key});

  @override
  State<LogIng> createState() => _LogIngState();
}

class _LogIngState extends State<LogIng> {
  final List<ClienteLogin> _clientelogin = clientesLogin;
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de Sesion"),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // text welcome
            const Text(
              "Hola, Bienvenido!",
              style: TextStyle(fontSize: 34),
            ),

            const SizedBox(height: 60),

            // textfield user

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white),
                    color: Colors.grey[200]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: controlUser,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Usuario',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            //textfield password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white),
                    color: Colors.grey[200]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: controlPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Contraseña',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            //logIn button

            MaterialButton(
              onPressed: () {
                if (validarInicioSesion(
                    controlUser.text, controlPassword.text)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ListarClientes(), //Llamar la Vista
                    ),
                  );
                  clearcontrol();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      "Iniciar Sesion",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
              ),
            ),

            const SizedBox(height: 10),

            // register button

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿No estas registrado?,"),
                MaterialButton(
                  onPressed: () {
                    clearcontrol();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SingIn(), //Llamar la Vista
                      ),
                    ).then((value) {
                      if (value != null) {
                        _clientelogin.addAll(value);
                      }
                    });
                  },
                  child: Text(
                    " Registrate Aqui",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validarInicioSesion(var user, var password) {
    for (var clientefor in clientesLogin) {
      if (clientefor.user == user && clientefor.password == password) {
        return true;
      }
    }
    return false;
  }

  void clearcontrol() {
    controlPassword.clear();
    controlUser.clear();
  }
}
