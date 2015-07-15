#include <QApplication>
#include "welcomePage.h"
#include "externvars.h"

//Init extern variables
void init()
{
    //QString IP;
    //IP = "http://194.58.108.169";
    qDebug() << IP;
}

int main(int argc, char *argv[])
{
    init();
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    welcomePage *welcome = new welcomePage(engine);

    engine.rootContext()->setContextProperty("welcome", welcome);

    return app.exec();
}
