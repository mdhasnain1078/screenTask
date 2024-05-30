import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.color, required this.text});
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: AssetImage("assets/image121.png"),
      ),
      title: Text("Yashika"),
      subtitle: Text(
        "29, India",
        style: TextStyle(color: Color(0xFF494949)),
      ),
      trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: color, minimumSize: Size(110, 40)),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          )),
    );
  }
}
