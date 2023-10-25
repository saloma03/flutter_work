import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu, //static
        ),
        title: Text(
            'Barbie App'
        ),
        actions: [
          IconButton(
              onPressed: (){
            print("notificarion clicked");
          },
              icon: Icon(Icons.notification_important,
      ) ),
          IconButton(
              onPressed: (){
                print("hello");
              },
              icon: Icon(Icons.search,)
          ),

        ],


        elevation: 20,
        backgroundColor: Colors.pink, //static
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20.0)),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://tse4.mm.bing.net/th?id=OIP.H6Znb4LwWOEUCbMW8sxrTgHaEo&pid=Api&P=0&h=180',
                    ),
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Container(

                    width: 200.0,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    color: Colors.black.withOpacity(0.4),
                    child: Text("Sea",

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
      //parameter: object from class
    );
  }


}