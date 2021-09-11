import 'package:flutter/material.dart';
import 'package:flutter_application_1/form/model/field_model.dart';

class CustomTextFormField extends StatefulWidget {
  final FieldModel field;
  final TextEditingController controller;

  const CustomTextFormField({ Key? key, required this.field, required this.controller}) : super(key: key);

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  TextInputType _keyboardType = TextInputType.text;
  String? errorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectKeyboardType();
  }

  void _selectKeyboardType() {
    if (widget.field.type == "Text") {
      _keyboardType = TextInputType.text;
    }
    else if (widget.field.type == "Number") {
      _keyboardType = TextInputType.number;
    }
  }

  void remoteValidation(String? error){
    setState(() {
      errorText = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: widget.field.label, errorText: errorText),
      keyboardType: _keyboardType,
      validator: (value) {
        if (widget.field.validation != null) {
          Validation? validation = widget.field.validation;
          if (validation?.required != null && validation?.required == true) {
            if (value == "") {
              return widget.field.label + " is required";
            }
          }

          if (validation?.minimum != null) {
            if (double.parse(value ?? "") <= double.parse(validation?.minimum?.toString() ?? "")) {
              return "Minimum value is " + (validation?.minimum?.toString() ?? "");
            }
          }
        }
      },
    );
  }
}