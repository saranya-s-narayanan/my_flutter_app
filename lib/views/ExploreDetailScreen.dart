import 'package:flutter/material.dart';

void main() {
  runApp(ExploreScreen());
}

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Collapsible List View with Datamodel',
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
      isExpanded: true,
      content: 'This is the content of the collapsible list view for Item 1.This is the content of the collapsible list view for Item 1.'
          'This is the content of the collapsible list view for Item 1.This is the content of the collapsible list view for Item 1.'
          'This is the content of the collapsible list view for Item 1.This is the content of the collapsible list view for Item 1.'
          'This is the content of the collapsible list view for Item 1.This is the content of the collapsible list view for Item 1.'
          'This is the content of the collapsible list view for Item 1.This is the content of the collapsible list view for Item 1.',
    ),
    Datamodel(
      name: 'Item 2',
      id: 2,
      content: 'This is the content of the collapsible list view for Item 2.',
    ),
    Datamodel(
      name: 'Item 3',
      id: 3,
      content: 'This is the content of the collapsible list view for Item 3.',
    ),
    Datamodel(
      name: 'Item 4',
      id: 4,
      content: 'This is the content of the collapsible list view for Item 4.',
    ),
    Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ),
    Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ), Datamodel(
      name: 'Item 5',
      id: 5,
      content: 'This is the content of the collapsible list view for Item 5.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Collapsible List View with Datamodel'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          elevation: 1,
          expandedHeaderPadding: EdgeInsets.zero,
          animationDuration: Duration(milliseconds: 300),
          children: _items.map<ExpansionPanelRadio>((Datamodel item) {
            return ExpansionPanelRadio(
              value: item,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: _buildImage(item.imageUrl),
                  title: Text(item.name),
                );
              },
              body: Column(
                children: [
                  _buildContentImage(item.contentImageUrl),
                  ListTile(
                    title: Text(item.content),
                    subtitle: Text('${item.id}'),
                  ),
                ],
              ),
              canTapOnHeader: true,
            );
          }).toList(),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _items[index].isExpanded = !isExpanded;
            });
          },
        ),
      ),
    );
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

  Widget _buildContentImage(String? contentImageUrl) {
    if (contentImageUrl != null) {

      return Image.network(
        contentImageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    } else {
      return SizedBox.shrink();
    }
  }
}


class Datamodel {
  String name;
  int id;
  bool isExpanded;
  String? imageUrl;
  String content;
  String? contentImageUrl;

  Datamodel({
    required this.name,
    required this.id,
    this.isExpanded = false,
    this.imageUrl="https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png",
    required this.content,
    this.contentImageUrl="https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png",
  });
}