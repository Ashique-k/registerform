import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:register_form/new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formkey=GlobalKey<FormState>();
  TextEditingController datectrl=TextEditingController();
  TextEditingController timectrl=TextEditingController();
  final SnackBar _snackBar= SnackBar(content: Text("registerd"),duration: Duration(seconds: 4),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        title: Text("Register Form"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
         IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SingleChildScrollView(),
            Image.asset("assets/images/register.jpg"),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ) ,
                hintText: "Enter username" ,
                labelText: "username",

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height:80,
                width: 800,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ) ,
                    hintText: "Enter Address" ,
                    labelText: "Address",

                  ),
                ),
              ),
            ),
            Form(
             key: _formkey,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,

                  child: TextFormField(
                    controller: datectrl,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      hintText: "DOB",
                      suffixIcon: IconButton(onPressed: ()async{

                       final DateTime? _date= await showDatePicker(context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                        );
                       final _formatteddate = DateFormat("dd/MM/yyyy").format(_date!);
                       setState(() {
                         datectrl.text =_formatteddate.toString();
                       });




                      }, icon:Icon(Icons.calendar_month)),
                    ),
                  ),
                ),
              ) ,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: timectrl,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: "Enter Time",
                  suffixIcon: IconButton(onPressed: ()async{
                    final TimeOfDay?_day = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now());
                    setState(() {
                      timectrl.text =_day!.format(context);
                    });



                  }, icon: Icon(Icons.timer)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  hintText: "enter password",
                  labelText: "password",

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  hintText: "enter Location",
                  labelText: "Location",

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){

                ScaffoldMessenger.of(context).showSnackBar(_snackBar);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const goat()),
                );

              }, child: Text("Register Now")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed:(){}),
                SizedBox(width: 10,),
                FloatingActionButton(onPressed:(){}),
                SizedBox(width: 10,),
                FloatingActionButton(onPressed:(){}),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed: (){}, child: Text("already sign in?")),
            ),
          ],
        ),
      ),
    );
  }
}

