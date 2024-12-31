import sys
from PyQt6.QtWidgets import QApplication, QPushButton, QWidget
from PyQt6.QtCore import Qt


class FullScreenWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Full Screen App")

        # Create a button and set its size
        self.button = QPushButton("NEW Release", self)
        self.button.resize(200, 100)  # Resize the button (width, height)
        self.button.move(100, 100)  # Position the button (x, y)

    def keyPressEvent(self, event):
        if event.key() == Qt.Key_C and event.modifiers() == Qt.KeyboardModifier.ControlModifier:
            self.close()  # Close the application


app = QApplication(sys.argv)
window = FullScreenWindow()

# Make the window full screen
window.showFullScreen()

window.show()
app.exec()
