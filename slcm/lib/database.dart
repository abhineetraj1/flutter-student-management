import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:slcm/main.dart';

var address="mongodb://10.0.2.2:27017/";

getData(context, roll, password) async{
  var a = await Db.create(address+"/college");
  await a.open();
  var main = await a.collection("main");
  
  var b = await Db.create(address+"/college");
  await b.open();
  var notifications = await b.collection("notifications");
  notificationData.clear();
  var bb = await notifications.find().toList();
  for (var i in bb) notificationData.add(i);

  var c = await Db.create(address+"/college");
  await c.open();
  var note = await b.collection("notes");
  notes.clear();
  var cc = await note.find().toList();
  for (var i in cc) notes.add(i);

  var t =await main.find({"roll":roll,"password":password}).toList();
  t.length > 0 ?
  AN(context, t[0]) 
  : showDialog(context: context, builder: (builder) => (
  AlertDialog(
    title: Text("Credentials"),
    content: Text("Invalid credentials"),
    actions: [
      TextButton(onPressed: () {
        Navigator.of(context).pop();
      }, child: Text("Ok", style: TextStyle(color: Colors.green),))
    ],
  )
));
}

newPassword(roll,password,newpassword) async {
  var a = await Db.create(address+"/college");
  await a.open();
  var main = await a.collection("main");
  var t = await main.update({"roll":roll,"password":password}, modify.set("password", newpassword));
}

AN (context, data) {
  appData.clear();
  appData.add(data);
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Profile();}));
}