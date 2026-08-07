import QtQuick 2.15
import QtQuick.Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents
import org.kde.kirigami as Kirigami

PlasmoidItem {
    id: root
    toolTipMainText: i18n("This is %1", Plasmoid.title)

    Layout.minimumWidth: Kirigami.Units.gridUnit * 1.5
    Layout.minimumHeight: Kirigami.Units.gridUnit * 3.25

    PlasmaComponents.Label {
        id: label
        text: "Loading..."
        anchors.centerIn: parent
        font.pixelSize: Plasmoid.configuration.fontSize > 0 ? Plasmoid.configuration.fontSize : Kirigami.Units.gridUnit
        font.family: Plasmoid.configuration.useCustomFont && Plasmoid.configuration.fontFamily !== "" ? Plasmoid.configuration.fontFamily : ""
        color: Plasmoid.configuration.useCustomColor ? Plasmoid.configuration.fontColor : undefined
        lineHeight: Plasmoid.configuration.lineHeight
        lineHeightMode: Text.ProportionalHeight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Timer {
        id: timer
        interval: 10000
        running: true
        repeat: true
        onTriggered: updateTime()
    }

    Component.onCompleted: {
        updateTime();
        timer.start();
    }

    function updateTime() {
        var currentDateTime = new Date();
        var hours = currentDateTime.getHours().toString().padStart(2, '0');
        var minutes = currentDateTime.getMinutes().toString().padStart(2, '0');
        label.text = hours + "\n" + minutes;
    }
}
