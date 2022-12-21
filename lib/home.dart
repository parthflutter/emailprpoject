import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List l1=[];
  TextEditingController txtname = TextEditingController();
  String name="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            centerTitle: true,
            title: Text("Textfield",style: TextStyle(color: Colors.white)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: txtname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Name",
                        focusedBorder: OutlineInputBorder()
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      name = txtname.text;
                      l1.add(name);
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 18)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: l1.asMap().entries.map((e) => Name(l1[e.key],e.key)).toList(),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
  Widget Name(dynamic name,int index)
  {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("$name",style: TextStyle(color: Colors.white,fontSize: 18)),
                ),
                InkWell(onTap: () {
                  setState(() {
                    l1.removeAt(index);
                  });
                },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}