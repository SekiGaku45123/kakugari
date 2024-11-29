package judge;
public class Judge {
   private String itemId;
   private String userId;
   private String comment;
   private boolean evaluate;
   public String getItemId() {
       return itemId;
   }
   public void setItemId(String itemId) {
       this.itemId = itemId;
   }
   public String getUserId() {
       return userId;
   }
   public void setUserId(String userId) {
       this.userId = userId;
   }
   public String getComment() {
       return comment;
   }
   public void setComment(String comment) {
       this.comment = comment;
   }
   public boolean isEvaluate() {
       return evaluate;
   }
   public void setEvaluate(boolean evaluate) {
       this.evaluate = evaluate;
   }
}