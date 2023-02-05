import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageCategory extends StatefulWidget {
  const ManageCategory({super.key, });

  @override
  State<ManageCategory> createState() => _ManageCategoryState();
}

class _ManageCategoryState extends State<ManageCategory> {

TextEditingController categoryController= TextEditingController();
  Widget buildTextFormField(BuildContext context,TextEditingController textEditingControllerInput,String userlabeltext,TextInputType TextType){
    return Container(
        height:50 ,
        margin: EdgeInsets.only(top:21,left: 16,right: 16),
        child: TextFormField(
          controller: textEditingControllerInput,
          keyboardType:TextType ,

          style: Theme.of(context).textTheme.bodySmall,

          decoration: InputDecoration(

            focusColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),

            focusedBorder: OutlineInputBorder(

            ),
            fillColor: Colors.grey,

            labelText: userlabeltext,

            labelStyle: Theme.of(context).textTheme.bodySmall,
          ),));


  }
Widget buildElevatedButton(BuildContext context,String buttonText,){
  return Container(
      margin: EdgeInsets.only(top:30,left: 16,right: 16),
      height: 44,
      width: MediaQuery.of(context).size.width,

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
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
                child:ListTile(
                  title:Text("Computer and accessories",
                  style: Theme.of(context).textTheme.bodyMedium,),
                  trailing: IconButton(icon: Icon(Icons.delete,color: Colors.white,),onPressed: (){

                  },),
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child:Scaffold(
      appBar: AppBar(
      title: Text(
      "Company",
    ),
    elevation: 0,
    backgroundColor: Theme.of(context).primaryColor,
    centerTitle: true,
      ),
    body:Container(
    constraints: const BoxConstraints(
    maxHeight: double.infinity,
    ),
    child: SingleChildScrollView(
    child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      buildTextFormField(context, categoryController,"Category", TextInputType.text),
      buildElevatedButton(context, "Add"),
       Padding(
        padding: EdgeInsets.only(top:60,left: 16),
          child:Align(
            alignment: Alignment.topLeft,
              child:Text("List of Categories",style: Theme.of(context).textTheme.bodySmall,))
      ),

        buildProductList(context),
    ])))));
  }

}