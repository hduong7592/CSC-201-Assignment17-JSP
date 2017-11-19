<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileInputStream" %><%--
  Created by IntelliJ IDEA.
  User: hieuduong
  Date: 11/19/17
  Time: 12:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Input/Output file</title>
  </head>
  <body>
  <br>
  <br>/**
  <br>* Create by hieuduong on 11/18/17
  <br>*
  <br>* CSC 201 - Assignment 17
  <br>* Problem 17.1:
  <br>*
  <br>* (Create a text file) Write a program to create a file named Exercise17_01.txt if
  <br>* it does not exist. Append new data to it if it already exists. Write 100 integers
  <br>* created randomly into the file using text I/O. Integers are separated by a space.
  <br>*/

    <br>
    <form name="myForm" action="index.jsp" method="post">
      <table align="center" style="width: 400px;">
        <tr>
          <td colspan="2" style="text-align: center">
            <input type="hidden" value="write" id="1" name="action">
            <input type="submit" value="Write To File">
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>


<%
  class Data{
      private String fileName;
    public Data(String fileName){
      this.fileName = fileName;
    }
    /**
     * Write to file method
     */
    private String writeToFile() {
      String result = "";
      try{
        FileOutputStream output = new FileOutputStream(fileName);
        for(int i=0; i<=100; i++){
          output.write(randomNumber());
        }
        result = "Write to file successful.";
      }
      catch (IOException ex){
        result = ex.toString();
      }
      return  result;
    }

    /**
     * Read from file method
     */
    private String readFromFile(){
      String result = "";
      try{
        FileInputStream input = new FileInputStream(fileName);
        int value;
        String outputString = "";
        while ((value=input.read())!= -1){
          outputString+=value+" ";
        }

        result = outputString;
      }
      catch (IOException ex){
         result = ex.toString();
      }
      return result;
    }

    /**
     * Generate random number method
     * @return
     */
    private int randomNumber(){
      int random = 0;
      random = ((int)(Math.random()*100))+1;
      return random;
    }
  }

  String action = "";
  try{
    action = request.getParameter("action").toString();
  }
  catch (Exception e){
    action = "";
    //out.print(e.toString());
  }

  if(action.equals("write")) {
    String fileName = "Exercise17_01.txt";

    Data data = new Data(fileName);

    out.print(data.writeToFile() + "<br>");
    out.print(data.readFromFile() + "<br>");
  }
%>
