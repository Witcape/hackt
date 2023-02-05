import 'package:flutter/material.dart';

void main() {
  runApp(homepage());
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final _pageOptions = [
    homepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 60,
                left: 20,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Catalog',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                left: 20,
              ),
              child: Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildCard(context, "Option 1"),
                    _buildCard(context, "Option 2"),
                    _buildCard(context, "Option 3"),
                    _buildCard(context, "Option 4"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(height: 10),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 165, 195, 220),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0
                    ? Color.fromARGB(255, 68, 78, 222)
                    : Colors.grey,
              ),
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              label: "Pages",
              icon: Icon(
                Icons.menu_book_rounded,
                color: _selectedIndex == 1
                    ? Color.fromARGB(255, 68, 78, 222)
                    : Colors.grey,
              ),
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(
                Icons.shopping_cart,
                color: _selectedIndex == 2 ? Colors.red : Colors.grey,
              ),
              backgroundColor: Color.fromARGB(255, 18, 23, 85),
            ),
            BottomNavigationBarItem(
              label: "profile",
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 3 ? Colors.red : Colors.grey,
              ),
              backgroundColor: Color.fromARGB(255, 18, 23, 85),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String option) {
    return GestureDetector(
      onTap: () {},
      child: InkWell(
        onTap: (() {}),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.23,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: _selectedIndex == 2 || _selectedIndex == 3
                ? Colors.red
                : Color.fromARGB(255, 18, 23, 85),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              option,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
