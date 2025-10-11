import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/enums/gender_enum.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/helper/images.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/local/shared_prefrence.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/gender_choose_screen/widgets/gender_button.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/ui/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseGenderScreen extends StatefulWidget {
  const ChooseGenderScreen({super.key});

  @override
  State<ChooseGenderScreen> createState() => _ChooseGenderScreenState();
}

class _ChooseGenderScreenState extends State<ChooseGenderScreen> {
  Gender? selectedGender;

  @override
  void initState() {
    super.initState();
    _loadGender();
  }

  Future<void> _loadGender() async {
    final savedGender = SharedPreferencesHelper.getString(
      SharedPrefKeys.gender,
    );
    if (savedGender != null) {
      setState(() {
        selectedGender = GenderExtension.fromString(savedGender);
      });
    } else {
      // default selection if none saved
      selectedGender = Gender.female;
    }
  }

  Future<void> _saveGender(Gender gender) async {
    await SharedPreferencesHelper.saveString(
      SharedPrefKeys.gender,
      gender.toStorageString(),
    );
  }

  void _onGenderSelected(Gender gender) async {
    setState(() => selectedGender = gender);
    await _saveGender(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB49AF9),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                Images.manModelOne,
                height: 1.5.sh,
                fit: BoxFit.contain,
              ),
            ),

            // bottom card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Look Good, Feel Good",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Create your individual & unique style and look amazing everyday.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenderButton(
                        label: "Men",
                        isSelected: selectedGender == Gender.male,
                        onTap: () => _onGenderSelected(Gender.male),
                      ),
                      const SizedBox(width: 12),
                      GenderButton(
                        label: "Women",
                        isSelected: selectedGender == Gender.female,
                        onTap: () => _onGenderSelected(Gender.female),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
