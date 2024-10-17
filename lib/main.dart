import 'package:flutter/material.dart';

void main() {
  runApp(MyMidtermApp());
}

class MyMidtermApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aljay Dinoy_MidtermExam'),
          centerTitle: true,
        ),
        body: ItemList(),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final List<String> items = [
    'Laptop',
    'Smartphone',
    'Tablet',
    'Headphones',
    'Keyboard',
    'Mouse',
    'Monitor',
    'Speaker',
    'Printer',
    'Camera'
  ];

  final Map<String, bool> isAdded = {};

  @override
  void initState() {
    super.initState();

    for (var item in items) {
      isAdded[item] = false;
    }
  }

  void showDetails(String item) {
    String details = '';

    switch (item) {
      case 'Laptop':
        details = 'Details about Laptop: A portable computer.';
        break;
      case 'Smartphone':
        details =
            'Details about Smartphone: A handheld device with phone features.';
        break;
      case 'Tablet':
        details =
            'Details about Tablet: A touchscreen device that is larger than a phone.';
        break;
      case 'Headphones':
        details = 'Details about Headphones: A device to listen to audio.';
        break;
      case 'Keyboard':
        details = 'Details about Keyboard: A device for typing.';
        break;
      case 'Mouse':
        details = 'Details about Mouse: A pointing device for computers.';
        break;
      case 'Monitor':
        details = 'Details about Monitor: A display screen for computers.';
        break;
      case 'Speaker':
        details = 'Details about Speaker: A device that outputs sound.';
        break;
      case 'Printer':
        details = 'Details about Printer: A device that prints documents.';
        break;
      case 'Camera':
        details = 'Details about Camera: A device for capturing images.';
        break;
      default:
        details = 'No details available.';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item),
          content: Text(details),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final added = isAdded[item] ?? false;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: added ? Colors.green[100] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => showDetails(item),
                    child: Text('Details'),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAdded[item] = !added;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: added ? Colors.green : Colors.blue,
                    ),
                    child: Text(added ? 'Added' : 'Add'),
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