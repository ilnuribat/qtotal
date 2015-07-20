#include <QApplication>
#include "welcomePage.h"
#include "externvars.h"
#include "homepage.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/main.qml"));

    welcomePage *welcome;
    welcome = new welcomePage(engine);



    homePage *home;
    home = new homePage(engine);
    engine.rootContext ()->setContextProperty ("home", home);

    return app.exec();
}
