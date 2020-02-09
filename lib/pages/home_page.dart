import 'package:carros/pages/carros/carros_api.dart';
import 'package:carros/pages/carros/carros_listview.dart';
import 'package:carros/widgets/draw_list.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with  SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
         appBar: (AppBar(title: Text("Carros"),
           bottom: TabBar(tabs: <Widget>[
             Tab(text: "Clássicos",),
             Tab(text: "Esportivos",),
             Tab(text: "Luxo",),
           ],),
        )
      ),
      body: TabBarView(children : [
        CarroListView(TipoCarro.classicos),
        CarroListView(TipoCarro.esportivos),
        CarroListView(TipoCarro.luxo),
      ]),
          drawer: DrawerList (),
        ),
    );
  }
}

