

class ModelClass{
  ModelClass({required this.name,required this.age, this.id});
  String name;
  String age;
  int? id;
  static ModelClass fromMap(Map<String,Object?
  > map){
String name=map['name'] as String;
String age=map['age']as String;
int id=map['id'] as int;
   


    return
    ModelClass(name: name, age: age,id: id);
  }
}