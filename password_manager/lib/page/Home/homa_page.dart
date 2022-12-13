import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/page/Home/addPassword_component.dart';
import 'package:password_manager/page/Home/password_Card.dart';
import 'package:password_manager/util/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Text(
                'Ciao Nome Utente',
                style: TextStyle(
                  color: lightColor,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    Icons.settings,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Impostazioni'),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    Icons.help,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Aiuto'),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    Icons.tips_and_updates_rounded,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Aggiornamenti'),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    Icons.logout,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Logout'),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const AddPassword(),
      appBar: AppBar(
        backgroundColor: lightColor,
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream:
                  Firestore.instance.collection("password").get().asStream(),
              builder: (context, snapshot) {
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return PasswordCard(snapshot: snapshot.data![index]);
                    });
              })
        ],
      ),
    );
  }
}
