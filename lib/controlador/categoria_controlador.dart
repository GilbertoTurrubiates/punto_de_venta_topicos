import 'package:hive_flutter/hive_flutter.dart';

class CategoriaControlador {
  final _categoriaBox = Hive.box('categorias');

  List<dynamic> get categorias {
    List<dynamic> categorias = [];
    for (var i = 0; i < _categoriaBox.length; i++) {
      categorias.add(_categoriaBox.getAt(i));
    }
    return categorias;
  }

  String agregarCategoria(String nombre) {
    if (nombre.isEmpty) {
      return 'El nombre no puede estar vacío';
    }
    for (var i = 0; i < _categoriaBox.length; i++) {
      if (_categoriaBox.getAt(i) == nombre) {
        return 'La categoría ya existe';
      }
    }
    _categoriaBox.add(nombre);
    return 'Categoría agregada';
  }

  String editarCategoria(int index, String nombre) {
    if (index < 0 || index >= _categoriaBox.length) {
      return 'Índice inválido';
    }

    if (nombre.isEmpty) {
      return 'El nombre no puede estar vacío';
    }
    for (var i = 0; i < _categoriaBox.length; i++) {
      if (_categoriaBox.getAt(i) == nombre && i != index) {
        return 'La categoría ya existe';
      }
    }
    _categoriaBox.putAt(index, nombre);
    return 'Categoría editada';
  }

  String eliminarCategoria(int index) {
    if (index < 0 || index >= _categoriaBox.length) {
      return 'Índice inválido';
    }

    _categoriaBox.deleteAt(index);
    return 'Categoría eliminada';
  }
}
