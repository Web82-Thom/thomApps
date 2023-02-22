import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

///====================DEPENDENCY :
/// => intl
/// => get_storage
/// => flutter_datetime_picker
/// =================================
/// use get_storage to retrieve the selected value

class DatePickerWidget extends StatefulWidget {
  String? textWhenEmpty;
  bool? isEditWithUpdate;
  Function? onUpdateDate;
  String? boxKeyDate;

  DatePickerWidget({Key? key,
    required this.textWhenEmpty,
    this.onUpdateDate,
    this.isEditWithUpdate = false,
    this.boxKeyDate,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final box = GetStorage();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //------NEW DATE------//
        (widget.isEditWithUpdate == false)
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(selectedDate == null ? widget.textWhenEmpty! : DateFormat('yMMMMEEEEd', 'fr_FR').format(selectedDate!).toString()),
            ElevatedButton(onPressed: (){
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime(2100, 12, 31), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.fr).then((date){
                setState(() {
                  selectedDate = date;
                  // box.write(widget.boxKeyDate!, selectedDate);
                });
                print(selectedDate);
                print(' box ${box.read(widget.boxKeyDate!)}');
              });
            }, child: Text("Sélectionner une date")),
          ],
        ): 
        //------UPDATE DATE EXISTING------//
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(selectedDate == null ? widget.textWhenEmpty! : DateFormat('yMMMMEEEEd', 'fr_FR').format(selectedDate!).toString()),
            ElevatedButton(onPressed: (){
              DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1900, 1, 1),
                maxTime: DateTime(2100, 12, 31), 
                onChanged: (date) {
                  print('change $date');
                }, 
                onConfirm: (date) {
                  setState(() {
                  selectedDate = date;
                  box.write(widget.boxKeyDate!, date);
                  print('BOX read ${DateFormat("yyyy-MM-dd").format(box.read(widget.boxKeyDate!))}');
                },);
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.fr).then((date){
                
                (widget.isEditWithUpdate == true) ? widget.onUpdateDate!(box.read(widget.boxKeyDate!)) : null;
                print(selectedDate);
                },
              );
            }, child: Text("Sélectionner une date")),
          ],
        ),
      ],
    );
  }

}
