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
}

