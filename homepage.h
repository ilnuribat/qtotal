#ifndef HOMEPAGE_H
#define HOMEPAGE_H

#include <QQuickItem>
#include <QQmlApplicationEngine>
#include <QtQuick>
#include <QNetworkAccessManager>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>

#include "externvars.h"

class homePage : public QQuickItem
{
    Q_OBJECT

public:
    homePage(QQmlApplicationEngine &engine);
    Q_INVOKABLE void loaded();

signals:

private:
    QObject *mainQML;
    QSettings *settings;

public slots:
};

#endif // HOMEPAGE_H
