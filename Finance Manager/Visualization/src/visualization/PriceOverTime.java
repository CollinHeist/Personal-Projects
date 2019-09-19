/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package visualization;

import java.awt.BasicStroke;
import java.awt.Color;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import org.jfree.chart.*;
import org.jfree.chart.labels.*;
import org.jfree.chart.plot.*;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DatasetGroup;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.ui.RefineryUtilities;
import org.jfree.ui.TextAnchor;
import org.xml.sax.SAXException;

/**
 *
 * @author CollinHeist
 */
public class PriceOverTime extends javax.swing.JFrame {
//    private Visualization viz;
    /* Creates new form PriceOverTime */
    public PriceOverTime() {
//        this.viz = viz;
        initComponents();
    }
    
    private static XYDataset createDataset(ArrayList<String> sortedDates, ArrayList<Float> sortedDayTotals) {
        XYSeries series = new XYSeries("Entries");
        sortedDates.forEach(i -> { System.out.print(i + ", "); });
        System.out.println();
        sortedDayTotals.forEach(i -> { System.out.print(i + ", "); });
        for (int i = 0; i < sortedDates.size(); i++) {
//            dataset.addValue(sortedDayTotals.get(i), "Dollars", sortedDates.get(i));
            int day = Integer.parseInt(sortedDates.get(i).substring(0, 2));
            int month = Integer.parseInt(sortedDates.get(i).substring(3, 5)) - 1; // Counting starts at 0
            int year = 2000 + Integer.parseInt(sortedDates.get(i).substring(6, 8)); // Don't count current year
            Calendar myCal = new GregorianCalendar(year, month, day); // Use the Calendar class so we don't have to generalize time
            series.add((float)myCal.getTimeInMillis(), (float)sortedDayTotals.get(i));
        }
        XYDataset dataset = new XYSeriesCollection(series); // dataset is a collection of series
        return dataset;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setPreferredSize(new java.awt.Dimension(1200, 800));
        setSize(new java.awt.Dimension(1200, 800));

        jPanel1.setPreferredSize(new java.awt.Dimension(1200, 800));
        jPanel1.setSize(new java.awt.Dimension(1200, 800));

        jButton1.setText("test JFreeChart");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(496, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(423, 423, 423))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(263, 263, 263)
                .addComponent(jButton1)
                .addContainerGap(272, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 510, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 393, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        ArrayList<String> sortedDates    = new ArrayList<>();
        ArrayList<Float> sortedDayTotals = new ArrayList<>();
        ArrayList<Float> minMaxSpent     = new ArrayList<>();
        try {
            Visualization.obtainData(sortedDates, sortedDayTotals, minMaxSpent); // run obtainData
        } catch (ParserConfigurationException | SAXException | IOException ex) {
            Logger.getLogger(PriceOverTime.class.getName()).log(Level.SEVERE, null, ex);
        }

        //Now, sortedDates, sortedDayTotals, and minMaxSpent are filled with correct values
        JFreeChart chart = ChartFactory.createXYLineChart("Expenditures vs. Time",
            "Dates",
            "Money Spent",
            createDataset(sortedDates, sortedDayTotals),
            PlotOrientation.VERTICAL,
            false, false, false);

        ChartPanel chartPanel = new ChartPanel(chart);

        /* Format the plot area */
        XYPlot plot = chart.getXYPlot();
        plot.setBackgroundPaint(Color.DARK_GRAY);
        plot.setDomainGridlinesVisible(false);
        plot.setRangeGridlinePaint(Color.LIGHT_GRAY); // Horizontal grid-lines
        plot.setOutlineVisible(false);
        /* Format the line's color and thickness */
        plot.getRenderer().setSeriesPaint(0, Color.CYAN);
        plot.getRenderer().setSeriesStroke(0, new BasicStroke(2.5f));

        /* Formatting the chart's format */
        chartPanel.setPreferredSize(new java.awt.Dimension(1000, 750));

        setContentPane(chartPanel);
        pack();
        setVisible(true);
    }//GEN-LAST:event_jButton1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new PriceOverTime().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables
}