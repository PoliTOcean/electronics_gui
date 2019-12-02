import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import '../models/models.dart';

class HomePage extends StatelessWidget {
  final List<Component> components = [
    Component(
        componentId: 10,
        name: "ATMega328P",
        category: 'Microcontroller',
        package: 'PDIP',
        box: 5,
        cell: 2,
        quantity: 6,
        createdBy: null,
        createdOn: null,
        updatedBy: null,
        updatedOn: null)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: TextField(
                  autocorrect: false,
                  autofocus: false,
                  decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Search components...'),
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(width: 30.0),
              RaisedButton(
                child: Text('new'.toUpperCase()),
                onPressed: () =>
                    Navigator.of(context).pushNamed(Router.addRoute),
              )
            ],
          ),
          SizedBox(height: 20.0),
          DataTable(columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text("Category")),
            DataColumn(label: Text("Package")),
            DataColumn(label: Text("Box")),
            DataColumn(label: Text("Cell")),
            DataColumn(label: Text("Quantity")),
            DataColumn(label: Text('Add/Remove/Delete')),
          ], rows: _buildTableView(components))
        ],
      ),
    ));
  }

  List<DataRow> _buildTableView(List<Component> components) => components
      .map((component) => DataRow(cells: [
            DataCell(Text(component.name)),
            DataCell(Text(component.category)),
            DataCell(Text(component.package)),
            DataCell(Text(component.box.toString())),
            DataCell(Text(component.cell.toString())),
            DataCell(Text(component.quantity.toString())),
            DataCell(Row(children: [
              SizedBox(
                  width: 48,
                  height: 24,
                  child: TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    autofocus: false,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    initialValue: '1',
                  )),
              SizedBox(width: 2),
              GestureDetector(
                child: Icon(Icons.add, size: 24.0),
                onTap: () {},
              ),
              SizedBox(width: 2),
              GestureDetector(
                child: Icon(Icons.remove, size: 24.0),
                onTap: () {},
              ),
              SizedBox(width: 2),
              GestureDetector(
                child: Icon(Icons.clear, size: 24.0),
                onTap: () {},
              )
            ]))
          ]))
      .toList();
}
