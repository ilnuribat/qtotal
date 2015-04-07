import QtQuick 2.4
import QtQuick.Controls 1.3
import "QMLs"

ApplicationWindow {
    title: qsTr("Hello World")
    width: 480
    height: 800
    visible: true
    ToolBar {
        id: toolBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height / 10
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: height * 0.8
            text: "Welcome!"
        }
    }
    Loader {
        anchors.top: toolBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: "qrc:/QMLs/Welcome.qml"
    }

}
