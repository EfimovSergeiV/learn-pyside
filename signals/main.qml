import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    id: mainwindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item {
        id: main
        width: mainwindow.width
        height: mainwindow.height

        StackView {
            id: stackView
            anchors.fill: parent
            initialItem: Qt.resolvedUrl("page.qml")
            pushEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 100
                }
            }
            pushExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 100
                }
            }
            popEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 100
                }
            }
            popExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 100
                }
            }
        }
    }
}

