import 'package:flutter/material.dart';
import 'package:todo/contactUs.dart';
import 'package:todo/search.dart';

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  List<String> todoItems = [];

  final texteditingcontroller = TextEditingController();
  bool validated = true;
  String errtext = "";
  String todoedited = "";
  String tobesearched = "";
  int currentIndex = 0;

  void addtodo() {
    todoItems.add(todoedited);
    Navigator.pop(context);
    todoedited = "";
    setState(() {
      validated = true;
      errtext = "";
    });
  }

  void showalertdialog() {
    texteditingcontroller.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "Add Task",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: texteditingcontroller,
                    autofocus: true,
                    onChanged: (_val) {
                      todoedited = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      errorText: validated ? null : errtext,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (texteditingcontroller.text.isEmpty) {
                              setState(() {
                                errtext = "This field can't Be Empty";
                                validated = false;
                              });
                            } else if (texteditingcontroller.text.length >
                                512) {
                              setState(() {
                                errtext = "Too may Chanracters";
                                validated = false;
                              });
                            } else {
                              addtodo();
                            }
                          },
                          color: Colors.green[700],
                          child: Text("ADD",
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  void showSearchDialog() {
    texteditingcontroller.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "Search Task",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: texteditingcontroller,
                    autofocus: true,
                    onChanged: (_val) {
                      tobesearched = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      errorText: validated ? null : errtext,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            List searchlist = [];
                            todoItems.forEach((element) {
                              if (element.contains(tobesearched)) {
                                searchlist.add(element);
                              }
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search(searchlist)));
                          },
                          color: Colors.green[700],
                          child: Text("SEARCH",
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        centerTitle: true,
        title: Text(
          "My Tasks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactDetails()),
            ),
          )
        ],
      ),
      body: todoItems.isEmpty
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
                      leading: Icon(Icons.add),
                      title: Text(
                        todoItems[index],
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onLongPress: () {
                        todoItems.removeAt(index);
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
              itemCount: todoItems.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showalertdialog,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green[700],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          switch (currentIndex) {
            case 0:
              showSearchDialog();
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactDetails()));
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("About Us")),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
