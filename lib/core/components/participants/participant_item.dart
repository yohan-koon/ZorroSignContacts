import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/core/base64/base64_data.dart';
import 'package:zorro_sign_contacts/core/components/avatar/avatar.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:zorro_sign_contacts/helpers/base64_utils/base64_utils.dart';

class ParticipantItem extends StatelessWidget {
  final Contact? data;
  final Function(Contact?)? onTapParticipant;
  const ParticipantItem({Key? key, required this.data, this.onTapParticipant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Avatar(
          size: (76 / 5).w,
          source: Base64Utils.convertBase64Image(
              data?.imageStr ?? Base64Data.DEFAULT_PROFILE),
          isVisibleClose: true,
          onTap: () {
            if (onTapParticipant != null) {
              onTapParticipant!(data);
            }
          },
        )
      ],
    ));
  }
}
