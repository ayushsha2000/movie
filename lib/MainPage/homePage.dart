// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, avoid_print, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:storemovieinfo/Data/data.dart';
import 'package:provider/provider.dart';
import 'package:storemovieinfo/MainPage/details.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/homePage';
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _form = GlobalKey<FormState>();
  final _directorFocusNode = FocusNode();
  final _urlFocusNode = FocusNode();
  @override
  void dispose() {
    _directorFocusNode.dispose();
    _urlFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<DataFunction>(context, listen: false).addData(_editedData);
    Navigator.pushNamed(context, Details.routeName);
  }

  var _editedData = Data(
    id: null,
    movieName: '',
    director: '',
    posterUrl: '',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/BackImg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(14.0),
            margin: EdgeInsets.only(left: 25.0, right: 25.0),
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Form(
              key: _form,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'MOVIE NAME',
                        labelStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_directorFocusNode);
                    },
                    onSaved: (value) {
                      _editedData = Data(
                        id: null,
                        movieName: value,
                        director: _editedData.director,
                        posterUrl: _editedData.posterUrl,
                      );
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Movie Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'DIRECTED BY',
                        labelStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    textInputAction: TextInputAction.next,
                    focusNode: _directorFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_urlFocusNode);
                    },
                    onSaved: (value) {
                      _editedData = Data(
                        id: null,
                        movieName: _editedData.movieName,
                        director: value,
                        posterUrl: _editedData.posterUrl,
                      );
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Director Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'POSTER URL',
                        labelStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    textInputAction: TextInputAction.next,
                    focusNode: _urlFocusNode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Poster URL';
                      }
                      if (!value.startsWith('http') &&
                          !value.startsWith('https')) {
                        return 'Please enter valid URL';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _editedData = Data(
                        id: null,
                        movieName: _editedData.movieName,
                        director: _editedData.director,
                        posterUrl: value,
                      );
                    },
                    onFieldSubmitted: (_) {
                      _saveForm();
                    },
                  ),
                  SizedBox(
                    height: 55.0,
                  ),
                  GestureDetector(
                    onTap: _saveForm,
                    child: Container(
                        child: Icon(
                      Icons.save,
                      size: 50.0,
                      color: Colors.black,
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
