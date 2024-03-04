import 'package:flutter/material.dart';
import 'package:punto_de_venta_topicos/view/ventapage.dart';
import 'package:punto_de_venta_topicos/view/reportepage.dart';
import 'package:punto_de_venta_topicos/view/productospage.dart';
import 'package:punto_de_venta_topicos/view/categoriaspage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Punto de Venta '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductosPage(),
                  ),
                );
              },
              child: const Text('Productos'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CagtegoriaPage(),
                  ),
                );
              },
              child: const Text('Categorias'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RealizarVentaPage(),
                  ),
                );
              },
              child: const Text('Realizar Venta'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReportePage(),
                  ),
                );
              },
              child: const Text('Reporte'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerProductos(),
                  ),
                );
              },
              child: const Text('Lista de Productos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AgregarProducto(),
                  ),
                );
              },
              child: const Text('Agregar Producto'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditarProducto(),
                  ),
                );
              },
              child: const Text('Editar Producto'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EliminarProducto(),
                  ),
                );
              },
              child: const Text('Eliminar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}

class CagtegoriaPage extends StatelessWidget {
  const CagtegoriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerCategorias(),
                  ),
                );
              },
              child: const Text('Lista de Categorias'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AgregarCategoria(),
                  ),
                );
              },
              child: const Text('Agregar Categoria'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditarCategoria(),
                  ),
                );
              },
              child: const Text('Editar Categoria'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EliminarCategoria(),
                  ),
                );
              },
              child: const Text('Eliminar Categoria'),
            ),
          ],
        ),
      ),
    );
  }
}
