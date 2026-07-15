import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM
import org.kde.kquickcontrols as KQuickControls

KCM.SimpleKCM {
    id: root

    property alias cfg_useCustomColor: useCustomColorCheckbox.checked
    property alias cfg_fontColor: fontColorButton.color
    property alias cfg_fontSize: fontSizeSpinBox.value
    property alias cfg_useCustomFont: useCustomFontCheckbox.checked
    property string cfg_fontFamily
    property alias cfg_lineHeight: lineHeightSlider.value

    Kirigami.FormLayout {
        CheckBox {
            id: useCustomColorCheckbox
            Kirigami.FormData.label: "Custom Font Color:"
            text: "Use custom font color"
        }

        KQuickControls.ColorButton {
            id: fontColorButton
            Kirigami.FormData.label: "Font Color:"
            enabled: useCustomColorCheckbox.checked
        }

        SpinBox {
            id: fontSizeSpinBox
            Kirigami.FormData.label: "Font Size (px):"
            from: 0
            to: 200
            stepSize: 1
            // 0 means "Default" size (responsive gridUnit)
            textFromValue: function(value, locale) {
                if (value === 0) {
                    return "Default";
                }
                return value;
            }
            valueFromText: function(text, locale) {
                if (text === "Default") {
                    return 0;
                }
                return parseInt(text);
            }
        }

        RowLayout {
            id: lineHeightRow
            Kirigami.FormData.label: "Number Spacing:"
            Slider {
                id: lineHeightSlider
                from: 0.5
                to: 2.0
                stepSize: 0.05
            }
            Label {
                text: (lineHeightSlider.value * 100).toFixed(0) + "%"
            }
        }

        CheckBox {
            id: useCustomFontCheckbox
            Kirigami.FormData.label: "Custom Font Family:"
            text: "Use custom font family"
        }

        ComboBox {
            id: fontFamilyComboBox
            Kirigami.FormData.label: "Font Family:"
            enabled: useCustomFontCheckbox.checked
            model: Qt.fontFamilies().sort()
            editable: true

            Component.onCompleted: {
                currentIndex = model.indexOf(root.cfg_fontFamily)
            }

            onActivated: {
                root.cfg_fontFamily = currentText
            }

            onEditTextChanged: {
                if (activeFocus && model.indexOf(editText) !== -1) {
                    root.cfg_fontFamily = editText
                }
            }

            Connections {
                target: root
                function onCfg_fontFamilyChanged() {
                    fontFamilyComboBox.currentIndex = fontFamilyComboBox.model.indexOf(root.cfg_fontFamily)
                }
            }
        }
    }
}
