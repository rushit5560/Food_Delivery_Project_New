import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:share/share.dart';

class CodeModule extends StatelessWidget {
  const CodeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'JHAS4SH',
              textScaleFactor: 1.5,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: ()=> copyTextOnClick(),
              child: Text(
                'COPY',
                textScaleFactor: 0.9,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void copyTextOnClick() => Clipboard.setData(ClipboardData(text: 'JHAS4SH'));

}

class InviteFriendButton extends StatelessWidget {
  const InviteFriendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Share.share('check out my website https://example.com', subject: 'Look what I made!');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            'Invite Friends',
            textScaleFactor: 1.1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
