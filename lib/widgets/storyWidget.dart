import 'package:flutter/material.dart';

class Storywidget extends StatelessWidget {
  final String imageUrl;
  final String username;
  final Widget profilleicon;
  

  Storywidget({required this.imageUrl, required this.username, required this.profilleicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal:5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              "John Doe",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: profilleicon,
            ),
          ),
        ],
      ),
    );
  }
}
