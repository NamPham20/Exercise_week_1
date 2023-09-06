import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_application/resources/strings.dart';
import 'package:payment_application/resources/widgets/widgets.dart';
import 'classes/customer.dart';

void main() {
  runApp(const MaterialApp(
    home: PaymentScreen(),
  ));
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool ischecker = false;
  bool isClick =false;
  List<Customer> mlistCustomer =[];
  TextEditingController? nameCusController;
  TextEditingController? numberBookController;
  var customer ;
  FocusNode focusNode = FocusNode();

  var sumCustomer =0 ;
  var sumVipCustomer =0 ;
  var totalRevenue = 0.0 ;

  String? nameCus;
   int numberBook = 0;
  double money=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCusController = TextEditingController(text: '0');
    numberBookController= TextEditingController(text: '0');

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameCusController!.dispose();
    numberBookController!.dispose();
    focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(PAYMENT_SCREEN),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(20),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                enterInfo(title: 'User Name           : ',controller:nameCusController,typeData: true,focus: focusNode ),
                const SizedBox(
                  height: 10,
                ),
                enterInfo(title: 'Number Of Book : ',controller: numberBookController,typeData: false),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                        value: ischecker,
                        onChanged: (newValue) {
                          setState(() {
                            ischecker = newValue!;
                          });
                        }),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('VIP Customers'),
                    const SizedBox(
                      width: 80,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Total money',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.blue,
                          child:  Text(
                            (money.toString()),
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nameCus=nameCusController!.text;
                                numberBook = int.parse(numberBookController!.text) ;
                                if(ischecker){
                                  money = numberBook * 20000.0*0.9;
                                }else{
                                  money = numberBook * 20000.0;
                                }
                              });
                              FocusScope.of(context).unfocus();
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                            child: const Text(
                              'Prepare bill',
                              style: TextStyle(color: Colors.white),
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nameCus=nameCusController!.text;
                                numberBook = int.parse(numberBookController?.text??'0') ;
                                if(nameCus==null || numberBook == 0){
                                  return;
                                }
                                if(ischecker){
                                  money = numberBook * 20000.0*0.9;
                                }else{
                                  money = numberBook * 20000.0;
                                }
                               customer = Customer(nameCus!,ischecker, money);
                               mlistCustomer.add(customer);
                               nameCusController?.clear();
                               numberBookController?.clear();
                               money=0.0;
                                ischecker = false;
                                FocusScope.of(context).requestFocus(focusNode);
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent)),
                            child: const Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isClick=true;
                                  sumCustomer =mlistCustomer.length;
                                  sumVipCustomer=0;
                                  totalRevenue =0;
                                for( Customer customers in  mlistCustomer){
                                  if(customers.isVip){
                                    sumVipCustomer++;
                                  }
                                  totalRevenue =totalRevenue + customers.money;
                                }
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.lightGreen)),
                            child: const Text(
                              'Statistical',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if(isClick)
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              color: Colors.blue,
                              child: const Text(
                                'Statistical Information',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    infomation(title: 'Total Customers', value: sumCustomer.toString()),
                    const SizedBox(
                      height: 15,
                    ),
                    infomation(title: 'Total Vip Customers', value: sumVipCustomer.toString()),
                    const SizedBox(
                      height: 15,
                    ),
                    infomation(title: 'Total Revenue', value: totalRevenue.toString()),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              color: Colors.blue,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    isClick=false;
                                  });
                                },
                                  child: const Text(
                                'END',
                                style: TextStyle(color: Colors.white),
                              ),)
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    ElevatedButton.icon(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      icon: const Icon(Icons.login_outlined), // Biểu tượng ở đây
                      label: const Text('Exit'), // Text hoặc nội dung của nút
                    ),
                  ],
                )

              ],
            ),
          )
        ),
      );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: const Text('Do you want to exit ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
                Navigator.of(context).pop();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
  }

