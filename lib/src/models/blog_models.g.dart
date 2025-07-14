// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogPostAdapter extends TypeAdapter<BlogPost> {
  @override
  final int typeId = 0;

  @override
  BlogPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogPost(
      id: fields[0] as String,
      title: fields[1] as String,
      content: fields[2] as String,
      category: fields[3] as String,
      tags: (fields[4] as List).cast<String>(),
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
      readTimeMinutes: fields[7] as int,
      excerpt: fields[8] as String?,
      codeExamples: (fields[9] as List).cast<CodeExample>(),
      interviewQuestions: (fields[10] as List).cast<InterviewQuestion>(),
      difficulty: fields[11] as DifficultyLevel,
      language: fields[12] as String,
      relatedTopics: (fields[13] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BlogPost obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.tags)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.readTimeMinutes)
      ..writeByte(8)
      ..write(obj.excerpt)
      ..writeByte(9)
      ..write(obj.codeExamples)
      ..writeByte(10)
      ..write(obj.interviewQuestions)
      ..writeByte(11)
      ..write(obj.difficulty)
      ..writeByte(12)
      ..write(obj.language)
      ..writeByte(13)
      ..write(obj.relatedTopics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogPostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CodeExampleAdapter extends TypeAdapter<CodeExample> {
  @override
  final int typeId = 1;

  @override
  CodeExample read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CodeExample(
      title: fields[0] as String,
      code: fields[1] as String,
      language: fields[2] as String,
      explanation: fields[3] as String?,
      highlights: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CodeExample obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.explanation)
      ..writeByte(4)
      ..write(obj.highlights);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CodeExampleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InterviewQuestionAdapter extends TypeAdapter<InterviewQuestion> {
  @override
  final int typeId = 2;

  @override
  InterviewQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InterviewQuestion(
      question: fields[0] as String,
      answer: fields[1] as String,
      type: fields[2] as QuestionType,
      followUpQuestions: (fields[3] as List).cast<String>(),
      difficulty: fields[4] as DifficultyLevel,
    );
  }

  @override
  void write(BinaryWriter writer, InterviewQuestion obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.answer)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.followUpQuestions)
      ..writeByte(4)
      ..write(obj.difficulty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InterviewQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 3;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      icon: fields[3] as String,
      color: fields[4] as String,
      subCategories: (fields[5] as List).cast<String>(),
      language: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.subCategories)
      ..writeByte(6)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserProgressAdapter extends TypeAdapter<UserProgress> {
  @override
  final int typeId = 4;

  @override
  UserProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProgress(
      postId: fields[0] as String,
      isCompleted: fields[1] as bool,
      isBookmarked: fields[2] as bool,
      lastReadAt: fields[3] as DateTime,
      progressPercentage: fields[4] as double,
      timeSpentMinutes: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserProgress obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.postId)
      ..writeByte(1)
      ..write(obj.isCompleted)
      ..writeByte(2)
      ..write(obj.isBookmarked)
      ..writeByte(3)
      ..write(obj.lastReadAt)
      ..writeByte(4)
      ..write(obj.progressPercentage)
      ..writeByte(5)
      ..write(obj.timeSpentMinutes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DifficultyLevelAdapter extends TypeAdapter<DifficultyLevel> {
  @override
  final int typeId = 5;

  @override
  DifficultyLevel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DifficultyLevel.beginner;
      case 1:
        return DifficultyLevel.intermediate;
      case 2:
        return DifficultyLevel.advanced;
      case 3:
        return DifficultyLevel.expert;
      default:
        return DifficultyLevel.beginner;
    }
  }

  @override
  void write(BinaryWriter writer, DifficultyLevel obj) {
    switch (obj) {
      case DifficultyLevel.beginner:
        writer.writeByte(0);
        break;
      case DifficultyLevel.intermediate:
        writer.writeByte(1);
        break;
      case DifficultyLevel.advanced:
        writer.writeByte(2);
        break;
      case DifficultyLevel.expert:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DifficultyLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuestionTypeAdapter extends TypeAdapter<QuestionType> {
  @override
  final int typeId = 6;

  @override
  QuestionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return QuestionType.theoretical;
      case 1:
        return QuestionType.practical;
      case 2:
        return QuestionType.coding;
      case 3:
        return QuestionType.systemDesign;
      case 4:
        return QuestionType.behavioral;
      default:
        return QuestionType.theoretical;
    }
  }

  @override
  void write(BinaryWriter writer, QuestionType obj) {
    switch (obj) {
      case QuestionType.theoretical:
        writer.writeByte(0);
        break;
      case QuestionType.practical:
        writer.writeByte(1);
        break;
      case QuestionType.coding:
        writer.writeByte(2);
        break;
      case QuestionType.systemDesign:
        writer.writeByte(3);
        break;
      case QuestionType.behavioral:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
