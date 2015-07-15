#include "welcomePage.h"
#include "externvars.h"

welcomePage::welcomePage(QQmlApplicationEngine &engine, QQuickItem *parent)
    : QQuickItem(parent)
{
    QObject *mainQML = engine.rootObjects().value(0);

    qDebug() << IP;
}
