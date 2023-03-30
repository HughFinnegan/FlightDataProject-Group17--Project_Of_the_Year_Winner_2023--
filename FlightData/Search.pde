class Search {
  String dataReturned ="";
  String typeBar = "|";

  boolean alreadyRun=true;
  void searchTyping() {
    if (key==CODED) {
      alreadyRun=false;
      if (keyCode==LEFT) {
        println ("left");
      } // if
      /*else {
       // message
       println ("unknown special key");
       alreadyRun=true;
       } // else*/
    } // if
    else
    {
      if (key==BACKSPACE) {
        if (text1.length()>0) {
          text1=text1.substring(0, text1.length()-1);
        } // if
      } // if
      else if (key==RETURN || key==ENTER) {
        boolean gotFlight = false;
        for (int i =0; i< myFlights.size(); i++) {
          Flight currentFlight = myFlights.get(i);
          String currentFlightNumber = currentFlight.getFlightNumber();
          if (currentFlightNumber.equals(text1)) {
            try {
              String[] EDT = currentFlight.getEstimatedDepartureTime().split("");
              String[] EAT = currentFlight.getEstimatedArrivalTime().split("");
              String[] departsAt = currentFlight.getDepartureTime().split("");
              String[] arrivesAt = currentFlight.getArrivalTime().split("");
              dataReturned = "Flight Number: " + text1 + "\nOrigin Airport Code: " + currentFlight.getOrigin() +
              "\nStatus: " + currentFlight.getStatus() +
                "\nDestination Airport Code: " + currentFlight.getDest() +
                "\nDate of Departure: " + currentFlight.getFlightDate() +
                "\nEstimated Departure Time: " + EDT[0] + EDT[1] + ":" + EDT[2] + EDT[3] +
                "\nEstimated Arrival Time: " + EAT[0] + EAT[1] + ":" + EAT[2] + EAT[3] +
                "\nActual Departure Time: " + departsAt[0]+departsAt[1]+":"+departsAt[2]+departsAt[3]
                + "\nActual Arrival Time: " + arrivesAt[0] + arrivesAt[1]+ ":" + arrivesAt[2] + arrivesAt[3]  +
                "\nDeparture City: " + currentFlight.getCityName() + "\nArrival City: " + currentFlight.getArrivalCityName()+
                "\nDistance: " + currentFlight.getDistance() + " miles" ;
              gotFlight = true;
            }
            catch(ArrayIndexOutOfBoundsException exception) {
              dataReturned= "Flight not found";
            }
          }
        }
        println ("ENTER");
        if (gotFlight==true) {
          println("Found");
          text1="";
          alreadyRun=true;
        } // if
        else {
          dataReturned= "Flight not found. Please try again.\nAirline carrier prefixes supported include:\nAA, AS, B6, DL, F9, G4, HA, NK, UA, WN. ";
          text1="";
          alreadyRun=true;
        }
      } // else if
      else {
        text1+=key; //<>//
      } // else
      // output
    } // else
  } // func
  
  void flashingTypingYoke(){
    float s = second()%2;
    if(s==0)
    {float barDist = (text1.length()*12)-1.5;
    text(typeBar, 166 + barDist, 47);}
  }
  
  void draw() {
    stroke(BLACK);
    rect(150, 25, 210, 30);
    textAlign(LEFT);
    textFont(myFont);
    textSize(20);
    fill(BLACK);
    text(text1, 160, 50);
    text(dataReturned, 150, 80); //<>//
    textAlign(CENTER);
    flashingTypingYoke();
  }
}
