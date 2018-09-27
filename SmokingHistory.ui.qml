import QtQuick 2.9
import QtQuick.Controls 2.2
import QtDataVisualization 1.2


Page {
    width: 600
    height: 400

    property alias smokingHistoryButton: smokingHistoryButton
    property alias smokeHistory: smokeHistory
    property alias smokingHistoryGraph: smokingHistoryGraph

    header: Label {
        text: qsTr("Smoking history")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }


    Button {
        id: smokingHistoryButton
        anchors.centerIn: parent
        text: qsTr("Get my smoking history")
    }

    Bars3D {
        id: smokingHistoryGraph
            visible: false
            width: parent.width
            height: parent.height
            barThickness: 2
            orthoProjection: true

            Bar3DSeries {
                itemLabelFormat: "@colLabel, @rowLabel: @valueLabel"

                ItemModelBarDataProxy {
                    itemModel: smokeHistory
                    // Mapping model roles to bar series rows, columns, and values.
                    rowRole: "date"
                    columnRole: "none"
                    valueRole: "nb_cigarettes"

                }
            }
        }

        ListModel {
            id: smokeHistory
        }
}
