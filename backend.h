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

class backend : public QQuickItem
{
    Q_OBJECT
public:
    explicit backend(QQuickItem *parent = 0);

    Q_INVOKABLE void getListOfClass(int classID);
    Q_INVOKABLE void setMark(QString studentID, int mark);
    Q_INVOKABLE void setTypeOfMark(int index);
    Q_INVOKABLE void sendData();
private:

    QQmlApplicationEngine engine;
    QObject *mainQML;
    QObject *listQML;
    QObject *listView;

    QString IP;
    QString typeOfMark;
    QVariantMap marks;
signals:

public slots:
    void slotGotListOfClass(QNetworkReply *reply);
    void slotSentData(QNetworkReply *reply);
};

#endif //BACKEND_H
