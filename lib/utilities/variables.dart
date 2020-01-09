import 'dart:ui';

import 'package:flutter/material.dart';

String langValue;
String restApiUrl = "http://apps.uco.kz:8089/aa/rest/";
String aToken;
String userId;

final Color mainBackgroundColor =
    Color(int.parse("#F4F2F0".substring(1, 7), radix: 16) + 0xFF000000);

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

String connectionTimeCode = "CONNECTION_TIME_OUT";
String accessError = "ACCESS_ERROR";

class LanguageUtils {
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'loginTitle': 'Personal Assistant',
      'loginAgreement': 'I-agree-with-the-processing-of-personal-data',
      'loginValidate': 'Fill the field',
      'signIn': 'Sign In',
      'leaf': 'Notification',
      'carOrder': "Taxi Ordering",
      'tasks': "Outfit Job",
      'testing': "Tests",
      'yes': "Yes",
      'no': "No",
      'mustSelectAnswer': "You must select an answer to continue.",
      'noData': "Data not available",
      'total': "Total",
      'openUp': 'Open up',
      'test': "Test",
      'confirm': "Confirm",
      'next': "Next",
      'question': "Question",
      'of': "of",
      'start': "Start",
      'attention': "Warning!",
      'testWillPop':
          "Are you sure you want to exit the test? All your progress will be lost",
      'personalCabinet': "Personal Area",
      'singInSystem': "Enter System",
      'mainInfo': "Main Infromation",
      'food': "Supply",
      'allowance': "Allowance",
      'wantPin':
          "Would you like to create a PIN code for quick access to the application?",
      'pinCreate': "PIN code creation",
      'enterPin': "Enter pin code",
      'repeatePin': "Repeat PIN Code",
      'doesntMatchPin': "PIN codes do not match",
      'error': "Error",
      'incorrectPin': "Incorrect pin code",
      'logoTitle': 'AO "Karajıra"',
      'enterLogin': "Enter login",
      'enterPassword': "Enter password",
      'incorrectSignIn': "Incorrect login or password",
    },
    'ru': {
      'loginTitle': 'Личный ассистент',
      'loginAgreement': 'Согласен на обработку персональных данных',
      'loginValidate': 'Заполните поле',
      'signIn': 'ПРОДОЛЖИТЬ',
      'leaf': 'Уведомление',
      'funcLeaf': "Функция",
      'carOrder': "Заказ транспорта",
      'tasks': "Наряд Задания",
      'testing': "Список Тестов",
      'yes': "Да",
      'no': "Нет",
      'mustSelectAnswer': "Вы должны выбрать ответ, чтобы продолжить.",
      'noData': "Нет данных",
      'total': "Всего",
      'openUp': 'Раскрыть',
      'test': "Ежедневное тестирование",
      'confirm': "Подтвердить",
      'next': "Далее",
      'cancel': "Отмена",
      'question': "Вопрос",
      'of': "из",
      'start': "Начать",
      'attention': "Предупреждение!",
      'testWillPop':
          "Вы уверены, что хотите выйти из теста? Весь ваш прогресс будет потерян",
      'personalCabinet': "Личный кабинет",
      'singInSystem': "ВХОД В СИСТЕМУ",
      'mainInfo': "Основная Инфромация",
      'food': "Питание",
      'allowance': "Допуски",
      'wantPin': "Хотите ли создать пин код для быстрого входа в приложение?",
      'pinCreate': "Создание ПИН кода",
      'enterPin': "Введите пин код",
      'repeatePin': "Повторите пин код",
      'doesntMatchPin': "Пин коды не совпадают",
      'error': "Ошибка",
      'incorrectPin': "Неправильный пин код",
      'logoTitle': 'AO "Каражыра"',
      'enterLogin': "Введите имя пользователя",
      'enterPassword': "Введите пароль",
      'incorrectSignIn': "Неверные логин или пароль",
      'orderStory': "История заказов",
      'savedAddreses': "Мои адресса",
      'fromWhere': "Откуда",
      'toWhere': "Куда",
      'fromAddress': "Введите пункт отпрвления",
      'toAddress': "Введите конечный пункт",
      'different_addresses': "Адресса должны быть разными",
      'timeOut':
          "Закончилось время ожидания, пожалуйста проверьте ваше интернет соединение",
      'home': "Дом",
      'office': "Офис",
      'other': "Прочее",
      'delete': "Удалить",
      'canceling': "Отменить",
      'more': "Подробнее",
      'order_reason': "Введите причину",
      'orders_list': "Список Заявок на перевозку",
      'errorToAdmin':
          "Ошибка. Пожалуйста обратитесь к системному администратору",
      'save': "Сохранить",
      'send': "Отправить",
      'required': "Это обязательное поле",
      'IS_NEW': "Новый",
      'APPROVED': "Утвержден",
      'UNAPPROVED': "Не утвержден",
      'ON_DISTRIBUTION': "На распределении",
      'EXPECTATION': "Ожидание",
      'COMPLETED': "Завершено",
      'CANCELED': "Отменено",
      'ONAPPROVE': "На утверждении",
      'PLAN': "Плановый ремонт",
      'settings': "Настройки",
      'true': "",
      '': "",
    },
    'kz': {
      'loginTitle': 'Жеке көмекші',
      'loginAgreement': 'Согласен с обработкой персональных данных',
      'loginValidate': 'Заполните поле',
      'signIn': 'Продолжить',
    }
  };

  static String getLangValue(String code) {
    return _localizedValues[langValue ?? "ru"][code];
  }
}
