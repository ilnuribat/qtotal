#include "backend.h"

backend::backend(QQuickItem *parent)
    : QQuickItem(parent)
{
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    engine.rootContext()->setContextProperty("backend", this);
    mainQML = engine.rootObjects().value(0);
    this->IP = "http://194.58.100.50";
}

void backend::getListOfClass(int classID)
{
    QNetworkAccessManager *pManager = new QNetworkAccessManager(this);
    connect(pManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(slotGotListOfClass(QNetworkReply*)));
    QString requestAddress = this->IP + "/listofclass?id_class=" + QString::number(classID);
    QNetworkRequest request(QUrl(requestAddress.toUtf8()));
    pManager->get(request);

    QObject *titleListOfClassOrRooms = mainQML->findChild<QObject *>("titleListOfClassOrRooms");
    QMetaObject::invokeMethod(titleListOfClassOrRooms, "setTitle", Q_ARG(QVariant, QVariant("Список класса")));
    //QMetaObject::invokeMethod(titleListOfClassOrRooms, "setMarkTitle", Q_ARG(QVariant, QVariant("Кто")));
}

void backend::slotGotListOfClass(QNetworkReply *reply)
{
    this->marks.clear();
    QObject *listOfClass = mainQML->findChild<QObject *>("listCheckBox");
    QString replyStr(reply->readAll());
    //qDebug() << replyStr << "list of class";
    QJsonDocument jsonDoc = QJsonDocument::fromJson(replyStr.toUtf8());
    QJsonArray jsonArr = jsonDoc.array();
    QVariantMap map;
    for(int i = 0; i < jsonArr.size(); i ++)
    {
        map = jsonArr.at(i).toObject().toVariantMap();
        this->marks[map["id"].toString()] = 0;
        QMetaObject::invokeMethod(listOfClass, "append", Q_ARG(QVariant, QVariant::fromValue(map)));
    }

    //qDebug() << this->marks;
}

void backend::setTypeOfMark(int index, QString fullName)
{
    //Вытаскиваем название таблицы в БД из ComboBox
    switch (index) {
        case 0: this->typeOfMark = "zrd";
                break;
        case 1: this->typeOfMark = "chku";
            break;
        case 2: this->typeOfMark = "opozdal";
                break;
        case 3: this->typeOfMark = "vnesh_vid";
                break;
        case 4: this->typeOfMark = "sampod";
                break;
        case 5: this->typeOfMark = "ch_terr";
                break;
        case 6: this->typeOfMark = "chkv";
                break;
    }
    this->fullTypeOfMark = fullName;
    qDebug() << "selected " << this->fullTypeOfMark;
}

void backend::setMark(QString studentID, int mark)
{
    this->marks[studentID] = mark;
}

void backend::sendData()
{

    if(this->typeOfMark == "zrd" || this->typeOfMark == "opozdal" || this->typeOfMark == "vnesh_vid" || this->typeOfMark == "sampod")
        this->sendClassMarks();
    else if(this->typeOfMark != "ch_terr")
        sendRoomMarks();
}

void backend::sendClassMarks()
{
    int day = QDateTime::currentMSecsSinceEpoch() / (24 * 60 * 60 * 1000);
    QString VALUES = "VALUES ";
    QVariantMap::iterator vIT;
    for(vIT = this->marks.begin();vIT != this->marks.end(); vIT ++) {
        VALUES.append("(" + vIT.key() + ", ");
        VALUES.append(QString::number(day) + ", ");
        VALUES.append(vIT.value().toString() + "),");
    }
    int VALUESsize = VALUES.size() - 1;
    VALUES = VALUES.left(VALUESsize);

    QNetworkAccessManager *pManager = new QNetworkAccessManager(this);
    connect(pManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(slotSentClassMarks(QNetworkReply*)));
    QString requestAddress = this->IP + "/marking";
    QString params = "type=" + this->typeOfMark + "&";
    params.append("data=");
    params.append(VALUES);
    QNetworkRequest request(QUrl(requestAddress.toUtf8()));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    pManager->post(request, params.toUtf8());
}

void backend::slotSentClassMarks(QNetworkReply *reply)
{

    QString strReply(reply->readAll());
    qDebug() << strReply;
    QObject *listMain = mainQML->findChild<QObject *>("listMain");
    QMetaObject::invokeMethod(listMain, "closeProgram");
}

void backend::sendRoomMarks()
{
    int day = QDateTime::currentMSecsSinceEpoch() / (24 * 60 * 60 * 1000);
    QString VALUES;
    QVariantMap::iterator vIT;
    for(vIT = this->marks.begin();vIT != this->marks.end(); vIT ++) {
        VALUES.append(" (SELECT id, " + QString::number(day) + ", ");
        VALUES.append(vIT.value().toString() + " FROM students ");
        VALUES.append("WHERE room = " + vIT.key() + ") UNION");
    }
    int VALUESsize = VALUES.size() - 5;
    VALUES = VALUES.left(VALUESsize);

    QNetworkAccessManager *pManager = new QNetworkAccessManager(this);
    connect(pManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(slotSentClassMarks(QNetworkReply*)));
    QString requestAddress = this->IP + "/marking";
    QString params = "type=" + this->typeOfMark + "&";
    params.append("data=");
    params.append(VALUES);
    QNetworkRequest request(QUrl(requestAddress.toUtf8()));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    pManager->post(request, params.toUtf8());
}

void backend::getListOfRooms(int classID)
{
    QNetworkAccessManager *pManager = new QNetworkAccessManager(this);
    connect(pManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(slotGotListOfRooms(QNetworkReply*)));
    QString requestAddress = this->IP + "/listofrooms?id_class=" + QString::number(classID);
    QNetworkRequest request(QUrl(requestAddress.toUtf8()));
    pManager->get(request);

    QObject *titleListOfClassOrRooms = mainQML->findChild<QObject *>("titleListOfClassOrRooms");
    QMetaObject::invokeMethod(titleListOfClassOrRooms, "setTitle", Q_ARG(QVariant, QVariant("Список комнат")));
    QMetaObject::invokeMethod(titleListOfClassOrRooms, "setMarkTitle", Q_ARG(QVariant, QVariant("грязно")));
}

void backend::slotGotListOfRooms(QNetworkReply *reply)
{
    this->marks.clear();
    QObject *listOfClass = mainQML->findChild<QObject *>("listCheckBox");
    QString replyStr(reply->readAll());
    //qDebug() << replyStr << "list of class";
    QJsonDocument jsonDoc = QJsonDocument::fromJson(replyStr.toUtf8());
    QJsonArray jsonArr = jsonDoc.array();
    QVariantMap map;
    for(int i = 0; i < jsonArr.size(); i ++)
    {
        map = jsonArr.at(i).toObject().toVariantMap();
        this->marks[map["id"].toString()] = 0;
        QMetaObject::invokeMethod(listOfClass, "append", Q_ARG(QVariant, QVariant::fromValue(map)));
    }

}
