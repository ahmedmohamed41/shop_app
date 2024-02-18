part of 'shop_cubit.dart';


abstract class ShopStates {}

final class ShopInitialStates extends ShopStates {}

final class ShopChangeIndexStates extends ShopStates {}

final class ShopLoadingStates extends ShopStates {}

final class ShopSuccessStates extends ShopStates {}

final class ShopErrorStates extends ShopStates {}

final class ShopLoadingCategoriesStates extends ShopStates {}

final class ShopSuccessCategoriesStates extends ShopStates {}

final class ShopErrorCategoriesStates extends ShopStates {}


final class ShopSuccessFavoritesStates extends ShopStates {}

final class ShopErrorFavoritesStates extends ShopStates {}

final class ShopLoadingGetFavoritesStates extends ShopStates {}

final class ShopSuccessGetFavoritesStates extends ShopStates {}

final class ShopErrorGetFavoritesStates extends ShopStates {}

final class ShopLoadingGetSettingsStates extends ShopStates {}

final class ShopSuccessGetSettingsStates extends ShopStates {}

final class ShopErrorGetSettingsStates extends ShopStates {}

