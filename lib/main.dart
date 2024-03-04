import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:punto_de_venta_topicos/view/home.dart';


void main() async {
  await inicializarHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

inicializarHive() async {
  await Hive.initFlutter();
  await Hive.openBox('productos');
  await Hive.openBox('categorias');
  await Hive.openBox('ventas');
}
