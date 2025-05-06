import gi
gi.require_version("Gtk", "4.0")
from gi.repository import Gtk

class LogicController:
    def open_neuer_auftrag(self, button):
        builder = Gtk.Builder()
        builder.add_from_file("ui/popup_neuerProduktionsAuftrag.ui")
        popup = builder.get_object("neuer_auftrag_popup")
        popup.show()

    def open_neue_linie(self, button):
        builder = Gtk.Builder()
        builder.add_from_file("ui/popup_neueProduktionslinie.ui")
        popup = builder.get_object("neue_linie_popup")
        popup.show()

