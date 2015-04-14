import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Enterprise.Controls 1.2

Rectangle {
    anchors.fill: parent
    objectName: "mainReport"
    ComboBox {
        id: typeOfMarkingReports
        anchors.left: parent.left
        anchors.right: parent.right
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
    Text {
        id: simpleText
        objectName: "simpleText"
        anchors.top: typeOfMarkingReports.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        font.pointSize: 14;
    }

}

