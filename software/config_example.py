import scoring_rules
import datetime

# serial port paths
SERIAL_PORT_RFID_READER = "/dev/serial/by-id/usb-FTDI_FT232R_USB_UART_A400C02I-if00-port0"
SERIAL_PORT_TAG_HEUER_520 = "/dev/serial/by-id/usb-Prolific_Technology_Inc._USB-Serial_Controller_D-if00-port0"
SERIAL_PORT_LICENSE_SCANNER = "/dev/serial/by-id/usb-Hand_Held_Products_4600R_08056A1430-if00"

SCORING_RULES_CLASS = scoring_rules.BasicRules

DEFAULT_MAX_TIME_EVENTS = 20
DEFAULT_SEASON = "ORG_%04d"  % datetime.today().year
DEFAULT_ORGANIZATION = "Oregon Rally Group"

# database paths
SCORING_DB_PATH = "~/database/scoring_002.db"

# Flask/Jinja config
TEMPLATES_AUTO_RELOAD = True

# printer config
LABEL_PRINTER_NAME = "Zebra_TLP2844"