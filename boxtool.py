import sys, struct

NAME_TABLE_ADDR = 0x20801e
MONS_PER_BOX = 20
BOX_STRUCT_LEN = 4 + 55 * MONS_PER_BOX

def get_poke_name(rom, ind):
	rom.seek(NAME_TABLE_ADDR + ind * 10)
	return rom.read(10) + b'\x50'

def make_poke(ind):
	speciesid = struct.pack('B', ind)
	dat = speciesid + b'\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00'
	dat += b'\xff' * 2 * 6
	dat += b'\x00' * 8
	dat += b'\x64'
	assert len(dat) == 32
	return dat

DEFAULT_OT = b'\x82\x91\x98\x92\x93\x80\x8b\x50\x50\x50\x50'

MAX_MON_IND = 543
def gen_box(startind, rom):
	if startind >= MAX_MON_IND:
		a = b'\x00\xff' + b'\x00' * MONS_PER_BOX
		b = b'\x00' * 32 * MONS_PER_BOX
		c = b'\x00' * 2 * MONS_PER_BOX
		d = b'\x00' * 11 * MONS_PER_BOX
		e = b'\x00' * 11 * MONS_PER_BOX
		return a,b,c,d,e
	numpokes = min(MONS_PER_BOX, (MAX_MON_IND - startind))
	st_dat = struct.pack('B', numpokes)
	poke_dat = b''
	ind_dat = b''
	name_dat = b''
	otnames = DEFAULT_OT * numpokes + (b'\x00' * 11) * (MONS_PER_BOX - numpokes)
	for i in range(numpokes):
		st_dat += struct.pack('B', i + 1)
		poke_dat += make_poke(i + 1)
		ind_dat += struct.pack('H', startind + i)
		name_dat += get_poke_name(rom, startind + i)
	st_dat += b'\xff'
	for _ in range(MONS_PER_BOX - numpokes):
		st_dat += b'\x00'
		poke_dat += b'\x00' * 32
		ind_dat += b'\x00\x00'
		name_dat += b'\x00' * 11
	return st_dat, poke_dat, ind_dat, name_dat, otnames

def gen_7_box(startind, rom):
	boxdat = b''
	inddat = b''
	for i in range(7):
		a,b,c,d,e = gen_box(startind + i * MONS_PER_BOX, rom)
		boxdat += a
		boxdat += b
		boxdat += e
		boxdat += d
		boxdat += b'\xff\x00'
		inddat += c
	return boxdat + inddat

box_addr = (
	2 * 0x2000 + 0 * BOX_STRUCT_LEN,
	2 * 0x2000 + 1 * BOX_STRUCT_LEN,
	2 * 0x2000 + 2 * BOX_STRUCT_LEN,
	2 * 0x2000 + 3 * BOX_STRUCT_LEN,
	2 * 0x2000 + 4 * BOX_STRUCT_LEN,
	2 * 0x2000 + 5 * BOX_STRUCT_LEN,
	2 * 0x2000 + 6 * BOX_STRUCT_LEN,
	3 * 0x2000 + 0 * BOX_STRUCT_LEN,
	3 * 0x2000 + 1 * BOX_STRUCT_LEN,
	3 * 0x2000 + 2 * BOX_STRUCT_LEN,
	3 * 0x2000 + 3 * BOX_STRUCT_LEN,
	3 * 0x2000 + 4 * BOX_STRUCT_LEN,
	3 * 0x2000 + 5 * BOX_STRUCT_LEN,
	3 * 0x2000 + 6 * BOX_STRUCT_LEN,
	4 * 0x2000 + 0 * BOX_STRUCT_LEN,
	4 * 0x2000 + 1 * BOX_STRUCT_LEN,
	4 * 0x2000 + 2 * BOX_STRUCT_LEN,
	4 * 0x2000 + 3 * BOX_STRUCT_LEN,
	4 * 0x2000 + 4 * BOX_STRUCT_LEN,
	4 * 0x2000 + 5 * BOX_STRUCT_LEN,
	4 * 0x2000 + 6 * BOX_STRUCT_LEN,
	5 * 0x2000 + 0 * BOX_STRUCT_LEN,
	5 * 0x2000 + 1 * BOX_STRUCT_LEN,
	5 * 0x2000 + 2 * BOX_STRUCT_LEN,
	5 * 0x2000 + 3 * BOX_STRUCT_LEN,
	5 * 0x2000 + 4 * BOX_STRUCT_LEN,
	5 * 0x2000 + 5 * BOX_STRUCT_LEN,
	5 * 0x2000 + 6 * BOX_STRUCT_LEN,
)
ind_addr = (
	box_addr[ 6] + BOX_STRUCT_LEN + 0 * 2 * MONS_PER_BOX,
	box_addr[ 6] + BOX_STRUCT_LEN + 1 * 2 * MONS_PER_BOX,
	box_addr[ 6] + BOX_STRUCT_LEN + 2 * 2 * MONS_PER_BOX,
	box_addr[ 6] + BOX_STRUCT_LEN + 3 * 2 * MONS_PER_BOX,
	box_addr[ 6] + BOX_STRUCT_LEN + 4 * 2 * MONS_PER_BOX,
	box_addr[ 6] + BOX_STRUCT_LEN + 5 * 2 * MONS_PER_BOX,
	box_addr[ 6] + BOX_STRUCT_LEN + 6 * 2 * MONS_PER_BOX,
	box_addr[13] + BOX_STRUCT_LEN + 0 * 2 * MONS_PER_BOX,
	box_addr[13] + BOX_STRUCT_LEN + 1 * 2 * MONS_PER_BOX,
	box_addr[13] + BOX_STRUCT_LEN + 2 * 2 * MONS_PER_BOX,
	box_addr[13] + BOX_STRUCT_LEN + 3 * 2 * MONS_PER_BOX,
	box_addr[13] + BOX_STRUCT_LEN + 4 * 2 * MONS_PER_BOX,
	box_addr[13] + BOX_STRUCT_LEN + 5 * 2 * MONS_PER_BOX,
	box_addr[13] + BOX_STRUCT_LEN + 6 * 2 * MONS_PER_BOX,
	box_addr[20] + BOX_STRUCT_LEN + 0 * 2 * MONS_PER_BOX,
	box_addr[20] + BOX_STRUCT_LEN + 1 * 2 * MONS_PER_BOX,
	box_addr[20] + BOX_STRUCT_LEN + 2 * 2 * MONS_PER_BOX,
	box_addr[20] + BOX_STRUCT_LEN + 3 * 2 * MONS_PER_BOX,
	box_addr[20] + BOX_STRUCT_LEN + 4 * 2 * MONS_PER_BOX,
	box_addr[20] + BOX_STRUCT_LEN + 5 * 2 * MONS_PER_BOX,
	box_addr[20] + BOX_STRUCT_LEN + 6 * 2 * MONS_PER_BOX,
	box_addr[27] + BOX_STRUCT_LEN + 0 * 2 * MONS_PER_BOX,
	box_addr[27] + BOX_STRUCT_LEN + 1 * 2 * MONS_PER_BOX,
	box_addr[27] + BOX_STRUCT_LEN + 2 * 2 * MONS_PER_BOX,
	box_addr[27] + BOX_STRUCT_LEN + 3 * 2 * MONS_PER_BOX,
	box_addr[27] + BOX_STRUCT_LEN + 4 * 2 * MONS_PER_BOX,
	box_addr[27] + BOX_STRUCT_LEN + 5 * 2 * MONS_PER_BOX,
	box_addr[27] + BOX_STRUCT_LEN + 6 * 2 * MONS_PER_BOX,
)
save_fn = sys.argv[1]
rom_fn = sys.argv[2]
raw = open(save_fn, 'rb').read()
rom = open(rom_fn, 'rb')

box1dat = raw[box_addr[0]:box_addr[1]]
box1ind = raw[ind_addr[0]:ind_addr[1]]
sav = open(save_fn, 'wb')
sav.write(raw[:0x4000])
for i in range(4):
	sav.write(gen_7_box(1 + i * 7 * MONS_PER_BOX, rom))
	pos = sav.tell()
	sav.write(b'\x00' * (0x2000 - pos % 0x2000))
