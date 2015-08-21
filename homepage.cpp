#include "homepage.h"

homePage::homePage(QQmlApplicationEngine &engine)
{
    mainQML = engine.rootObjects().value(0);
    engine.rootContext()->setContextProperty ("home", this);
    settings = new QSettings("settings.ini", QSettings::IniFormat);
}

void homePage::loaded ()
{
}

void homePage::goToZRD ()
{
    //Открывает по умолчанию свой класс
    //нужно добавить меню, в котором можно поменять класс
    //можно это сделать в боковом меню
    QObject *loader = mainQML->findChild<QObject*>("loader");
    loader->setProperty ("source", "qrc:/QMLs/Lists.qml");
}
