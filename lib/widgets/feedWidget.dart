import 'package:flutter/material.dart';

class Feedwidget extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String timeAgo;
  final String content;
  final String postImageUrl;
  final int likes;
  final int comments;
  final int shares;
  Feedwidget({required this.imageUrl, required this.username, required this.timeAgo, required this.content, required this.postImageUrl, required this.likes, required this.comments, required this.shares});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                this.imageUrl,
              ),
            ),
            title: Text(this.username),
            subtitle: Text(this.timeAgo),
            trailing: Icon(Icons.more_horiz),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              this.content, 
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  this.postImageUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              spacing: 20,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.lightBlue),
                    SizedBox(width: 2),
                    Text(this.likes.toString()),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment_outlined, color: Colors.grey),
                    SizedBox(width: 2),
                    Text(this.comments.toString()),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.share_outlined, color: Colors.grey),
                    SizedBox(width: 2),
                    Text(this.shares.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
        
      ),
      

    );
  }
}
