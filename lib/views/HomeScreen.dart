import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          padding: EdgeInsets.all(16),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            GridItem(
              icon: Icons.home,
              label: 'Item 1',
            ),
            GridItem(
              icon: Icons.search,
              label: 'Item 2',
            ),
            GridItem(
              icon: Icons.notifications,
              label: 'Item 3',
            ),
            GridItem(
              icon: Icons.settings,
              label: 'Item 4',
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const GridItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle item click
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


}


