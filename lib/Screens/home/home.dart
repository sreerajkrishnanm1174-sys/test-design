import 'package:facebook_design_clone/widgets/appBarButton.dart';
import 'package:facebook_design_clone/widgets/feedWidget.dart';
import 'package:facebook_design_clone/widgets/roundProfiles.dart';
import 'package:facebook_design_clone/widgets/searchOption.dart';
import 'package:facebook_design_clone/widgets/storyWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final ScrollController scrollController;
  const Home({ Key? key,required this.scrollController }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          actionsPadding: EdgeInsets.all(5),
          title: Text(
            "Facebook",
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          
          actions: [
            Appbarbutton(icon: Icons.search, onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchOption()));
            }),
            SizedBox(width: 10),
            Appbarbutton(icon: Icons.message, onPressed: () {}),
          ],
        ),
        body: ListView(
          controller: widget.scrollController,
          children: [
            Container(
              height: 60,
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                spacing: 20,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    ),
                  ),
                  Text(
                    "What's on your mind?",
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.videocam, color: Colors.red),
                        SizedBox(width: 5),
                        Text("Live"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),

                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(color: Colors.black!, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.photo, color: Colors.green),
                        SizedBox(width: 5),
                        Text("Photo"),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.room_preferences_rounded,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 5),
                        Text("Room"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 10),
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.videocam, color: Colors.blue, size: 25),
                        SizedBox(width: 10),
                        Text(
                          "create \n room",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Roundprofiles(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    isOnline: true,
                  ),
                  SizedBox(width: 10),
                  Roundprofiles(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    isOnline: false,
                  ),
                  SizedBox(width: 10),
                  Roundprofiles(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    isOnline: false,
                  ),
                  SizedBox(width: 10),
                  Roundprofiles(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    isOnline: true,
                  ),
                  SizedBox(width: 10),
                  Roundprofiles(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    isOnline: false,
                  ),
                  SizedBox(width: 10),
                  Roundprofiles(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    isOnline: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 220,
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical:10),
                children: [
                  Storywidget(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    username: "Add story",
                    profilleicon: Icon(
                      Icons.add,
                      color: Colors.lightBlue,
                      size: 20,
                    ),
                  ),
                  Storywidget(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    username: "Jane Smith",
                    profilleicon: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                        ),
                      ),
                    ),
                  ),
                  Storywidget(
                    imageUrl:
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                    username: "Jane Smith",
                    profilleicon: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Feedwidget(
              imageUrl: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
              username: "John Doe",
              timeAgo: "2 hrs ago",
              content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              postImageUrl: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
              likes: 222,
              comments: 22,
              shares: 10,
            ),
            SizedBox(height: 5),
            Feedwidget(
              imageUrl: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
              username: "John Doe",
              timeAgo: "2 hrs ago",
              content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              postImageUrl: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
              likes: 222,
              comments: 22,
              shares: 10,
            ),
            SizedBox(height: 5),

          ],
        ),
      );
  }
}
