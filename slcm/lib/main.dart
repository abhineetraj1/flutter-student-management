import 'package:flutter/material.dart';
import 'package:slcm/database.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

var appData =[];
var notificationData=[];
var notes =[];
Color background = const Color.fromARGB(255, 3, 117, 6);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
    );
  }
}

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: background,
        body: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height*0.9,
              child: Center(
                child: Text("Student Life Cycle Management", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.white),).animate(effects: [FadeEffect(duration: Duration(milliseconds: 500), curve: Curves.easeInBack)]),
              ),
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width*0.9,child: ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Login();}));
            }, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.black),),
            ))).animate(effects: [FadeEffect(duration: Duration(milliseconds: 500), curve: Curves.easeInCubic)])
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  TextEditingController roll_number = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: background,
        body: Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width*0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.black,blurRadius: 10,blurStyle: BlurStyle.outer)]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Login", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  TextField(
                    controller: roll_number,
                    decoration: InputDecoration(
                      hintText: "Enter your roll number", 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: background)
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: "Enter your password", 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: background)
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20,),
                  SizedBox(width: MediaQuery.sizeOf(context).width*0.5,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: background, foregroundColor: Colors.white),onPressed: () {
                    if (password.text == "" && roll_number.text == "") {
                      showDialog(context: context, builder: (builder) => (
                        AlertDialog(
                          title: Text("Credentials"),
                          content: Text("Enter all credentials"),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: Text("Ok", style: TextStyle(color: background),))
                          ],
                        )
                      ));
                    } else {
                      getData(context, roll_number.text,password.text);
                    }
                  }, child: Text("Login"))),
                ],
              ),
            ),
          ).animate(effects: [FadeEffect(duration: Duration(milliseconds:500), curve: Curves.easeInSine)]),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Index();}));}, child: Icon(Icons.logout, color: Colors.white,), backgroundColor: background,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Align(alignment: Alignment.center,child: ClipRRect(borderRadius: BorderRadius.circular(200),child: Image.network(appData[0]["photo"], height: 150,))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appData[0]["name"],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    SizedBox(width: 10,),
                    Icon(Icons.verified, color: background,)
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Roll number",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                    Text("Attendance",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                    Text("CGPA",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(appData[0]["roll"], style: TextStyle(fontSize: 18),),
                    Text(appData[0]["attendance"], style: TextStyle(fontSize: 18),),
                    Text(appData[0]["cgpa"].toString(), style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Father's Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text("Mother's Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(appData[0]["Mother"], style: TextStyle(fontSize: 18),),
                    Text(appData[0]["Father"], style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 20,),
                Align(alignment: Alignment.centerLeft,child: Text("Address", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                Text(appData[0]["address"], style: TextStyle(fontSize: 18),),
                SizedBox(height: 20),
                Align(alignment: Alignment.centerLeft,child: Text("Passing year", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                Align(alignment: Alignment.centerLeft,child: Text(appData[0]["passingYear"], style: TextStyle(fontSize: 18),))
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigation(context, 0),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Settings"),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Routine();}));
              }, child: Row(
                children: [
                  Icon(Icons.calendar_month, color: Colors.black, size: 22,),
                  SizedBox(width: 10,),
                  Text("Routine", style: TextStyle(fontSize: 22, color: Colors.black),),
                ],
              )),
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return HolidayList();
                }));
              }, child: Row(
                children: [
                  Icon(Icons.home_filled, color: Colors.black, size: 22,),
                  SizedBox(width: 10,),
                  Text("Holiday list", style: TextStyle(fontSize: 22, color: Colors.black),),
                ],
              )),
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return ResetPassword();}));
              }, child: Row(
                children: [
                  Icon(Icons.reset_tv, color: Colors.black, size: 22,),
                  SizedBox(width: 10,),
                  Text("Reset password", style: TextStyle(fontSize: 22, color: Colors.black),),
                ],
              )),
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return SemesterReport();}));
              }, child: Row(
                children: [
                  Icon(Icons.contact_page, color: Colors.black, size: 22,),
                  SizedBox(width: 10,),
                  Text("Semester report", style: TextStyle(fontSize: 22, color: Colors.black),),
                ],
              )),
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Internships();}));
              }, child: Row(
                children: [
                  Icon(Icons.interests_rounded, color: Colors.black, size: 22,),
                  SizedBox(width: 10,),
                  Text("Internships", style: TextStyle(fontSize: 22, color: Colors.black),),
                ],
              )),
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Societies();}));
              }, child: Row(
                children: [
                  Icon(Icons.group, color: Colors.black, size: 22,),
                  SizedBox(width: 10,),
                  Text("Societies", style: TextStyle(fontSize: 22, color: Colors.black),),
                ],
              )),
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Achievements();}));
              }, child: Row(
                children: [
                  Icon(Icons.celebration, color: Colors.black, size: 22,),
                  SizedBox(width: 10,),
                  Text("Achievements", style: TextStyle(fontSize: 22, color: Colors.black),),
                ],
              )),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavigation(context, 3),
      ),
    );
  }
}

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Notifications"),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                for (var i in notificationData[0][appData[0]["passingYear"]]) Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(i["name"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text(i["datetime"], style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Align(alignment: Alignment.centerLeft,child: Text(i["message"])),
                      SizedBox(height: 20,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigation(context, 2),
      ),
    );
  }
}

class Internships extends StatelessWidget {
  const Internships({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return Settings(); 
                }));
              }, icon: Icon(Icons.arrow_back)),
              Text("Internships")
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (var i in appData[0]["internship"]) Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer
                    )]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(alignment: Alignment.centerLeft,child: Text(i["role"], style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        Align(alignment: Alignment.centerLeft, child: Text(i["company"]+",")),
                        Align(alignment: Alignment.centerLeft, child: Text("Stipend - "+i["stipend"])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(i["startTime"]+" - "+i["endTime"]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

class Societies extends StatelessWidget {
  const Societies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Row(
          children: [
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Settings();}));
            }, icon: Icon(Icons.arrow_back)),
            Text("Societies"),
          ],
        ),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                for (var i in appData[0]["society"]) Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer
                      )]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(i["role"], style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(i["name"], style: TextStyle(fontSize: 15),),
                            ],
                          ),
                          Align(alignment: Alignment.centerLeft,child: Text(i["progress"], style: TextStyle(fontSize: 15),)),
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SemesterReport extends StatelessWidget {
  const SemesterReport({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return Settings();
                }));
              }, icon: Icon(Icons.arrow_back)),
              Text("Semester reports")
            ],
          ),
        ),
        body: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              for (var i in appData[0]["result"]) Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                    )]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PieChart(
                          dataMap: {"cgpa scored":0.0+i["cgpa"],"":10.0-i["cgpa"]},
                          chartType: ChartType.ring,
                          chartRadius: 300,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValues: false
                          ),
                        ),
                        Align(alignment: Alignment.centerLeft,child: Text("Semester - "+i["semester"].toString(),style: TextStyle(fontSize: 20),)),
                        Align(alignment: Alignment.centerLeft,child: Text("CGPA - "+i["cgpa"].toString(), style: TextStyle(fontSize: 20),))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class ResetPassword extends StatelessWidget {
  var password = new TextEditingController();
  var cpassword = new TextEditingController();
  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Settings();}));
              }, icon: Icon(Icons.arrow_back)),
              Text("Reset Password")
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 10,blurStyle: BlurStyle.outer, color: Colors.black)]
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Enter new password",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: background)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)
                        )
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 15,),
                    TextField(
                      controller: cpassword,
                      decoration: InputDecoration(
                        hintText: "Confirm new password",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: background)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)
                        )
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 15,),
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.7,child: ElevatedButton(onPressed: () {
                      if (cpassword.text == password.text) {
                        newPassword(appData[0]["roll"], appData[0]["password"], password.text);
                        appData[0]["password"] = password.text;
                        showDialog(context: context, builder: (builder) {
                          return AlertDialog(
                            title: Text("Message"),
                            content: Text("Your password is successfully changed"),
                            actions: [
                              TextButton(onPressed: () {
                                Navigator.of(context).pop();
                              }, child: Text("Yay!"))
                            ],
                          );
                        });
                      } else {
                        showDialog(context: context, builder: (builder) {
                          return AlertDialog(
                            title: Text("Reset password"),
                            content: Text("Entered different password, kindly confirm your password"),
                            actions: [
                              TextButton(onPressed: () {
                                Navigator.of(context).pop();
                              }, child: Text("Try again", style: TextStyle(color: Colors.red),))
                            ],
                          );
                        }
                        );
                      }
                    }, style: ElevatedButton.styleFrom(backgroundColor: background, foregroundColor: Colors.white) ,child: Text("Reset")))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Achievements extends StatelessWidget {
  const Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Row(
          children: [
            IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Settings();}));}, icon: Icon(Icons.arrow_back)),
            Text("Achievements")
          ],
        ),),
        body: SingleChildScrollView(
          child: Column(children: [
            for (var i in appData[0]["acheivements"]) Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10,blurStyle: BlurStyle.outer)],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(i, width: MediaQuery.sizeOf(context).width*0.8,),
                ),
              ),
            )
          ],),
        ),
      ),
    );
  }
}

class HolidayList extends StatelessWidget {
  const HolidayList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Row(
          children: [
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Settings();
              }));
            }, icon: Icon(Icons.arrow_back)),
            Text("Holiday list"),
          ],
        ),),
        body: SingleChildScrollView(child: Column(
          children: [
            for (var i in appData[0]["HolidayList"]) Padding(
              padding: const EdgeInsets.all(8.0),
                child: Align(alignment: Alignment.centerLeft,child: Text(i, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
            )
          ],
        )),
      ),
    );
  }
}

class Routine extends StatelessWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return Settings();
                }));
              }, icon: Icon(Icons.arrow_back)),
              Text("Routine")
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(appData[0]["routine"]),
            )
          ],
        ),
      ),
    );
  }
}

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 25,),
            for (var i in notes[0][appData[0]["passingYear"]]) Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10,blurStyle: BlurStyle.outer)]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(i["Subject"], style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          IconButton(onPressed: () {
                            final Uri _url = Uri.parse(i["link"]);
                            launchUrl(_url);
                          }, icon: Icon(Icons.download))
                        ],
                      ),
                      Align(alignment: Alignment.centerLeft,child: Text(i["Chapter"], style: TextStyle(fontSize: 18),)),
                      Row(
                        children: [
                          Text("Categories: ", style: TextStyle(fontSize: 18),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 236, 170, 216),
                            ),child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(i["Category"]),
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],),
        ),
        bottomNavigationBar: bottomNavigation(context, 1),
      ),
    );
  }
}

bottomNavigation(context, currentIndex) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: background,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          if (value == 0) Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Profile();}));
          if (value == 1) Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Notes();}));
          if (value == 2) Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Notification();}));
          if (value == 3) Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Settings();}));
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.notes), label: "Notes"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    ),
  );
}