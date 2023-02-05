import 'package:company_mangement_system/model/Companymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SqlDB/project_databases.dart';

class ManageCompany extends StatefulWidget {
  const ManageCompany({
    super.key,
    required this.companyModel,
  });
  final CompanyModel? companyModel;
  @override
  State<ManageCompany> createState() => _ManageCompanyState();
}

class _ManageCompanyState extends State<ManageCompany> {
  TextEditingController companyController = TextEditingController();
  final companykey = GlobalKey<FormState>();
  late bool isImportant;

  late List<CompanyModel> notes;
  bool isLoading = false;
  Future addNote() async {
    final note = CompanyModel(
      title: companyController.text,
      isImportant: true,
    );
    await NotesDatabase.instance.create(note);
  }

  @override
  void initState() {
    super.initState();

    isImportant = widget.companyModel?.isImportant ?? false;
  }

  Widget buildTextFormField(
      BuildContext context,
      TextEditingController textEditingControllerInput,
      String userlabeltext,
      TextInputType TextType) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(top: 21, left: 16, right: 16),
        child: Form(
          key: companykey,
            child:TextFormField(
          controller: textEditingControllerInput,
          keyboardType: TextType,
          validator: ((value) {
            if (value == null) {
              return "Field required* ";
            } else {
              return value;
            }
          }),
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            focusColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(),
            fillColor: Colors.grey,
            labelText: userlabeltext,
            labelStyle: Theme.of(context).textTheme.bodySmall,
          ),
        )));
  }

  Widget buildElevatedButton(
    BuildContext context,
    String buttonText,
  ) {
    return Container(
        margin: EdgeInsets.only(top: 30, left: 16, right: 16),
        height: 44,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          child: Text(buttonText),
          onPressed: () {
            if(companykey.currentState!.validate()){
              addNote();
            }else{}
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
          ),
        ));
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
                  child: ListTile(
                    title: Text(
                      "ABB",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
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
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Company",
              ),
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: true,
            ),
            body: Container(
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      buildTextFormField(context, companyController, "Company",
                          TextInputType.text),
                      buildElevatedButton(context, "Add"),
                      Padding(
                          padding: EdgeInsets.only(top: 60, left: 16),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "List of Categories",
                                style: Theme.of(context).textTheme.bodySmall,
                              ))),
                      buildProductList(context),
                    ])))));
  }
}
