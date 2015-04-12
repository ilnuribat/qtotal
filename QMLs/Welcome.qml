import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    color: "lightgray"
    Rectangle {
    //Кнопка. отмечать.
        id: buttonPutMarks
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.1
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.1
        anchors.top: parent.top
        anchors.topMargin: parent.height / 5
        height: parent.height / 10
        color: "silver"
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 28
            text: "Отмечать"
        }
        MouseArea {
            anchors.fill: parent
            onPressed: buttonPutMarks.color = "green"
            onReleased: buttonPutMarks.color = "silver"
            onClicked: {
                loader.setSource("qrc:/QMLs/class.qml")
            }
        }
    }
}

