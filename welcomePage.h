#ifndef BACKEND_H
#define BACKEND_H

#include <QQuickItem>
#include <QQmlApplicationEngine>
#include <QtQuick>
#include <QNetworkAccessManager>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>

#include "externvars.h"

class welcomePage : public QQuickItem
{
    Q_OBJECT
public:
    explicit welcomePage(QQmlApplicationEngine &engine, QQuickItem *parent = 0);

private:

signals:

public slots:

};

#endif //BACKEND_H
