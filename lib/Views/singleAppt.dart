import 'package:flutter/material.dart';
import 'package:myknot/Service/appointments.dart';

class SingleAppt extends StatefulWidget {
  final String id;
  SingleAppt({this.id});
  @override
  _SingleApptState createState() => _SingleApptState();
}

class _SingleApptState extends State<SingleAppt> {
  @override
  Widget build(BuildContext context) {
    HandleAppointments appoint = new HandleAppointments();
    return Scaffold(
        appBar: AppBar(title: Text("MYKNOT")),
        body: FutureBuilder(
            future: appoint.getSingleAppointents(widget.id),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("OrderID : " +
                            widget.id),
                        Text("Amount : " +
                            snapshot.data["order"]["amount"].toString()),
                      ],
                    ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
