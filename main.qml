import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import "QMLs"

ApplicationWindow {
    id: rootApp
    title: qsTr("Total Control")
    property int aWidth: 300
    property int aHeight: 500
    width: aWidth
    height: aHeight
    visible: true

    Loader {
        id: loader
        anchors.fill: parent
        source: "qrc:/QMLs/Welcome.qml"
        onLoaded: {
            //backend.qmlLoaded(loader.source);
        }
    }
}
