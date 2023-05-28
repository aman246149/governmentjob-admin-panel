class PushNotificationModel {
  String? to;
  NotificationBody? notification;
  Data? data;

  PushNotificationModel({this.to, this.notification, this.data});

  PushNotificationModel.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    notification = json['notification'] != null
        ? NotificationBody.fromJson(json['notification'])
        : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to'] = to;
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class NotificationBody {
  String? body;
  String? organizationId;
  bool? contentAvailable;
  String? priority;
  String? subtitle;
  String? title;

  NotificationBody(
      {this.body,
      this.organizationId,
      this.contentAvailable,
      this.priority,
      this.subtitle,
      this.title});

  NotificationBody.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    organizationId = json['OrganizationId'];
    contentAvailable = json['content_available'];
    priority = json['priority'];
    subtitle = json['subtitle'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    data['OrganizationId'] = organizationId;
    data['content_available'] = contentAvailable;
    data['priority'] = priority;
    data['subtitle'] = subtitle;
    data['title'] = title;
    return data;
  }
}

class Data {
  String? priority;
  String? sound;
  bool? contentAvailable;
  String? bodyText;
  String? organization;

  Data(
      {this.priority,
      this.sound,
      this.contentAvailable,
      this.bodyText,
      this.organization});

  Data.fromJson(Map<String, dynamic> json) {
    priority = json['priority'];
    sound = json['sound'];
    contentAvailable = json['content_available'];
    bodyText = json['bodyText'];
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priority'] = priority;
    data['sound'] = sound;
    data['content_available'] = contentAvailable;
    data['bodyText'] = bodyText;
    data['organization'] = organization;
    return data;
  }
}