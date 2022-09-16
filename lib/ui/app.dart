import 'package:crudclientes/domain/modelo/modelo.dart';
import 'package:crudclientes/ui/pages/lista.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud clientes',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const ListarClientes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
