import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home:Homepage(),
    debugShowCheckedModeBanner: false,
  ));
}
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
  TextEditingController controller3=TextEditingController();

  double? interest;
  double? total;
  //controller1.txt=amt
  //con2.t= interest rete
  //con3.t=period

  void calculation(){
    final calinterestrate =(double.parse(controller2.text)/100/12)* int.parse(controller3.text);
    final calinterest = calinterestrate * int.parse(controller1.text);
    setState(() {
      interest = calinterest;
      total = int.parse(controller1.text) + (interest ?? 0.0);

    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 40,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Body(),
    );
  }

  Widget Body() {
    return Container(
      color: Colors.grey[100],
      
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Fixed Deposit',
                        style: TextStyle(
                          fontFamily: 'ProtestRiot-Regular',
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Calculator',
                        style: TextStyle(
                          fontFamily: 'ProtestRiot-Regular',
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
        
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 10, 0),
              child: Column(
                children: [
                  inputform(
                      title: "Deposit Amount: ₹",
                      controller: controller1,
                      hinttext: "e.g 9087",

                  ),
                  inputform(
                      title: "Annual Interest Rate(%):",
                      controller: controller2,
                      hinttext: "e.g 3"
                  ),
                  inputform(title: "Period(in month):",
                      controller: controller3,
                      hinttext: "e.g 3"),
                  SizedBox(height: 10),
        
                  GestureDetector(
                    onTap: (){
                      calculation();
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    
                      child: Center(
                        child: Text('CALCULATE',
                        style: TextStyle(
                          fontFamily: 'ProtestRiot-Regular',
                    
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  interest != null
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('RESULT:',
                        style: TextStyle(
                        fontFamily: 'ProtestRiot-Regular',fontSize: 20,
                        color: Colors.black,
                      ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text('INTEREST:₹ ${interest?.toStringAsFixed(2) ?? ''}',
        
                        style: TextStyle(
                          fontFamily: 'ProtestRiot-Regular',fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
        
        
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text('TOTAL:₹ ${total?.toStringAsFixed(2) ?? ''}',
        
                        style: TextStyle(
                            fontFamily: 'ProtestRiot-Regular',fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
        
        
                      ),
              ],
            )
                      :SizedBox(),
        
                    ],
                  ),
            ),
                ],
        ),
      ),
    );
  }


  Widget inputform(
      { required String title, required TextEditingController controller, required String hinttext}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: TextStyle(
            fontFamily: 'ProtestRiot-Regular',
            fontSize: 20,
            color: Colors.black,
            //fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hinttext,
            ),

          ),
        ),
        SizedBox(height: 20),
      ],

    );
  }
}


