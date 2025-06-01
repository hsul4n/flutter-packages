import 'dart:io';

import 'package:clip/l10n/clip_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:clip/clip.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ClipListView extends FormField<List<XFile>> {
  static final _imagePicker = ImagePicker();

  final Widget Function(BuildContext)? header;

  final ItemWidgetBuilder<XFile> itemBuilder;

  final IndexedWidgetBuilder? separatorBuilder;

  final ReorderCallback? onReorder;

  /// Corresponds to [SliverChildBuilderDelegate.addAutomaticKeepAlives].
  final bool addAutomaticKeepAlives;

  /// Corresponds to [SliverChildBuilderDelegate.addRepaintBoundaries].
  final bool addRepaintBoundaries;

  /// Corresponds to [SliverChildBuilderDelegate.addSemanticIndexes].
  final bool addSemanticIndexes;

  ClipListView({
    List<dynamic> initialValues = const [],
    void Function(int index, List<XFile?>? value)? onChanged,
    void Function(int index)? onTap,
    FormFieldSetter<List<XFile>>? onSaved,
    BoxConstraints constraints = const BoxConstraints(),
    int quality = 50,
    int? maxHeight,
    int? maxWidth,
    FormFieldValidator<List<XFile>>? validator,
    List<ImageSource> sources = const [ImageSource.camera, ImageSource.gallery],
    List<ClipOption> options = const [ClipOption.zoom, ClipOption.delete],
    bool? enabled,
    InputDecoration? decoration = const InputDecoration(),
    AutovalidateMode? autovalidateMode,
    required this.itemBuilder,
    this.separatorBuilder,
    this.header,
    this.onReorder,
    // Corresponds to [ScrollView.controller].
    ScrollController? scrollController,
    // Corresponds to [ScrollView.scrollDirection].
    Axis scrollDirection = Axis.horizontal,
    // Corresponds to [ScrollView.reverse].
    bool reverse = false,
    // Corresponds to [ScrollView.primary].
    bool? primary,
    // Corresponds to [ScrollView.physics].
    ScrollPhysics? physics,
    // Corresponds to [ScrollView.shrinkWrap].
    bool shrinkWrap = false,
    // Corresponds to [ScrollView.shrinkWrap].
    bool reorderable = true,
    // Corresponds to [BoxScrollView.padding].
    EdgeInsets? padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    // Corresponds to [ScrollView.cacheExtent].
    double? cacheExtent,
    // Corresponds to [ScrollView.dragStartBehavior].
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    // Corresponds to [ScrollView.keyboardDismissBehavior].
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    // Corresponds to [ScrollView.restorationId].
    String? restorationId,
    // Corresponds to [ScrollView.clipBehavior].
    Clip clipBehavior = Clip.hardEdge,
    super.key,
  })  : assert(sources.isNotEmpty),
        assert(options.isNotEmpty),
        super(
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          validator: validator,
          enabled: enabled ?? decoration?.enabled ?? true,
          builder: (FormFieldState<List<XFile>> field) {
            if (field.value == null) {
              () async {
                final items = initialValues.whereType<XFile>().toList();

                await Future.forEach(initialValues, (value) async {
                  if (value is String)
                    items.add(
                      await DefaultCacheManager()
                          .getSingleFile(value)
                          .then((file) => XFile(file.path)),
                    );
                  else if (value is Uint8List)
                    items.add(XFile(File.fromRawPath(value).path));
                  else if (value is File) items.add(XFile(value.path));
                });

                return items;
              }.call().then(field.didChange);
            }

            final InputDecoration effectiveDecoration = (decoration ??
                    const InputDecoration())
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);

            final value = field.value ?? <XFile>[];

            return IgnorePointer(
              ignoring: !field.widget.enabled,
              child: InputDecorator(
                decoration: effectiveDecoration.copyWith(
                  errorText: field.hasError ? field.errorText : null,
                  border: InputBorder.none,
                  errorMaxLines: 2,
                ),
                child: ReorderableListView.builder(
                  buildDefaultDragHandles: reorderable,
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex == value.length) return;

                    if (newIndex > oldIndex) newIndex--;

                    final item = value.removeAt(oldIndex);

                    field.didChange(value..insert(newIndex, item));

                    onReorder?.call(oldIndex, newIndex);
                  },
                  header: header != null
                      ? GestureDetector(
                          child: header(field.context),
                          onTap: () {
                            showModalBottomSheet(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              context: field.context,
                              builder: (BuildContext context) {
                                return SafeArea(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: sources
                                        .map(
                                          (source) => ListTile(
                                            leading: Icon(
                                              source == ImageSource.camera
                                                  ? Icons.photo_camera_outlined
                                                  : Icons
                                                      .photo_library_outlined,
                                            ),
                                            title: Text(
                                              source == ImageSource.camera
                                                  ? ClipLocalizations.of(
                                                          context)!
                                                      .camera
                                                  : ClipLocalizations.of(
                                                          context)!
                                                      .gallery,
                                            ),
                                            onTap: () async {
                                              Navigator.of(field.context).pop();

                                              // field.onPause.call();

                                              (source == ImageSource.camera
                                                      ? _imagePicker.pickImage(
                                                          source: source,
                                                          imageQuality: quality,
                                                          maxHeight: maxHeight
                                                              ?.toDouble(),
                                                          maxWidth: maxWidth
                                                              ?.toDouble(),
                                                        )
                                                      : _imagePicker
                                                          .pickMultiImage(
                                                          imageQuality: quality,
                                                          maxHeight: maxHeight
                                                              ?.toDouble(),
                                                          maxWidth: maxWidth
                                                              ?.toDouble(),
                                                        ))
                                                  .then<List<XFile>?>((value) =>
                                                      value is List<XFile>
                                                          ? value
                                                          : [value as XFile])
                                                  .then((pickedFiles) async {
                                                field.didChange(<XFile>[
                                                  ...pickedFiles!,
                                                  ...value,
                                                ]);

                                                onChanged?.call(
                                                  value.length,
                                                  pickedFiles,
                                                );

                                                return pickedFiles;
                                              });
                                              //
                                              // .whenComplete(field.onResume);
                                            },
                                          ),
                                        )
                                        .toList(),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : null,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      key: ValueKey('clip.item.$index'),
                      child: itemBuilder(context, value[index], index),
                      onTap: () {
                        if (onTap != null) return onTap(index);

                        showModalBottomSheet(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          context: field.context,
                          builder: (BuildContext context) {
                            return SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (options.contains(ClipOption.zoom))
                                    ListTile(
                                      leading:
                                          Icon(Icons.zoom_out_map_outlined),
                                      title: Text(
                                          ClipLocalizations.of(context)!.zoom),
                                      onTap: () async {
                                        final items = <Uint8List>[];

                                        await Future.forEach<XFile>(value,
                                            (value) async {
                                          items.add(await value.readAsBytes());
                                        });

                                        Navigator.of(context)
                                          ..pop()
                                          ..push(
                                            MaterialPageRoute(
                                                builder: (_) => GalleryPage(
                                                      attachments: value
                                                          .map((xfile) =>
                                                              File(xfile.path))
                                                          .toList(),
                                                      initialIndex: index,
                                                    )),
                                          );
                                      },
                                    ),
                                  if (options.contains(ClipOption.delete))
                                    ListTile(
                                      leading: Icon(
                                        Icons.delete_outlined,
                                        color: Colors.red[600],
                                      ),
                                      title: Text(
                                        ClipLocalizations.of(context)!.remove,
                                        style:
                                            TextStyle(color: Colors.red[600]),
                                      ),
                                      onTap: () {
                                        field.didChange(
                                          value..removeAt(index),
                                        );

                                        onChanged?.call(index, null);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  itemCount: value.length,
                  scrollDirection: scrollDirection,
                  reverse: reverse,
                  scrollController: scrollController,
                  primary: primary,
                  physics: physics,
                  shrinkWrap: shrinkWrap,
                  padding: padding,
                  cacheExtent: cacheExtent,
                  dragStartBehavior: dragStartBehavior,
                  keyboardDismissBehavior: keyboardDismissBehavior,
                  restorationId: restorationId,
                  clipBehavior: clipBehavior,
                  // separatorBuilder: separatorBuilder ??
                  //     (context, index) => const SizedBox(width: 8.0),
                ),
              ),
            );
          },
        );
}
