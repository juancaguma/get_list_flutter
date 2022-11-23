import 'package:flutter/material.dart';

import '../clases/reqres.dart';
import '../models/get_user.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Usuario>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiServiceUser().getUsers())!;
    print('HOME');
    print(_userModel);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuarios'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "home")
                  .then((value) => setState(() {})),
              icon: const Icon(Icons.add_circle)),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
      drawer: const MenuWidget(),
      body: const Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
