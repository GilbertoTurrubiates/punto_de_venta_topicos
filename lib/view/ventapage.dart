import 'package:flutter/material.dart';
import 'package:punto_de_venta_topicos/controlador/venta_controller.dart';

class RealizarVentaPage extends StatefulWidget {
  const RealizarVentaPage({super.key});

  @override
  State<RealizarVentaPage> createState() => _RealizarVentaPageState();
}

class _RealizarVentaPageState extends State<RealizarVentaPage> {
  final VentaController ventaController = VentaController();
  final TextEditingController idProductoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realizar Venta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: idProductoController,
              decoration: const InputDecoration(
                labelText: 'ID del producto',
              ),
              onSubmitted: (value) {
                String resultado = ventaController.agregarProducto(value, 1);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(resultado),
                    duration: const Duration(milliseconds: 500),
                  ),
                );
                idProductoController.clear();
                setState(() {});
              },
            ),
            ElevatedButton(
              onPressed: () {
                String resultado = ventaController.crearVenta();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(resultado),
                  ),
                );
              },
              child: const Text('Realizar Venta'),
            ),
            ElevatedButton(
              onPressed: () {
                ventaController.productos.clear();
                setState(() {});
              },
              child: const Text('Vaciar Carrito'),
            ),
            for (var i = 0; i < ventaController.productos.length; i++)
              ListTile(
                title: Text(ventaController.productos[i].producto.nombre),
                subtitle: Text(
                    'x${ventaController.productos[i].cantidad} \$${ventaController.productos[i].producto.precio}'),
              ),
          ],
        ),
      ),
    );
  }
}
