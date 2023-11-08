import 'package:booksapp_asign/services/fetch_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic data;
  void getData() async{
  data = await FetchData.instance.getData();
  print(data);

  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listexample"),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
         ListTile(
           title: Text("Item 1"),
           subtitle: Text("Sub Item 1"),
         ),
          ListTile(
            title: Text("Item 2"),
            subtitle: Text("Sub Item 2"),
          ),
          ListTile(
            title: Text("Item 3"),
            subtitle: Text("Sub Item 3"),
          ),
          ListTile(
            title: Text("Item 4"),
            subtitle: Text("Sub Item 4"),
          ),
          ListTile(
            title: Text("Item 5"),
            subtitle: Text("Sub Item 5"),
          ),
        ],


      ),
    );
  }
}
