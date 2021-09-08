import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui_generator.dart';

class FormView extends StatefulWidget {
  FormView({Key? key}) : super(key: key);

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UIGenerator().getHttp(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data ?? Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
