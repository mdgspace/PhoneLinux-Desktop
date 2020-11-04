from PySide2.QtCore import Slot
from PySide2.QtWidgets import *
import os
import platform
import subprocess


@Slot()
def restart_system():
    if restart_checkbox.isChecked():
        print('Restarting System')
        if platform.system() == "Linux":
            os.system("shutdown -t 1 -r -f")
        elif platform.system() == "Windows":
            os.system("shutdown /r /t 1")
    else:
        print('Restart not allowed')


@Slot()
def shutdown_system():
    if shutdown_checkbox.isChecked():
        print('Shutting down system')
        if platform.system() == "Linux":
            os.system("shutdown -t 1")
        elif platform.system() == "Windows":
            os.system("shutdown /t 1")
    else:
        print('Shutdown not allowed')


@Slot()
def get_all_processes():
    if get_processes_checkbox.isChecked():
        result = subprocess.run(['ps', '-aux'], stdout=subprocess.PIPE).stdout.decode(
            'utf-8')
        print(result)
    else:
        print('Getting processes not allowed')


app = QApplication([])  # Start an application.
window = QWidget()  # Create a window.
layout = QVBoxLayout()  # Create a layout.
layout.setMargin(50)
restart_button = QPushButton("Restart")
shutdown_button = QPushButton("Shutdown")
get_processes_button = QPushButton("Get Processes")
restart_button.clicked.connect(restart_system)
shutdown_button.clicked.connect(shutdown_system)
get_processes_button.clicked.connect(get_all_processes)
restart_checkbox = QCheckBox("Restart")
shutdown_checkbox = QCheckBox("Shutdown")
get_processes_checkbox = QCheckBox("Get Processes")
layout.addWidget(restart_checkbox)
layout.addWidget(restart_button)
layout.addWidget(shutdown_checkbox)
layout.addWidget(shutdown_button)
layout.addWidget(get_processes_checkbox)
layout.addWidget(get_processes_button)
window.setLayout(layout)
window.setWindowTitle('PhoneLinux App')
window.show()

if __name__ == '__main__':
    if os.path.isfile('PhoneLinux.cfg') and os.stat('PhoneLinux.cfg').st_size == 3:
        with open("PhoneLinux.cfg", "rb") as f:
            byte = f.read(1)
            restart_checkbox.setChecked(byte == b'\x01')
            byte = f.read(1)
            shutdown_checkbox.setChecked(byte == b'\x01')
            byte = f.read(1)
            get_processes_checkbox.setChecked(byte == b'\x01')
    else:
        restart_checkbox.setChecked(False)
        shutdown_checkbox.setChecked(False)
        get_processes_checkbox.setChecked(False)

    app.exec_()  # Execute the App
    restart_checkbox_byte = 1 if restart_checkbox.isChecked() else 0
    shutdown_checkbox_byte = 1 if shutdown_checkbox.isChecked() else 0
    get_processes_checkbox_byte = 1 if get_processes_checkbox.isChecked() else 0
    cfg_bytes = [restart_checkbox_byte, shutdown_checkbox_byte,
                 get_processes_checkbox_byte]
    cfg_file = open('PhoneLinux.cfg', "wb")
    cfg_file.write(bytearray(cfg_bytes))
