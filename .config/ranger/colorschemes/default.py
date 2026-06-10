#!/usr/bin/python
#
#
# ██████╗  █████╗ ███╗   ██╗ ██████╗ ███████╗██████╗ 
# ██╔══██╗██╔══██╗████╗  ██║██╔════╝ ██╔════╝██╔══██╗
# ██████╔╝███████║██╔██╗ ██║██║  ███╗█████╗  ██████╔╝
# ██╔══██╗██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██╗
# ██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║
# ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
#
from __future__ import (absolute_import, division, print_function)
from ranger.colorschemes.default import Default
from ranger.gui.color import red, green, yellow, blue, magenta, cyan, white

class Scheme(Default):
    progress_bar_color = yellow

    def use(self, context):
        fg, bg, attr = Default.use(self, context)
        # Folder
        if context.directory and not context.inactive_pane:
            fg = green
            return fg, bg, attr
        # Video
        if context.video:
            fg = cyan
            return fg, bg, attr
        # Image
        if context.image:
            fg = yellow
            return fg, bg, attr
        # EXE/SH
        if context.executable and not context.directory:
            fg = magenta
            return fg, bg, attr
        # Symlinks
        if context.link:
            fg = blue
            return fg, bg, attr
        # Text/Other
        if not context.directory:
            fg = white
        # Titel
        if context.in_titlebar and context.hostname:
            fg = red
        # Status
        if context.in_statusbar:
            if context.good:
                fg = green
            elif context.bad:
                fg = red
        # Border
        if context.border:
            fg = green

        return fg, bg, attr
#
#
#