from PIL import Image
import sys

txtout = ''

imgfilenamein = sys.argv[1]
img = Image.open(imgfilenamein)
ims = []
imgh = img.size[1]
numimgs = (imgh + 1) // 11
for y in range(numimgs):
	x1 = 0
	x2 = 13
	y1 = y * 11
	y2 = y * 11 + 10
	ims.append(img.crop((x1, y1, x2, y2)))

c0 = (0, 0, 0)
c1 = (255, 255, 255)
for imgind, im in enumerate(ims):
	pxl = im.load()
	lst = ''
	for y in range(10):
		for x in range(13):
			p = pxl[x,y]
			try:
				assert p == c0 or p == c1
			except:
				print(imgind, x, y, p)
				raise
			if p == c0:
				lst += '1'
			else:
				lst += '0'
	bytlist = []
	i = 0
	curb = ''
	for c in lst:
		curb += c
		i += 1
		if i == 8:
			bytlist.append(curb)
			curb = ''
			i = 0
	while i < 8:
		curb += '0'
		i += 1
		if i == 8:
			bytlist.append(curb)

	txtout += '	db '
	for i, bt in enumerate(bytlist):
		txtout += '%{}'.format(bt[::-1])
		if (i+1)%4 == 0:
			txtout += '\n	db '
		elif i != len(bytlist) - 1:
			txtout += ', '
	txtout += '\n\n'

open(sys.argv[2], 'w').write(txtout)
