import QtQuick 2.7
import rolevax.sakilogy 1.0
import "../widget"

Room {
    showReturnButton: false

    Row {
        anchors.centerIn: parent
        spacing: global.size.space

        Buxxon {
            id: kickFloor
            text: "踩地板"
            textLength: 14
            enabled: PClient.loggedIn
            onClicked: {
                global.pushScene("room/RoomClient");
            }
        }

        Item {
            width: miscRow.width
            height: kickFloor.height

            Row {
                id: miscRow
                anchors.top: parent.top
                spacing: global.size.space

                Repeater {
                    model: [
                        { text: "麻将部备品", load: "Tools" },
                        { text: "设置", load: "Settings" }
                    ]

                    delegate: Buxxon {
                        text: modelData.text
                        textLength: 7
                        onClicked: {
                            global.pushScene("room/Room" + modelData.load);
                        }
                    }
                }

                Buxxon {
                    text: "骑马"
                    textLength: 7
                    onClicked: { Qt.quit(); }
                }
            }

            Buxxon {
                width: parent.width
                anchors.top: miscRow.bottom
                anchors.topMargin: global.size.space
                height: kickFloor.height - miscRow.height - global.size.space
                text: "松饼社区主站"
                onClicked: {
                    Qt.openUrlExternally("https://mjpancake.github.io/");
                }
            }
        }
    }
}
