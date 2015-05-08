import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import "QMLs"

ApplicationWindow {
    title: qsTr("Total Control")
    width: 300
    height: 500
    visible: true

    Loader {
        id: loader
        anchors.fill: parent
        source: "qrc:/QMLs/class.qml"
    }

}
