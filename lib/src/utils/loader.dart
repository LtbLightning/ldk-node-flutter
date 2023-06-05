import 'dart:ffi';
import 'dart:io';

import '../generated/bindings.dart';

final DynamicLibrary dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open('librust.so');
RustImpl loaderApi = RustImpl(dylib);
