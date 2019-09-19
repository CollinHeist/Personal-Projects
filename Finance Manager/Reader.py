# ---------------- Reads the scanned reciept and outputs the corresponding data ----------------- #

import os # For reading the file directories
import commands # For moving the files from the .py directory to the Product ID directory
import xml.etree.cElementTree as ET # Used for all XML writing and reading
import xml.dom.minidom as MD # Used to format the ET written XML sheets, specificially prettify them

# -------------------------------- Global variable declarations --------------------------------- #

inputPath = "/Users/CollinHeist/Dropbox/Scripts/Finance Manager/Text Files/"
productPath = "/Users/CollinHeist/Dropbox/Scripts/Finance Manager/XML Files/"
datesPath = "/Users/CollinHeist/Dropbox/Scripts/Finance Manager/XML Files/dates.xml"

# ---------------------------- Searches the given path for the item ----------------------------- #
# -------------- If item is 'None' then it outputs the name of every item in /path/ ------------- #
# ----------------- If item is an int, it outputs the name of that given itemID ----------------- #
# --------- If the item is a str, it outputs all the files whose names contain that str --------- #

def searchItems(item, path):
	if item is None:
		print ("Number of Files: %i" % int(len(os.listdir(path))-1))
		for files in os.listdir(path):
			if files not in ("dates.xml", ".DS_Store"): # Cannot parse the dates.xml file for a item name	
				tree = ET.parse(path + files)
				root = tree.getroot()
				item_name = root.find("item_name").text # The item_name value in the .xml file
				print("Item #%s | \"%s\"" % (files[:-4], item_name))
	elif isinstance(item, int): # If the passed item is an item ID
		if (str(item) + ".xml" in os.listdir(path)): # If the provided item ID exists in /Path/
			tree = ET.parse(path + str(item) + ".xml")
			root = tree.getroot()
			item_name = root.find("item_name").text
			print ("\nItem #%s is.. \"%s\"" % (item, item_name))
		else: # The provided item ID does not exist in /Path/
			print ("Unable to find item %i. Perhaps try a new item ID." % item)
	elif isinstance(item, str): # The provided item is an item NAME
		matchingIDs = [] # Contains a list of all IDs that match the provided name
		matchingNames = []
		for files in os.listdir(path):
			if files not in ("dates.xml", ".DS_Store"): # Ignore the dates.xml and .DS_Store file
				tree = ET.parse(path + files)
				root = tree.getroot()
				item_name = root.find("item_name").text
				tmp = (matchingIDs.append(files) if item.lower() in item_name else None) # If the name matches, add to list
				tmp = (matchingNames.append(item_name) if item.lower() in item_name else None)

		if len(matchingIDs) > 0: # The provided item was found, output each file
			print "\n\"%s\" can be found in:\n" % item,  # End comma makes the ending \n
			print ('\t\t '.join(map(str, matchingIDs))) # Map each val to a str, then print each value separated by commas
			print ('\t\t '.join(map(str, matchingNames)))
		else:
			print ("\nUnable to find %s. Perhaps try a new keyword." % item)


# - Returns a list structured like [Name, Product code, Quantity, Price-per-unit, Amount spent] - #

def extractItemInfo(fileText):
	data = [] # [Name, Product code, Quantity, Price-per-unit, Amount spent] | What will later be formatted as an XML document
	isQuantized = False # True only if the current line had a previous line indicating its quanitity or PPU
	tempQuantity = ""
	tempPricePerUnit = ""
	for line in fileText:
		entries = line.split(" ")
		if not (line[0].isdigit()): # The line is not the quantized line (i.e. the entry below was not purchased multiple times)
			tempItemName = ""
			tempCost = ""
			for items in entries: # Populates tempCost, but only appends tempItemName and the productCode
				if (items in {"FS", "F3", "F8", "F5", "T2"}):
					break
				elif ("." in items): # The cost of the item
					tempCost = items
				elif (items.isdigit() and len(items) >= 4): # The current space is a product ID code
					data.append(tempItemName)
					data.append(items)
					tempItemName = ""
				else: # The current item is a continuation of the product name
					tempItemName += " " + items

			# Add the fields to the data, then reset the temp fields
			if isQuantized:
				isQuantized = False # Reset the flag
				data.append(tempQuantity)
				data.append(tempPricePerUnit)
				data.append(tempCost)
			else:
				data.append("1")
				data.append(tempCost)
				data.append(tempCost)
			tempQuantity = tempPricePerUnit = tempCost = ""
		else: # Line contains a price per unit and quantity
			isQuantized = True
			tempQuantity = entries[0] # The first item is always the quantity purchased
			for items in entries[1:]:
				if ("." in items):
					tempPricePerUnit = items # Only mark the PPU as the item that contains a decimal (i.e. a price)
					break

	return data


# ------------------------- Add the passed entry into the dates.xml file ------------------------ #

def dateXML(productData, tagList, purchaseDate, entryName, location, subtotal):
	tree = ET.parse(datesPath)
	root = tree.getroot()

	# Find the date in the xml file already or make it
	foundDate = False
	for dates in root.findall("date"): # Loop through all the dates in the xml file
		if dates.get("date") == purchaseDate: # The purchase date already has an entry in dates.xml
			foundDate = True
			dateElement = dates
			break

	if not foundDate: # Make the dateElement we'll add to a new element
		dateElement = ET.Element("date", date=purchaseDate)
		root.append(dateElement)
		day_total = ET.Element("day_total") # Add a new day_total Element for the new day
		day_total.text = subtotal
		dateElement.append(day_total)
	else: # Change the existing day's day_total field 
		dateElement.find("day_total").text = str(float(dateElement.find("day_total").text) + float(subtotal))

	# Build the new entry xml section
	entry = ET.Element("entry", name=entryName)
	dateElement.append(entry)
	total = ET.Element("total") # total field for the entry 
	total.text = subtotal
	entry.append(total)
	store = ET.Element("store") # store field for the entry 
	store.text = location
	entry.append(store)
	item_list = ET.Element("item_list") # item_list field for the entry
	entry.append(item_list)

	productIDs = [] # List of all the product IDs of all items in the passed file
	for count in range(len(productData)/5): # Each item has 5 elements in the productData array
		productIDs.append(productData[count * 5 + 1])
	for products in productIDs:
		product = ET.Element("item", id=products)
		item_list.append(product)
		price_per_item = ET.Element("price_per_item")
		price_per_item.text = productData[productData.index(products) + 2]
		product.append(price_per_item)
		amount = ET.Element("amount")
		amount.text = productData[productData.index(products) + 1]
		product.append(amount)
		total_cost = ET.Element("total_cost")
		total_cost.text = productData[productData.index(products) + 3]
		product.append(total_cost)
		tag_list = ET.Element("tag_list")
		product.append(tag_list)
		for tags in tagList[tagList.index(products) + 1:]: # Loop though tagList and add all the tag elements
			if tags.isdigit(): # The 'tag' is actually the next product's ID
				break
			tag = ET.Element("tag")
			tag.text = tags
			tag_list.append(tag)

	# Write the new XML sections to dates.xml
	tree = ET.ElementTree(root)
	tree.write(datesPath)

	# Prettify the appended information in dates.xml
	uglyXML = MD.parse(datesPath)
	prettyXML = uglyXML.toprettyxml() # Convert to formatted XML
	file = open(datesPath, "w") # Overwrite the old file, rewriting it with the formatted XML
	file.write(prettyXML)
	file.close()

	# Erase all while lines from the file after the pretty-if-ication
	with open(datesPath) as filehandle:
		lines = filehandle.readlines()
	with open(datesPath, "w") as filehandle:
		lines = filter(lambda x: x.strip(), lines)
		filehandle.writelines(lines)


# ----------------------- Output the correct xml into the passed fileName ----------------------- #

def outputXML(productData, fileName, subtotal):
	print productData
	print ("For %s, enter the following information: " % fileName)
	purchaseDate = raw_input("Date of purchase (dd/mm/yy).. ")
	entryName = raw_input("Name of entry.. ")
	location = raw_input("Purchase location.. ")

	productIDs = [] # List of all the product IDs of all items in the passed file
	for count in range(len(productData)/5): # Each item has 5 elements in the productData array
		productIDs.append(productData[count * 5 + 1])

	tagList = []		
	for ids in productIDs:
		tagList.append(ids) # Mark each new product by separating the tags for each item with their IDs
		xmlFileName = ids + ".xml"
		if (xmlFileName in os.listdir(productPath)): # If the product already has an associated product XML file
			tree = ET.parse(productPath + xmlFileName)
			root = tree.getroot()

			# Inputting and changing the tags on the item
			tempTag = raw_input("New tag for \"%s\" (%s) (type exit to quit).. " % (root.find("item_name").text, ids)).lower()
			while ("exit" not in tempTag): # Add tags until exit is typed
				tagList.append(tempTag)
				foundTag = False
				for tags in root.find("tag_list").findall("tag"): # Loop through all the tags in the tag_list
					if (tempTag in tags.get("name")): # Entered tag is already associated with the item | Increase count
						oldCount = int(tags.find("count").text)
						tags.find("count").text = str(oldCount + 1)
						foundTag = True
						break
				if not foundTag: # The given tag is new, create a new tag
					tagElem = ET.Element("tag", name=tempTag) # Create the tag element
					root.find("tag_list").append(tagElem) # Add the tag element to the tag_list
					countElem = ET.Element("count") # Create the count element
					countElem.text = "1"
					tagElem.append(countElem) # Add the count element as a subElement of the tag element
				tempTag = raw_input("New tag for \"%s\" (%s).. " % (root.find("item_name").text, ids)).lower()

			# Update total_spent field
			try:
				root.find("total_spent").text = str(float(root.find("total_spent").text) + float(productData[productData.index(ids) + 3]))
			except ValueError:
				print ("Fix the total_spent tag in %s" % xmlFileName)

			# Update the total_amount field
			try:
				root.find("total_amount").text = str(float(root.find("total_amount").text) + float(productData[productData.index(ids) + 1]))
			except ValueError:
				print ("fix the total_amount tag in %s" % xmlFileName)

			# Add a new date purchased entry
			dateElem = ET.Element("date_purchased", date=purchaseDate)
			root.append(dateElem)
			ppiElem = ET.Element("price_per_item")
			ppiElem.text = productData[productData.index(ids) + 2]
			dateElem.append(ppiElem)
			amountElem = ET.Element("amount")
			amountElem.text = productData[productData.index(ids) + 1]
			dateElem.append(amountElem)
			totalCostElem = ET.Element("total_cost")
			totalCostElem.text = productData[productData.index(ids) + 3]
			dateElem.append(totalCostElem)

			# Write the completed tree to the XML file
			tree = ET.ElementTree(root)
			tree.write(productPath + xmlFileName)

			# Make the newly written XML file look good
			uglyXML = MD.parse(productPath + xmlFileName)
			prettyXML = uglyXML.toprettyxml() # Convert to formatted XML
			# print("\nPrettyXML: %s" % prettyXML)
			file = open(productPath + xmlFileName, "w") # Overwrite the old file, rewriting it with the formatted XML
			file.write(prettyXML)
			file.close()

			# Erase all while lines from the file after the pretty-if-ication
			with open(productPath + xmlFileName) as filehandle:
				lines = filehandle.readlines()
			with open(productPath + xmlFileName, "w") as filehandle:
				lines = filter(lambda x: x.strip(), lines)
				filehandle.writelines(lines)

		else: # We need to create the product's XML file
			file = open(xmlFileName, "w+") # Create the file with the id number as the name
			file.close()

			# Making the XML tree
			item = ET.Element("item", id=ids) 
			tempItemName = raw_input("Item name for \"%s\" (%s).. " % (productData[productData.index(ids) - 1], ids)).lower()
			item_name = ET.SubElement(item, "item_name").text = tempItemName
			tag_list = ET.SubElement(item, "tag_list")
			tempTag = raw_input("New tag for %s.. (type exit to quit) " % tempItemName).lower()
			while ("exit" not in tempTag): # Add tags until exit is typed
				tagList.append(tempTag)
				tag = ET.SubElement(tag_list, "tag", name=tempTag)
				counts = ET.SubElement(tag, "count").text = "1"
				tempTag = raw_input("New tag for %s.. " % tempItemName).lower()
			total_spent = ET.SubElement(item, "total_spent").text = productData[productData.index(ids) + 3]
			total_amount = ET.SubElement(item, "total_amount").text = productData[productData.index(ids) + 1]
			date_purchased = ET.SubElement(item, "date_purchased", date=purchaseDate)
			price_per_item = ET.SubElement(date_purchased, "price_per_item").text = productData[productData.index(ids) + 2]
			amount = ET.SubElement(date_purchased, "amount").text = productData[productData.index(ids) + 1]
			total_cost = ET.SubElement(date_purchased, "total_cost").text = productData[productData.index(ids) + 3]

			# Finalize the tree and write it to ids.xml
			tree = ET.ElementTree(item)
			tree.write(xmlFileName)

			# Convert the ugly xml tree in ids.xml to a pretty tree | Rewrite the file
			uglyXML = MD.parse(xmlFileName)
			prettyXML = uglyXML.toprettyxml() # Convert to formatted XML
			# print("\nPrettyXML: %s" % prettyXML)
			file = open(xmlFileName, "w") # Overwrite the old file, rewriting it with the formatted XML
			file.write(prettyXML)
			file.close()

			os.system("mv %s \"./XML Files/\"" % xmlFileName) # Move the made XML file to the /Products/ directory

	# Output to the date.xml file
	dateXML(productData, tagList, purchaseDate, entryName, location, subtotal)

# ---------- Fix the formatting of the passed filename | Misaligned tags on other lines --------- #

def correctFormatting(path, fileName):
	correctedLines = []
	filePath = (path if "dates.xml" in path else path + fileName) 
	with open(filePath) as filehandle:
		allLines = filehandle.readlines()
		skipNext = False
		for lineCount in range(len(allLines)):
			if not skipNext:
				line = allLines[lineCount]
				# Look for misaligned tags in the line | Align them
				startTags = ["<day_total>", "<total>", "<store>", "<price_per_item>", "<amount>", "<total_cost>"]
				endTags = ["</day_total>", "</total>", "</store>", "</price_per_item>", "</amount>", "</total_cost>"]
				for sTag, eTag in zip(startTags, endTags):
					if (sTag in line and eTag not in line):
						print ("Fixed:\n %s %s | In %s" % (line[:-1], allLines[lineCount+1][:-1], fileName))
						skipNext = True
						correctedLines.append(line[:-1] + allLines[lineCount + 1])
						break
				if not skipNext: 
					correctedLines.append(line)
			else:
				skipNext = False
	with open(filePath, "w") as filehandle:
		filehandle.writelines(correctedLines)

# ----- Function that calls all the appropriate functions | Reads and outputs to .xml files ----- #

def readFiles():
	files = os.listdir(inputPath) # files contains a list of all files in /Text Files/
	scans = [] # List of all reciepts that need to be parsed

	# fill scans[] with the name of each text file to read
	for items in files:
		if (items.endswith(".txt")): scans.append(items)

	for document in scans: # Loop through all the documents in the /Text Files/ directory
		file_object = open(inputPath + document, "r")
		textContents = []
		subtotal = -1 # Will store the subtotal cost of the purchase | PRE TAX
		for line in file_object: # Fill textContents with each line of the document
			if ("SUBTOTAL" in line):
				temp, subtotal = line.split(" ") # Ignore the word subtotal, but store the next value in subtotal
				break
			elif line != '\n': # Only append the non-empty lines
				textContents.append(line)

		data = extractItemInfo(textContents) # Analyze each document in the folder
		outputXML(data, document, subtotal)

		# Move processed files into "./Scanned Text Files/"
		os.system("mv \"./Text Files/%s\" \"./Scanned Text Files/\"" % document)

	for xmlFiles in os.listdir(productPath):
		if "dates.xml" not in xmlFiles: correctFormatting(productPath, xmlFiles)
		else: 							correctFormatting(datesPath  , xmlFiles)

readFiles()
searchItems("Bagel", productPath)