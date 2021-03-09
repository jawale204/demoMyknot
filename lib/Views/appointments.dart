import 'package:flutter/material.dart';
import 'package:myknot/Models/Appointment.dart';
import 'package:myknot/Service/appointments.dart';
import 'package:myknot/Views/singleAppt.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    HandleAppointments appoint = new HandleAppointments();
    return Scaffold(
        appBar: AppBar(title: Text("MYKNOT")),
        body: FutureBuilder(
          future: appoint.getAllAppointents(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Good Morning."),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      snapshot.data["notary"]["firstName"],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Todays Appointments",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      children: [
                        ...snapshot.data['appointments']
                            .map((singleAppointment) {
                          var a =
                              Appt.fromJson(singleAppointment['appointment']);
                          return singleAppt(
                              singleAppointment['orderId'], a, context);
                        })
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

singleAppt(String id, Appt appt, context) {
  return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SingleAppt(id: id)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: 200,
          height: 150,
          child: ListTile(
            title: Text(
              appt.name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Date : " + appt.time.substring(0, 10)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Place : " + appt.place),
                ),
              ],
            ),
          ),
        ),
      ));
}
