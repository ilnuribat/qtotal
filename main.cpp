#include <QApplication>
#include "welcomePage.h"
#include "externvars.h"
#include "homepage.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    welcomePage *welcome;
    welcome = new welcomePage(engine);
    engine.rootContext()->setContextProperty("welcome", welcome);

    homePage *home = new homePage(engine);
    engine.rootContext ()->setContextProperty ("home", home);

    return app.exec();
}
