class Home {
  final Greeting greeting;
  final List<Story> stories;
  final Appointment appointment;
  final List<Category> categories;

  Home({
    required this.greeting,
    required this.stories,
    required this.appointment,
    required this.categories,
  });

  Map<String, dynamic> toJson() {
    return {
      'greeting': greeting.toJson(),
      'stories': stories.map((story) => story.toJson()).toList(),
      'appointment': appointment.toJson(),
      'categories': categories.map((category) => category.toJson()).toList(),
    };
  }

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      greeting: Greeting.fromJson(json['greeting']),
      stories: (json['stories'] as List).map((item) => Story.fromJson(item)).toList(),
      appointment: Appointment.fromJson(json['appointment']),
      categories: (json['categories'] as List).map((item) => Category.fromJson(item)).toList(),
    );
  }
}

class Greeting {
  final String message;
  final Avatar avatar;

  Greeting({
    required this.message,
    required this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'avatar': avatar.toJson(),
    };
  }

  factory Greeting.fromJson(Map<String, dynamic> json) {
    return Greeting(
      message: json['message'],
      avatar: Avatar.fromJson(json['avatar']),
    );
  }
}

class Avatar {
  final String imageUrl;
  final String profileName;

  Avatar({
    required this.imageUrl,
    required this.profileName,
  });

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'profile_name': profileName,
    };
  }

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      imageUrl: json['image_url'],
      profileName: json['profile_name'],
    );
  }
}

class Story {
  final String name;
  final String imageUrl;
  final bool isUserStory;

  Story({
    required this.name,
    required this.imageUrl,
    this.isUserStory = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image_url': imageUrl,
      'is_user_story': isUserStory,
    };
  }

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      name: json['name'],
      imageUrl: json['image_url'],
      isUserStory: json['is_user_story'] ?? false,
    );
  }
}

class Appointment {
  final Doctor doctor;
  final String date;
  final String time;
  final String detailsUrl;

  Appointment({
    required this.doctor,
    required this.date,
    required this.time,
    required this.detailsUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'doctor': doctor.toJson(),
      'date': date,
      'time': time,
      'details_url': detailsUrl,
    };
  }

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      doctor: Doctor.fromJson(json['doctor']),
      date: json['date'],
      time: json['time'],
      detailsUrl: json['details_url'],
    );
  }
}

class Doctor {
  final String name;
  final String designation;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.designation,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'designation': designation,
      'image_url': imageUrl,
    };
  }

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      designation: json['designation'],
      imageUrl: json['image_url'],
    );
  }
}

class Category {
  final String name;
  final String color;

  Category({
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'color': color,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      color: json['color'],
    );
  }
}
