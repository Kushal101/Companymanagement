import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({
  super.key,
  });

  @override
  State<AddProducts> createState() => _AddProductsState();
}



class _AddProductsState extends State<AddProducts> {
  TextEditingController productInput=TextEditingController();
  TextEditingController descriptionInput=TextEditingController();
 TextEditingController priceInput=TextEditingController();
  TextEditingController quantityInput=TextEditingController();
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
 String Company='Food';
  var currencies = [
    'Food',
    'Transport',
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];


  Widget buildDropDownList1(BuildContext context){
    return Container(
      height: 50,
      margin: EdgeInsets.only(top:21,left: 16,right: 16),
      child: DropdownButtonFormField(
        value: dropdownvalue,
        icon: const Icon(Icons.keyboard_arrow_down),
        decoration: InputDecoration(
          focusColor: Colors.white,
    isDense: true,

    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    ),

    focusedBorder: OutlineInputBorder(

    ),
    ),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),

        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      ),
    );

  }
  Widget buildDropDownList2(BuildContext context){
    return Container(
      height: 50,
      margin: EdgeInsets.only(top:21,left: 16,right: 16),
      child: DropdownButtonFormField(
        value: Company,
        icon: const Icon(Icons.keyboard_arrow_down),
        decoration: InputDecoration(
          focusColor: Colors.white,
          isDense: true,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),

          focusedBorder: OutlineInputBorder(

          ),
        ),
        items: currencies.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),

        onChanged: (String? newValue) {
          setState(() {
            Company = newValue!;
          });
        },
      ),
    );

  }

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

  Widget buildDescriptionTextFormField(BuildContext context,){
    return Container(
          height:100,
          margin: EdgeInsets.only(top:21,left: 16,right: 16),
          child: TextFormField(
            controller: descriptionInput,
            maxLines: 5,

            keyboardType:TextInputType.multiline ,
            style: Theme.of(context).textTheme.bodySmall,

            decoration: InputDecoration(
              focusColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),

              focusedBorder: OutlineInputBorder(

              ),
              fillColor: Colors.grey,

              labelText: "Description",

              labelStyle: Theme.of(context).textTheme.bodySmall,

          ),));


  }
  Widget buildElevatedButton(BuildContext context,String buttonText,){
    return Container(
       margin: EdgeInsets.only(top:60,left: 16,right: 16),
        height: 44,
        width: MediaQuery.of(context).size.width,

        child:ElevatedButton(child:Text(buttonText),onPressed: (){},style:ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        ), )

    );

  }
  Widget buildImagesWidget(BuildContext context,){
    return Padding(padding:EdgeInsets.only(top:11,left:16,right:16),child:Row(children: [
      Container(
         width: 80,
         height: 40,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(5),
               border: Border.all(),
         ),
         child: Icon(Icons.add),),
      Spacer(),
      Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: Icon(Icons.add),),
      Spacer(),
      Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: Icon(Icons.add),),
      Spacer(),
    Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: Icon(Icons.add),)]));
  }
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
       onTap: () => FocusScope.of(context).unfocus(),
    child:Scaffold(
     appBar: AppBar(
       title: Text(
         "Add Products",
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
      buildTextFormField(context,productInput,"Product",TextInputType.text),
      buildDropDownList1(context),
      buildDropDownList2(context),
      buildDescriptionTextFormField(context),
      buildTextFormField(context,priceInput,"Price",TextInputType.number),
      buildTextFormField(context,quantityInput,"Qty",TextInputType.number),
      Padding(
        padding: EdgeInsets.only(top:11,left: 16),
          child:Align(
        alignment: Alignment.topLeft,
        child:Text("UploadImage:-",style: Theme.of(context).textTheme.bodySmall,),)
      ),
      buildImagesWidget(context),
      buildElevatedButton(context, "Save"),

    ])))));
  }

}