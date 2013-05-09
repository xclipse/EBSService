package oracle.ebs.service.pim;

import java.util.HashMap;
import java.util.Hashtable;

import oracle.ebs.service.servlet.PollingData;

public class PIMService {

  public static final String SIEBEL_UPDATE_FLAG = "SIEBEL_UPDATE_FLAG";
  public static final String BRM_UPDATE_FLAG = "BRM_UPDATE_FLAG";
  public static final String ALL_UPDATE_FLAG = "ALL_UPDATE_FLAG";
  public static final String[] FLAGS = new String[] {SIEBEL_UPDATE_FLAG, BRM_UPDATE_FLAG, ALL_UPDATE_FLAG};
  public static Hashtable<String, HashMap<String,String>> udaMap = new Hashtable<String, HashMap<String,String>>();
  public String callPim(String itemNumber, String attr, String value) {

    PollingData.appendMsg("1", "BPM require update item " + itemNumber + "'s UDA " + attr + " to value " + value, "black");
    HashMap<String, String> inMap = udaMap.get(itemNumber);
    if(inMap == null){
      inMap = new HashMap<String, String>();
      udaMap.put(itemNumber, inMap);
    }
    inMap.put(attr, value);
    StringBuilder msg = new StringBuilder("Checking UDAs value of item [" + itemNumber + "]<br>");
    for (int i = 0; i < FLAGS.length; i++) {
      String v = inMap.get(FLAGS[i]);
      if(v == null){
        v = "false";
        inMap.put(FLAGS[i], v);
      }
      msg.append(" - ").append(FLAGS[i]).append(" == ").append(v).append("<br/>");
    }
    PollingData.appendMsg("1", msg.toString(), "black");
    
    return "S";
  
  }
}
