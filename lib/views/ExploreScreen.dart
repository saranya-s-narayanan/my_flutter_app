import 'package:flutter/material.dart';

void main() {
  runApp(ExploreScreen());
}

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoAware',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Datamodel> _items = [
    Datamodel(
      name: 'Item 1',
      id: 1,
    ),
    Datamodel(
      name: 'Item 2',
      id: 2,
    ),
    Datamodel(
      name: 'Item 3',
      id: 3,
    ),
    Datamodel(
      name: 'Item 4',
      id: 4,
    ),
    Datamodel(
      name: 'Item 5',
      id: 5,
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press here
            },
          ),
          title: Text(
            'EcoAware',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),


        ),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.network(
                    'https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Description paragraph',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 200.0),
                  Expanded(
                    child: Container(
                      height: 40.0,
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          hintText: 'Enter text',
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Handle search button press here
                    },
                  ),
                  SizedBox(width: 16.0),
                ],
              ),
            ),

            SizedBox(height: 16.0),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _items[index];
                return Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  child: ListTile(
                    leading: _buildImage(item.imageUrl),
                    title: Text(item.name),
                    onTap: () {
                      // Handle item tap here
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

  Widget _buildImage(String? imageUrl) {
    if (imageUrl != null) {
      return Image.network(
        imageUrl,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      );
    } else {
      return Container(
        width: 40,
        height: 40,
        color: Colors.grey,
      );
    }
  }
  class Datamodel {
  String name;
  int id;
  String? imageUrl;

  Datamodel({
  required this.name,
  required this.id,
  this.imageUrl =
  "https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png",
  });
  }
