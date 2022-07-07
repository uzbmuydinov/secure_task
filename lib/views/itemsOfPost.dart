import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:secure_task/controller/home_controller.dart';
import 'package:secure_task/models/post_model.dart';




Widget itemOfPost(Post post,HomeController mainController) {
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            mainController.goToEditPage(post,context);
          },
          backgroundColor: const Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ],
    ),
    endActionPane:  ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          backgroundColor: const Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
          onPressed: (BuildContext context) {
            mainController.apiPostDelete(post);
          },
        ),
      ],
    ),
    child: Container(
      padding:const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(post.body),
        ],
      ),
    ),
  );
}