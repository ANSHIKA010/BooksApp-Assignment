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
      body: Align(
        alignment: Alignment.center,

          child: bodyUI(),
        ),
    );
  }
  Widget bodyUI() {

    return FutureBuilder<Map<String, dynamic>>(
      future: FetchData.instance.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Align(alignment: Alignment.center, child: CircularProgressIndicator(),);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final data = snapshot.data;
          List<Widget> widgets = [
            ListTile(
              title: Text("Item 1"),
              subtitle: Text("Sub Item 1"),
            ),
          ];

          if(data!= null && data["leads"] != null){
            widgets =   data["leads"]?.map<Widget>((lead) =>
                ListTile(
                  title: Text(lead["firstName"] + " " + lead["lastName"]),
                  subtitle: Text(lead["email"]),
                ),
            ).toList();
          }

          return  ListView(
            scrollDirection: Axis.vertical,
            children: widgets

          );
        }
      },
    );

  }
}
