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
    Q_INVOKABLE void getListOfRooms(int classID);
    Q_INVOKABLE void setMark(QString ID, int mark);
    Q_INVOKABLE void setTypeOfMark(int index, QString fullName);
    Q_INVOKABLE void sendData();
    Q_INVOKABLE void getListOfClasses();
    Q_INVOKABLE void setClassID(int ID);
    Q_INVOKABLE void getDayReport();

    void prepareClassMarks();
    void prepareRoomMarks();
    void prepareClassesMarks();
    void sendDataToServer(QString value);

private:

    QQmlApplicationEngine engine;
    QObject *mainQML;
    QObject *listQML;
    QObject *listView;

    QString IP;
    QString typeOfMark, fullTypeOfMark;
    QVariantMap marks;
    int day;
    int classID;
    //QStringList classTitle  = {"7А", "7Б"};//, "7В", "8А", "8Б", "8В", "9А", "9Б", "9В", "10А", "10Б", "10В", "11А", "11Б", "11В"};;

signals:

public slots:
    void slotGotList(QNetworkReply *reply);
    void slotSentClassMarks(QNetworkReply *reply);
    void slotGotReportList(QNetworkReply *reply);
};

#endif //BACKEND_H
