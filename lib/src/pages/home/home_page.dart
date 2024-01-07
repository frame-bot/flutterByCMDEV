import 'package:cmflutter0/src/models/youtube.dart';
import 'package:cmflutter0/src/services/webapi_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WebApiService().feed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: Container(
          color: Colors.purple[50],
          child: FutureBuilder(
            future: WebApiService().feed(),
            builder: (context, snapshot) {
              if(snapshot.hasData == false){
                return Text("Loading...");
              }

            final youtubes = snapshot.data;
            // better performance
            return ListView.builder(
              itemCount: youtubes!.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                    print(youtubes[index].title);
                  },
                  child: Card(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(youtubes[index].title),
                        // Text(youtubes[index].subtitle),
                        Image.network(youtubes[index].avatarImage),
                      ],
                    ),
                  ),
                );
              },
            );

            // Low performance
            // return Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [...youtubes!.map((e) => Text(e.title))],
            // );
              // return Column(
              //   children: [
              //     ...[1, 2, 3, 4].map((e) => Text(e.toString()))
              //   ],
              // );
            },
          ),
        )));
  }
}
