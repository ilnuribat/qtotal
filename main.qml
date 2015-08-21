import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import "QMLs"

ApplicationWindow {
    id: rootApp
    objectName: "rootApp"
    title: qsTr("Total Control")
    property int aWidth: 480
    property int aHeight: 800
    property string backGroundColor: "#FFC107"
    property string otherColor: "#9c27b0"
    property string menuColor: "#ededed"
    width: aWidth
    height: aHeight
    visible: true

    Loader {
        id: loader
        objectName: "loader"
        anchors.fill: parent
        focus: true
        onLoaded: {
            if(loader.source == "qrc:/QMLs/Welcome.qml") {
                welcome.loaded();
            }
            if(loader.source == "qrc:/QMLs/Home.qml") {
                home.loaded();
            }
            if(loader.source == "qrc:/QMLs/Lists.qml")
                list.loaded();
        }
        onFocusChanged: console.log("focus", focus);
        Keys.onReleased: {
            if (event.key === Qt.Key_Back) {
                console.log("Back button captured - wunderbar !")
                event.accepted = true
            }
        }
    }
}
