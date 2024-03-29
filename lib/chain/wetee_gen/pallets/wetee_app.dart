// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/sp_core/crypto/account_id32.dart' as _i3;
import '../types/wetee_app/pallet/call.dart' as _i9;
import '../types/wetee_app/price.dart' as _i5;
import '../types/wetee_app/tee_app.dart' as _i4;
import '../types/wetee_primitives/types/app_setting.dart' as _i6;
import '../types/wetee_runtime/runtime_call.dart' as _i8;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<BigInt> _nextTeeId = const _i1.StorageValue<BigInt>(
    prefix: 'WeteeApp',
    storage: 'NextTeeId',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i4.TeeApp> _tEEApps =
      const _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i4.TeeApp>(
    prefix: 'WeteeApp',
    storage: 'TEEApps',
    valueCodec: _i4.TeeApp.codec,
    hasher1: _i1.StorageHasher.identity(_i3.AccountId32Codec()),
    hasher2: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<int, _i5.Price> _prices =
      const _i1.StorageMap<int, _i5.Price>(
    prefix: 'WeteeApp',
    storage: 'Prices',
    valueCodec: _i5.Price.codec,
    hasher: _i1.StorageHasher.identity(_i2.U8Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i3.AccountId32> _appIdAccounts =
      const _i1.StorageMap<BigInt, _i3.AccountId32>(
    prefix: 'WeteeApp',
    storage: 'AppIdAccounts',
    valueCodec: _i3.AccountId32Codec(),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, int, _i6.AppSetting> _appSettings =
      const _i1.StorageDoubleMap<BigInt, int, _i6.AppSetting>(
    prefix: 'WeteeApp',
    storage: 'AppSettings',
    valueCodec: _i6.AppSetting.codec,
    hasher1: _i1.StorageHasher.identity(_i2.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i2.U16Codec.codec),
  );

  final _i1.StorageMap<BigInt, BigInt> _appVersion =
      const _i1.StorageMap<BigInt, BigInt>(
    prefix: 'WeteeApp',
    storage: 'AppVersion',
    valueCodec: _i2.U64Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  /// The id of the next app to be created.
  /// 获取下一个app id
  _i7.Future<BigInt> nextTeeId({_i1.BlockHash? at}) async {
    final hashedKey = _nextTeeId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextTeeId.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// App
  /// 应用
  _i7.Future<_i4.TeeApp?> tEEApps(
    _i3.AccountId32 key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _tEEApps.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _tEEApps.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Price of resource
  /// 价格
  _i7.Future<_i5.Price?> prices(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _prices.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _prices.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// App 对应账户
  /// user's K8sCluster information
  _i7.Future<_i3.AccountId32?> appIdAccounts(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _appIdAccounts.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _appIdAccounts.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// App setting
  /// App设置
  _i7.Future<_i6.AppSetting?> appSettings(
    BigInt key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _appSettings.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _appSettings.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// App version
  /// App 版本
  _i7.Future<BigInt?> appVersion(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _appVersion.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _appVersion.decodeValue(bytes);
    }
    return null; /* Nullable */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::create`].
  _i8.RuntimeCall create({
    required name,
    required image,
    required port,
    required cpu,
    required memory,
    required disk,
    required level,
    required deposit,
  }) {
    final _call = _i9.Call.values.create(
      name: name,
      image: image,
      port: port,
      cpu: cpu,
      memory: memory,
      disk: disk,
      level: level,
      deposit: deposit,
    );
    return _i8.RuntimeCall.values.weteeApp(_call);
  }

  /// See [`Pallet::update`].
  _i8.RuntimeCall update({
    required appId,
    required name,
    required image,
    required port,
  }) {
    final _call = _i9.Call.values.update(
      appId: appId,
      name: name,
      image: image,
      port: port,
    );
    return _i8.RuntimeCall.values.weteeApp(_call);
  }

  /// See [`Pallet::set_settings`].
  _i8.RuntimeCall setSettings({
    required appId,
    required value,
  }) {
    final _call = _i9.Call.values.setSettings(
      appId: appId,
      value: value,
    );
    return _i8.RuntimeCall.values.weteeApp(_call);
  }

  /// See [`Pallet::recharge`].
  _i8.RuntimeCall recharge({
    required id,
    required deposit,
  }) {
    final _call = _i9.Call.values.recharge(
      id: id,
      deposit: deposit,
    );
    return _i8.RuntimeCall.values.weteeApp(_call);
  }

  /// See [`Pallet::stop`].
  _i8.RuntimeCall stop({required appId}) {
    final _call = _i9.Call.values.stop(appId: appId);
    return _i8.RuntimeCall.values.weteeApp(_call);
  }

  /// See [`Pallet::restart`].
  _i8.RuntimeCall restart({required appId}) {
    final _call = _i9.Call.values.restart(appId: appId);
    return _i8.RuntimeCall.values.weteeApp(_call);
  }
}
