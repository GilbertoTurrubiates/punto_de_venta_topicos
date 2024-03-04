import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punto_de_venta_topicos/modelo/Producto.dart';
import 'package:punto_de_venta_topicos/controlador/producto_controlador.dart';

class VerProductos extends StatefulWidget {
  const VerProductos({super.key});

  @override
  State<VerProductos> createState() => _VerProductosState();
}

class _VerProductosState extends State<VerProductos> {
  @override
  Widget build(BuildContext context) {
    final ProductoControlador productoControlador = ProductoControlador();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: productoControlador.productos.isEmpty
          ? const Center(child: Text('No hay productos'))
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < productoControlador.productos.length; i++)
                    ListTile(
                      leading: Text(productoControlador.productos[i].id),
                      title: Text(productoControlador.productos[i].nombre),
                      subtitle: Text(
                        '${productoControlador.productos[i].categoria}\nCantidad: ${productoControlador.productos[i].cantidad}',
                      ),
                      trailing: Text(
                        productoControlador.productos[i].precio.toString(),
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}

class AgregarProducto extends StatelessWidget {
  const AgregarProducto({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductoControlador productoControlador = ProductoControlador();
    final TextEditingController idController = TextEditingController();
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController categoriaController = TextEditingController();
    final TextEditingController precioController = TextEditingController();
    final TextEditingController cantidadController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Producto'),
      ),
      body: Column(
        children: [
          TextField(
            controller: idController,
            decoration: const InputDecoration(
              labelText: 'ID del producto',
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: nombreController,
            decoration: const InputDecoration(
              labelText: 'Nombre del producto',
            ),
          ),
          TextField(
            controller: categoriaController,
            decoration: const InputDecoration(
              labelText: 'Categoria del producto',
            ),
          ),
          TextField(
            controller: precioController,
            decoration: const InputDecoration(
              labelText: 'Precio del producto',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: cantidadController,
            decoration: const InputDecoration(
              labelText: 'Cantidad del producto',
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              String mensaje = productoControlador.agregarProducto(
                idController.text,
                nombreController.text,
                double.parse(precioController.text),
                categoriaController.text,
                int.parse(cantidadController.text),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(mensaje),
                ),
              );
              Navigator.pop(context);
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }
}

class EditarProducto extends StatefulWidget {
  const EditarProducto({super.key});

  @override
  State<EditarProducto> createState() => _EditarProductoState();
}

class _EditarProductoState extends State<EditarProducto> {
  final ProductoControlador productoControlador = ProductoControlador();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();

  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
      ),
      body: Column(
        children: [
          TextField(
            controller: idController,
            decoration: const InputDecoration(
              labelText: 'ID del producto',
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            onSubmitted: (value) {
              Producto? producto = productoControlador.buscarProducto(value);

              if (producto != null) {
                setState(() {
                  isEditing = true;
                  nombreController.text = producto.nombre;
                  categoriaController.text = producto.categoria;
                  precioController.text = producto.precio.toString();
                  cantidadController.text = producto.cantidad.toString();
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Producto no encontrado'),
                  ),
                );
              }
            },
          ),
          TextField(
            controller: nombreController,
            decoration: const InputDecoration(
              labelText: 'Nuevo nombre del producto',
            ),
            enabled: isEditing,
          ),
          TextField(
            controller: categoriaController,
            decoration: const InputDecoration(
              labelText: 'Nueva categoria del producto',
            ),
            enabled: isEditing,
          ),
          TextField(
            controller: precioController,
            decoration: const InputDecoration(
              labelText: 'Nuevo precio del producto',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            keyboardType: TextInputType.number,
            enabled: isEditing,
          ),
          TextField(
            controller: cantidadController,
            decoration: const InputDecoration(
              labelText: 'Nueva cantidad del producto',
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            enabled: isEditing,
          ),
          ElevatedButton(
            onPressed: () {
              String mensaje = productoControlador.editarProducto(
                idController.text,
                nombreController.text,
                double.parse(precioController.text),
                categoriaController.text,
                int.parse(cantidadController.text),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(mensaje),
                ),
              );
              Navigator.pop(context);
            },
            child: const Text('Editar'),
          )
        ],
      ),
    );
  }
}

class EliminarProducto extends StatelessWidget {
  const EliminarProducto({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductoControlador productoControlador = ProductoControlador();
    final TextEditingController idController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliminar Producto'),
      ),
      body: Column(
        children: [
          TextField(
            controller: idController,
            decoration: const InputDecoration(
              labelText: 'ID del producto',
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              String mensaje =
                  productoControlador.eliminarProducto(idController.text);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(mensaje),
                ),
              );
              Navigator.pop(context);
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}
