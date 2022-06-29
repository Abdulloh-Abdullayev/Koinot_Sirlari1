import 'package:flutter/material.dart';
import 'package:get/get.dart';

IconButton buildIconButton() {
  return IconButton(onPressed: (){
    Get.defaultDialog(
      cancel: Align(
        alignment: Alignment(0,-1.6),
        child: CircleAvatar(
            backgroundColor: Color(0xFF253341),
            child: IconButton(
              icon:  Icon(Icons.keyboard_backspace,color: Colors.white,size: 30,),
              onPressed: (){
                Get.back();
              },
            )
        ),
      ),
      backgroundColor: Color(0xFF253341),
      title: "Ilova Haqida",
      titleStyle: TextStyle(fontSize: 25),
      content: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Text("Bismillahir Rohmanir Rohiym\nIlovadan foydalanganingiz uchun tashakkur. Ilovaga birinchi marta kirganingizda malumotlarni internetdan olib kelib, suratlarni telefoningiz cash xotirasiga saqlab qo'yadi va kelasi safar ularni internetdan yuklashga xojat qolmaydi. Bu malumotlar www.islom.uz va www.esahubble.org saytidan olindi. Bu ilmlar ila Allohning qudratini his eting, ilm o'rganing va rohatlaning.",style: TextStyle(fontSize: 18),),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Dasturchi Abdulloh.."),
            )
          ],
        ),
      ),
    );
  }, icon: Icon(Icons.info_outline,color: Colors.white,size: 30,));
}