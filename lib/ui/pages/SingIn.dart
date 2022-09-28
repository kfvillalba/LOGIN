import 'package:crudclientes/domain/modelo/ClienteLogIn.dart';
import 'package:crudclientes/ui/pages/LogIn.dart';
import 'package:flutter/material.dart';
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

class SingIn extends StatefulWidget {
  const SingIn({super.key});
  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final List<ClienteLogin> _clienteLoginAdd = [];
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  TextEditingController controlRepeatPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrarse"),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // text welcome
            const Text(
              "Ingresa los datos para continuar",
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

            const SizedBox(height: 10),

            //textfield repeat password
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
                    controller: controlRepeatPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Repetir Contraseña',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
            //Register button

            MaterialButton(
              onPressed: () {
                if (controlUser.text.isNotEmpty &&
                    controlPassword.text.isNotEmpty &&
                    controlRepeatPassword.text.isNotEmpty &&
                    controlPassword.text == controlRepeatPassword.text &&
                    !buscarUsuario(controlUser.text, controlPassword.text)) {
                  _clienteLoginAdd.add(ClienteLogin(
                      user: controlUser.text, password: controlPassword.text));
                  Navigator.pop(context, _clienteLoginAdd);
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
                      "registrarse",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
              ),
            ),

            const SizedBox(height: 10),

            // login button

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿Ya estas registrado?, "),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LogIng(), //Llamar la Vista
                      ),
                    );
                  },
                  child: Text(
                    " inicia sesion Aqui",
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

  bool buscarUsuario(var user, var password) {
    for (var clientefor in clientesLogin) {
      if (clientefor.user == user && clientefor.password == password) {
        return true;
      }
    }
    return false;
  }
}
