import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    // print('object = didUpdateProvider');
    print('["didUpdateProvider": "${provider.name ?? provider.runtimeType}", "newValue": "$newValue"]');
  }

  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    print('["didAddProvider": "${provider.name ?? provider.runtimeType}", "newValue": "$value"]');
  }
}
