import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:test_prep_2/core/extensions/double_extension.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';

DialogRoute? dialogRoute;
SnackbarController? snackbarController;

class DialogService {
  /// Generic show dialog handler
  void _showDialog({
    required Widget child,
    bool barrierDismissible = true,
    Color backgroundColor = Colors.white,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: AnimatedScale(
            scale: 1,
            duration: const Duration(milliseconds: 150),
            child: child,
          ),
        );
      },
    );
  }

  /// --- Message dialog with icon + message + OK button ---
  void showMessageDialog(
    String message, {
    String buttonText = "OK",
    bool barrierDismissible = true,
    VoidCallback? onOk,
    IconData icon = TablerIcons.info_circle,
    Color? iconColor,
  }) {
    _showDialog(
      barrierDismissible: barrierDismissible,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// --- Icon Section ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (iconColor ?? AppColor.mainColor).withAlpha(0.1.toAlpha),
              ),
              child: Icon(
                icon,
                size: 48,
                color: iconColor ?? AppColor.mainColor,
              ),
            ),
            const SizedBox(height: 20),

            /// --- Message Text ---
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            /// --- OK Button ---
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.mainColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
              ),
              onPressed: () {
                Get.back();
                onOk?.call();
              },
              child: Text(
                buttonText,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// --- Confirm dialog with icon + message + confirm/cancel ---
  void showConfirmDialog({
    required String text,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    bool barrierDismissible = true,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    IconData icon = TablerIcons.alert_triangle,
    Color? iconColor,
  }) {
    _showDialog(
      barrierDismissible: barrierDismissible,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// --- Icon Section ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (iconColor ?? Colors.orange).withOpacity(0.1),
              ),
              child: Icon(icon, size: 48, color: iconColor ?? Colors.orange),
            ),
            const SizedBox(height: 20),

            /// --- Message Text ---
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            /// --- Buttons ---
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                      onCancel?.call();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(cancelText),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      onConfirm?.call();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.mainColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      confirmText,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// --- Loading dialog ---
  void showLoadingDialog({String loadingText = "Loading...\nPlease Wait!"}) {
    _showDialog(
      barrierDismissible: false,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: AppColor.mainColor),
            const SizedBox(height: 20),
            Text(
              loadingText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  /// --- Snackbar ---
  void showSnack({
    required String title,
    required String message,
    Color bgColor = Colors.black,
    int durationInMs = 2000,
  }) {
    snackbarController = Get.snackbar(
      title,
      message,
      backgroundColor: bgColor.withOpacity(0.65),
      colorText: AppColor.white,
      duration: Duration(milliseconds: durationInMs),
      snackPosition: SnackPosition.TOP,
    );
  }

  void dismissSnackBar() {
    snackbarController?.close(withAnimations: false);
  }
}
