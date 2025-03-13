import 'package:flutter/material.dart';
import 'package:mencoba_1/utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  List<dynamic> schedules = [
    {
      "doctor_name": "Biboo",
      "doctor_profile": "assets/doctor_1.png",
      "category": "Dental",
      "status": FilterStatus.upcoming,
    },
    {
      "doctor_name": "Bijou",
      "doctor_profile": "assets/doctor_1.png",
      "category": "Cardiology",
      "status": FilterStatus.cancel,
    },
    {
      "doctor_name": "Beebs",
      "doctor_profile": "assets/doctor_1.png",
      "category": "General",
      "status": FilterStatus.complete,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // List<dynamic> filteredSchedules =
    //     schedules.where((var schedule) {
    //       switch (schedule['status']) {
    //         case 'upcoming':
    //           schedule['status'] = FilterStatus.upcoming;
    //           break;
    //         case 'complete':
    //           schedule['status'] = FilterStatus.complete;
    //           break;
    //         case 'cancel':
    //           schedule['status'] = FilterStatus.cancel;
    //           break;
    //       }
    //       return schedule['status'];
    //     }).toList();
  List<Map<String, dynamic>> filteredSchedules = schedules
      .where((schedule) => schedule['status'] == status)
      .cast<Map<String, dynamic>>()
      .toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(child: Text(filterStatus.name)),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement ? const EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(schedule['doctor_profile']),
                              ),
                              const SizedBox(width: 10,),
                              
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    schedule['doctor_name'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    schedule['category'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const ScheduleCard(),

                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {}, 
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),

                                Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor,
                                  ),
                                  onPressed: () {}, 
                                  child: const Text(
                                    'Reschedule',
                                    style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
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
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(Icons.calendar_today,
          color: Colors.black,
          size: 15,
          ),
          const SizedBox(width: 5,),
          Text(
            'Saturday, 23/02/2025',
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(width: 20,),
          const Icon(Icons.access_alarm,
          color: Colors.black,
          size: 17,
          ),
          const SizedBox(width: 5,),
          Flexible(child: Text(
            '17:40', 
            style: TextStyle(
              color: Colors.black
              ),
            ),
          ),
        ],
      ),
    );
  }
}