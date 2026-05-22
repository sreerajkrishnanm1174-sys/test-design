import 'package:flutter/material.dart';

class SearchOption extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 60,
            color: Colors.white,
            child:ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              title: ListTile(
                title: Text("Search Facebook"),
                leading: Icon(Icons.search),
              
              )
            ),
            )
            ),
      );
        

    
  }
}