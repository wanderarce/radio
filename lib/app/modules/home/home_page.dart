import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    store.getRadios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radios'),
        actions: [
          IconButton(
              onPressed: () {
                Modular.to.pushNamed("/plus");
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 1,
          ),
          Expanded(
            child: Observer(
              builder: (context) => store.radios == null
                  ? Container(height: 0)
                  : Container(
                      padding: EdgeInsets.all(18),
                      child: ListView.builder(
                        key: UniqueKey(),
                        itemCount: store.radios.length,
                        itemBuilder: (context, index) => Card(
                          key: UniqueKey(),
                          elevation: 2,
                          margin: EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            key: Key(store.radios[index].id.toString()),
                            contentPadding: EdgeInsets.all(5),
                            leading: store.metadata == null
                                ? Image.asset("images/musica.png")
                                : getValidImage(
                                    store.metadata!.last,
                                  ),
                            title: Text("${store.radios[index].name}"),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${store.radios[index].album}"),
                                Text("${store.radios[index].title}"),
                                Text("${store.radios[index].url}"),
                              ],
                            ),
                            trailing: IconButton(
                              key: Key(
                                  store.radios[index].id!.bitLength.toString()),
                              onPressed: () {
                                store.initRadioPlayer(store.radios[index]);

                                setState(() {
                                  store.radioPlayer.getMetadataArtwork();
                                  store.isPlaying == true
                                      ? store.radioPlayer.pause()
                                      : store.radioPlayer.play();
                                });
                              },
                              icon: Icon(store.radios[index].icon),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  getValidImage(String last) {
    try {
      if (store.metadata != null &&
          (store.metadata!.last.contains(".jpg") ||
              store.metadata!.last.contains(".png")))
        return Image.network(store.metadata!.last);
      else
        return Image.asset("images/musica.png");
    } catch (e) {
      print(e);
    }
  }
}
