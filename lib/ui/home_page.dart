import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;

  int offset = 0;

  Future<Map> _getSearch() async {
    http.Response response;

    if (_search == null)
      response = await http.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=lEfUAjzRp3l8FuorXtSoawPoSekvibUH&limit=25&rating=g');
    else
      response = await http.get(
          'https://api.giphy.com/v1/gifs/search?api_key=PlZolrTlOobahOvXILOMUDkOjejD4sBN&q=$_search=20&offset=$offset&rating=g&lang=en');

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getSearch().then((map) => print(map));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.black,
      title: SizedBox(
        child: Text('Search Giphys'),
        width: 300.0,
        height: 100.0,
      ),
      centerTitle: true,
    ));
  }
}
