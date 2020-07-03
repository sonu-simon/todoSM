import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final List list;
  Search(this.list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Search Results",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: list.isEmpty
          ? Center(
              child: Text(
                "No Task Avaliable",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  margin: EdgeInsets.only(left: 10, right: 10.0, top: 10),
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                        list[index],
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: list.length,
            ),
    );
  }
}
