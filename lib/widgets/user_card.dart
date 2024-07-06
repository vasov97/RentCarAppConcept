import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFCBF1F5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
          ]),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/user.png'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Jane Cooper',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '\$4,253',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
