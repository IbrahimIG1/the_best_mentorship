class LocalNotificationService {
  void send(String message) {
    print('Sending local notification: $message');
  }
}

class AppNotifier {
  final LocalNotificationService service = LocalNotificationService();

  void notifyUser(String message) {
    service.send(message);
  }
}
