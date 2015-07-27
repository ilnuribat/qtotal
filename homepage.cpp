#include "homepage.h"

homePage::homePage(QQmlApplicationEngine &engine)
{
    mainQML = engine.rootObjects().value(0);
    engine.rootContext ()->setContextProperty ("home", this);
    settings = new QSettings("settings.ini", QSettings::IniFormat);
}

void homePage::loaded ()
{
    QObject *sideMenu = mainQML->findChild<QObject*>("sideMenu");
    sideMenu->setProperty ("name_lastname", settings->value ("name_lastname"));
    sideMenu->setProperty ("position", settings->value ("position"));
}
