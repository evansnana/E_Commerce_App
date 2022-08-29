 import 'package:flutter/material.dart';

AppBar ShopAppBar(BuildContext context, TextStyle titleStyle) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.grey[400]),
      automaticallyImplyLeading: false,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 50,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://images.pexels.com/photos/4412516/pexels-photo-4412516.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hello",
          style: titleStyle
          
        ),
        Text("Evans",
        style: titleStyle,
        ),
        ],
      ),
      actions: [
        Icon(Icons.notifications),
        SizedBox(
          width: 20,
        )
        ],
    );
  }

