import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:radio/app/modules/radios/radios_store.dart';

class RadiosPage extends StatefulWidget {
  final String title;
  const RadiosPage({Key? key, this.title = 'Adicionar'}) : super(key: key);
  @override
  RadiosPageState createState() => RadiosPageState();
}

class RadiosPageState extends State<RadiosPage> {
  final RadiosStore store = Modular.get();

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  onChanged: (value) => store.radio!.name = value,
                  decoration: InputDecoration(
                      labelText: "Nome", errorText: store.validName()),
                ),
                TextField(
                  onChanged: (value) => store.radio!.url = value,
                  decoration: InputDecoration(
                      labelText: "Url", errorText: store.validUrl()),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      store.add();
                      Modular.to.pushReplacementNamed(Modular.initialRoute);
                    },
                    icon: Icon(Icons.music_note),
                    label: Text("Adicionar"))
              ],
            ),
          )),
    );
  }
}
