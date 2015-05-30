import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 1024
    height: 480

    Rectangle {
        id: topBar
        height: 40
        color: "#a51e9e"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Button {
            id: newShare
            text: qsTr("New share")
            iconSource: "plus.png"
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left;
        }

        Image {
            id: arboreLogo
            width: 100
            fillMode: Image.PreserveAspectFit
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            source: "arbore.png"
        }

        TextField {
            id: textInput1
            y: 12
            height: 20
            placeholderText: qsTr("Search")
            anchors.right: parent.right
            anchors.rightMargin: third.width
            anchors.left: parent.left
            anchors.leftMargin: menu.width
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
            style: TextFieldStyle {
                    textColor: "black"
                    background: Rectangle {
                        radius: 10
                        implicitWidth: 100
                        implicitHeight: 24
                        border.color: "#333"
                        border.width: 2
                    }
                }
        }
    }


    SplitView {
        id: splitView1
        anchors.topMargin: 40
        anchors.fill: parent
        orientation: Qt.Horizontal

        Loader {
            id: menu
            source: "menu.qml"
            Layout.minimumWidth: 200
        }

        Loader {
            id: second
            source: "shareList.qml"
            Layout.minimumWidth: 400
        }

        Rectangle {
            id: third
            color: "yellow"
            Layout.minimumWidth: 400
        }


    }
}
