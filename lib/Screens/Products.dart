import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({
    super.key,
  });

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {


  Widget buildElevatedButton(BuildContext context,String buttonText,){
    return Container(

      height: 20,
      width: 77,
      child:ElevatedButton(child:Text(buttonText),onPressed: (){},style:ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          ), )

    );

  }

  Widget buildProductList(
    BuildContext context,
  ) {
    return Container(
        margin: const EdgeInsets.only(top: 11, bottom: 11),
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 13),
                    leading: Container(
                        height: 77,
                        width: 77,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Image",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )),
                    title: const Text("Jbl Headphone"),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("TV & Accessiores"), Text("Oty:2")]),
                    trailing: Column( children: [
                        buildElevatedButton(context, "Edit"),
                      Spacer(),
                      buildElevatedButton(context, "Delete")
                    ]),
                  ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 15,
              );
            },
            itemCount: 50));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Products",
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          actions: [IconButton(onPressed: () {
            Navigator.pushNamed(context, "/AddProducts");
          }, icon: Icon(Icons.add))],
        ),
        body: Container(
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildProductList(context),
                  ],
                ),
              ),
              // This trailing comma makes auto-formatting nicer for build methods.
            )));
  }
}
