import QtQuick
import QtQuick.Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.clock as PlasmaClock
import org.kde.kirigami as Kirigami

PlasmoidItem {
    id: root

    PlasmaClock.Clock {
        id: clock
        trackSeconds: false
    }

    toolTipMainText: Qt.formatDate(clock.dateTime, Locale.LongFormat)
    toolTipSubText: ""

    Layout.minimumWidth: Math.max(Kirigami.Units.gridUnit * 1.5, label.implicitWidth + 4)
    Layout.minimumHeight: Math.max(Kirigami.Units.gridUnit * 3.25, label.implicitHeight + 4)
    Layout.preferredWidth: Layout.minimumWidth
    Layout.preferredHeight: Layout.minimumHeight

    PlasmaComponents.Label {
        id: label
        text: {
            var d = clock.dateTime;
            var hours = d.getHours().toString().padStart(2, "0");
            var minutes = d.getMinutes().toString().padStart(2, "0");
            return hours + "\n" + minutes;
        }
        anchors.centerIn: parent
        font.pixelSize: Plasmoid.configuration.fontSize > 0 ? Plasmoid.configuration.fontSize : Kirigami.Units.gridUnit
        font.family: Plasmoid.configuration.useCustomFont && Plasmoid.configuration.fontFamily !== "" ? Plasmoid.configuration.fontFamily : ""
        color: Plasmoid.configuration.useCustomColor ? Plasmoid.configuration.fontColor : Kirigami.Theme.textColor
        lineHeight: Plasmoid.configuration.lineHeight
        lineHeightMode: Text.ProportionalHeight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
