import 'dart:io';
import 'dart:ui' as ui;

import 'package:clip/l10n/clip_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clip/clip.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

enum ClipOption {
  zoom,
  delete,
}

class ImageClipField extends FormField<XFile> {
  static final _imagePicker = ImagePicker();

  ImageClipField({
    super.key,
    required Widget Function(BuildContext, XFile?) builder,
    dynamic initialValue,
    ValueChanged<XFile?>? onChanged,
    FormFieldSetter<XFile>? onSaved,
    int quality = 100,
    int? maxHeight,
    int? maxWidth,
    FormFieldValidator<XFile>? validator,
    List<ImageSource> sources = const [ImageSource.camera, ImageSource.gallery],
    List<ClipOption> options = const [ClipOption.zoom, ClipOption.delete],
    bool? enabled,
    InputDecoration? decoration = const InputDecoration(),
    AutovalidateMode? autovalidateMode,
  })  : assert(sources.isNotEmpty),
        assert(options.isNotEmpty),
        super(
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          validator: validator,
          enabled: enabled ?? decoration?.enabled ?? true,
          builder: (FormFieldState<XFile> field) {
            if (!field.hasInteractedByUser) {
              () async {
                if (initialValue != null) {
                  if (initialValue is String) {
                    return DefaultCacheManager()
                        .getSingleFile(initialValue)
                        .then((value) => XFile(value.path));
                  } else if (initialValue is Uint8List)
                    return Future.value(
                        XFile(File.fromRawPath(initialValue).path));
                  else
                    throw UnsupportedError('cant get base64');
                }

                return null;
              }.call().then(field.didChange);
            }

            final InputDecoration effectiveDecoration = (decoration ??
                    const InputDecoration())
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);

            return IntrinsicWidth(
              child: InputDecorator(
                decoration: effectiveDecoration.copyWith(
                  errorText: field.hasError ? field.errorText : null,
                  isCollapsed: true,
                  border: InputBorder.none,
                ),
                child: GestureDetector(
                  child: builder(field.context, field.value),
                  onTap: () {
                    showModalBottomSheet(
                      clipBehavior: ui.Clip.antiAliasWithSaveLayer,
                      context: field.context,
                      builder: (BuildContext context) {
                        return SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...sources
                                  .map(
                                    (source) => ListTile(
                                      leading: Icon(
                                        source == ImageSource.camera
                                            ? Icons.photo_camera_outlined
                                            : Icons.photo_library_outlined,
                                      ),
                                      title: Text(
                                        source == ImageSource.camera
                                            ? ClipLocalizations.of(context)!
                                                .camera
                                            : ClipLocalizations.of(context)!
                                                .gallery,
                                      ),
                                      onTap: () async {
                                        Navigator.of(field.context).pop();

                                        // field.onPause.call();

                                        _imagePicker
                                            .pickImage(
                                              source: source,
                                              imageQuality: quality,
                                              maxHeight: maxHeight?.toDouble(),
                                              maxWidth: maxWidth?.toDouble(),
                                            )
                                            .then((file) => file != null
                                                ? XFile(file.path)
                                                : null)
                                            .then((xFile) {
                                          if (xFile != null) {
                                            field.didChange(xFile);
                                            onChanged?.call(xFile);
                                          }
                                        });

                                        //.whenComplete(field.onResume);
                                      },
                                    ),
                                  )
                                  .toList(),
                              if (field.value != null) ...[
                                if (options.contains(ClipOption.zoom))
                                  ListTile(
                                    leading: Icon(Icons.zoom_out_map_outlined),
                                    title: Text(
                                        ClipLocalizations.of(context)!.zoom),
                                    onTap: () {
                                      Navigator.of(context)
                                        ..pop()
                                        ..push(
                                          MaterialPageRoute(
                                              builder: (context) => GalleryPage(
                                                      attachments: [
                                                        File(field.value!.path)
                                                      ])),
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
                                      style: TextStyle(color: Colors.red[600]),
                                    ),
                                    onTap: () {
                                      field.didChange(null);
                                      onChanged?.call(null);

                                      Navigator.of(context).pop();
                                    },
                                  ),
                              ]
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        );

  @override
  _ImageClipFieldState createState() => _ImageClipFieldState();
}

class _ImageClipFieldState extends FormFieldState<XFile> {
  @override
  ImageClipField get widget => super.widget as ImageClipField;
}
