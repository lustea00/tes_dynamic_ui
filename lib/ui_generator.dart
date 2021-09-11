import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/form/model/field_model.dart';

import 'form/field/custom_dropdown_field.dart';
import 'form/field/custom_text_form_field.dart';

class UIGenerator {
  Map<String, dynamic> jsonData = {
    "form": [
      {
        "name": "InputText",
        "label": "Input Text",
        "type": "Text",
        "validation": {"required": true}
      },
      {
        "name": "InputNumber",
        "label": "Input Number",
        "type": "Number",
        "validation": {"required": true, "minimum": 100}
      },
      {"name": "InputText2", "label": "Input Text 2", "type": "Text"},
      {
        "name": "SelectText",
        "label": "Select Text",
        "type": "Select",
        "item": [
          {
            "value": "1",
            "label": "Select 1"
          },
          {
            "value": "2",
            "label": "Select 2"
          }
        ]
      }
    ]
  };

  final _formKey = GlobalKey<FormState>();

  Future<Widget> getHttp() async {
    List<Widget> widget = [];
    List<Map<String, dynamic>> textCon = [];

    try {
      var response = await Dio().get('http://172.104.170.68:3000/form');
      // print(response);
      Map<String, dynamic> json = jsonData; // jsonDecode(response.toString());

      print(json.toString());
      List form = json['form'];
      form.forEach((element) {
        FieldModel model = FieldModel.fromJson(element);

        if (model.type == "Text" || model.type == "Number") {
          TextEditingController tempCon = new TextEditingController();
          GlobalKey<CustomTextFormFieldState> tempKey = new GlobalKey();
          Map<String, dynamic> tempConMap = {
            "Name": model.name,
            "Controller": tempCon,
            "Key": tempKey
          };
          textCon.add(tempConMap);

          Widget temp = CustomTextFormField(
            key: tempKey,
            controller: tempCon,
            field: model,
          );

          widget.add(temp);
        } else if (model.type == "Select") {
          Widget temp = CustomDropDownField(
            field: model,
          );

          widget.add(temp);
        }
      });

      widget.add(
        ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              GlobalKey<CustomTextFormFieldState> tempKey = textCon.firstWhere(
                  (element) => element['Name'] == "InputText2")['Key'];
              tempKey.currentState!.remoteValidation("error");
            }
          },
          child: const Text('Submit'),
        ),
      );
    } catch (e) {
      print(e);
    }
    return Form(
      key: _formKey,
      child: Column(children: widget),
    );
  }
}
