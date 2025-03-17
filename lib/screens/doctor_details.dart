import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mencoba_1/components/button.dart';
import 'package:mencoba_1/components/custom_appbar.dart';
import 'package:mencoba_1/utils/config.dart';
// import 'package:mencoba_1/components/button.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appTitle: 'Doctor Details',
        route: 'main',
        icon: const FaIcon(Icons.arrow_back),
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              isFav ? Icons.favorite_border : Icons.favorite_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AboutDoctor(),
              DetailBody(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Button(
                  width: double.infinity,
                  title: 'Book Appointment',
                  onPressed: () {
                    Navigator.of(context).pushNamed('booking_page');
                  },
                  disable: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/doctor_1.png'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            'Dr.Biboo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Deskripsi tentang Dr.Biboo',
              style: TextStyle(color: Colors.grey, fontSize: 15),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),

          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Nama rumah sakit',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.spaceSmall,
          DoctorInfo(),
          Config.spaceMedium,
          const Text(
            'About Doctor',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Config.spaceSmall,
          Text(
            'Dr.Biboo is a very experienced dentist we have in this country.',
            style: TextStyle(fontWeight: FontWeight.w500, height: 1.5),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        InfoCard(label: 'Patient', value: '109'),
        SizedBox(width: 15),
        InfoCard(label: 'Experiences', value: '10 years'),
        SizedBox(width: 15),
        InfoCard(label: 'Rating', value: '4.5'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
