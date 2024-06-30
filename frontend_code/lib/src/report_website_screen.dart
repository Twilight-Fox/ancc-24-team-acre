import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class ReportWebsiteScreen extends StatefulWidget {
  final String url;
  
  const ReportWebsiteScreen({super.key, required this.url});

  @override
  State<ReportWebsiteScreen> createState() => _ReportWebsiteScreenState();
}

class _ReportWebsiteScreenState extends State<ReportWebsiteScreen> {
  Map<String, bool> checkboxValues = {
    "phishing": false,
    "invalid domain": false,
    "malware": false,
    "copyright infringement": false,
    "spam": false,
    "piracy": false,
    "illegal content": false,
  };

  Future<void> _handleReport() async {
    final supabase = context.read<SupabaseState>().supabase;

    String selectedCategories = '';
    checkboxValues.forEach((key, value) {
      if (value) {
      selectedCategories += '$key, ';
      }
    });
    if (selectedCategories != ''){
      selectedCategories = selectedCategories.substring(0, selectedCategories.length - 2);
    } 
    //print(selectedCategories);
    await supabase
        .from('community_reports')
        .insert([
        { "website_url": widget.url, 'categories': selectedCategories},
        ]);
    context.go('/report_result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            left:35,
            top:55,
            child: Image(
              image: AssetImage(
                'assets/images/leftArrowIcon.png'
              ),
            )
          ),

          const Positioned(
            left: 163,
            top: 61,
            child: SizedBox(
              width: 221,
              height: 70,
              child: Text(
                'Report Website',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27.26,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 25,
            top: 175,
            child: SizedBox(
              width: 138,
              height: 31,
              child: Text(
                'Categories:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.52,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 62,
            top: 305,
            child: SizedBox(
              width: 280,
              height: 469,
              child: Text(
                'phishing/scam\n\ninvalid domain\n\nmalware\n\nCopyright Infringement\n\nspam\n\npiracy\n\nIllegal Content\n\n\n\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.52,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
            Positioned(
            left: 334,
            top: 283,
            child: Checkbox(
              value: checkboxValues['phishing'],
              onChanged: (bool? value) {
                setState(() {
                  checkboxValues['phishing'] = value ?? false;
                });
              },
            ),
            ),
            Positioned(
            left: 334,
            top: 331,
            child: Checkbox(
              value: checkboxValues['invalid domain'],
              onChanged: (bool? value) {
                setState(() {
                  checkboxValues['invalid domain'] = value ?? false;
                });
              },
            ),
            ),
            Positioned(
            left: 334,
            top: 379,
            child: Checkbox(
              value: checkboxValues['malware'],
              onChanged: (bool? value) {
                setState(() {
                  checkboxValues['malware'] = value ?? false;
                });
              },
            ),
            ),
            Positioned(
            left: 334,
            top: 427,
            child: Checkbox(
              value: checkboxValues['copyright infringement'],
              onChanged: (bool? value) {
                setState(() {
                  checkboxValues['copyright infringement'] = value ?? false;
                });
              },
            ),
            ),
            Positioned(
            left: 334,
            top: 475,
            child: Checkbox(
              value: checkboxValues['spam'],
              onChanged: (bool? value) {
                setState(() {
                  checkboxValues['spam'] = value ?? false;
                });
              },
            ),
            ),
            Positioned(
            left: 334,
            top: 523,
            child: Checkbox(
              value: checkboxValues['piracy'],
              onChanged: (bool? value) {
                setState(() {
                  checkboxValues['piracy'] = value ?? false;
                });
              },
            ),
            ),
            Positioned(
            left: 334,
            top: 571,
            child: Checkbox(
              value: checkboxValues['illegal content'],
              onChanged: (bool? value) {
                setState(() {
                  checkboxValues['illegal content'] = value ?? false;
                });
              },
            ),
            ),
          Positioned(
            left: 93,
            top: 750,
            child: ElevatedButton(
              onPressed: () {
                _handleReport();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFAB00), // Button color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                ),
                fixedSize: const Size(226, 67),
              ),
              child: const Text(
                'REPORT',
                style: TextStyle(
                  fontSize: 27.40,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
