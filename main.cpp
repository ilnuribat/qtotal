#include <QApplication>
#include "welcomePage.h"
#include "externvars.h"
#include "homepage.h"

void init(QQmlApplicationEngine &engine)
{
    //Логика кэширования. Если человек уже логинился, то
    //нужно сразу в следующую страницу
    QObject *mainQML = engine.rootObjects().value(0);
    QObject *loader = mainQML->findChild<QObject*>("loader");
    QSettings *settings = new QSettings("settings.ini", QSettings::IniFormat);
    QString ID = settings->value ("ID").toString ();
    if (ID.size () > 0) {
        loader->setProperty ("source", "qrc:/QMLs/Home.qml");
    }
    else {
        loader->setProperty ("source", "qrc:/QMLs/Welcome.qml");
    }
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/main.qml"));

    new welcomePage(engine);
    new homePage(engine);

    init(engine);

    return app.exec();
}
