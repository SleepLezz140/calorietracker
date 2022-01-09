import 'package:calorietracker/dashboard.dart';
import 'package:flutter/material.dart';

TextEditingController enterCalories = TextEditingController();
TextEditingController enterFood = TextEditingController();
String sEnterCalories = "";
int ienterCalories = 0;
int finalCalories = 0;
String sfinalCalories = finalCalories.toString();
int iBMR = BMR.toInt();
String sBMR = iBMR.toString();
int iCalories = calories.toInt();
String sCalories = iCalories.toString();
bool isVisible = false;

class SecondScreen extends StatefulWidget {
  const SecondScreen({ Key? key }) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

enum Gender { Male, Female }

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color(0xffdedede),
       title: const Text('Calorie Tracker',style: TextStyle(color: Colors.black),),
      iconTheme: const IconThemeData(color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 25,),
              Row(
                children: [
                  const Text( "Your BMR: ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'avenir',
                    ),
                  ),
                  Text(
                    sBMR + " Calories/day",
                    style: const TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w800,
                     fontFamily: 'avenir',
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const SizedBox(height: 25,),
              Row(
                children: [
                  const Text("Daily Calories Required : ",
                    style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w800,
                     fontFamily: 'avenir',
                    ),
                  ),
                  Text(
                    sCalories + " Calories/day",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const SizedBox(height: 20,),
              const Text(
                "Activity: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'avenir',
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                dropdownValue,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'avenir',
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const SizedBox(height: 25,),
              Row(
                children: const [
                  Text(
                    "Food: ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'avenir',
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              TextField(
                controller: enterFood,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Food Name",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const SizedBox(height: 20,),

              Row(
                children: const [
                  Text(
                    "Calorie Amount: ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'avenir',
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              TextField(
                controller: enterCalories,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Food Calorie Amount",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const SizedBox(height: 25,),
              Row(
                children: [
                  const Text(
                    "Required Calories : ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'avenir',
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Text(
                      sfinalCalories + " Calories",
                      style: const TextStyle(
                       fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'avenir',
                      ),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const SizedBox( height: 15,),
              
              TextButton(
                child: const Text('Calculate'),
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: const Color(0xffffac30),
                    onSurface: Colors.grey,
                    textStyle: const TextStyle(fontSize: 18),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                onPressed: () {
                  if(enterCalories.text.isNotEmpty && enterFood.text.isNotEmpty){
                     setState(() {
                    sEnterCalories = enterCalories.text;
                    ienterCalories = int.parse(sEnterCalories);
                    finalCalories = iCalories - ienterCalories;
                    sfinalCalories = finalCalories.toString();
                    isVisible = true;
                  });
                  setState(() {
                    enterAge.clear();
                    enterHeight.clear();
                    enterWeight.clear();
                    sAge = "";
                    sHeight = "";
                    sWeight = "";
                    BMR = 0;
                    calories = 0;
                    age = 0;
                    height = 0;
                    weight = 0;
                    isMale = true;
                    isFemale = false;
                    isSedentary = false;
                    isLight = false;
                    isModerate = false;
                    isActive = false;
                    isVeryActive = false;
                    isExtraActive = false;
                    enterCalories.clear();
                    enterFood.clear();
                  });
                  } 
                  else if(enterCalories.text.isEmpty && enterFood.text.isNotEmpty){
                     SnackBar snackBar = SnackBar(
                    content: const Text('Please input food calorie amount '),
                    action: SnackBarAction(label: 'Close', onPressed: () {}));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } 
                  else if(enterCalories.text.isNotEmpty && enterFood.text.isEmpty){
                    SnackBar snackBar = SnackBar(
                    content: const Text('Please input name of food '),
                    action: SnackBarAction(label: 'Close', onPressed: () {}));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } 
                  else{
                     SnackBar snackBar = SnackBar(
                    content: const Text('Please input food name and its calorie amount '),
                    action: SnackBarAction(label: 'Close', onPressed: () {}));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                 
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}