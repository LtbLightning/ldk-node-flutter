import 'dart:ffi';
import 'dart:io';

import '../generated/bindings.dart';

final DynamicLibrary dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open('libldknode.so');
RustImpl loaderApi = RustImpl(dylib);
