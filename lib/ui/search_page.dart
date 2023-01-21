import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:weather_test_2/constants/app_colors.dart';
import 'package:weather_test_2/constants/text_styles.dart';
import 'package:weather_test_2/ui/home_page.dart';


class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => HomeUi(),));
                },
                child: Icon(Icons.arrow_back)),
              ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/home_ui.jpg', 
                   height: 1000,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: const TextStyle(fontSize: 35),
                      controller: _controller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Search City',
                        hintStyle: const TextStyle(
                            fontSize: 20, color: AppColors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 3, color: AppColors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 3, color: AppColors.grey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                      onPressed: () { Navigator.pop(
                              context, _controller.text);
                        FocusManager.instance.primaryFocus?.unfocus();
                        log('controller =====> ${_controller.text}');
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor:AppColors.grey,
                      ),
                     
                        child: const Text(
                          'Search City',
                          style: AppTextStyles.text40White,
                        ),
                      ),
                ],
              ),
            ),
          ],
        ));
  }
}
