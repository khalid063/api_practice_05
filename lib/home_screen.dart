

import 'dart:convert';

import 'package:api_practice_05/new_product_add_screen.dart';
import 'package:api_practice_05/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreenUI();
  }

}

class HomeScreenUI extends State<HomeScreen>{

  List<Product> products = [];

  /// API call initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Call API");
    getProduct();
  }

  getProduct() async{
    Response response = await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    print(response.statusCode);
    print(response.body);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    print("Decoded Response Length : ${decodedResponse['data'].length}");
    if ( response.statusCode == 200 && decodedResponse['status'] == 'success'){
      for ( var e in decodedResponse['data']){
        products.add(Product(
          e['_id'],
          e['ProductName'],
          e['ProductCode'],
          e['Img'],
          e['UnitPrice'],
          e['Qty'],
          e['TotalPrice'],
          e['CreatedDate'],
            //it, productName, productCode, image, unitPrice, quentity, totalPrice, createdDate
        ));
        setState(() {});
      }
      print("Data of List : ${products[0].productName}");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Practice 6"),
      ),
      body: ListView.separated(
        itemCount: 20,
          itemBuilder: (context, index){
            return ListTile(
              onLongPress: (){
                showDialog(
                    context: context, 
                    builder: (_){
                      return AlertDialog(
                        //titlePadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.only(left: 10, right: 10),
                        //contentPadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        title: Row(
                          children: [
                            Text("Chose an Action"),
                            Spacer(),
                            IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, icon: Icon(Icons.close))
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.edit),
                              title: Text("Edit"),
                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.delete),
                              title: Text("Delete"),
                            ),
                          ],
                        ),
                      );
                    }
                );
              },
              leading: Icon(Icons.image),
              title: Text("Product Name : ${products[index].productName}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Code : ${products[index].productCode}"),
                  Text("Total Price : ${products[index].totalPrice}"),
                  Text("Available Unit : ${products[index].quentity}"),
                ],
              ),
              trailing: Text("Unit Price : ${products[index].unitPrice}"),
            );
          }, separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.pink, height: 1,);
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewProductAddScreen()));
        },child: Icon(Icons.add),
      ),
    );
  }
}