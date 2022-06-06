import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zorro_sign_contacts/core/components/participants/participant_item.dart';
import 'package:zorro_sign_contacts/core/components/participants/participants.shimmer.dart';
import 'package:zorro_sign_contacts/core/components/seperator/seperator.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';

class Participants extends StatelessWidget {
  final List<Contact?>? participants;
  final Function(Contact?)? onTapParticipant;
  final bool? isLoading;
  const Participants(
      {Key? key,
      required this.participants,
      this.onTapParticipant,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return participants != null && participants?.isNotEmpty == true
        ? SizedBox(
            height: 18.w,
            child: isLoading == true
                ? _renderShimmer(context)
                : _renderBody(context),
          )
        : Container();
  }

  Widget _renderBody(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Seperator(
        width: 4.w,
        color: Palette.WHITE,
      ),
      itemCount: participants?.length ?? 0,
      itemBuilder: (context, index) {
        return ParticipantItem(
          data: participants?[index],
          onTapParticipant: (Contact? item) {
            if (onTapParticipant != null) {
              onTapParticipant!(item);
            }
          },
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _renderShimmer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.w),
      child: Shimmer.fromColors(
          baseColor: Palette.WHISPER,
          highlightColor: Palette.LIGHT_GREY,
          enabled: isLoading == true,
          child: ParticipantSimmer(
            height: 0.w,
          )),
    );
  }
}
