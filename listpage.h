#ifndef LISTPAGE_H
#define LISTPAGE_H

#include <QQuickItem>
#include <QQmlApplicationEngine>
#include <QtQuick>
#include <QNetworkAccessManager>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>

#include "externvars.h"

class listPage : public QQuickItem
{
    Q_OBJECT
public:
    listPage(QQmlApplicationEngine &engine);
    Q_INVOKABLE void loaded();

signals:

private:
    QObject *mainQML;
    QSettings *settings;

public slots:

};

#endif // LISTPAGE_H
