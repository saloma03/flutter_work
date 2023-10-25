import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://scontent.fcai21-3.fna.fbcdn.net/v/t39.30808-6/312438750_649690536670552_7135008860448794589_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFkSc2T28ixZi26mwrz5mkbYc_-4dU9Dd5hz_7h1T0N3hC5Qm-1g1V7W7Quhf_-eoeKFV40coZOIWM0jSb2G7ZP&_nc_ohc=JGNgqdKBfhsAX-fYBlG&_nc_ht=scontent.fcai21-3.fna&oh=00_AfDaJdKvpCbgIFNc827SQXoouZs-ZsU7G5IbJCifeB-Bzg&oe=64E62448',),
            ),
            SizedBox(width: 15.0,),
            Text('Chats',style: TextStyle(
              color: Colors.black,
            ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon:
            CircleAvatar(
                child: Icon(
                    Icons.camera_alt,
                  color: Colors.white,
                  size: 16.0,
                )
            ),
          ),
          IconButton(
            onPressed: (){},
            icon:
            CircleAvatar(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16.0,
                )
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),

        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5.0),
                  color: Colors.grey[200],
//SingChild
                ),
                child: Row
                  (
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(width: 15.0,),
                      Text('search',),
                    ],



                ),
              ),
              SizedBox(height: 10.0,),
              //you need to put specific hight
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>buildStoryItem(),
                    separatorBuilder: (context,index) => SizedBox(width: 5,),
                    itemCount: 20,
                ),
              ),
              SizedBox(height: 10.0,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(), // all of them scroll and this is false
                  shrinkWrap: true, //create the list once
                  itemBuilder: (context,index)=>buildChatItem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 10.0,),
                  itemCount: 20)

            ],
          ),
        ),
      ),
    );
  }
  //1. build item
  //2 build list
  // context? => فيه بيحتاج وفيه مش بيحتاج
  //
  Widget buildChatItem() =>  Row(
  children: [
  Stack(
  alignment: AlignmentDirectional.bottomEnd,
  children: [
  CircleAvatar(
  radius: 25.0,
  backgroundImage: NetworkImage('https://scontent.fcai21-3.fna.fbcdn.net/v/t39.30808-6/312438750_649690536670552_7135008860448794589_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFkSc2T28ixZi26mwrz5mkbYc_-4dU9Dd5hz_7h1T0N3hC5Qm-1g1V7W7Quhf_-eoeKFV40coZOIWM0jSb2G7ZP&_nc_ohc=JGNgqdKBfhsAX-fYBlG&_nc_ht=scontent.fcai21-3.fna&oh=00_AfDaJdKvpCbgIFNc827SQXoouZs-ZsU7G5IbJCifeB-Bzg&oe=64E62448',),
  ),
  CircleAvatar(
  radius: 9.0,
  backgroundColor: Colors.white,
  ),
  Padding(
  padding:  EdgeInsetsDirectional.only(
  bottom: 2.0,
  end: 2.0,
  ),
  child: CircleAvatar(
  radius: 7.0,
  backgroundColor: Colors.green,
  ),
  )
  ],
  ),
  SizedBox(width: 20.0,),
  Expanded(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text('Salma Ramadan',
  style: TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  ),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,),
  SizedBox(height: 5.0,),
  Row(
  children: [
  Text(
  'new message from salma',
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  ),
  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0),
  child: Container(
  width: 7.0,
  height: 7.0,
  decoration: BoxDecoration(
  color: Colors.blue,
  shape: BoxShape.circle,

  ),
  ),
  ),
  Text(
  '5:43 pm',
  ),


  ],

  ),
  ],
  ),
  ),
  ],
  );
  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('https://scontent.fcai21-3.fna.fbcdn.net/v/t39.30808-6/312438750_649690536670552_7135008860448794589_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFkSc2T28ixZi26mwrz5mkbYc_-4dU9Dd5hz_7h1T0N3hC5Qm-1g1V7W7Quhf_-eoeKFV40coZOIWM0jSb2G7ZP&_nc_ohc=JGNgqdKBfhsAX-fYBlG&_nc_ht=scontent.fcai21-3.fna&oh=00_AfDaJdKvpCbgIFNc827SQXoouZs-ZsU7G5IbJCifeB-Bzg&oe=64E62448',),
            ),
            CircleAvatar(
              radius: 9.0,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding:  EdgeInsetsDirectional.only(
                bottom: 2.0,
                end: 2.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        SizedBox(height: 10.0,),
        Text('Salma Ramadan',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(

          ),),
      ],
    ),
  );


}

