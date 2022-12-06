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
      body: _crearListado(_userModel),
    );
  }

  Widget _crearListado(user) {
    if (user.length == 0) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, i) => _crearItem(context, user[i]),
      );
    }
  }

  Widget _crearItem(BuildContext context, Usuario user) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.blue,
      ),
      onDismissed: (direccion) {},
      child: Card(
        color: Colors.blueAccent[50],
        child: Column(
          children: <Widget>[
            Container(
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.profilePath),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(
                    user.email,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  tileColor: Colors.cyan,
                  trailing: const Icon(
                    Icons.favorite,
                    size: 24.0,
                    color: Colors.red,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
