import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetails extends StatefulWidget {
  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

Widget visibilityText(String key, String value) {
  return Padding(
    padding: const EdgeInsets.only(left: 4),
    child: ListTile(
      leading: Text(key),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ),
    ),
  );
}

Widget emailTile(String email, Function emailFn) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
            child: Text(
          email,
          style: TextStyle(fontSize: 16),
        )),
        IconButton(icon: Icon(Icons.mail), onPressed: emailFn),
      ],
    ),
  );
}

class _ContactDetailsState extends State<ContactDetails> {
  String name = "CSI member";
  String phone = "8547886720";
  String email = "sonuisplaying@gmail.com";
  String imageurl =
      "https://upload.wikimedia.org/wikipedia/en/e/e0/Csi_logo_india.jpg";
  String whatsapp = "8547886720";

  _whatsappURL() async {
    String whatsappURL = "https://wa.me/91" + whatsapp;
    launch(whatsappURL);
  }

  _phoneURL() async {
    String phoneURL = "tel:+91" + phone;
    launch(phoneURL);
  }

  _smsURL() async {
    String smsURL = "sms:+91" + phone;
    launch(smsURL);
  }

  _emailURL() async {
    String smsURL = "mailto:" + email;
    launch(smsURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(imageurl),
                      radius: 80,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 4, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      phone,
                      style: TextStyle(fontSize: 18),
                    )),
                    IconButton(
                        icon: Icon(Icons.watch_later), onPressed: _whatsappURL),
                    IconButton(icon: Icon(Icons.message), onPressed: _smsURL),
                    IconButton(icon: Icon(Icons.phone), onPressed: _phoneURL),
                  ],
                ),
              ),
              emailTile(email, _emailURL),
            ]),
      ),
    );
  }
}
