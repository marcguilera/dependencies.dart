/// Dependency injection container for dart.
library dependencies;

import 'package:meta/meta.dart';
import 'package:quiver/check.dart';
import 'package:quiver/core.dart';
import 'package:disposables/disposables.dart';

part 'src/binding/_binder_container.dart';
part 'src/binding/_configurer_binder_container.dart';
part 'src/binding/binder.dart';
part 'src/binding/installer.dart';
part 'src/binding/binding.dart';
part 'src/builder/_injector_builder_container.dart';
part 'src/builder/injector_builder.dart';
part 'src/injector/_injector_base.dart';
part 'src/injector/_injector_container.dart';
part 'src/injector/_empty_injector.dart';
part 'src/injector/error.dart';
part 'src/injector/injector.dart';
part 'src/params/params.dart';
part 'src/params/_empty_params.dart';
part 'src/params/_map_params.dart';
part 'src/params/params_builder.dart';
part 'src/params/error.dart';
part 'src/module/_compose_module.dart';
part 'src/module/_empty_module.dart';
part 'src/module/module.dart';
part 'src/module/configurer.dart';
part 'src/registration/_factory.dart';
part 'src/registration/_lazy_singleton.dart';
part 'src/registration/_registration.dart';
part 'src/registration/_registration_container.dart';
part 'src/registration/_singleton.dart';
part 'src/registry/_injector_registry_container.dart';
part 'src/registry/injector_registry.dart';
part 'src/registry/injector_mixin.dart';
