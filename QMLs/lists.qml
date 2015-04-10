import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    color: "silver"
    //Получить, распарсить список учащихся
    //вывести учащихся
    //после каждой фамилии_имени поставить ChekBox
    //данные компоновать, отправлять на сервер
    Rectangle {
        id: titleListOfClassOrRooms
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        height: parent.height / 15
        color: "gray"
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: height * 0.8
            text: "Список класса"
        }
    }
    ListView {
        //Тут типо список будет
        id: listCheckBox
        anchors.left: parent.left
        anchors.top: titleListOfClassOrRooms.bottom
        anchors.right: parent.right
        anchors.bottom: sendData.top
    }

    Rectangle {
        //Отправить данные на сервер
        id: sendData
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: parent.width / 20
        anchors.rightMargin: parent.width / 20
        anchors.bottomMargin: parent.width / 20
        height: parent.height / 15
        color: "lightgray"
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: height * 0.8
            text: "Отправить!"
        }
        MouseArea {
            anchors.fill: parent

            onPressed: parent.color = "green"
            onReleased: parent.color = "lightgray"
            onClicked: Qt.quit()
        }
    }
}

