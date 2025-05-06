import gi
gi.require_version("Gtk", "4.0")
from gi.repository import Gtk
from app.logicController import LogicController

class WindowHandler(Gtk.Application):
    def __init__(self):
        super().__init__(application_id="de.berufsschule.mes")
        self.controller = LogicController()

    def do_activate(self):
        builder = Gtk.Builder()
        builder.add_from_file("ui/produktionslinienauswahl.ui")
        self.main_window = builder.get_object("main_window")
        self.main_window.set_application(self)

        # Button-Handler setzen
        neuer_auftrag_btn = builder.get_object("btn_neuer_auftrag")
        neue_linie_btn = builder.get_object("btn_neue_linie")

        neuer_auftrag_btn.connect("clicked", self.controller.open_neuer_auftrag)
        neue_linie_btn.connect("clicked", self.controller.open_neue_linie)

        self.main_window.present()

