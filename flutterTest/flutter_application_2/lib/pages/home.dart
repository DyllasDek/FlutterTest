import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, String> todoList = {};

  late String _userToDo;
  @override
  void initState() {
    super.initState();
    loadList();
  }

  void loadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    setState(() {
      for (String key in keys) {
        todoList[key] = (prefs.getString(key) ?? '');
      }
    });
  }

  void deleteFromList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(key);
    setState(() {
      todoList.remove(key);
    });
  }

  void insertToList(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = (int.parse(prefs.getKeys().last) + 1).toString();

    prefs.setString(key, value);
    setState(() {
      todoList[key] = value;
    });
  }

  void _menuOpen() {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Меню'),
          ),
          body: Row(
            children: [
              ElevatedButton(
                  onPressed: (() {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  }),
                  child: const Text('На главную')),
              const Padding(padding: EdgeInsets.only(left: 15))
            ],
          ));
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar:
          AppBar(title: const Text('Список дел'), centerTitle: true, actions: [
        IconButton(
            onPressed: (() => _menuOpen()),
            icon: const Icon(Icons.menu_outlined))
      ]),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            String key = todoList.keys.elementAt(index);
            return Dismissible(
              key: Key(key),
              onDismissed: (direction) => {
                //if (direction == DismissDirection.endToStart)
                setState(
                  () {
                    deleteFromList(key);
                  },
                )
              },
              child: Card(
                // ignore: sort_child_properties_last
                child: ListTile(
                  title: Text((todoList[key] ?? '')),
                  trailing: IconButton(
                    icon: const Icon(Icons.restore_from_trash),
                    color: Colors.redAccent,
                    onPressed: () {
                      setState(
                        () {
                          deleteFromList(key);
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: const Text('Добавить элемент'),
                  content: TextField(
                    onChanged: (String value) {
                      _userToDo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          insertToList(_userToDo);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Добавить'))
                  ],
                );
              }));
        },
        child: const Icon(
          Icons.add_box,
          color: Colors.greenAccent,
        ),
      ),
    );
  }
}
