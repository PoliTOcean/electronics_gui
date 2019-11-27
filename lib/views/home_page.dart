import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Table(
        border: null,
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(children: [
            Center(child: Text("Image")),
            Center(child: Text("Name")),
            Center(child: Text("Category")),
            Center(child: Text("Package")),
            Center(child: Text("Box")),
            Center(child: Text("Cell")),
            Center(child: Text("Quantity")),
            Container()
          ]),
          TableRow(children: [
            Image(
              image: AssetImage('assets/atmega.jpeg'),
              width: 45,
            ),
            Center(child: Text("ATMega328P")),
            Center(child: Text('Microcontroller')),
            Center(child: Text('PDIP')),
            Center(child: Text('5')),
            Center(child: Text('2')),
            Center(child: Text('6')),
            Center(
                child: Row(
              children: <Widget>[
                Container(
                  width: 25,
                  child: IconButton(
                      icon: Icon(Icons.add), tooltip: "Add", onPressed: () {}),
                ),
                IconButton(
                    icon: Icon(Icons.remove),
                    tooltip: "Remove",
                    onPressed: () {}),
              ],
            ))
          ])
        ],
      ),
    ));
  }
}
