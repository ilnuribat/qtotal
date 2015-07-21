#include "homepage.h"

homePage::homePage(QQmlApplicationEngine &engine)
{
    mainQML = engine.rootObjects().value(0);
    engine.rootContext ()->setContextProperty ("home", this);
}

void homePage::loaded ()
{
    qDebug() << "home page loaded";
}
