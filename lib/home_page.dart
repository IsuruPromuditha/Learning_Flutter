import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_design_class/rest_api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final apiService = RestAPIService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: Text('Home Page',style: TextStyle(
          color: Colors.white,
        ),),),
      body: Container(
        child: Column(
          children: [
            Expanded(child: FutureBuilder(
              future:apiService.getUsers() ,
              builder: (context,snapShot){
                if(snapShot.hasData)
                  {
                    return ListView.builder(
                      itemCount: snapShot.data?.length ?? 0 ,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap:(){} ,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  color: Colors.grey.withOpacity(0.3)
                                )
                              ]
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            child: ListTile(
                              title: Text( snapShot.data?[index].name ?? '',style: TextStyle(fontSize: 18,color: Colors.black),),
                              subtitle: Text( snapShot.data?[index].city ?? '',style: TextStyle(fontSize: 18,color: Colors.black),),
                            ),
                          ),
                        );
                      },
                    );

                  }else{
                  return Container(
                    child: Center(
                      child: Text(
                        'Loading....',style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      ),
                    ),
                  );
                }
              },
            ))
          ],
        ),
      ),


    );
  }
}
