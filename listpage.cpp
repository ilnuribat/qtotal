#include "listpage.h"

listPage::listPage(QQmlApplicationEngine &engine)
{
    mainQML = engine.rootObjects ().value (0);
    engine.rootContext()->setContextProperty ("list", this);
    settings = new QSettings("settings.ini", QSettings::IniFormat);
}

void listPage::loaded ()
{
    qDebug() << "list page loaded!";
    QObject *listCheckBox = mainQML->findChild<QObject*>("listCheckBox");
    QVariantMap map;
    map["name"] = "ilnur";
    map["id"] = 1;
    map["marked"] = "0";
    QMetaObject::invokeMethod(listCheckBox, "append", Q_ARG(QVariant, QVariant::fromValue(map)));
}

