import 'package:flutter/material.dart';
import 'package:punto_de_venta_topicos/controlador/venta_controller.dart';

class ReportePage extends StatelessWidget {
  const ReportePage({super.key});

  @override
  Widget build(BuildContext context) {
    final VentaController ventaController = VentaController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de Ventas'),
      ),
      body: ventaController.ventas.isEmpty
          ? const Center(child: Text('No hay ventas'))
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < ventaController.ventas.length; i++)
                    ListTile(
                      title: Text(
                        'Venta ${i + 1}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var j = 0;
                              j < ventaController.ventas[i].productos.length;
                              j++)
                            Text(
                              '${ventaController.ventas[i].productos[j].producto.nombre} x${ventaController.ventas[i].productos[j].cantidad} = \$${ventaController.ventas[i].productos[j].producto.precio * ventaController.ventas[i].productos[j].cantidad}',
                            ),
                          const Divider(),
                          Text(
                            'Total: \$${ventaController.ventas[i].total}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
