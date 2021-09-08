import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UIGenerator {
  Future<Widget> getHttp() async {
    List<Widget> widget = [];
    try {
      var response = await Dio().get('http://172.104.170.68:3000/form');
      // print(response);
      Map<String, dynamic> json = jsonDecode(response.toString());
      List form = json['data'];
      form.forEach((element) {
        // if (element.keys == "TextField") {
          TextField temp = TextField(
            decoration: InputDecoration(labelText: element['TextField']['decoration']['labelText']),
          );
          widget.add(temp);
          print("a");
        // }
        print(element);
      });
    } catch (e) {
      print(e);
    }
    return Column(children: widget);
  }
}
