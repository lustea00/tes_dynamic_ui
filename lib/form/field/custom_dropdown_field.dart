import 'package:flutter/material.dart';
import 'package:flutter_application_1/form/model/field_model.dart';

class CustomDropDownField extends StatefulWidget {
  final FieldModel field;

  const CustomDropDownField({ Key? key, required this.field }) : super(key: key);

  @override
  CustomDropDownFieldState createState() => CustomDropDownFieldState();
}

class CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: Text(widget.field.name));
  }
}