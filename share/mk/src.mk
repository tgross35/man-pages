########################################################################
# Copyright 2021-2022, Alejandro Colomar <alx@kernel.org>
# SPDX-License-Identifier: GPL-3.0-or-later
########################################################################


ifndef MAKEFILE_SRC_INCLUDED
MAKEFILE_SRC_INCLUDED := 1


include $(MAKEFILEDIR)/cmd.mk


MANDIR := $(srcdir)
MANEXT := \.[0-9]\w*\(\.man\)\?\(\.in\)\?$


MANPAGES := $(shell $(FIND) $(MANDIR)/* -type f \
		| $(GREP) '$(MANEXT)' \
		| $(SORTMAN) \
		| $(SED) 's,:,\\:,g')


MANINTROPAGES := $(shell $(FIND) $(MANDIR)/* -type f \
		| $(GREP) '$(MANEXT)' \
		| $(GREP) '/intro$(MANEXT)' \
		| $(SORTMAN) \
		| $(SED) 's,:,\\:,g')


MAN1PAGES      := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man1/%,$(filter %.1,$(MANPAGES))))
MAN2PAGES      := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man2/%,$(filter %.2,$(MANPAGES))))
MAN2TYPEPAGES  := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man2type/%,$(filter %.2type,$(MANPAGES))))
MAN3PAGES      := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man3/%,$(filter %.3,$(MANPAGES))))
MAN3CONSTPAGES := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man3const/%,$(filter %.3const,$(MANPAGES))))
MAN3HEADPAGES  := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man3head/%,$(filter %.3head,$(MANPAGES))))
MAN3TYPEPAGES  := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man3type/%,$(filter %.3type,$(MANPAGES))))
MAN4PAGES      := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man4/%,$(filter %.4,$(MANPAGES))))
MAN5PAGES      := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man5/%,$(filter %.5,$(MANPAGES))))
MAN6PAGES      := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man6/%,$(filter %.6,$(MANPAGES))))
MAN7PAGES      := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man7/%,$(filter %.7,$(MANPAGES))))
MAN8PAGES      := $(filter-out $(MANINTROPAGES),$(filter $(MANDIR)/man8/%,$(filter %.8,$(MANPAGES))))


endif  # include guard
