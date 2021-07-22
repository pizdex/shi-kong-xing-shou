#!/usr/bin/python

from xml.dom import minidom
import sys

root = minidom.Document()

with open(sys.argv[1], 'rb') as meta:
	rows = []
	
	WIDTH = int(sys.argv[3])
	
	row = meta.read(WIDTH)
	while row:
		#rows.append()
		p = []
		for i in range(WIDTH):
			try:
				p.append(row[i]+1)
			except:
				pass
		rows.append(p)
		row = meta.read(WIDTH)
	
	meta_height = len(rows)
	
	csv = ''
	for i in range(len(rows)):
		if i == len(rows)-1:
			csv += '\n'
			for j in range(len(rows[i])):
				if j == len(rows[i])-1:
					csv += f'{rows[i][j]}'
				else:
					csv += f'{rows[i][j]},'
		else:
			csv += '\n'
			for j in range(len(rows[i])):
				csv += f'{rows[i][j]},'
	
	map_ = root.createElement('map')
	map_.setAttribute('orientation', 'orthogonal')
	map_.setAttribute('renderorder', 'right-down')
	map_.setAttribute('tilewidth', '32')
	map_.setAttribute('tileheight', '32')
	map_.setAttribute('width', f'{WIDTH}')
	map_.setAttribute('height', f'{meta_height}')
	root.appendChild(map_)
	
	map_.appendChild(
		root.createComment('Add tilesets as much as needed')
	)
	
	tileset = root.createElement('tileset')
	tileset.setAttribute('firstgid', '1')
	tileset.setAttribute('tilewidth', '32')
	tileset.setAttribute('tileheight', '32')
	tileset_img = root.createElement('image')
	tileset_img.setAttribute('source', '../blocks/???')
	tileset.appendChild(tileset_img)
	map_.appendChild(tileset)
	
	layer = root.createElement('layer')
	layer.setAttribute('id', '1')
	layer.setAttribute('name', 'layout')
	layer.setAttribute('width', f'{WIDTH}')
	layer.setAttribute('height', f'{meta_height}')
	
	data = root.createElement('data')
	data.setAttribute('encoding', 'csv')
	data.appendChild(root.createTextNode(csv))
	layer.appendChild(data)
	map_.appendChild(layer)

	xml_str = root.toprettyxml(indent ="\t") 

	save_path_file = sys.argv[2]

	with open(save_path_file, "w") as f:
		f.write(xml_str) 
