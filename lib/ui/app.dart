import 'package:crudclientes/ui/pages/LogIn.dart';
import 'package:crudclientes/ui/pages/SingIn.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud clientes',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const LogIng(),
      debugShowCheckedModeBanner: false,
    );
  }
}
