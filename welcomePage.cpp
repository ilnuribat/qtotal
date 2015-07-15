#include "welcomePage.h"
#include "externvars.h"

welcomePage::welcomePage(QQmlApplicationEngine &engine, QQuickItem *parent)
    : QQuickItem(parent)
{
    mainQML = engine.rootObjects().value(0);

    qDebug() << IP;
}

void welcomePage::login (QString login, QString password)
{
    if(login == "ilnur" && password == "1")
    {
        qDebug() << "success";
        QObject *loader = mainQML->findChild<QObject*>("loader");
        loader->setProperty ("source", "qrc:/QMLs/class.qml");
    }
}

void welcomePage::loaded ()
{
}
