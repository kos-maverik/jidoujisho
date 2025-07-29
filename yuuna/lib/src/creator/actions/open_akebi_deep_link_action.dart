import 'package:flutter/material.dart';
import 'package:yuuna/src/creator/actions/configurable/open_deep_link_action.dart';

/// This action opens the Akebi app with the selected term.
class OpenAkebiDeepLinkAction extends ConfigurableOpenDeepLinkAction {
  /// Initialise this enhancement with the hardset parameters.
  OpenAkebiDeepLinkAction()
      : super(
          actionUniqueKey: key,
          actionLabel: 'Search on Akebi',
          actionIcon: Icons.translate,
          deepLinkBaseUrl: 'akebi://word?kanji=',
          description: 'Searches the term on Akebi app.',
        );

  static const key = 'open_akebi_deep_link';
}
