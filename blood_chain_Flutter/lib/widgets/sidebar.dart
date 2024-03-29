import 'package:blood/screens/login_screen.dart';
import 'package:blood/utils/colors.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(0.8),
            ),
            child: Image.asset(
              'assets/blood.png',
              width: 100, // Adjust size as needed
              height: 100, // Adjust size as needed
            ),
          ),
          SizedBox(height: 10), // Adding space between header and list items
          _buildListTile(context, 'Organisation', Colors.blue),
          _buildListTile(context, 'Hospital', Colors.green),
          _buildListTile(context, 'Donor', Colors.orange),
          SizedBox(height: 10), // Adding space between list items
          _buildListTile(context, 'Logout', Colors.red),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        onTap: () {
          if (title == 'Logout') {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          } else if (title == 'Organisation') {
            // Handle Organisation option logic
          } else if (title == 'Hospital') {
            // Handle Hospital option logic
          } else if (title == 'Donor') {
            // Handle Donor option logic
          }
        },
      ),
    );
  }
}
