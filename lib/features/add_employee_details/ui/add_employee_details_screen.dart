import 'package:assignment_realtime_innovations/core/app_colors.dart';
import 'package:assignment_realtime_innovations/helpers/date_time_helpers.dart';
import 'package:assignment_realtime_innovations/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AddEmployeeDetailsScreen extends StatelessWidget {
  AddEmployeeDetailsScreen({super.key});

  TextEditingController employeeNameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee Details'),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.dp),
        child: ListView(
          children: [
            TextFormField(
              controller: employeeNameController,
              decoration: InputDecoration(
                hintText: 'Employee Name',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: AppColors.primary,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.dp),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    //width: 0.2.dp,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.dp),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300.withOpacity(0.5),
                    width: 0.2.dp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.dp),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.dp),
                        topRight: Radius.circular(8.dp),
                      ),
                    ),
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              roleController.text = 'Product Designer';
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.dp),
                                  child: Text(
                                    'Product Designer',
                                    style: TextStyle(
                                      fontSize: 16.dp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 0.5.dp,
                            color: Colors.grey.shade300,
                          ),
                          GestureDetector(
                            onTap: () {
                              roleController.text = 'Flutter Developer';
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.dp),
                                  child: Text(
                                    'Flutter Developer',
                                    style: TextStyle(
                                      fontSize: 16.dp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 0.5.dp,
                            color: Colors.grey.shade300,
                          ),
                          GestureDetector(
                            onTap: () {
                              roleController.text = 'QA Tester';
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.dp),
                                  child: Text(
                                    'QA Tester',
                                    style: TextStyle(
                                      fontSize: 16.dp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 0.5.dp,
                            color: Colors.grey.shade300,
                          ),
                          GestureDetector(
                            onTap: () {
                              roleController.text = 'Product Owner';
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.dp),
                                  child: Text(
                                    'Product Owner',
                                    style: TextStyle(
                                      fontSize: 16.dp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.dp,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      );
                    });
              },
              child: TextFormField(
                controller: roleController,
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'Select Role',
                  prefixIcon: Icon(
                    Icons.work_outline,
                    color: AppColors.primary,
                  ),
                  suffixIcon: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: AppColors.primary,
                    size: 32.dp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.dp),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.dp),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      //width: 0.2.dp,
                    ),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.dp),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Material(
                              child: SizedBox(
                                  height: 80.h,
                                  width: 80.w,
                                  child: CustomDatePicker(
                                    onDateSelected: (selectedDate) {
                                      fromDateController.text = selectedDate
                                          .getDateWithShortMonthName;
                                    },
                                  )),
                            );
                          });
                    },
                    child: TextFormField(
                      enabled: false,
                      controller: fromDateController,
                      decoration: InputDecoration(
                        hintText: 'No Date',
                        prefixIcon: Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.dp),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.dp),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            //width: 0.2.dp,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.arrow_right_alt,
                    color: AppColors.primary, size: 24.dp),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Material(
                              child: SizedBox(
                                  height: 80.h,
                                  width: 80.w,
                                  child: CustomDatePicker(
                                    onDateSelected: (selectedDate) {
                                      toDateController.text = selectedDate
                                          .getDateWithShortMonthName;
                                    },
                                  )),
                            );
                          });
                    },
                    child: TextFormField(
                      enabled: false,
                      controller: toDateController,
                      decoration: InputDecoration(
                        hintText: 'No Date',
                        prefixIcon: Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.dp),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.dp),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            //width: 0.2.dp,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1.dp,
            color: Colors.grey.shade300,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary.shade50.withOpacity(0.5),
                    foregroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.dp),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
                SizedBox(width: 8.dp),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.dp),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
