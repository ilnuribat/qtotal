#include "backend.h"

backend::backend(QQuickItem *parent)
    : QQuickItem(parent)
{
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    engine.rootContext()->setContextProperty("backend", this);
    mainQML = engine.rootObjects().value(0);
    this->IP = "http://localhost";
}

void backend::getListOfClass(int classID)
{
    QNetworkAccessManager *pManager = new QNetworkAccessManager(this);
    connect(pManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(slotGotListOfClass(QNetworkReply*)));
    QString requestAddress = this->IP + "/listofclass?id_class=" + QString::number(classID);
    QNetworkRequest request(QUrl(requestAddress.toUtf8()));
    pManager->get(request);
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

void backend::setTypeOfMark(int index)
{
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
    qDebug() << "selected " << this->typeOfMark;
}

void backend::setMark(QString studentID, int mark)
{
    this->marks[studentID] = mark;
}
