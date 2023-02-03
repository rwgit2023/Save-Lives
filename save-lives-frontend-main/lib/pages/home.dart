import 'package:flutter/material.dart';
import 'package:savelives/pages/drawers/drawer.dart';
import 'package:savelives/pages/map/maps_widget.dart';

class MapsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MapsPage();
  }
}

class _MapsPage extends State<MapsPage> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(               
        title: const Text("Hemocentros"),
      ),
      body: MapsWidget(),
    );
  }
}
