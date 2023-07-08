

import 'package:api_practice_05/style.dart';
import 'package:flutter/material.dart';

class NewProductAddScreen extends StatefulWidget {
  const NewProductAddScreen({Key? key}) : super(key: key);

  @override
  State<NewProductAddScreen> createState() => _NewProductAddScreenState();
}

class _NewProductAddScreenState extends State<NewProductAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Product Add"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: myInputDecoretion('Product Name'),
              ),
              SizedBox(height: 8,),
              TextFormField(
                decoration: myInputDecoretion('Product Name'),
              ),
              SizedBox(height: 8,),
              TextFormField(
                decoration: myInputDecoretion('Product Name'),
              ),
              SizedBox(height: 8,),
              TextFormField(
                decoration: myInputDecoretion('Product Name'),
              ),
              SizedBox(height: 8,),
              TextFormField(
                decoration: myInputDecoretion('Product Name'),
              ),
              SizedBox(height: 8,),
              TextFormField(
                decoration: myInputDecoretion('Product Name'),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Add New Product")),
            ],
          ),
        )
      ),
    );
  }
}
