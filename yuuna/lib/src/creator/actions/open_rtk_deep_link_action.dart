import 'package:flutter/material.dart';
import 'package:yuuna/src/creator/actions/configurable/open_deep_link_action.dart';

/// This action opens the RTK app with the selected term.
class OpenRtkDeepLinkAction extends ConfigurableOpenDeepLinkAction {
  /// Initialise this enhancement with the hardset parameters.
  OpenRtkDeepLinkAction()
      : super(
          actionUniqueKey: key,
          actionLabel: 'Search on RTK',
          actionIcon: Icons.troubleshoot,
          deepLinkBaseUrl: 'rtk://search?q=',
          description: 'Searches the term on RTK app.',
        );

  static const key = 'open_rtk_deep_link';
}
