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
from tkinter import *

# since comparing 134 bit wire is wried and tedious
# using cocotb + tkinter + iverilog (modelsim can also work) to simluate game_core design
width=64
height=64

def dut_init(dut):
	dut.clk=0
	dut.game_area=0
	dut.retract=0
	dut.retry=0
	dut.left=0
	dut.right=0
	dut.reset=0
	dut.cursor=0

def key(event,dut,block,flag):
	print(event.char)
	if event.char=='q':
		flag.set(0)
	elif event.char=='a':
		dut.game_area=1-int(dut.game_area)
	elif event.char=='e':
		dut.reset=1-int(dut.reset)
	elif event.char=='r':
		dut.retry=1-int(dut.retry)
	elif event.char=='t':
		dut.retract=1-int(dut.retract)
	elif event.char=='j':
		dut.left=1-int(dut.left)
	elif event.char=='k':
		dut.right=1-int(dut.right)
	else:
		block.set(0)

def motion(event,dut):
	cursor=event.y//height*8+event.x//width
	dut.cursor=cursor

def lmouse(event,dut,block,left):
	cursor=event.y//height*8+event.x//width
	dut.cursor=cursor
	#dut.left=1
	left.set(1)
	#block.set(0)

def draw_object_color(mask,canvas,color,size):
	for i in range(64):
		if mask[63-i]=='1':
			canvas.create_rectangle(i%8*width,i//8*height,i%8*width+size,i//8*height+size,fill=color)

def gather_output_color(dut,canvas):
	canvas.delete(ALL)
	wall=str(dut.wall)
	way=str(dut.way)
	box=str(dut.box)
	destination=str(dut.destination)
	x=int(dut.man)
	draw_object(wall,canvas,'black',50)
	draw_object(way,canvas,'green',45)
	draw_object(destination,canvas,'red',43)
	draw_object(box,canvas,'blue',42)
	canvas.create_rectangle(x%8*50,x//8*50,x%8*50+20,x//8*50+20,fill='yellow')
	print(x)

def draw_object(mask,canvas,img):
	for i in range(64):
		if mask[63-i]=='1':
			canvas.create_image(i%8*width,i//8*height,anchor=NW, image=img)

def gather_output(dut,canvas,img):
	canvas.delete(ALL)
	wall=str(dut.wall)
	way=str(dut.way)
	box=str(dut.box)
	destination=str(dut.destination)
	x=int(dut.man)
	draw_object(wall,canvas,img["wall"])
	draw_object(way,canvas,img["ground"])
	draw_object(box,canvas,img["ground"])
	draw_object(destination,canvas,img["dst"])
	draw_object(box,canvas,img["box"])
	for i in range(64):
		if destination[63-i]=='1' and box[63-i]=='1':
			canvas.create_image(i%8*width,i//8*height,anchor=NW, image=img['box_dst'])
	canvas.create_image(x%8*width,x//8*height, anchor=NW, image=img["man"])
	#canvas.create_rectangle(x%8*50,x//8*50,x%8*50+20,x//8*50+20,fill='yellow')
	#print(x)

@cocotb.test()
def game_core_test(dut):
	# init sokoban gui
	gui=Tk()
	img_man=PhotoImage(file="./asserts/man.png")
	img_box=PhotoImage(file="./asserts/box.png")
	img_box_dark=PhotoImage(file="./asserts/box_dark.png")
	img_dst=PhotoImage(file="./asserts/dst.png")
	img_wall=PhotoImage(file="./asserts/wall.png")
	img_ground=PhotoImage(file="./asserts/ground.png")
	img={"man":img_man,"box":img_box,"dst":img_dst,"wall":img_wall,"ground":img_ground,"box_dst":img_box_dark}
	block=IntVar()
	block.set(1)
	flag=IntVar()
	flag.set(1)
	left=IntVar()
	left.set(0)
	canvas=Canvas(gui,width=width*8,height=height*8)
	canvas.bind("<Key>",lambda event: key(event,dut,block,flag))
	canvas.focus_set()
	canvas.bind("<Button-1>",lambda event: lmouse(event,dut,block,left))
	canvas.pack()
	label=Label(gui,text="Reset: "+str(dut.reset)+"; Area: "+str(dut.game_area)+"; Retry: "+str(dut.retry)+"; Retract: "+str(dut.retract)+"; Stage: "+str(dut.stage)+"; Win:"+str(dut.win)+"; Left: "+str(dut.left)+"; Right: "+str(dut.right))
	label.pack()
	# init all input signal
	dut_init(dut)
	dut.clk=0
	yield Timer(100)
	dut.reset=1
	dut.clk=1
	yield Timer(100)
	dut.clk=0
	yield Timer(100)
	dut.reset=0
	dut.clk=1
	yield Timer(100)
	dut.clk=0
	yield Timer(100)
	while flag.get():
		dut.left=0
		dut._log.info("before state: "+str(dut.controller.state)+"state_up: "+str(dut.controller.stage_up))
		if int(dut.controller.state)==2 or int(dut.controller.state)==3:
			gui.wait_variable(left)
			if left.get()==1:
				dut.left=1
			dut.clk=1
			yield Timer(100)
			dut.clk=0
			yield Timer(100)
		elif int(dut.controller.state)==4:
			dut.clk=1
			yield Timer(100)
			dut.clk=0
			yield Timer(100)
			break
		else:
			#gui.wait_variable(block)
			dut.clk=1
			yield Timer(100)
			dut.clk=0
			yield Timer(100)
		dut._log.info("after state: "+str(dut.controller.state)+"state_up: "+str(dut.controller.stage_up)+" step:"+str(dut.step))
		dut._log.info("stage: "+str(dut.stage)+"win: "+str(dut.win))
		label.config(text="Reset: "+str(dut.reset)+"; Area: "+str(dut.game_area)+"; Retry: "+str(dut.retry)+"; Retract: "+str(dut.retract)+"; Stage: "+str(dut.stage)+"; Win:"+str(dut.win))
		gather_output(dut,canvas,img)
		gui.update()
		
	x=input("quit?")
	gui.quit()
	yield Timer(200)