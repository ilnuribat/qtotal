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

signals:

private:
    QObject *mainQML;

public slots:
};

#endif // HOMEPAGE_H
