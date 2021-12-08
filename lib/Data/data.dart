// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';

class Data {
  final String? id;
  final String? movieName;
  final String? director;
  final String? posterUrl;

  Data({this.director, this.id, this.movieName, this.posterUrl});
}

class DataFunction with ChangeNotifier {
  List<Data> _items = [];
  List<Data> get items {
    return [..._items];
  }

  void addData(Data data) {
    final newData = Data(
      director: data.director,
      movieName: data.movieName,
      posterUrl: data.posterUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newData);
    notifyListeners();
  }

  void deleteData(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
