import 'package:auvnet/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CustomGotCodeWidget extends StatelessWidget {
  const CustomGotCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 0), // Shadow from all directions
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(Assets.imageCoge),
        title: const Text(
          'Got a code !',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Add your code and save on your order'),
        onTap: () {},
      ),
    );
  }
}
