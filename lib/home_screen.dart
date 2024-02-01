import 'package:flutter/material.dart';
import 'package:watertracker_app/water_consume.dart';
import 'package:intl/intl.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WaterConsume> waterConsumeList= [];
  final TextEditingController _numberOfGlasses= TextEditingController(text: "1");
  final TextEditingController _noteOfGlasses= TextEditingController(text: "Morning");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Tracker",),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: (){
                      if(_numberOfGlasses.text.trim().isEmpty){
                        _numberOfGlasses.text = "1";
                      }
                      final noOfGlass= _numberOfGlasses.text.trim();
                      int value= int.tryParse(noOfGlass) ?? 1;
                      waterConsumeList.add(WaterConsume(value, DateTime.now(),_noteOfGlasses.text));
                      //waterConsumeList.insert(0, WaterConsume(value, DateTime.now(), _noteOfGlasses.text));
                      setState(() {});
                    },child: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(
                          color: Colors.deepOrange,
                          width: 5
                        ),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("Tap to Add",
                        style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                          child: TextField(
                            controller: _numberOfGlasses,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                          ),
                      ),
                      SizedBox(width: 16),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _noteOfGlasses,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListView.builder(
                itemCount: waterConsumeList.length,
                reverse: false,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(waterConsumeList[index].numberOfGlass.toString()),
                    ),
                    title: Text(waterConsumeList[index].noteOfGlass),
                    subtitle: Text("Time ${DateFormat.yMEd().add_jms().format(waterConsumeList[index].time)}"),
                    trailing: IconButton(onPressed: (){
                      waterConsumeList.removeAt(index);
                      setState(() {});
                    }, icon: Icon(Icons.delete)),
                  );
                },)
          ],
        ),
      ),
    );
  }
}
