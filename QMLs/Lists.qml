import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import Material 0.1 as Material

Rectangle {
    //anchors.fill: parent
    width: 480
    height: 800
    id: listMain
    objectName: "listMain"
    color: rootApp.backGroundColor
    //Получить, распарсить список учащихся
    //вывести учащихся
    //после каждой фамилии_имени поставить ChekBox
    //данные компоновать, отправлять на сервер
    ListView {
        //Тут типо список будет
        id: listCheckBox
        objectName: "listCheckBox"
        anchors {
            left: parent.left
            top: titleListOfClassOrRooms.bottom
            right: parent.right
            bottom: sendData.top
        }

        model: ListModel {}
        delegate: Rectangle {
            id: name_surnameText
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 20
            height: markedStudent.height
            width: parent.width
            color: rootApp.backGroundColor
            Material.CheckBox {
                id: markedStudent
                //anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                //anchors.left: parent.left
                checked: checkBoxStatus.text == "0" ? Qt.Unchecked : Qt.Checked
                onClicked: {
                    //backend.setMark(id, (markedStudent.checked ? 1 : 0))
                }
            }
            Text {
                anchors.fill: parent
                anchors.leftMargin: name_surnameText.width * 0.1
                verticalAlignment: Text.AlignTop
                font.pixelSize: name_surnameText.height * 0.8
                text: name
            }
            Text {
                //Это чисто для ID, чтобы в базу легче было закидывать
                id: idOfStudent
                text: id
                visible: false
            }
            Text {
                //Это для метки состояния CheckBox
                id: checkBoxStatus
                text: marked
                visible: false
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    markedStudent.checked = (markedStudent.checked == true ? false : true);
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
        objectName: "titleListOfClassOrRooms"
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }
        height: parent.height * 0.06
        color: rootApp.menuColor

        Text {
            id:  titleMarkingType
            anchors {
                fill: parent
                leftMargin: parent.width * 0.05
            }

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: height * 0.6
            text: "Список класса"
        }
        Text {
            id: titleListOf
            anchors.fill: parent
            anchors.rightMargin: parent.width * 0.05
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            text: "чисто"
        }
        function setTitle(list) {
            titleListOf.text = list;
        }
        function setMarkTitle(name) {
            titleMarkingType.text = name;
        }

    }

}

