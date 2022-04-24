import 'package:flutter/material.dart';

import 'main.dart';
import 'auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: AppBar(title: Text('Sis')),
      drawer: Drawer(
          child: ListView(
            // Remove padding
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('ballsKsharma.com'),
                accountEmail: Text('PKS@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://preview.redd.it/v0caqchbtn741.jpg?auto=webp&s=c5d05662a039c031f50032e22a7c77dfcf1bfddc',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
                ),
              ),
              ListTile(title: Text('Lmao'), onTap: () => null),
              ListTile(title: Text('Lol'), onTap: () => null),
              ListTile(title: Text('rofl'), onTap: () => null),
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
          /*Text('Hello chaps',
              style: TextStyle(color: Colors.white, fontSize: 20)*/
          backgroundColor: Color.fromARGB(255, 55, 215, 254)),
      body: PageView(
        controller: pageController,
        children: [
          Scaffold(),
          Scaffold(
            body: ListView(padding: const EdgeInsets.all(0), children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Cello Hat 1",
                  style: TextStyle(
                      fontSize: 75, color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.left,
                ),
                height: 300,
                color: Color.fromARGB(230, 108, 108, 231),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Cello Hat 2",
                  style: TextStyle(
                      fontSize: 75, color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.left,
                ),
                height: 300,
                color: Color.fromARGB(230, 108, 108, 231),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Cello Hat 3",
                  style: TextStyle(
                      fontSize: 75, color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.left,
                ),
                height: 300,
                color: Color.fromARGB(230, 108, 108, 231),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Cello Hat 4",
                  style: TextStyle(
                      fontSize: 75, color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.left,
                ),
                height: 300,
                color: Color.fromARGB(230, 108, 108, 231),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Cello Hat 5",
                  style: TextStyle(
                      fontSize: 75, color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.left,
                ),
                height: 300,
                color: Color.fromARGB(230, 108, 108, 231),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Cello Hat 6",
                  style: TextStyle(
                      fontSize: 75, color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.left,
                ),
                height: 300,
                color: Color.fromARGB(230, 108, 108, 231),
              ),
            ]),
          ),
          Scaffold(
              // appBar: AppBar(
              //   title: Text('Login'),
              //   backgroundColor: Colors.amber,
              // ),
              // body: Center(
              //     child: Column(
              //   children: <Widget>[LoginButton(), UserProfile()],
              // )),
              )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: 'My Groups'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: 'Notifications'),
          ],
          currentIndex: _pageIndex,
          selectedItemColor: Color.fromARGB(255, 255, 174, 0),
          unselectedItemColor: Colors.grey,
          onTap: onTapped),
    );
  }
}
