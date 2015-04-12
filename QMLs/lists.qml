import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

Rectangle {
    anchors.fill: parent
    id: listMain
    color: "silver"
    //Получить, распарсить список учащихся
    //вывести учащихся
    //после каждой фамилии_имени поставить ChekBox
    //данные компоновать, отправлять на сервер
    ListView {
        //Тут типо список будет
        id: listCheckBox
        objectName: "listCheckBox"
        anchors.left: parent.left
        anchors.top: titleListOfClassOrRooms.bottom
        anchors.right: parent.right
        anchors.bottom: sendData.top
        model: ListModel {}

        delegate: Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            color: markedStudent.checked ? "lightgreen" : "silver"
            height: 17 * (25.4 / 72) * Screen.pixelDensity
            Rectangle {
                id: name_surnameText
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 20
                height: parent.height
                width: parent.width * 0.85
                color: parent.color

                Text {
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: height * 0.95
                    text: name
                }
                Text {
                    //Это чисто для ID, чтобы в базу легче было закидывать
                    id: idOfStudent
                    text: id
                    visible: false
                }
            }
            Rectangle {
                anchors.left: name_surnameText.right
                anchors.right: parent.right
                height: name_surnameText.height
                color: parent.color
                CheckBox {
                    id: markedStudent
                    anchors.centerIn: parent
                    onClicked: {
                        console.log(id, " : ", (markedStudent.checked ? 1 : 0));
                        backend.setMark(id, (markedStudent.checked ? 1 : 0))
                    }

                }
            }
        }
        function append(newElement) {
            listCheckBox.model.append(newElement)
        }
        function clearList() {
            listCheckBox.model.clear();
        }
    }

    Rectangle {
        id: titleListOfClassOrRooms
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        height: parent.height / 10
        border.width: 1
        color: "lightgray"
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 28
            text: "Список класса"
        }
    }

    Rectangle {
        //Отправить данные на сервер
        id: sendData
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        //anchors.leftMargin: parent.width / 20
        //anchors.rightMargin: parent.width / 20
        //anchors.bottomMargin: parent.width / 20
        height: parent.height / 10
        border.width: 1
        color: "lightgray"
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 28
            text: "Отправить!"
        }
        MouseArea {
            anchors.fill: parent

            onPressed: parent.color = "green"
            onReleased: parent.color = "lightgray"
            onClicked: {
                backend.sendData();
            }
        }
    }
}

