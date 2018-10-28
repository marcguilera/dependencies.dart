/// Dependency injection container for dart.
library dependencies;

import 'package:validate/expect.dart';

part 'src/injector/injector.dart';
part 'src/injector/_injector_container.dart';
part 'src/injector/error.dart';

part 'src/builder/injector_builder.dart';
part 'src/builder/_injector_builder_container.dart';

part 'src/binding/binder.dart';
part 'src/binding/_binder_container.dart';

part 'src/module/module.dart';

part 'src/registration/_registration.dart';
part 'src/registration/_registration_container.dart';
part 'src/registration/_factory.dart';
part 'src/registration/_lazy_singleton.dart';
part 'src/registration/_singleton.dart';
