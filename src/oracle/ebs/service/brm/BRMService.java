package oracle.ebs.service.brm;

import oracle.ebs.service.servlet.PollingData;

public class BRMService {

  public static boolean processFlag;
  public String callBRM(String itemNumber){
    PollingData.appendMsg("3", "BRM receive item information of [" + itemNumber + "] from BPM<br/> Waiting for process:", "green");

    try {
      Thread.sleep(5000);
    } catch (InterruptedException ex) {
      ex.printStackTrace();
    }
  
    PollingData.appendMsg("3", "BRM processed item [" + itemNumber + "] and back to BPM" , "green");
    return "S";
  }
}
