import 'package:flutter/material.dart';
import 'package:pallifind/widgets/expandable.dart';
import 'package:pallifind/widgets/h1.dart';
import 'package:pallifind/widgets/quote.dart';
import 'package:pallifind/widgets/subtext.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Header1(title: 'Welcome to Pallifind'),
          SizedBox(height: 16.0),
          Subtext(
            subtext: 'Your companion to aid you through Palliative care',
          ),
          SizedBox(height: 16.0),
          Text(
            'Frequently Asked Questions:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 16.0),
          Quote(quote: 'Cure can end, but care never ends.', author: 'Unknown'),
          SizedBox(height: 16.0),
          ExpandableWidget(
            title: 'What is Palliative Care?',
            content: Text(
              'Palliative care is a specialized medical care that focuses on improving the quality of life for people living with serious illnesses and their families. It is designed to provide relief from the symptoms and stress of the illness and is appropriate at any stage of an illness. Palliative care teams include doctors, nurses, social workers, chaplains, and other healthcare professionals who work together to provide comprehensive care. They address physical symptoms like pain, nausea, and fatigue, as well as emotional, social, and spiritual needs. Palliative care can be provided in hospitals, clinics, and at home and is often used in conjunction with hospice care, which provides end-of-life care and support for patients and their families.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontFamily: 'Arial',
              ),
            ),
          ),
          SizedBox(height: 8.0),
          ExpandableWidget(
            title: 'Why Palliative Care?',
            content: Text(
              'Palliative care is a specialized medical care that focuses on improving the quality of life for people living with serious illnesses and their families. It is designed to provide relief from the symptoms and stress of the illness and is appropriate at any stage of an illness. Palliative care teams include doctors, nurses, social workers, chaplains, and other healthcare professionals who work together to provide comprehensive care. They address physical symptoms like pain, nausea, and fatigue, as well as emotional, social, and spiritual needs. Palliative care can be provided in hospitals, clinics, and at home and is often used in conjunction with hospice care, which provides end-of-life care and support for patients and their families.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
