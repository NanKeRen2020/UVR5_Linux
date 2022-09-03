from pathlib import Path

inited = False
root = None


def init(func):
    def wrapper(*args, **kwargs):
        global inited
        global root

        if not inited:
            from tkinter import _default_root

            path = (Path(__file__).parent / "sun-valley.tcl").resolve()

            try:
                _default_root.tk.call("source", str(path))
            except AttributeError:
                raise RuntimeError(
                    "can't set theme. "
                    "Tk is not initialized. "
                    "Please first create a tkinter.Tk instance, then set the theme."
                ) from None
            else:
                inited = True
                root = _default_root

        return func(*args, **kwargs)

    return wrapper


@init
def set_theme(theme):
    if theme not in {"dark", "light"}:
        raise RuntimeError(f"not a valid theme name: {theme}")

    root.tk.call("set_theme", theme)


@init
def get_theme():
    theme = root.tk.call("ttk::style", "theme", "use")

    try:
        return {"sun-valley-dark": "dark", "sun-valley-light": "light"}[theme]
    except KeyError:
        return theme


@init
def toggle_theme():
    if get_theme() == "dark":
        use_light_theme()
    else:
        use_dark_theme()


use_dark_theme = lambda: set_theme("dark")
use_light_theme = lambda: set_theme("light")
