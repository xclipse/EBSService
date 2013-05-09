package oracle.ebs.service.siebel;

import oracle.ebs.service.servlet.PollingData;

public class SiebelService {

  public static boolean processFlag = false;
  public String callSiebel(String itemNumber){
    PollingData.appendMsg("2", "Siebel receive item information of [" + itemNumber + "] from BPM<br/> Waiting for process:", "blue");

    try {
      Thread.sleep(7000);
    } catch (InterruptedException ex) {
      ex.printStackTrace();
    }
  
    PollingData.appendMsg("2", "Siebel processed item [" + itemNumber + "] and back to BPM" , "blue");
    return "S";
    
  }
}
