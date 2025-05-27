import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const AddNewBlogPage(),
  );
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, AddNewBlogPage.route());
          },
              icon: Icon(Icons.done_rounded))
        ],
      ),
      body: Column(
        children: [
          DottedBorder(child: Container(
            height: 150,
            width: double.infinity,
            child: Column(
              children: [
                Icon(Icons.folder_open, size: 40,),

              ],
            ),
          ),),
        ],
      ),
    );
  }
  }
