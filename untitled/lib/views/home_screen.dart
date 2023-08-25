import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController? userEmailController;
  TextEditingController? userPasswordController;

  String userEmail = 'NONE' ;
  String userPassword ='NONE';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userEmailController = TextEditingController();
    userPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userEmailController!.dispose();
    userPasswordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("LOGIN",
            style: TextStyle(
            fontSize: 20.0
        ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textInputWidget('Email','Nhập Email' , userEmailController),
            textInputWidget('PassWord', 'Nhập Password', userPasswordController),
            ElevatedButton(onPressed: (){
              setState(() {
                userEmail = userEmailController!.text;
                userPassword = userPasswordController!.text;
              });
            }, child: const Text('Confirm')),
            accInformatonWidget(userEmail, userPassword),
            TextButton(onPressed: (){}, child: const Text('LogIn',
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20),))
          ],
        ),
      ),
    );
  }

  Widget textInputWidget(String labelText,String hintText,dynamic controler){
    return Container(
      padding:  const EdgeInsets.only(left: 10,top: 10,right: 5),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controler,
      ),
    );
  }
  Widget accInformatonWidget(String contentEmail,String contentPassword){
    return Container(
      child: Card(
        child: Column(
          children: [
            textWidget('Email :',contentEmail ),
            textWidget('Password :', contentPassword),
            const SizedBox(height: 15.0,)
          ],
        ),
      ),
    );
  }
  
  textWidget (String title, String value){
    return Container(
      padding:  const EdgeInsets.only(left: 10.0,top: 10.0),
      child: Row(
        children: [
          Text (title, style:  const TextStyle(
            fontSize: 15,
            color: Colors.red,
            fontWeight: FontWeight.bold
          ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child:Text(value,style: const TextStyle(
              fontSize: 15
          )
            )
          ),
        ],
      ),
    );
  }

}
