import QtQuick
import Quickshell
import qs.Commons
import qs.Services.UI
import qs.Widgets

NIconButton {
  id: root

  property var pluginApi: null

  property ShellScreen screen
  property string widgetId: ""
  property string section: ""
  property int sectionWidgetIndex: -1
  property int sectionWidgetsCount: 0

  property var cfg: pluginApi?.pluginSettings || ({})
  property var defaults: pluginApi?.manifest?.metadata?.defaultSettings || ({})

  readonly property string iconColorKey: cfg.iconColor ?? defaults.iconColor

  icon: "camera-video"
  tooltipText: pluginApi?.tr("widget.tooltip")
  tooltipDirection: BarService.getTooltipDirection(screen?.name)
  baseSize: Style.getCapsuleHeightForScreen(screen?.name)
  applyUiScale: false
  customRadius: Style.radiusL
  colorBg: Style.capsuleColor

  property bool blinkState: false
  
  Timer {
    interval: 500
    running: pluginApi?.mainInstance?.isRecording || false
    repeat: true
    onTriggered: root.blinkState = !root.blinkState
    onRunningChanged: if (!running) root.blinkState = false
  }

  colorFg: pluginApi?.mainInstance?.isRecording ? (root.blinkState ? Color.mError : Style.capsuleColor) : Color.resolveColorKey(iconColorKey)

  border.color: Style.capsuleBorderColor
  border.width: Style.capsuleBorderWidth

  NPopupContextMenu {
    id: contextMenu

    model: pluginApi?.mainInstance?.isRecording ? [
      {
        "label": pluginApi?.mainInstance?.formattedTime || "00:00",
        "action": "stop_recording",
        "icon": "stop"
      }
    ] : [
      {
        "label": pluginApi?.tr("menu.record_with_sound"),
        "action": "record_with_sound",
        "icon": "microphone"
      },
      {
        "label": pluginApi?.tr("menu.record_without_sound"),
        "action": "record_without_sound",
        "icon": "microphone-off"
      }
    ]

    onTriggered: function (action) {
      contextMenu.close();
      PanelService.closeContextMenu(root.screen);
      
      if (action === "record_with_sound") {
        pluginApi?.mainInstance?.startRecording(true);
      } else if (action === "record_without_sound") {
        pluginApi?.mainInstance?.startRecording(false);
      } else if (action === "stop_recording") {
        pluginApi?.mainInstance?.stopRecording();
      }
    }
  }

  onClicked: {
    PanelService.showContextMenu(contextMenu, root, root.screen);
  }

  NPopupContextMenu {
    id: rightClickMenu

    model: [
      {
        "label": pluginApi?.tr("menu.settings") || "Settings",
        "action": "settings",
        "icon": "settings"
      }
    ]

    onTriggered: function (action) {
      rightClickMenu.close();
      PanelService.closeContextMenu(root.screen);
      if (action === "settings") {
        BarService.openPluginSettings(root.screen, pluginApi.manifest);
      }
    }
  }

  onRightClicked: {
    if (pluginApi?.mainInstance?.isRecording) {
      pluginApi?.mainInstance?.stopRecording();
    } else {
      PanelService.showContextMenu(rightClickMenu, root, root.screen);
    }
  }
}
