import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://wallpaperaccess.com/full/1372730.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text(
              "Juan Carlos",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text("jc.gumar96@gmail.com",
                style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://wipy.tv/wp-content/uploads/2020/06/por-que-tony-stark-usaba-un-reactor-arc-1200x675.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.house, color: Colors.blue),
            title: const Text("Peticiones"),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.doorOpen, color: Colors.blue),
            title: const Text("Salir"),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
        ],
      ),
    );
  }
}
