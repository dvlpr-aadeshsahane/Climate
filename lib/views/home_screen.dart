import 'package:clima/consts/app_colors.dart';
import 'package:clima/consts/assets.dart';
import 'package:clima/consts/typo.dart';
import 'package:clima/controllers/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

getDay(int miliseconds) {}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: AppColors.bgGrident,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44.r),
            topRight: Radius.circular(44.r),
          ),
        ),
        height: 325.h,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedTab = 0;
                      setState(() {});
                    },
                    child: Text(
                      "Hourly Forcast",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.labelDarkSecondary,
                          fontFamily: Typo.semibold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedTab = 1;
                      setState(() {});
                    },
                    child: Text(
                      "Weekly Forcast",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.labelDarkSecondary,
                          fontFamily: Typo.semibold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 1,
                    thickness: selectedTab == 0 ? 1 : 0,
                    color: selectedTab == 0
                        ? Colors.white
                        : Colors.white.withOpacity(0.10),
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 1,
                    thickness: selectedTab == 1 ? 1 : 0,
                    color: selectedTab == 1
                        ? Colors.white
                        : Colors.white.withOpacity(0.10),
                  ),
                )
              ],
            ),
            const Divider(
              height: 1,
              thickness: 0.30,
            ),
            SizedBox(
              height: 20.h,
            ),
            selectedTab == 0 ? hourlyWeather() : WeeklyWeather()
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.bg,
            ),
          ),
          gradient: AppColors.bgGrident,
        ),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Image.network(
                "https://openweathermap.org/img/wn/${WeatherController().currentData!.weather![0].icon!}@2x.png"),
            Text(
              WeatherController().currentData!.name!,
              style: TextStyle(fontSize: 34.sp, color: Colors.white),
            ),
            SizedBox(
              child: Text(
                "${WeatherController().currentData!.main!.temp!}",
                style: TextStyle(
                    fontSize: 85.sp,
                    color: Colors.white,
                    fontFamily: Typo.thin),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              WeatherController().currentData!.weather![0].description!,
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.labelDarkSecondary,
                fontFamily: Typo.semibold,
              ),
            ),
            SizedBox(height: 23.h),
            Text(
              "H:24  L:18",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontFamily: Typo.semibold,
              ),
            ),
            Image.asset(
              Assets.house,
              width: 390.w,
              height: 390.w,
            )
          ],
        ),
      ),
    );
  }

  SizedBox WeeklyWeather() {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(left: index == 0 ? 20.w : 12.w),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white.withOpacity(0.20)),
            borderRadius: BorderRadius.circular(30.r),
            color: const Color(0xff48319D).withOpacity(0.20),
          ),
          width: 60.w,
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Mon",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: Typo.semibold,
                  fontSize: 15.sp,
                ),
              ),
              Image.network(
                "https://openweathermap.org/img/wn/04d@2x.png",
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "20",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: Typo.semibold,
                  fontSize: 20.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox hourlyWeather() {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(left: index == 0 ? 20.w : 12.w),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white.withOpacity(0.20)),
            borderRadius: BorderRadius.circular(30.r),
            color: const Color(0xff48319D).withOpacity(0.20),
          ),
          width: 60.w,
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                "12 AM",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: Typo.semibold,
                  fontSize: 15.sp,
                ),
              ),
              Image.network(
                "https://openweathermap.org/img/wn/04d@2x.png",
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "20",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: Typo.semibold,
                  fontSize: 20.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
