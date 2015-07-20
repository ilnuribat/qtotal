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
    Q_INVOKABLE void login(QString login, QString password);
    Q_INVOKABLE void loaded();
    void authentication(QString login, QString password);

private:
    QObject *mainQML;

signals:

public slots:
    void slotAuthentication(QNetworkReply *reply);

};

#endif //BACKEND_H
