import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(
            'assets/logo.jpeg',
            width: 100,
            height: 100,
          ),
          SizedBox(height: 20),
          Text(
            'Team Happen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'A group of 11 students from Government Medical College, Miraj',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Mission',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Our mission is to raise awareness and promote the significance of palliative care in enhancing the lives of individuals facing serious illnesses.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'About Palliative Care',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Palliative care is a specialized medical approach centered on love, comfort, and compassion.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Our Journey',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Our journey started when we realized the lack of awareness surrounding palliative care, with only 14 percent of those in need having access to its benefits. We believe that everyone facing serious illness deserves utmost care and support, making palliative care crucial.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Our Commitment',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Our commitment is rooted in the belief that though we can\'t change the outcome, we can make the journey more peaceful and dignified with compassion.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),
          Text(
            'Connect With Us',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  Uri uri1 =
                      Uri.parse('instagram://user?username=the_palligram');
                  Uri uri2 =
                      Uri.parse('https://www.instagram.com/the_palligram/');
                  try {
                    await launchUrl(uri1);
                  } catch (error1) {
                    try {
                      await launchUrl(uri2);
                    } catch (error2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Unable to open Instagram page'),
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  height: 70,
                  width: 70,
                  child: Image.asset('assets/instagram_icon.jpg'),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Uri url = Uri.parse(
                    'https://docs.google.com/forms/d/e/1FAIpQLSeruSaiDrm1QSPhHd5RpgGi4uZNbvZ2zLrNuVGDR0J-dccbkA/viewform?usp=sf_link',
                  );
                  if (!await launchUrl(url)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Unable to open the google'),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/google_forms_icon.png'),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Uri url = Uri.parse(
                    'mailto:palliativecaregmcm@gmail.com',
                  );
                  if (!await launchUrl(url)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Unable to open the google'),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/gmail_icon_crop.png'),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Join Us',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Join us in our noble venture to make a difference in the lives of terminally ill patients and their families. Together, let\'s create a world where love and compassion pave the way for a more dignified approach to serious illness.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Warm Regards,\nTeam Happen',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
