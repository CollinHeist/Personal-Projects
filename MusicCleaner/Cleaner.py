# ----------------------- Global variables and necessary imports ----------------------- #

import os
path = "/Users/CollinHeist/Music/iTunes/iTunes Media/Music/" # Path of the music directory

# --------------------- Return a list of all the artists in /path/ --------------------- #

def listArtists():
	artistList = []
	# Filter out any .DS_Store files from the artist list, adds None instead
	artistList = [[files, None][files == ".DS_Store"] for files in os.listdir(path)]
	artistList[:] = [val for val in artistList if val != None] # None is added for .DS_Store files | Remove them
	return artistList

# ---------------- Returns a tuple of (songList, pathList, ~pictureList) --------------- #
# ------------------- Each respective item corresponds to each other ------------------- #
# --------------- pictureList is returned only if checkPictures is True ---------------- #

def generateLists(artistList, checkPictures):
	# Take the artist list and recurse until a .mp3 (or others) is found | Add to list
	songList = [] # List of song names
	pathList = [] # List of all song paths
	pictureList = []
	for artist in artistList:
		currDir = path + artist + "/"
		for items in os.listdir(currDir): # Every item is either a song or an album
			if (os.path.isfile(currDir+items) and items not in (".DS_Store", "desktop.ini")):
				if (checkPictures and items.endswith(".jpg")):
					pictureList.append(currDir + items)
				elif (not items.endswith(".jpg")):
					songList.append(items) 
					pathList.append(currDir + items)
			print (currDir + items + '/')
			if (os.path.isdir (currDir + items + '/')):
				for song in os.listdir(currDir + items + '/'):
					# Append the song if the given item is not a system file or a picture
					tempPath = currDir + items + '/'
					x = songList.append(song) if (song not in (".DS_Store", "desktop.ini") and not song.endswith(".jpg")) else None
					x = pathList.append(tempPath[50:]) if (song not in (".DS_Store", "desktop.ini") and not song.endswith(".jpg")) else None
					x = pictureList.append(tempPath[50:] + song) if (song not in (".DS_Store", "desktop.ini") and song.endswith(".jpg") and checkPictures) else None

	return ((songList, pathList, pictureList) if checkPictures else (songList, pathList)) 


# ------- Return a list of songs that have duplicate instances in a passed /path ------- #

def findDuplicates(songList, pathList):
	dupeList = []
	for count, locations in enumerate(pathList):
		# Ignore artists / albums with only 1 song, and if the provided path has been looked at
		if pathList.count(locations) > 1 and locations not in pathList[:count]:
			# Sub-list of all songs that are in the provided 
			songs = songList[count : count + pathList.count(pathList[count])]
			# print (' |\t '.join(songs))
			for location, song in enumerate(songs):
				tempSongs = ""
				for elem in songs[location+1:]: tempSongs = tempSongs + elem[:-4]
				# print (tempSongs)
				if song[:-4] in tempSongs: dupeList.append((song, pathList[count + location]))

	return dupeList

# -------------------- Delete all pictures as provided by pictureList ------------------ #

def deletePictures(pictureList):
	pathList = [] # List of directories that parallels that of pictureList
	for pics in pictureList:
		location = path + pics[1:pics.rfind('/') + 1] # Path is up to the last / in the string
		pathList.append(location) # Make pathList store all the locations of all the images

	for locs, pics in zip(pathList, pictureList):
		fullPicDirectory = locs + pics[pics.rfind('/') + 1:] # The full path of the picture (what we'll pass to 'rm')
		os.system("rm \"%s\"" % fullPicDirectory)
		if (len(os.listdir(locs)) == 0):  # If the provided directory is empty
			os.system("rmdir \"%s\"" % locs) # Delete the folder itself

# ------- Deletes all desktop.ini files from the folders specified in artistList ------- #
# ----- These files are created by the MacOS to store folder-specific preferences ------ #

def removeINIFiles(artistList):
	count = 0 # Track how many items are deleted
	for artists in artistList:
		currDir = path + artists + '/'
		for items in os.listdir(currDir):
			if (items == "desktop.ini"): # Delete the desktop.ini files
				os.system("rm \"%s\"" % (currDir + items))
				count = count + 1
			elif (os.path.isdir(currDir + items)): # If the subdirectory is a file itself (i.e. an album)
				for subs in os.listdir(currDir + items + "/"):
					print (currDir + items + "/", subs)
					if (subs == "desktop.ini"): # Delete the .ini file
						os.system("rm \"%s\"" % (currDir + items + '/' + subs))
						count = count + 1

				if (len(os.listdir(currDir + items)) == 0): # All the items were desktop.ini files
					os.system("rmdir \"%s\"" % (currDir + items))
					count = count + 1

		# All the subdirectories and files were desktop.ini | Remove the whole folder
		if (len(os.listdir(currDir)) == 0):
			os.system("rmdir \"%s\"" % (currDir))
			count = count + 1

	print ("\nDeleted %i items." % count)

# ----------------------------------- Function Calls ----------------------------------- #

artistList = listArtists()
songList, pathList, pictureList = generateLists(artistList, True)
dupeList = findDuplicates(songList, pathList)

# ------------------------------ Remove desktop.ini files ------------------------------ #

# print ("\nRemoving desktop.ini files..\n")
# removeINIFiles(artistList)

# --------------------------- Printing found duplicate songs --------------------------- #

print ("\nListing found duplicates..\n")
for names, locs in dupeList: print (names, locs) # Print the duplicate name and location

# ------------------ Printing found pictures (i.e. unnecessary files) ------------------ #

if (pictureList):
	print ("\n\nListing found pictures..\n")
	for pics in pictureList: print (pics)

# ----- Delete all pictures in the music directory. Used on Windows for album art ------ #

# deletePictures(pictureList)
