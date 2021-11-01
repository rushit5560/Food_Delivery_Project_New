import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:get/get.dart';

class CallbackTextModule extends StatelessWidget {
  const CallbackTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Would Your Like to Request For Callback From us',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: Get.width * 0.03
      ),
    );
  }
}

class CallBackButtonModule extends StatelessWidget {
  const CallBackButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Text(
            'Callback Request',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class FeedbackTextModule extends StatelessWidget {
  const FeedbackTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Let us know Your Feedback, Queries or issue regarding app or features',
      maxLines: 2,
      textAlign: TextAlign.center,
      textScaleFactor: 1.1,
    );
  }
}

class FormFieldsModule extends StatelessWidget {
  FormFieldsModule({
    required this.formKey,
    required this.fullNameFieldController,
    required this.phoneNoFieldController,
    required this.messageFieldController,
  });
  GlobalKey<FormState> formKey;
  TextEditingController fullNameFieldController;
  TextEditingController phoneNoFieldController;
  TextEditingController messageFieldController;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FullNameFieldModule(
            name: 'Full name',
            controller: fullNameFieldController,
          hintText: 'John Deo',
          ),
          PhoneNoFieldModule(
            name: 'Phone No',
            controller: phoneNoFieldController,
            hintText: '123456890',
            index: 1,
          ),

          FeedbackFieldModule(
            name: 'Feedback',
            controller: messageFieldController,
            hintText: 'Enter Your Message',
          ),

        ],
      ),
    );
  }


}

class FullNameFieldModule extends StatelessWidget {
  String name;
  TextEditingController controller;
  String hintText;

  FullNameFieldModule({
    required this.name,
    required this.controller,
    required this.hintText
});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Text(
          '$name - ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: controller,
              cursorColor: Colors.black,
              decoration: inputDecoration(hintText: '$hintText'),
              validator: (value) {
                if(value!.isEmpty){
                  return 'Field can\'t Empty';
                }
              },
            ),
          ),
        ),
      ],
    ),
  );
  }
}

class PhoneNoFieldModule extends StatelessWidget {
  String name;
  TextEditingController controller;
  String hintText;
  int index;

  PhoneNoFieldModule({
    required this.name,
    required this.controller,
    required this.hintText,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$name - ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: controller,
                cursorColor: Colors.black,
                decoration: inputDecoration(hintText: '$hintText', index: 1),
                maxLength: 10,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Field can\'t Empty';
                  } else if(value.length != 10){
                    return 'Phone No. should be valid';
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackFieldModule extends StatelessWidget {
  String name;
  TextEditingController controller;
  String hintText;

  FeedbackFieldModule({
    required this.name,
    required this.controller,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$name - ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: controller,
                cursorColor: Colors.black,
                decoration: inputDecoration(hintText: '$hintText'),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Field can\'t Empty';
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SubmitButtonModule extends StatelessWidget {
  GlobalKey<FormState> formKey;
  SubmitButtonModule({required this.formKey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(formKey.currentState!.validate()){
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              'Submit',
              textScaleFactor: 1.1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration inputDecoration({required String hintText, int index =0}) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.all(12),
    filled: true,
    fillColor: Colors.grey.shade200,
    hintText: '$hintText',
    counterText: '',
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}


// Widget _commonFieldModule(
//     {required String name,
//     required TextEditingController controller,
//     required String hintText,
//     required int index}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0),
//     child: Row(
//       children: [
//         Text(
//           '$name - ',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: TextFormField(
//               controller: controller,
//               cursorColor: Colors.black,
//               decoration: inputDecoration('$hintText'),
//               validator: (value) {
//                 validateForm(value!, index);
//               },
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// validateForm(String value, int index){
//   switch(index){
//     case 0:
//       if(value.isEmpty){
//         return 'Field can\'t Empty';
//       }
//       break;
//     default:
//       return '';
//   }
// }