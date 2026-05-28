import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons

Item {
  id: root
  property var pluginApi: null

  property bool isRecording: recordProcess.running
  property int recordingSeconds: 0
  
  property string formattedTime: {
    let minutes = Math.floor(recordingSeconds / 60);
    let seconds = recordingSeconds % 60;
    return (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
  }

  Timer {
    interval: 1000
    repeat: true
    running: root.isRecording
    onTriggered: root.recordingSeconds++
  }

  property Process recordProcess: Process {
    id: process
    command: []
    running: false
  }

  property var cfg: pluginApi?.pluginSettings || ({})
  property var defaults: pluginApi?.manifest?.metadata?.defaultSettings || ({})
  
  property string cmdWithSound: cfg.cmdWithSound ?? defaults.cmdWithSound ?? "screenrec -- -oi -f 144"
  property string cmdWithoutSound: cfg.cmdWithoutSound ?? defaults.cmdWithoutSound ?? "screenrec -- -o -f 144"
  property string cmdStop: cfg.cmdStop ?? defaults.cmdStop ?? "screenrec -- -s"

  function startRecording(withSound) {
    if (isRecording) return;
    
    recordingSeconds = 0;

    if (withSound) {
      process.command = ["sh", "-c", root.cmdWithSound];
    } else {
      process.command = ["sh", "-c", root.cmdWithoutSound];
    }
    
    process.running = true;
  }

  function stopRecording() {
    if (!isRecording) return;
    Quickshell.execDetached(["sh", "-c", root.cmdStop]);
  }
}
