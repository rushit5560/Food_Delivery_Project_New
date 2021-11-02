import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/controllers/add_address_screen_controller/add_address_screen_controller.dart';
import 'package:get/get.dart';

class AddAddressModule extends StatelessWidget {
  // AddAddressModule({Key? key}) : super(key: key);

  AddAddressScreenController addAddressScreenController = Get.find<AddAddressScreenController>();
  // AddAddressModule({required this.addAddressScreenController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Column(
        children: [
          addressTypeDropDown(context),
          SizedBox(height: 10,),
          receiverNameTextField(),
          SizedBox(height: 10,),
          receiverPhoneTextField(),
          SizedBox(height: 10,),
          cityTypeDropDown(context),
          SizedBox(height: 10,),
          societyDropDown(context),
          SizedBox(height: 10,),
          pincodeTextField(),
          SizedBox(height: 10,),
          houseTextField(),
          SizedBox(height: 10,),
          stateTextField(),
          SizedBox(height: 10,),
          address1TextField(),
          SizedBox(height: 10,),
          address2TextField(),

        ],
      ),
    );
  }

  addressTypeDropDown(context){
    return Obx(
        () =>
       Container(
        padding: const EdgeInsets.only(left: 10),
        height: 45,  //gives the height of the dropdown button
        width: MediaQuery.of(context).size.width, //gives the width of the dropdown button
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.shade200
          //border: Border.all(color: Colors.grey),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.grey.shade100, // background color for the dropdown items
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true,  //If false (the default), then the dropdown's menu will be wider than its button.
              )
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              focusColor:Colors.white,
              value: addAddressScreenController.addressType.value,
              //elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor:Colors.black,
              items: <String>[
                'Surat',
                'Ahmedabad',
                'Baroda',
                'Rajkot',
                'Gandhinagar',
                'Bhavanagar',
                'Junagagh',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style:TextStyle(color:Colors.black),),
                );
              }).toList(),
              hint:Text(
                "Select Address Type",
                /*style: TextStyle(
                                //color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),*/
              ),
              onChanged: (String ? value) {
                //setState(() {
                addAddressScreenController.addressType.value = value!;
                //});
              },
            ),
          ),
        ),
      ),
    );
  }

  cityTypeDropDown(context){
    return Obx(
          () =>
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 45,  //gives the height of the dropdown button
            width: MediaQuery.of(context).size.width, //gives the width of the dropdown button
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.shade200
              //border: Border.all(color: Colors.grey),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: Colors.grey.shade100, // background color for the dropdown items
                  buttonTheme: ButtonTheme.of(context).copyWith(
                    alignedDropdown: true,  //If false (the default), then the dropdown's menu will be wider than its button.
                  )
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor:Colors.white,
                  value: addAddressScreenController.cityType.value,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor:Colors.black,
                  items: <String>[
                    'Surat',
                    'Ahmedabad',
                    'Baroda',
                    'Rajkot',
                    'Gandhinagar',
                    'Bhavanagar',
                    'Junagagh',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style:TextStyle(color:Colors.black),),
                    );
                  }).toList(),
                  hint:Text(
                    "Select Your City",
                    /*style: TextStyle(
                                //color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),*/
                  ),
                  onChanged: (String ? value) {
                    //setState(() {
                    addAddressScreenController.cityType.value = value!;
                    //});
                  },
                ),
              ),
            ),
          ),
    );
  }

  societyDropDown(context){
    return Obx(
          () =>
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 45,  //gives the height of the dropdown button
            width: MediaQuery.of(context).size.width, //gives the width of the dropdown button
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.shade200
              //border: Border.all(color: Colors.grey),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: Colors.grey.shade100, // background color for the dropdown items
                  buttonTheme: ButtonTheme.of(context).copyWith(
                    alignedDropdown: true,  //If false (the default), then the dropdown's menu will be wider than its button.
                  )
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor:Colors.white,
                  value: addAddressScreenController.areaType.value,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor:Colors.black,
                  items: <String>[
                    'Surat',
                    'Ahmedabad',
                    'Baroda',
                    'Rajkot',
                    'Gandhinagar',
                    'Bhavanagar',
                    'Junagagh',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style:TextStyle(color:Colors.black),),
                    );
                  }).toList(),
                  hint:Text(
                    "Select Society/Area",
                    /*style: TextStyle(
                                //color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),*/
                  ),
                  onChanged: (String ? value) {
                    //setState(() {
                    addAddressScreenController.areaType.value = value!;
                    //});
                  },
                ),
              ),
            ),
          ),
    );
  }

  receiverNameTextField(){
    return Container(
      child: TextFormField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Receiver Name',
          fillColor: Colors.grey.shade200,
          filled: true,
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }

  receiverPhoneTextField(){
    return Container(
      child: TextFormField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Receiver Contact Number',
          fillColor: Colors.grey.shade200,
          filled: true,
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }

  pincodeTextField(){
    return Container(
      child: TextFormField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'PinCde',
          fillColor: Colors.grey.shade200,
          filled: true,
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }

  houseTextField(){
    return Container(
      child: TextFormField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'House/Flat Number',
          fillColor: Colors.grey.shade200,
          filled: true,
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }

  stateTextField(){
    return Container(
      child: TextFormField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'State',
          fillColor: Colors.grey.shade200,
          filled: true,
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }

  address1TextField(){
    return Container(
      child: TextFormField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Address Line 1',
          fillColor: Colors.grey.shade200,
          filled: true,
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }

  address2TextField(){
    return Container(
      child: TextFormField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Address Line 2',
          fillColor: Colors.grey.shade200,
          filled: true,
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Get.offAll(() => IndexScreen());
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
