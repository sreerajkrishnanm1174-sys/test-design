import 'package:flutter/material.dart';

class Roundprofiles extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;

  Roundprofiles({required this.imageUrl, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(radius: 25, backgroundImage: NetworkImage(imageUrl)),
        if (isOnline)
          Positioned(
            bottom: 0,
            right: 5,
            child: CircleAvatar(radius: 6, backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: CircleAvatar(radius: 4, backgroundColor: Colors.green)),
          ),

        
      ],
    );
  }
}
