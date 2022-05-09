import QtQuick 2.0
import QtQuick.Controls 2.15

Item {

    Label {
        id: manualCounter
        x: 321
        y: 221
        width: 183
        height: 38
        text: qsTr("0")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.pointSize: 16
    }

    Button {
        id: button
        x: 151
        y: 221
        width: 149
        height: 38
        text: qsTr("Button")
        font.pointSize: 14
        font.bold: true
        onClicked: {
            backend.manual_counter("Ручной счётчик +1")
        }
    }

    Label {
        id: autoCounter
        x: 321
        y: 265
        width: 183
        height: 38
        text: qsTr("0")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 16
        font.bold: true
    }

    Label {
        id: label2
        x: 151
        y: 265
        width: 149
        height: 38
        text: qsTr("Counter")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.pointSize: 14
    }

    Connections {
        target: backend

        function onManualCounter(value){
            manualCounter.text = value
        }

        function onAutoCounter(value){
            autoCounter.text = value
        }
    }

}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4}
}
##^##*/
