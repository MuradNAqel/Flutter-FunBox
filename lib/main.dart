import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Mid Term Exam',
  theme: ThemeData(primarySwatch: Colors.deepOrange),
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double weight = 0;
  double height = 0;
  var color =['Red','Green','Blue'];
  String selectedcolor = 'Red';
  int indix =0;
  var sizes=['10','15','60'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shape'),
      ),
      body: Column(
        children: [

          row1(),

          SizedBox(height: 4,),

          row2(),

          SizedBox(height: 4,),

          row3(),

          SizedBox(height: 4,),

          row4(),

          SizedBox(height: 4,),

          Container(
            // color: Colors.selectedcolor ,
            // decoration: EdgeInsets.all(sizes[indix]),

            child:
            SizedBox(
              width: weight,
              height: height,),
            decoration:
            BoxDecoration(
              border: Border.all(color: Colors.orangeAccent,width: 2),
              borderRadius: BorderRadius.circular(double.parse(sizes[indix])),
              color: selectedcolor=='Red'?Colors.red:selectedcolor=='Green'?Colors.green:Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget row1() {
    return Row(

      children: [
        Text('Width', style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        Slider(
            min: 0,
            max: 100,
            divisions: 90,
            label: weight.toString(),
            value: weight,
            onChanged: (value) {
              setState(() {
                weight = value;
              });
            }),
      ],
    );
  }

  Widget row2() {
    return Row(

      children: [
        Text('Height', style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        Slider(
            min: 0,
            max: 100,
            divisions: 90,
            label: height.toString(),
            value: height,
            onChanged: (value) {
              setState(() {
                height = value;
              });
            }),
      ],
    );
  }

  Widget row3() {
    return Row(
      children: [
        Text('Color',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        DropdownButton(
          items: color.map((e) {
            return DropdownMenuItem(
              child: Text(e),
              value: e,
            );
          }).toList(),
          value: selectedcolor,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30,
          dropdownColor: Colors.orangeAccent,
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (value) {
            setState(() {
              selectedcolor = value;
            });
          },
        )
      ],
    );
  }

  Widget row4() {
    return Row(
      children: [
        Text('Radious'),

        Expanded(
          child: RadioListTile(
              title: Text(sizes[0]),
              value: 0,
              groupValue: indix,
              onChanged: (value) {
                setState(() {
                  indix = value;
                });
              }),
        ),

        Expanded(child :RadioListTile(
            title: Text(sizes[1]),
            value: 1,
            groupValue: indix,
            onChanged: (value) {
              setState(() {
                indix = value;
              });
            }),
        ),
        Expanded(child: RadioListTile(
            title: Text(sizes[2]),
            value: 2,
            groupValue: indix,
            onChanged: (value) {
              setState(() {
                indix = value;
              });
            }),
        ),
      ],
    );
  }

}
