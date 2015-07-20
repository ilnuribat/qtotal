#include "homepage.h"

homePage::homePage(QQmlApplicationEngine &engine)
{
    mainQML = engine.rootObjects().value(0);
}

