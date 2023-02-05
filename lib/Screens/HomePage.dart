import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget buildButton(BuildContext context, String buttonTag) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
        ),
        height: MediaQuery.of(context).size.height * 0.26,
        margin: const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
        child: Center(
            child: Text(
          buttonTag,
          style: Theme.of(context).textTheme.bodyLarge,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
            "Home",
          ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/Products");
              },
              child: buildButton(context, "Products"),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/ManageCategory");
              },
              child: buildButton(context, "Manage Category"),
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/ManageCompany");
                }, child: buildButton(context, "Manage Company")),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
