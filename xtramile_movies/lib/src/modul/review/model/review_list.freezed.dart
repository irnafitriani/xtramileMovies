// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewList _$ReviewListFromJson(Map<String, dynamic> json) {
  return _ReviewList.fromJson(json);
}

/// @nodoc
mixin _$ReviewList {
  bool? get showLoading => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  List<Review> get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int? get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewListCopyWith<ReviewList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewListCopyWith<$Res> {
  factory $ReviewListCopyWith(
          ReviewList value, $Res Function(ReviewList) then) =
      _$ReviewListCopyWithImpl<$Res, ReviewList>;
  @useResult
  $Res call(
      {bool? showLoading,
      int? id,
      int? page,
      List<Review> results,
      @JsonKey(name: 'total_pages') int? totalPages,
      @JsonKey(name: 'total_results') int? totalResults});
}

/// @nodoc
class _$ReviewListCopyWithImpl<$Res, $Val extends ReviewList>
    implements $ReviewListCopyWith<$Res> {
  _$ReviewListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLoading = freezed,
    Object? id = freezed,
    Object? page = freezed,
    Object? results = null,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      showLoading: freezed == showLoading
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewListImplCopyWith<$Res>
    implements $ReviewListCopyWith<$Res> {
  factory _$$ReviewListImplCopyWith(
          _$ReviewListImpl value, $Res Function(_$ReviewListImpl) then) =
      __$$ReviewListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? showLoading,
      int? id,
      int? page,
      List<Review> results,
      @JsonKey(name: 'total_pages') int? totalPages,
      @JsonKey(name: 'total_results') int? totalResults});
}

/// @nodoc
class __$$ReviewListImplCopyWithImpl<$Res>
    extends _$ReviewListCopyWithImpl<$Res, _$ReviewListImpl>
    implements _$$ReviewListImplCopyWith<$Res> {
  __$$ReviewListImplCopyWithImpl(
      _$ReviewListImpl _value, $Res Function(_$ReviewListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLoading = freezed,
    Object? id = freezed,
    Object? page = freezed,
    Object? results = null,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$ReviewListImpl(
      showLoading: freezed == showLoading
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewListImpl implements _ReviewList {
  const _$ReviewListImpl(
      {this.showLoading,
      required this.id,
      required this.page,
      required final List<Review> results,
      @JsonKey(name: 'total_pages') required this.totalPages,
      @JsonKey(name: 'total_results') required this.totalResults})
      : _results = results;

  factory _$ReviewListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewListImplFromJson(json);

  @override
  final bool? showLoading;
  @override
  final int? id;
  @override
  final int? page;
  final List<Review> _results;
  @override
  List<Review> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @override
  @JsonKey(name: 'total_results')
  final int? totalResults;

  @override
  String toString() {
    return 'ReviewList(showLoading: $showLoading, id: $id, page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewListImpl &&
            (identical(other.showLoading, showLoading) ||
                other.showLoading == showLoading) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, showLoading, id, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewListImplCopyWith<_$ReviewListImpl> get copyWith =>
      __$$ReviewListImplCopyWithImpl<_$ReviewListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewListImplToJson(
      this,
    );
  }
}

abstract class _ReviewList implements ReviewList {
  const factory _ReviewList(
          {final bool? showLoading,
          required final int? id,
          required final int? page,
          required final List<Review> results,
          @JsonKey(name: 'total_pages') required final int? totalPages,
          @JsonKey(name: 'total_results') required final int? totalResults}) =
      _$ReviewListImpl;

  factory _ReviewList.fromJson(Map<String, dynamic> json) =
      _$ReviewListImpl.fromJson;

  @override
  bool? get showLoading;
  @override
  int? get id;
  @override
  int? get page;
  @override
  List<Review> get results;
  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  @JsonKey(name: 'total_results')
  int? get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$ReviewListImplCopyWith<_$ReviewListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_details')
  AuthorDetails get authorDetails => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {String? author,
      @JsonKey(name: 'author_details') AuthorDetails authorDetails,
      String? content,
      @JsonKey(name: 'created_at') String createdAt,
      String? id,
      @JsonKey(name: 'updated_at') String updatedAt,
      String? url});

  $AuthorDetailsCopyWith<$Res> get authorDetails;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? authorDetails = null,
    Object? content = freezed,
    Object? createdAt = null,
    Object? id = freezed,
    Object? updatedAt = null,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorDetails: null == authorDetails
          ? _value.authorDetails
          : authorDetails // ignore: cast_nullable_to_non_nullable
              as AuthorDetails,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorDetailsCopyWith<$Res> get authorDetails {
    return $AuthorDetailsCopyWith<$Res>(_value.authorDetails, (value) {
      return _then(_value.copyWith(authorDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? author,
      @JsonKey(name: 'author_details') AuthorDetails authorDetails,
      String? content,
      @JsonKey(name: 'created_at') String createdAt,
      String? id,
      @JsonKey(name: 'updated_at') String updatedAt,
      String? url});

  @override
  $AuthorDetailsCopyWith<$Res> get authorDetails;
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? authorDetails = null,
    Object? content = freezed,
    Object? createdAt = null,
    Object? id = freezed,
    Object? updatedAt = null,
    Object? url = freezed,
  }) {
    return _then(_$ReviewImpl(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorDetails: null == authorDetails
          ? _value.authorDetails
          : authorDetails // ignore: cast_nullable_to_non_nullable
              as AuthorDetails,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl(
      {required this.author,
      @JsonKey(name: 'author_details') required this.authorDetails,
      required this.content,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.id,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.url});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final String? author;
  @override
  @JsonKey(name: 'author_details')
  final AuthorDetails authorDetails;
  @override
  final String? content;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final String? id;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final String? url;

  @override
  String toString() {
    return 'Review(author: $author, authorDetails: $authorDetails, content: $content, createdAt: $createdAt, id: $id, updatedAt: $updatedAt, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorDetails, authorDetails) ||
                other.authorDetails == authorDetails) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, author, authorDetails, content,
      createdAt, id, updatedAt, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {required final String? author,
      @JsonKey(name: 'author_details')
      required final AuthorDetails authorDetails,
      required final String? content,
      @JsonKey(name: 'created_at') required final String createdAt,
      required final String? id,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      required final String? url}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  String? get author;
  @override
  @JsonKey(name: 'author_details')
  AuthorDetails get authorDetails;
  @override
  String? get content;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  String? get id;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthorDetails _$AuthorDetailsFromJson(Map<String, dynamic> json) {
  return _AuthorDetails.fromJson(json);
}

/// @nodoc
mixin _$AuthorDetails {
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_path')
  String? get avatarPath => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorDetailsCopyWith<AuthorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorDetailsCopyWith<$Res> {
  factory $AuthorDetailsCopyWith(
          AuthorDetails value, $Res Function(AuthorDetails) then) =
      _$AuthorDetailsCopyWithImpl<$Res, AuthorDetails>;
  @useResult
  $Res call(
      {String? name,
      String? username,
      @JsonKey(name: 'avatar_path') String? avatarPath,
      int? rating});
}

/// @nodoc
class _$AuthorDetailsCopyWithImpl<$Res, $Val extends AuthorDetails>
    implements $AuthorDetailsCopyWith<$Res> {
  _$AuthorDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? username = freezed,
    Object? avatarPath = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorDetailsImplCopyWith<$Res>
    implements $AuthorDetailsCopyWith<$Res> {
  factory _$$AuthorDetailsImplCopyWith(
          _$AuthorDetailsImpl value, $Res Function(_$AuthorDetailsImpl) then) =
      __$$AuthorDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? username,
      @JsonKey(name: 'avatar_path') String? avatarPath,
      int? rating});
}

/// @nodoc
class __$$AuthorDetailsImplCopyWithImpl<$Res>
    extends _$AuthorDetailsCopyWithImpl<$Res, _$AuthorDetailsImpl>
    implements _$$AuthorDetailsImplCopyWith<$Res> {
  __$$AuthorDetailsImplCopyWithImpl(
      _$AuthorDetailsImpl _value, $Res Function(_$AuthorDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? username = freezed,
    Object? avatarPath = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$AuthorDetailsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorDetailsImpl implements _AuthorDetails {
  const _$AuthorDetailsImpl(
      {required this.name,
      required this.username,
      @JsonKey(name: 'avatar_path') required this.avatarPath,
      required this.rating});

  factory _$AuthorDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorDetailsImplFromJson(json);

  @override
  final String? name;
  @override
  final String? username;
  @override
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;
  @override
  final int? rating;

  @override
  String toString() {
    return 'AuthorDetails(name: $name, username: $username, avatarPath: $avatarPath, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarPath, avatarPath) ||
                other.avatarPath == avatarPath) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, username, avatarPath, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorDetailsImplCopyWith<_$AuthorDetailsImpl> get copyWith =>
      __$$AuthorDetailsImplCopyWithImpl<_$AuthorDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorDetailsImplToJson(
      this,
    );
  }
}

abstract class _AuthorDetails implements AuthorDetails {
  const factory _AuthorDetails(
      {required final String? name,
      required final String? username,
      @JsonKey(name: 'avatar_path') required final String? avatarPath,
      required final int? rating}) = _$AuthorDetailsImpl;

  factory _AuthorDetails.fromJson(Map<String, dynamic> json) =
      _$AuthorDetailsImpl.fromJson;

  @override
  String? get name;
  @override
  String? get username;
  @override
  @JsonKey(name: 'avatar_path')
  String? get avatarPath;
  @override
  int? get rating;
  @override
  @JsonKey(ignore: true)
  _$$AuthorDetailsImplCopyWith<_$AuthorDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
