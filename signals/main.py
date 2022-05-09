# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
import datetime

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.counter())
        self.timer.start(5)

    # Signals
    manualCounter = Signal(str)
    autoCounter = Signal(str)

    # Variables
    count = 0
    two_count = 0
    

    def counter(self):
        self.count += 1
        self.autoCounter.emit(str(self.count))

    @Slot(str)
    def manual_counter(self, front_message):
        print(front_message)
        self.two_count += 1
        self.manualCounter.emit(str(self.two_count))


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    backend = MainWindow()
    engine.rootContext().setContextProperty("backend", backend)

    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
