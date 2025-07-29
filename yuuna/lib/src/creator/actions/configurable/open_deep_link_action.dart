import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yuuna/creator.dart';
import 'package:yuuna/dictionary.dart';
import 'package:yuuna/models.dart';

/// A configurable QuickAction to open a deep link for a given term.
class ConfigurableOpenDeepLinkAction extends QuickAction {

  /// Initialise this action with its specific properties.
  ConfigurableOpenDeepLinkAction({
    required this.actionUniqueKey,
    required this.actionLabel,
    required this.actionIcon,
    required this.deepLinkBaseUrl,
    String? description, // Optional description
    super.showInSingleDictionary = true,
  }) : super(
    uniqueKey: actionUniqueKey,
    label: actionLabel,
    description: description ?? 'Opens a custom URL with the selected term.',
    icon: actionIcon,
  );

  final String actionUniqueKey;
  final String actionLabel;
  final IconData actionIcon;
  final String deepLinkBaseUrl;

  @override
  Future<void> executeAction({
    required BuildContext context,
    required WidgetRef ref,
    required AppModel appModel,
    required CreatorModel creatorModel,
    required DictionaryHeading heading,
    required String? dictionaryName,
  }) async {
    final String term = heading.term;
    final String encodedTerm = Uri.encodeComponent(term);
    final Uri deepLinkUri = Uri.parse('$deepLinkBaseUrl$encodedTerm');

    if (!context.mounted) return;

    try {
      if (await canLaunchUrl(deepLinkUri)) {
        await launchUrl(
          deepLinkUri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        debugPrint('Could not launch $deepLinkUri - canLaunchUrl returned false');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not open: $deepLinkUri. Check target app or URL.'),
              duration: const Duration(seconds: 5),
            ),
          );
        }
      }
    } catch (e, stackTrace) {
      debugPrint('Error launching URL $deepLinkUri: $e');
      debugPrint('Stack trace: $stackTrace');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening link: $e')),
        );
      }
    }
  }

  @override
  Future<Color?> getIconColor({
    required AppModel appModel,
    required DictionaryHeading heading,
  }) async {
    return null; // Default color
  }
}
