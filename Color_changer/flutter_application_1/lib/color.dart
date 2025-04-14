import 'package:flutter/material.dart';
import 'dart:math';

class ColorChanger  extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {


Color edgeColor = Colors.pink;
Color midColor =const Color.fromARGB(255, 193, 175, 175);


List<Color> colors=[

  Colors.pink,
  const Color.fromARGB(255, 195, 182, 182),
  Colors.pink,
];


int index=0;
int red=0;
int green=0;
int blue=0;

String yay='jjj';

final List<Map<String, Alignment>> directions = [
  {'begin': Alignment.topCenter, 'end': Alignment.bottomCenter},
  {'begin': Alignment.centerLeft, 'end': Alignment.centerRight},       
  {'begin': Alignment.topLeft, 'end': Alignment.bottomRight},          
  {'begin': Alignment.bottomLeft, 'end': Alignment.topRight},          
];

final List<String> names=[
'Vertical',
'Horizontal',
'leftRight',
'rightLeft',
];

changeColor(){
  setState(() {
    edgeColor= Color.fromARGB(
      255,
   red= Random().nextInt(256),
   green= Random().nextInt(256),
   blue=Random().nextInt(256), );
  });
  colors=[edgeColor, midColor, edgeColor];
}

changeDirection(){
  setState(() {

   if(index+1==directions.length){
      index=0;
      
    }
   else{
      index=index+1;
    }
  });
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: colors,
           begin: directions[index]['begin']!,
           end: directions[index]['end']!,
      
          
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           TextButton(
            style:ButtonStyle(
              side:MaterialStateProperty.all(BorderSide(color:Colors.white)),
            ),
            onPressed: changeColor, 
            child: Text(
              style:TextStyle(
                fontSize:23,
                color: Colors.white,
              ),
              'Change Color')),
            
            SizedBox(height: 15),
      
            Text(
              style:TextStyle(
                 color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              'red: $red   blue: $blue   green: $green',),
      
             SizedBox(height: 50),
      
            TextButton(
              style:ButtonStyle(
                side:MaterialStateProperty.all(BorderSide(color:Colors.white)),
              ),
              onPressed: changeDirection,
               child: Text(
                 style:TextStyle(
                fontSize:23,
                color: Colors.white,
              ),
                'Change Direction')),
      
                SizedBox(height: 15),
            Text(
              style:TextStyle(
                color: Colors.black,
                fontSize:15,
                fontWeight: FontWeight.bold,
                
              ),
              ' Direction: ${names[index]}'),
      
      
          ],
      
      
        ),
      
      
      ),
    );
  }
}
