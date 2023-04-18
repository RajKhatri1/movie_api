import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_api/screen/home/controller/homecontroller.dart';
import 'package:movie_api/screen/home/model/homemodel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();

}

Homecontroller homecontroller = Get.put(Homecontroller());

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Movie",style: TextStyle(color: Colors.white)),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
            else if(snapshot.hasData)
              {
                Homemodel? h1 = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: homecontroller.txtname,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                homecontroller.movie.value = homecontroller.txtname.text;
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.network("${h1!.d![0].i!.imageUrl!}"),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Movie :=${h1.d![0].l}",style:TextStyle(fontWeight: FontWeight.w400) ),
                          SizedBox(height: 10,),
                          Text("cast :=${h1.d![0].s}",style:TextStyle(fontWeight: FontWeight.w400) ),
                          SizedBox(height: 10,),
                          Text("cast :=${h1.d![0].q}",style:TextStyle(fontWeight: FontWeight.w400) ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            return CircularProgressIndicator();
          },
          future: homecontroller.getApiData(homecontroller.movie.value),
        ),
      ),
    );
  }
}
