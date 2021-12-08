// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storemovieinfo/Data/data.dart';
import 'package:storemovieinfo/MainPage/homePage.dart';

class Details extends StatelessWidget {
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final dataList = Provider.of<DataFunction>(context);
    final data = dataList.items;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/BackImg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MainPage.routeName);
              },
              icon: Icon(Icons.add),
            )
          ],
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
          itemBuilder: (context, i) => CardDetails(
            movieName: data[i].movieName,
            director: data[i].director,
            posterUrl: data[i].posterUrl,
            id: data[i].id,
          ),
          itemCount: data.length,
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  // const CardDetails({ Key? key }) : super(key: key);
  final String? movieName;
  final String? director;
  final String? posterUrl;
  final String? id;

  CardDetails({this.director, this.movieName, this.posterUrl, this.id});

  @override
  Widget build(BuildContext context) {
    final dataList = Provider.of<DataFunction>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14.0),
          margin: EdgeInsets.only(left: 25.0, right: 25.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(movieName!,
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w500)),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      dataList.deleteData(id!);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text('DIRECTED BY ${director!}',
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500)),
              SizedBox(height: 10.0),
              Container(
                child: Image.network(posterUrl!),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
