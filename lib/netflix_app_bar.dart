import 'package:flutter/material.dart';

class NetflixAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NetflixAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: const Text(
        'Netflix',
        style: TextStyle(color: Colors.red, fontSize: 24),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/50'),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
