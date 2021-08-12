#!/usr/bin/python

from xml.dom import minidom
import sys
import os

root = minidom.Document()

with open(sys.argv[1], 'rb') as meta:
	rows = []
	
	name, ext = os.path.splitext(os.path.basename(sys.argv[1]))
	
	row = meta.read(2)
	while row:
		rows.append((row[0]+1, row[1]+1))
		row = meta.read(2)
	
	meta_height = len(rows)
	
	csv = ''
	for i in range(len(rows)):
		if i == len(rows)-1:
			csv += '\n%d, %d' % rows[i]
		else:
			csv += '\n%d, %d,' % rows[i]
	
	map_ = root.createElement('map')
	map_.setAttribute('orientation', 'orthogonal')
	map_.setAttribute('renderorder', 'right-down')
	map_.setAttribute('tilewidth', '16')
	map_.setAttribute('tileheight', '16')
	map_.setAttribute('width', '2')
	map_.setAttribute('height', f'{meta_height}')
	root.appendChild(map_)
	
	map_.appendChild(
		root.createComment('Add tilesets as much as needed')
	)
	
	tileset = root.createElement('tileset')
	tileset.setAttribute('firstgid', '1')
	tileset.setAttribute('tilewidth', '16')
	tileset.setAttribute('tileheight', '16')
	tileset_img = root.createElement('image')
	tileset_img.setAttribute('source', f'../metatiles/{name}.tmx')
	tileset.appendChild(tileset_img)
	map_.appendChild(tileset)
	
	layer = root.createElement('layer')
	layer.setAttribute('id', '1')
	layer.setAttribute('name', 'blocks')
	layer.setAttribute('width', '2')
	layer.setAttribute('height', f'{meta_height}')
	
	data = root.createElement('data')
	data.setAttribute('encoding', 'csv')
	data.appendChild(root.createTextNode(csv))
	layer.appendChild(data)
	map_.appendChild(layer)

	xml_str = root.toprettyxml(indent ="\t") 

	save_path_file = save_path_file = f'{name}.tmx'

	with open(save_path_file, "w") as f:
		f.write(xml_str) 
