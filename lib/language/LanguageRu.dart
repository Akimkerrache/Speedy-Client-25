import 'BaseLanguage.dart';

class LanguageRu extends BaseLanguage {
  @override
  String get appName => 'Могучий гонщик';
  @override
  String get chooseCallMethod => 'Выберите способ вызова';
  @override
  String get speedyCall => 'Быстрый звонок';
  @override
  String get phoneCall => 'Телефон';
  @override
  String get thisFieldRequired => 'Это поле обязательно к заполнению';
  @override
  String get email => 'Электронная почта';
  @override
  String get password => 'Пароль';
  @override
  String get forgotPassword => 'Забыли пароль?';
  @override
  String get logIn => 'Авторизоваться';
  @override
  String get orLogInWith => 'Или войти в систему с';
  @override
  String get donHaveAnAccount => 'Нет учетной записи?';
  @override
  String get signUp => 'Зарегистрироваться';
  @override
  String get createAccount => 'Зарегистрироваться';
  @override
  String get firstName => 'Имя';
  @override
  String get lastName => 'Фамилия';
  @override
  String get userName => 'Имя пользователя';
  @override
  String get phoneNumber => 'Номер телефона';
  @override
  String get alreadyHaveAnAccount => 'Уже есть аккаунт?';
  @override
  String get changePassword => 'Изменить пароль';
  @override
  String get oldPassword => 'Старый пароль';
  @override
  String get newPassword => 'Новый пароль';
  @override
  String get confirmPassword => 'Подтвердите пароль';
  @override
  String get passwordDoesNotMatch => 'Пароль не подходит';
  @override
  String get passwordInvalid => 'Минимальная длина пароля должна быть 8';
  @override
  String get yes => 'Да';
  @override
  String get no => 'Нет';
  @override
  String get writeMessage => 'Написать сообщение';
  @override
  String get enterTheEmailAssociatedWithYourAccount =>
      'Введите электронное письмо, связанное с вашей учетной записью';
  @override
  String get submit => 'Представлять на рассмотрение';
  @override
  String get language => 'Язык';
  @override
  String get notification => 'Уведомление';
  @override
  String get useInCaseOfEmergency =>
      'Использовать в случае чрезвычайной ситуации';
  @override
  String get notifyAdmin => 'Уведомить администратор';
  @override
  String get notifiedSuccessfully => 'Уведомил успешно';
  @override
  String get complain => 'Жаловаться';
  @override
  String get pleaseEnterSubject => 'Пожалуйста, введите тему';
  @override
  String get writeDescription => 'Напишите описание ....';
  @override
  String get saveComplain => 'Сохранить жалобу';
  @override
  String get editProfile => 'Редактировать профиль';
  @override
  String get address => 'Адрес';
  @override
  String get updateProfile => 'Обновить профиль';
  @override
  String get notChangeUsername => 'Вы не можете изменить имя пользователя';
  @override
  String get notChangeEmail =>
      'Вы не можете изменить идентификатор электронной почты';
  @override
  String get profileUpdateMsg => 'Профиль обновлен успешно';
  @override
  String get emergencyContact => 'Экстренный контакт';
  @override
  String get areYouSureYouWantDeleteThisNumber =>
      'Вы уверены, что хотите удалить этот номер?';
  @override
  String get addContact => 'Добавить контакт';
  @override
  String get save => 'Сохранять';
  @override
  String get availableBalance => 'доступные средства';
  @override
  String get recentTransactions => 'Недавние транзакции';
  @override
  String get moneyDeposited => 'Деньги депонированы';
  @override
  String get addMoney => 'Добавить деньги';
  @override
  String get cancel => 'Отмена';
  @override
  String get pleaseSelectAmount => 'Пожалуйста, выберите сумму';
  @override
  String get amount => 'Количество';
  @override
  String get capacity => 'Емкость';
  @override
  String get paymentMethod => 'Способ оплаты';
  @override
  String get chooseYouPaymentLate => 'Выберите оплату сейчас или поздно';
  @override
  String get enterPromoCode => 'Введите промо-код';
  @override
  String get confirm => 'Подтверждать';
  @override
  String get forInstantPayment => 'Для мгновенного оплаты';
  @override
  String get bookNow => 'Забронируйте сейчас';
  @override
  String get wallet => 'Кошелек';
  @override
  String get paymentDetail => 'Подробная информация о оплате';
  @override
  String get rideId => 'Ride id';
  @override
  String get viewHistory => 'Посмотреть историю';
  @override
  String get paymentDetails => 'Детали оплаты';
  @override
  String get paymentType => 'Способ оплаты';
  @override
  String get paymentStatus => 'Статус платежа';
  @override
  String get priceDetail => 'Ценовая деталь';
  @override
  String get basePrice => 'Базисная цена';
  @override
  String get distancePrice => 'Цена расстояния';
  @override
  String get waitTime => 'Время ожидания';
  @override
  String get extraCharges => 'Дополнительные сборы';
  @override
  String get couponDiscount => 'Купонная скидка';
  @override
  String get total => 'Общий';
  @override
  String get payment => 'Оплата';
  @override
  String get cash => 'Наличные';
  @override
  String get updatePaymentStatus => 'Обновить статус оплаты';
  @override
  String get waitingForDriverConformation =>
      'В ожидании подтверждения водителя';
  @override
  String get continueNewRide => 'Продолжить новую поездку';
  @override
  String get payToPayment => 'Заплатить за оплату';
  @override
  String get tip => 'Кончик';
  @override
  String get pay => 'Платить';
  @override
  String get howWasYourRide => 'Как прошла ваша поездка?';
  @override
  String get wouldYouLikeToAddTip => 'Хотели бы вы добавить совет?';
  @override
  String get addMoreTip => 'Добавьте больше чаевых';
  @override
  String get addMore => 'Добавить больше';
  @override
  String get addReviews => 'Добавить отзывы';
  @override
  String get writeYourComments => 'Напишите свои отзывы ....';
  @override
  String get continueD => 'Продолжать';
  @override
  String get aboutDriver => 'О водителе';
  @override
  String get rideHistory => 'История поездки';
  @override
  String get emergencyContacts => 'Экстренные контакты';
  @override
  String get logOut => 'Выйти';
  @override
  String get areYouSureYouWantToLogoutThisApp =>
      'Вы уверены, что хотите выйти из этого приложения?';
  @override
  String get whatWouldYouLikeToGo => 'Куда ты хочешь идти?';
  @override
  String get enterYourDestination => 'Введите пункт назначения';
  @override
  String get currentLocation => 'Текущее местоположение';
  @override
  String get destinationLocation => 'Место назначения';
  @override
  String get chooseOnMap => 'Выберите на карте';
  @override
  String get profile => 'Профиль';
  @override
  String get privacyPolicy => 'политика конфиденциальности';
  @override
  String get helpSupport => 'Помощь и поддержка';
  @override
  String get termsConditions => 'Условия и условия';
  @override
  String get aboutUs => 'О нас';
  @override
  String get lookingForNearbyDrivers => 'Ищу соседних водителей';
  @override
  String get weAreLookingForNearDriversAcceptsYourRide =>
      'Мы ищем близлежащих водителей, чтобы \ naccepts';
  @override
  String get get => 'Получать';
  @override
  String get rides => 'Поездка';
  @override
  String get people => 'Люди';
  @override
  String get done => 'Сделанный';
  @override
  String get availableOffers => 'Доступные предложения';
  @override
  String get off => 'ВЫКЛЮЧЕННЫЙ';
  @override
  String get sendOTP => 'Отправить OTP';
  @override
  String get carModel => 'Модель автомобиля';
  @override
  String get sos => 'SOS';
  @override
  String get driverReview => 'Обзор водителя';
  @override
  String get signInUsingYourMobileNumber =>
      'Войдите, используя свой номер \ nmobile';
  @override
  String get otp => 'ОТП';
  @override
  String get newRideRequested => 'Новая поездка запросила';
  @override
  String get accepted => 'Принял';
  @override
  String get arriving => 'Прибытие';
  @override
  String get arrived => 'Приехал';
  @override
  String get inProgress => 'В ходе выполнения';
  @override
  String get cancelled => 'Отменен';
  @override
  String get completed => 'Завершенный';
  @override
  String get pleaseEnableLocationPermission =>
      'Пожалуйста, включите разрешение на местоположение';
  @override
  String get pending => 'В ожидании';
  @override
  String get failed => 'Неуспешный';
  @override
  String get paid => 'Оплаченный';
  @override
  String get male => 'Мужской';
  @override
  String get female => 'Женский';
  @override
  String get other => 'Другой';
  @override
  String get deleteAccount => 'Удалить аккаунт';
  @override
  String get account => 'Счет';
  @override
  String get areYouSureYouWantPleaseReadAffect =>
      'Вы уверены, что хотите удалить свою учетную запись? Пожалуйста, прочитайте, как повлияет удаление учетной записи.';
  @override
  String get deletingAccountEmail =>
      'Удаление вашей учетной записи удаляет личную информацию из нашей базы данных. Ваше электронное письмо становится постоянно зарезервированным, и одно и то же электронное письмо не может быть повторно использовано для регистрации новой учетной записи';
  @override
  String get areYouSureYouWantDeleteAccount =>
      'Вы уверены, что хотите удалить учетную запись?';
  @override
  String get yourInternetIsNotWorking => 'Ваш интернет не работает';
  @override
  String get allow => 'Позволять';
  @override
  String get mostReliableMightyRiderApp =>
      'Самое надежное приложение Mighty Rider';
  @override
  String get toEnjoyYourRideExperiencePleaseAllowPermissions =>
      'Чтобы насладиться опытом поездки \ nplease, позвольте нам следующие разрешения';
  @override
  String get txtURLEmpty => 'URL пуст';
  @override
  String get lblFollowUs => 'Подписывайтесь на нас';
  @override
  String get duration => 'Продолжительность';
  @override
  String get paymentVia => 'Оплата через';
  @override
  String get demoMsg => 'Роль тестера не разрешена выполнять это действие';
  @override
  String get findPlace => 'Найдите место ...';
  @override
  String get pleaseWait => 'пожалуйста, подождите';
  @override
  String get selectPlace => 'Выберите место';
  @override
  String get placeNotInArea => 'Место не в районе';
  @override
  String get youCannotChangePhoneNumber =>
      'Вы не можете изменить номер телефона';
  @override
  String get complainList => 'Список жалоб';
  @override
  String get writeMsg => 'Написать сообщение';
  @override
  String get pleaseEnterMsg => 'Пожалуйста, введите сообщение';
  @override
  String get viewAll => 'Посмотреть все';
  @override
  String get pleaseSelectRating => 'Пожалуйста, выберите рейтинг';
  @override
  String get moneyDebit => 'Денежный дебет';
  @override
  String get pleaseAcceptTermsOfServicePrivacyPolicy =>
      'Пожалуйста, принимайте условия обслуживания и политики конфиденциальности';
  @override
  String get rememberMe => 'Запомнить меня';
  @override
  String get iAgreeToThe => 'я согласен';
  @override
  String get driverInformation => 'Информация о драйвере';
  @override
  String get nameFieldIsRequired => 'Требуется поле имени';
  @override
  String get phoneNumberIsRequired => 'Требуется номер телефона';
  @override
  String get enterName => 'Введите имя';
  @override
  String get enterContactNumber => 'Введите контактный номер';
  @override
  String get invoice => 'Счет';
  @override
  String get customerName => 'Имя Клиента';
  @override
  String get sourceLocation => 'Расположение источника';
  @override
  String get invoiceNo => 'Счет -фактура нет';
  @override
  String get invoiceDate => 'Дата счета';
  @override
  String get orderedDate => 'Заказанная дата';
  @override
  String get lblCarNumberPlate => 'Автомобильная номерная пластина';
  @override
  String get lblRide => 'Поездка';
  @override
  String get lblRideInformation => 'Информация о поездке';
  @override
  String get lblWhereAreYou => 'Где ты?';
  @override
  String get lblDropOff => 'Бросить';
  @override
  String get lblDistance => 'Расстояние:';
  @override
  String get lblSomeoneElse => 'Кто-нибудь другой';
  @override
  String get lblYou => 'Ты';
  @override
  String get lblWhoRidingMsg =>
      'Подтвердите гонщика и убедитесь, что информация о поездке';
  @override
  String get lblNext => 'Следующий';
  @override
  String get lblLessWalletAmount =>
      'Примечание: у вас есть недостаточный баланс в вашем кошельке. Добавьте сумму иначе, вы должны заплатить через наличные.';
  @override
  String get lblPayWhenEnds => 'Платить, когда поездка заканчивается';
  @override
  String get maximum => 'Максимум';
  @override
  String get required => 'необходимый';
  @override
  String get minimum => 'Минимум';
  @override
  String get withDraw => 'Отзывать';
  @override
  String get withdrawHistory => 'История снятия';
  @override
  String get approved => 'Одобренный';
  @override
  String get requested => 'Запрошен';
  @override
  String get minimumFare => 'Минимальный тариф';
  @override
  String get cancelRide => 'Отменить поездку';
  @override
  String get cancelledReason => 'Отменен разум';
  @override
  String get selectReason => 'Выберите разум';
  @override
  String get writeReasonHere => 'Напишите причину здесь ...';
  @override
  String get driverGoingWrongDirection =>
      'Драйвер, идущий неправильный направление';
  @override
  String get pickUpTimeTakingTooLong =>
      'Получите время, чтобы занять слишком много времени';
  @override
  String get driverAskedMeToCancel => 'Водитель попросил меня отменить';
  @override
  String get others => 'Другие';
  @override
  String get baseFare => 'Базовый тариф';
  @override
  String get perDistance => 'На расстояние';
  @override
  String get perMinDrive => 'В минуту езду';
  @override
  String get perMinWait => 'В минуту ожидание';
  @override
  String get min => 'мин';
  @override
  String get unsupportedPlateForm => 'Неподдерживаемая платформа';
  @override
  String get invoiceCapital => 'СЧЕТ';
  @override
  String get description => 'Описание';
  @override
  String get price => 'Цена';
  @override
  String get gallery => 'Галерея';
  @override
  String get camera => 'Камера';
  @override
  String get bankInfoUpdated => 'Банковская информация успешно';
  @override
  String get bankInfo => 'Банка информация';
  @override
  String get bankName => 'Название банка';
  @override
  String get bankCode => 'Код банка';
  @override
  String get accountHolderName => 'имя владельца счета';
  @override
  String get accountNumber => 'Номер счета';
  @override
  String get updateBankDetail => 'Обновление банковских деталей';
  @override
  String get addBankDetail => 'Добавьте детали банка';
  @override
  String get locationNotAvailable => 'Место недоступно';
  @override
  String get servicesNotFound => 'Услуги не найдены';
  @override
  String get paymentFailed => 'Платеж не прошел';
  @override
  String get checkConsoleForError => 'Проверьте консоли на наличие ошибки';
  @override
  String get transactionFailed => 'Сделка не удалась';
  @override
  String get transactionSuccessful => 'Сделка успешна';
  @override
  String get payWithCard => 'Заплатить картой';
  @override
  String get success => 'Успех';
  @override
  String get skip => 'Пропускать';
  @override
  String get declined => 'Отклоненный';
  @override
  String get validateOtp => 'Подтвердить OTP';
  @override
  String get otpCodeHasBeenSentTo => 'OTP -код был отправлен на';
  @override
  String get pleaseEnterOtp =>
      'Пожалуйста, введите OTP ниже, чтобы проверить свой номер мобильного телефона.';
  @override
  String get selectSources => 'Выберите источники';
  @override
  String get whoWillBeSeated => 'Кто будет сидеть?';
  @override
  String get via => 'С помощью';
  @override
  String get status => 'Положение дел';
  @override
  String get riderInformation => 'Информация на гонщике';
  @override
  String get minutePrice => 'Мельчайшая цена';
  @override
  String get waitingTimePrice => 'Цена времени ожидания';
  @override
  String get additionalFees => 'Дополнительная плата';
  @override
  String get settings => 'Настройки';
  @override
  String get welcome => 'Добро пожаловать,';
  @override
  String get signContinue => 'Войдите, чтобы продолжить';
  @override
  String get passwordLength => 'Длина пароля, по крайней мере, должна быть 8';
  @override
  String get bothPasswordNotMatch => 'Оба пароля должны быть сопоставлены';
  @override
  String get missingBankDetail =>
      'Отсутствуют банковские детали. Заполните свой профиль до суммы отмены';
  @override
  String get close => 'Закрывать';
  @override
  String get copied => 'Скопировано!';
}
