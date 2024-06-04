String BASE_URL = 'https://student.valuxapps.com/api';

class EndPoints {
  // USER
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const LOGOUT = '/logout';
  static const PROFILE = '/profile';
  static const UPDATE_PROFILE = '/update-profile';
  static const VERIFY_EMAIL = '/verify-email';
  static const VERIFY_CODE = '/verify-code';
  static const RESET_PASSWORD = '/reset-password';
  static const CHANGE_PASSWORD = '/change-password';

  // ADDRESSES
  static const NEW_ADDRESS = '/addresses';
  static const GET_ADDRESS = '/addresses';
  static UpdateAddress(addressId) => '/addresses/$addressId';
  static DeleteAddress(addressId) => '/addresses/$addressId';

  //PRODUCTS
  static CategoryProducts(categoryId) => '/products?category_id=$categoryId';
  static ProductDetails(id) => '/products/$id';
  static const SEARCH_PRODUCTS = '/products/search';

  //FAVORITES
  static const FAVORITES = '/favorites';
  static const ADD_OR_DELETE_FAVOURITE = '/favorites';
  static DeleteFavorite(processId) => '/favorites/$processId';

  //CARTS
  static const GET_CARTS = '/carts';
  static const ADD_OR_RRMOVE_CART_WITH_PRODUCT_ID = '/carts';
  static DeleteCart(id) => '/carts/$id';
  static UpdateCart(id) => '/carts/$id';

  //CONTACTS
  static const GET_CONTACTS = '/contacts';

  //CATEGORIES
  static const GET_CATEGORIES = '/categories';
  static CategoryDetails(categoryId) => '/categories/$categoryId';

  //SETTINGS
  static const GET_SETTINGS = '/settings';

  //COMPLAINTS
  static const ADD_COMPLAINTS = '/complaints';

  //FAQS
  static const GWT_FAQS = '/faqs';

  //BANNERS
  static const GET_BANNERS = '/banners';

  //HOME
  static const GET_HOME_DATA = '/home';

  //ORDERS
  static const ADD_ORDERS = '/orders';
  static const GET_ORDERS = '/orders';
  static OrderDetails(orderId) => '/orders/$orderId';
  static const ESTIMATE_ORDER = '/estimate-order';
  static CancelOrder(orderId) => '/orders/$orderId/cancel';

  //NOTIFICATIONS
  static const GET_NOTIFICATIONS = '/notifications';
}
