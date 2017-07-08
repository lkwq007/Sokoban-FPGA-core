TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)
COCOTB=$(PWD)/../cocotb
TOPDIR=$(PWD)/../../src
ifeq ($(OS),Msys)
WPWD=$(shell sh -c 'pwd -W')
PYTHONPATH := $(WPWD);$(PYTHONPATH)
else
WPWD=$(shell pwd)
PYTHONPATH := $(WPWD):$(PYTHONPATH)
endif

VERILOG_SOURCES = $(TOPDIR)/game_core.v
VERILOG_SOURCES += $(TOPDIR)/game_controller.v
VERILOG_SOURCES += $(TOPDIR)/game_dffre.v
VERILOG_SOURCES += $(TOPDIR)/game_init.v
VERILOG_SOURCES += $(TOPDIR)/game_man_move.v
VERILOG_SOURCES += $(TOPDIR)/game_mux_4.v
VERILOG_SOURCES += $(TOPDIR)/game_retract.v
VERILOG_SOURCES += $(TOPDIR)/game_stage_counter.v

TOPLEVEL = game_core
MODULE = test_game_core

VSIM_ARGS=-t 1ps

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim