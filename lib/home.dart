import 'dart:math';

import 'package:flutter/material.dart';

import 'main.dart';
import 'auth.dart';
import 'ui/login/login_view.dart';
import 'ui/login/login_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This holds the items of the ListView
  List<String> _listItems = <String>[
    "AP Physics 1",
    "AP Calculus BC",
    "AP Calculus AB",
    'AP US History',
    'AP Literature',
    'AP Computer Science',
    'AP Physics C'
  ];

  final List<String> myGroups = <String>["Shriram's APP1", "Naman's APBC"];
  final List<Color> colors = <Color>[
    Colors.cyan,
    Colors.indigo,
    Colors.teal,
    Colors.orange,
    Colors.amber,
    Color.fromARGB(255, 116, 249, 127),
    Colors.redAccent,
    Color.fromARGB(255, 247, 78, 134),
    Color.fromARGB(255, 112, 91, 217)
  ];
  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      myGroups.insert(0, nameController.text);
    });
  }

  // Used to generate random integers
  final _random = Random();

  int _pageIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ace')),
      drawer: Drawer(
          child: ListView(
            // Remove padding
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(''),
                accountEmail: Text(''),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'asset0.jpeg',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('asset.jpeg')),
                ),
              ),
              ListTile(title: Text('Sign in'), onTap: () => null),
              ListTile(title: Text('About'), onTap: () => null),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Request'),
                onTap: () => null,
                trailing: ClipOval(
                  child: Container(
                    color: Colors.red,
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Text(
                        '8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 55, 215, 254)),
      body: PageView(
        controller: pageController,
        children: [
          Scaffold(
            body: Column(children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: myGroups.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 200,
                          width: 1000,
                          margin: EdgeInsets.all(2.0),
                          child: Center(
                            child: Text(
                              '${myGroups[index]}',
                              style: TextStyle(
                                fontSize: 60,
                                color: Color.fromARGB(255, 247, 247, 247),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          color: colors[_random.nextInt(colors.length)],
                        );
                      })),
            ]),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showGroupAdd("Create a New Group?", context);
              },
            ),
          ),
          Scaffold(
            body: ListView.builder(
              itemCount: _listItems.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: colors[_random.nextInt(colors.length)],
                    child: FlatButton(
                        onPressed: () {
                          print("aaaaa");
                          showDialogFunc("Add to My Groups?", context);
                        },
                        padding: const EdgeInsets.all(30),
                        child: Text(
                          _listItems[index],
                          style: const TextStyle(fontSize: 24),
                        )),
                  ),
                );
              },
            ),
          ),
          Scaffold(body: LoginScreen()) //body: LoginView())
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: 'My Groups'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          ],
          currentIndex: _pageIndex,
          selectedItemColor: Color.fromARGB(255, 255, 174, 0),
          unselectedItemColor: Colors.grey,
          onTap: onTapped),
    );
  }

  showGroupAdd(title, context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              height: 320,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Group Name',
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text('Add'),
                    onPressed: () {
                      addItemToList();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(title, context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "",
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Add"),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
