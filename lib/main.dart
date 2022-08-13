import 'package:demo_app/data.dart';
import 'package:demo_app/listBuilder.dart';
import 'package:demo_app/model.dart';
import 'package:demo_app/textFiels.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await  openBase();
await readDatabase();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  
 
      final nameController = TextEditingController();
      final ageController = TextEditingController();
       

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
          child: Column(
        children: [
      TextFields(controller: nameController, hintText: "Name",),
            TextFields(controller: ageController, hintText: "Age",),
          Row(
            children: [
              ElevatedButton(onPressed: (){ 
              final ob= ModelClass(name: nameController.text, age:ageController.text);
              nameController.text.isNotEmpty || ageController.text.isNotEmpty?
              addData(ob):'';
             
              nameController.clear();
              ageController.clear();
              }, 
              child:const Icon(Icons.add),),




               ElevatedButton(onPressed: (){   
        removeData();
        
            ls.notifyListeners();
       
          }, child:const Icon(Icons.remove,)),
        
            ],
          ),
        const  ListBuilder()
          
       // ListView.separated(itemBuilder: (BuildContext cxt,int index){
        //    return
        //   const  Text("JAhjha");
        //  }, separatorBuilder: (con,ind)=>const Divider(), itemCount:50)
     
         
            
          

        ],
      )),
    ));
  }
}
