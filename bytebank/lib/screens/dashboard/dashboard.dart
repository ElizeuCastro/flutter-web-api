import 'package:bytebank/screens/contacts/list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FeatureItem(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ContactList()));
                  },
                ),
                FeatureItem(
                  'Transaction Feed',
                  Icons.description,
                  onClick: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ContactList()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onClick;

  const FeatureItem(this.title, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  this.icon,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  this.title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
