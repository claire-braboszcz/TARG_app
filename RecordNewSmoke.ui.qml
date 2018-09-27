import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 600
    height: 400
    property alias newSmokeButton: newSmokeButton

    header: Label {
        text: qsTr("Smoking habits")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

        Button {

            id: newSmokeButton

            anchors.centerIn: parent

            text: qsTr("I just smoked a cigarette")


    }

}
