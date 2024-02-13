part of 'shop_cubit.dart';


abstract class ShopStates {}

final class ShopInitialStates extends ShopStates {}

final class ShopChangeIndexStates extends ShopStates {}

final class ShopLoadingStates extends ShopStates {}

final class ShopSuccessStates extends ShopStates {}

final class ShopErrorStates extends ShopStates {}
