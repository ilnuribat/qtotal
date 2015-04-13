import QtQuick 2.0
import QtQuick.Controls 1.3

Rectangle {
    anchors.fill: parent
    color: "lightgray"
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

    Button {
        id: buttonShowMarks
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: buttonPutMarks.bottom
        anchors.leftMargin: parent.width * 0.1
        anchors.rightMargin: parent.width * 0.1
        anchors.topMargin: buttonPutMarks.height * 1.5
        height: buttonPutMarks.height
        Text {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 28
        }
        onClicked: {
            loader.setSource("qrc:/QMLs/showReports.qml")
        }
    }

}

