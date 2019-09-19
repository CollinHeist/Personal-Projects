package visualization;

import java.util.*; // Used for ArrayList<String>

import java.io.File;
import java.io.IOException;
import org.w3c.dom.Document;
import org.w3c.dom.*;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;

public class Visualization {
    public static ArrayList<Integer> orderDates(ArrayList<String> unsorted) { // Each date is dd/mm/yy
        ArrayList<Integer> sorted = new ArrayList<>(unsorted.size()); // Ordered list of indices that are the day values in decreasing order
        ArrayList<Long> dayValue = new ArrayList<>(unsorted.size()); // List of all the "day values" in the original order
        ArrayList<Boolean> isChecked = new ArrayList<>(unsorted.size()); // Mark for each element if it has been added to the ordered list
        for (int i = 0; i < unsorted.size(); i++) { isChecked.add(Boolean.FALSE); }
        
        unsorted.forEach(d -> {
            int day = Integer.parseInt(d.substring(0, 2)); // non-inclusive right-bound
            int month = Integer.parseInt(d.substring(3, 5)) - 1; // Counting starts at 0
            int year = 2000 + Integer.parseInt(d.substring(6, 8)); // Don't count current year
            Calendar myCal = new GregorianCalendar(year, month, day); // Use the Calendar class so we don't have to generalize time
            dayValue.add(myCal.getTimeInMillis()); // Add the MS time since the epoch as the timeVal
        });
        
        // Sort the array using a simple bubble-sort
        for (int i = 0; i < dayValue.size(); i++) {
            long tempLowest = Long.MAX_VALUE; // Every value must (realistically) be lower than the max
            for (int j = 0; j < dayValue.size(); j++) { // Check every element for the lowest that hasn't been checked
                if ((dayValue.get(j) < tempLowest) && !isChecked.get(j)) { tempLowest = dayValue.get(j); }
            }
            sorted.add(dayValue.indexOf(tempLowest));
            isChecked.set(dayValue.indexOf(tempLowest), Boolean.TRUE); // Mark the lowest element as checked
        }
        
        return sorted;
    }
    
    public static ArrayList<Float> findMinAndMax(NodeList listOfDates, ArrayList<String> unsortedDates, ArrayList<Float> unsortedDayTotals) {
        float mostSpent = Integer.MIN_VALUE; //  Tracks the most spent on any given day | Scales y-axis
        float leastSpent = Integer.MAX_VALUE; // Tracks the least spent on any given day | Scales y-axis
        for (int i = 0; i < listOfDates.getLength(); i++) {
            Node dateNode = listOfDates.item(i);
            if (dateNode.getNodeType() == Node.ELEMENT_NODE) {
                Element dateElement = (Element) dateNode; // Each element is the <date date=""> entry
                unsortedDates.add(dateElement.getAttributes().getNamedItem("date").getNodeValue()); // Add the date attribute of dateElement

                // This is a NodeList of all the sub-entries of each date that is tagged as day_total 
                NodeList tempList = dateElement.getElementsByTagName("day_total");
                Element tempElement = (Element) tempList.item(0); // Cast each Element is a Node that is tagged as day_total
                NodeList tempTextList = tempElement.getChildNodes(); // A list of Nodes that are stored under day_total

                float daySpent = Float.parseFloat(((Node) tempTextList.item(0)).getNodeValue().trim());
                unsortedDayTotals.add(daySpent);
                if (daySpent > mostSpent)  { mostSpent  = daySpent; }
                if (daySpent < leastSpent) { leastSpent = daySpent; }
            }
        }
        ArrayList<Float> minMax = new ArrayList<>();
        minMax.add(leastSpent); minMax.add(mostSpent);
        return minMax;
    }
    
    public static void obtainData(ArrayList<String> sortedDates, ArrayList<Float> sortedDayTotals, ArrayList<Float> minMaxSpent) throws ParserConfigurationException, SAXException, IOException {
        DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
        Document dateDoc = docBuilder.parse (new File("/Users/CollinHeist/Dropbox/Scripts/Finance Manager/XML Files/dates.xml"));
        Document doc = docBuilder.parse (new File("book.xml"));
        // Normalize text representation
        doc.getDocumentElement().normalize();
        dateDoc.getDocumentElement().normalize();

        /* ------------------------------------------------------------- */

        NodeList listOfDates = dateDoc.getElementsByTagName("date");
        int numDates = listOfDates.getLength();
        System.out.println("Total number of dates : " + numDates);

        // Fill minMaxSpent with [min, max] spent over all days in dates.xml
        ArrayList<String> unsortedDates = new ArrayList<>(); // StringList of all the days in dates.xml
        ArrayList<Float> unsortedDayTotals = new ArrayList<>(); // FloatList of all the day_totals in dates.xml
        minMaxSpent = findMinAndMax(listOfDates, unsortedDates, unsortedDayTotals); // [min, max]

        /* ------------------------------------------------------------- */

        // Obtain the order of which to sort the dates and day_totals
        ArrayList<Integer> sortOrder = orderDates(unsortedDates);
        for (int i = 0; i < sortOrder.size(); i++) {  // Sort the dates and day totals according to the order specified in sortOrder
            sortedDates.add(unsortedDates.get(sortOrder.get(i))); 
            sortedDayTotals.add(unsortedDayTotals.get(sortOrder.get(i))); 
        }
        
        /* We now have sortedDates<> which contains the dates in ascending order
         * sortedDayTotals<> which contains the corresponding totals for sortedDates
         * minMaxSpent<> which is a 2-Element array with [minSpent, maxSpent]
         */
    }
    public static void main (String argv []) { }
}