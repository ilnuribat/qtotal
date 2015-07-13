import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

Rectangle {
    anchors.fill: parent
    id: mainLocalRect
    color: "gray"
    Button  {
    //Кнопка. отмечать.
        id: buttonPutMarks
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.1
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.1
        anchors.top: parent.top
        anchors.topMargin: parent.height / 5
        height: parent.height / 10
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 28
            text: "Отмечать"
        }
        onClicked: {
            loader.setSource("qrc:/QMLs/class.qml")
        }
    }

    SideMenu {
        id: sideMenu
    }

    Rectangle {
        id: toLeft
        x: 0
        y: 0
        height: 50
        width: 50
        color: "green"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log(sideMenu.x)
                if(sideMenu.x < 0) {
                    mainLocalRect.opacity = 0.5
                    sideMenu.aRight();
                }
                else {
                    mainLocalRect.opacity = 1.0
                    sideMenu.aLeft();
                }
            }
        }
    }

}

