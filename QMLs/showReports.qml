import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Window 2.0

Rectangle {
    anchors.fill: parent
    objectName: "mainReport"
    color: "silver"
    ComboBox {
        id: typeOfMarkingReports
        anchors.left: parent.left
        width: chooseClassBox.visible == true ? parent.width * 0.7 : parent.width * 0.9
        anchors.top: parent.top
        height: parent.height * 0.1
        anchors.leftMargin: parent.width * 0.05
        anchors.rightMargin: parent.width * 0.05
        anchors.topMargin: parent.height * 0.04
        model: ["Утренняя зарядка", "Чистота комнат утром", "Опаздания", "Внешний вид", "Сампод",
            "Чистота территории", "Чистота комнат вечером"]
        onCurrentIndexChanged: {
            backend.setTypeOfMark(currentIndex, currentText)
            backend.getDayReport();
        }
    }
    ComboBox {
        id: chooseClassBox
        anchors.left: typeOfMarkingReports.right
        anchors.top: parent.top
        anchors.right: parent.right
        height: typeOfMarkingReports.height
        anchors.rightMargin: typeOfMarkingReports.anchors.rightMargin
        anchors.topMargin: parent.height * 0.04
        model: ["7А", "7Б", "7В", "8А", "8Б", "8В", "9А", "9Б", "9В", "10А", "10Б", "10В", "11А", "11Б", "11В"]
        visible: false
    }
    ListView {
        id: listReport
        objectName: "listReport"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: typeOfMarkingReports.bottom
        anchors.margins: parent.width * 0.03
        model: ListModel{}
        delegate: Rectangle {
           anchors.left: parent.left
           anchors.right: parent.right
           height: 20 * (25.4 / 72) * Screen.pixelDensity
           Text {
               anchors.fill: parent
               horizontalAlignment: Text.AlignLeft
               verticalAlignment: Text.AlignVCenter
               text: name
               font.pixelSize: height * 0.9
           }
           Text {
               anchors.fill: parent
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
               font.pixelSize: height * 0.9
               text: percentage
           }
        }
        function append(newElement) {
            listReport.model.append(newElement);
        }
        function clear() {
            listReport.model.clear();
        }
    }
}

