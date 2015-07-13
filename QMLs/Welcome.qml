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

    Rectangle {
        id: toLeft
        x: 0
        y: 0
        height: 50
        width: 50
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log(sideBar.x)
                if(sideBar.x < 0) {
                    mainLocalRect.opacity = 0.5
                    aRight.start()
                }
                else {
                    mainLocalRect.opacity = 1.0
                    aLeft.start()
                }
            }
        }
        color: "green"
    }

    Rectangle {
        id: sideBar
        y: 50
        width: 200
        x: -width
        height: parent.height - y
        color: "white"

        NumberAnimation on x {
            id: aRight
            to: 0
            running: false
            easing.type: Easing.InOutQuad;
        }
        NumberAnimation on x {
            id: aLeft
            to: -width
            running: false
            easing.type: Easing.InOutQuad;
        }
    }
}

