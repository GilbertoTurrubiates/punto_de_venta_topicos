import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punto_de_venta_topicos/controlador/categoria_controlador.dart';

class VerCategorias extends StatelessWidget {
  const VerCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriaControlador categoriaControlador = CategoriaControlador();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: categoriaControlador.categorias.isEmpty
          ? const Center(child: Text('No hay categorias'))
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0;
                      i < categoriaControlador.categorias.length;
                      i++)
                    ListTile(
                      leading: Text((i + 1).toString()),
                      title: Text(categoriaControlador.categorias[i]),
                    ),
                ],
              ),
            ),
    );
  }
}

class AgregarCategoria extends StatelessWidget {
  const AgregarCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriaControlador categoriaControlador = CategoriaControlador();
    final TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Agregar Categoria N° ${categoriaControlador.categorias.length + 1}'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: 'Nombre de la categoria',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String resultado = categoriaControlador.agregarCategoria(
                textController.text,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(resultado),
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

class EditarCategoria extends StatelessWidget {
  const EditarCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriaControlador categoriaControlador = CategoriaControlador();
    final TextEditingController idController = TextEditingController();
    final TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Categoria'),
      ),
      body: Column(
        children: [
          TextField(
            controller: idController,
            decoration: const InputDecoration(
              labelText: 'N° de la categoria',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: 'Nuevo Nombre de la categoria',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String resultado = categoriaControlador.editarCategoria(
                int.parse(idController.text) - 1,
                textController.text,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(resultado),
                ),
              );
              Navigator.pop(context);
            },
            child: const Text('Editar'),
          ),
        ],
      ),
    );
  }
}

class EliminarCategoria extends StatelessWidget {
  const EliminarCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriaControlador categoriaControlador = CategoriaControlador();
    final TextEditingController idController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliminar Categoria'),
      ),
      body: Column(
        children: [
          TextField(
            controller: idController,
            decoration: const InputDecoration(
              labelText: 'N° de la categoria',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          ElevatedButton(
            onPressed: () {
              String resultado = categoriaControlador.eliminarCategoria(
                int.parse(idController.text) - 1,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(resultado),
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
