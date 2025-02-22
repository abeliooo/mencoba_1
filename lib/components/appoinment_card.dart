import 'package:flutter/material.dart';
import 'package:mencoba_1/utils/config.dart';

class AppoinmentCard extends StatefulWidget {
  const AppoinmentCard({super.key});

  @override
  State<AppoinmentCard> createState() => _AppoinmentCardState();
}

class _AppoinmentCardState extends State<AppoinmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/doctor_1.png'),
                  ),
                  const SizedBox(
                        width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Dr.Biboo',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Dental', style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,

              const ScheduleCard(),
              Config.spaceSmall,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),

                  const SizedBox(
                    width: 20,
                  ),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Completed',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.calendar_today,
          color: Colors.white,
          size: 15,
          ),
          const SizedBox(width: 5,),
          Text(
            'Saturday, 22/02/2025',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 20,),
          const Icon(Icons.access_alarm,
          color: Colors.white,
          size: 17,
          ),
          const SizedBox(width: 5,),
          Flexible(child: Text(
            '23:25', 
            style: TextStyle(
              color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}