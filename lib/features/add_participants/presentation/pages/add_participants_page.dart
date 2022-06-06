import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/core/components/base_app_bar/base_app_bar.dart';
import 'package:zorro_sign_contacts/core/components/contact_item/contact_item.dart';
import 'package:zorro_sign_contacts/core/components/participants/participants.dart';
import 'package:zorro_sign_contacts/core/components/search_bar/search_debouncer.dart';
import 'package:zorro_sign_contacts/core/components/seperator/seperator.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:zorro_sign_contacts/features/add_participants/presentation/mobx/add_participants_store.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';
import 'package:zorro_sign_contacts/injection_container.dart';

class AddParticipantsPage extends StatefulWidget {
  final List<Contact>? participants;
  const AddParticipantsPage({Key? key, this.participants}) : super(key: key);

  @override
  State<AddParticipantsPage> createState() => _AddParticipantsPageState();
}

class _AddParticipantsPageState extends State<AddParticipantsPage>
    with SingleTickerProviderStateMixin {
  final AddParticipantsStore _store = di();
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    _store.init(context, widget.participants);
    initReactions(context);
    super.initState();
  }

  @override
  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
    _store.destroy(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: context.i18n.addParticipantsTitle,
        elevation: 1,
      ),
      body: Column(children: [
        _renderParticipantsList(context),
        Expanded(
            child: Stack(
          children: [_renderContactList(context)],
        ))
      ]),
      floatingActionButton: _renderNextButton(context),
    );
  }

  Widget _renderParticipantsList(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.w),
        child: Participants(
          participants: _store.participants?.map((element) => element).toList(),
          onTapParticipant: (Contact? item ) => _store.removeParticipant(context, item),
        ),
      );
    });
  }

  Widget _renderContactList(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        color: Palette.LIGHT_GREY,
        padding: EdgeInsets.all(4.w),
        child: _store.isLoadingContacts == true
            ? _renderShimmerList(context)
            : _renderList(context),
      );
    });
  }

  Widget _renderList(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.separated(
        separatorBuilder: (context, index) => Seperator(
          height: 4.w,
        ),
        itemCount: _store.contacts?.length ?? 0,
        itemBuilder: (context, index) {
          print('index : ${index}');
          return ContactItem(
              data: _store.contacts?[index],
              onTapItem: (data) =>
                  _store.onTapContactItem(_store.contacts?[index]),
              isCheckBoxSelected:
                  _store.isCheckBoxSelected(context, _store.contacts?[index]));
        },
      );
    });
  }

  Widget _renderShimmerList(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Seperator(
        height: 4.w,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ContactItem(
          isLoading: _store.isLoadingContacts,
          data: null,
        );
      },
    );
  }

  Widget _renderNextButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _store.navigateToNext(context),
      child: const Icon(Icons.arrow_forward),
    );
  }

  /// *************************************************************************
  /// REACTIONS - START
  ///**************************************************************************/

  void initReactions(BuildContext context) {}

  /// *************************************************************************
  /// REACTIONS - END
  ///**************************************************************************/
}
