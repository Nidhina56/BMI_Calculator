import 'package:flutter/material.dart';
class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}
final TextEditingController _heightController = TextEditingController();
final TextEditingController _weightController = TextEditingController();
class _BmiState extends State<Bmi> {
  var height;
  var weight;
  double results=0.0;

/*   double BMICalculator(double height , double weight){
    double heightSqure = height * height;
    double result = weight/ heightSqure;
    return result;

  }*/

void CalculateBmi(){
    double height = double.parse(_heightController.text)/100;
    double weight = double.parse(_weightController.text);

    double heightSqure = height* height;
     double result = weight/heightSqure;
    print(result);

    setState(() {
      results = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
          centerTitle: true,
          title: Text("BMI CALCULATOR",
            style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold),
          ),
        ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 6,),
                TextField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    labelText: "Height",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.vertical()
                    )

                  ),
                ),
                SizedBox(height: 6),
                TextField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.line_weight_outlined),
                    labelText: "Weight",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.vertical()
                    )
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(height: 50,width: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        // padding: EdgeInsets.all(30)
                      ),

                      onPressed:
                      (){CalculateBmi();}, child:Text("Result")),),
                Text(
                  results == null?"enter the values" : "BMI : ${results.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                    )

              ],


            ),
          ),
          backgroundColor: Colors.white10,
        ),
    );
  }
}
