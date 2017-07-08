import cocotb
from cocotb.decorators import coroutine
from cocotb.triggers import Timer, RisingEdge, ReadOnly
from cocotb.monitors import Monitor
from cocotb.drivers import BitDriver
from cocotb.binary import BinaryValue
from cocotb.regression import TestFactory
from cocotb.scoreboard import Scoreboard
from cocotb.result import TestFailure, TestSuccess
import random
#from Tkinter import *
# using cocotb with iverilog (modelsim can also work) 
def key(event):
	return event
def lmouse_callback(event):
	return event
def rmouse_callback(event):
	return event

@cocotb.coroutine
def clock_gen(signal):
	while True:
		signal<=0
		yield Timer(100)
		signal<=1
		yield Timer(100)

def dut_init(dut):
	dut.clk=0
	dut.game_area=0
	dut.retract=0
	dut.retry=0
	dut.left=0
	dut.right=0
	dut.reset=0
	dut.cursor=0

def reset(dut):
	dut.reset=1

def retry(dut):
	dut.retry=1

def left(dut):
	dut.left=1

def game_area(dut):
	dut.game_area=1

def retract(dut):
	dut.retract=1

@cocotb.test()
def game_core_gui_test(dut):
	flag=True
	dut_init(dut)
	#gui=Tk()
	while flag:
		x=input("num:")
		yield ClockCycles(dut.clk,1)
		dut._log.info(str(dut.clk))
		if x==0:
			flag=False
		if x==1:
			retract(dut)
	yield Timer(200)
	dut._log.info(str(dut.box))
	dut._log.info(str(dut.man))