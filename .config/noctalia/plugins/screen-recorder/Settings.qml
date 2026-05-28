import QtQuick
import QtQuick.Layouts
import qs.Commons
import qs.Widgets

ColumnLayout {
  id: root
  property var pluginApi: null

  property var cfg: pluginApi?.pluginSettings || ({})
  property var defaults: pluginApi?.manifest?.metadata?.defaultSettings || ({})

  property string editCmdWithSound: cfg.cmdWithSound ?? defaults.cmdWithSound ?? ""
  property string editCmdWithoutSound: cfg.cmdWithoutSound ?? defaults.cmdWithoutSound ?? ""
  property string editCmdStop: cfg.cmdStop ?? defaults.cmdStop ?? ""

  spacing: Style.marginL

  NTextInput {
    Layout.fillWidth: true
    label: pluginApi?.tr("settings.cmdWithSound.label")
    description: pluginApi?.tr("settings.cmdWithSound.desc")
    text: root.editCmdWithSound
    onTextChanged: root.editCmdWithSound = text
  }

  NTextInput {
    Layout.fillWidth: true
    label: pluginApi?.tr("settings.cmdWithoutSound.label")
    description: pluginApi?.tr("settings.cmdWithoutSound.desc")
    text: root.editCmdWithoutSound
    onTextChanged: root.editCmdWithoutSound = text
  }

  NTextInput {
    Layout.fillWidth: true
    label: pluginApi?.tr("settings.cmdStop.label")
    description: pluginApi?.tr("settings.cmdStop.desc")
    text: root.editCmdStop
    onTextChanged: root.editCmdStop = text
  }

  function saveSettings() {
    if (!pluginApi) return;
    pluginApi.pluginSettings.cmdWithSound = root.editCmdWithSound;
    pluginApi.pluginSettings.cmdWithoutSound = root.editCmdWithoutSound;
    pluginApi.pluginSettings.cmdStop = root.editCmdStop;
    pluginApi.saveSettings();
  }
}
