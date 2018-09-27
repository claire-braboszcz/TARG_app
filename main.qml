import QtQuick 2.9
import QtQuick.Controls 2.2


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("TARG")

    property string userID: "test1"

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        RecordNewSmoke {
            newSmokeButton.onClicked: {
                var http = new XMLHttpRequest()
                        var url = "https://targ.guakamole.org";
                        var params = "action=new_smoke&user=" + userID;
                        http.open("GET", url + "?" + params, true);

                        http.onreadystatechange = function() { // Call a function when the state changes.
                                    if (http.readyState === XMLHttpRequest.DONE) {
                                        if (http.status == 200) {
                                            console.log("ok: new smoke recorded")
                                        } else {
                                            console.log("error: " + http.status)
                                        }
                                    }
                                }
                        http.send();

            }

        }

        SmokingHistory {
            smokingHistoryButton.onClicked: {
                var http = new XMLHttpRequest()
                        var url = "https://targ.guakamole.org";
                        var params = "action=history&user=" + userID;
                        http.open("GET", url + "?" + params, true);

                        http.onreadystatechange = function() { // Call a function when the state changes.
                                    if (http.readyState === XMLHttpRequest.DONE) {
                                        if (http.status == 200) {
                                            var res = JSON.parse(http.responseText);
                                            console.log("ok: " + res)

                                            smokeHistory.clear();

                                            for (var key in res) {
                                                smokeHistory.append({"date": key, "nb_cigarettes": res[key]});
                                            }
                                            smokingHistoryGraph.visible = true;

                                        } else {
                                            console.log("error: " + http.status)
                                        }
                                    }
                                }
                        http.send();
            }
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Smoking habits")
        }
        TabButton {
            text: qsTr("My smoking history")
        }
    }
}
