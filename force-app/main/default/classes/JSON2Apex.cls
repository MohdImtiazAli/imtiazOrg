public class JSON2Apex {

	public List<Results> results;

	public class Results {
		public String id;
		public Properties properties;
		public String createdAt;
		public String updatedAt;
		public Boolean archived;
	}

	public class Properties {
		public String createdate;
		public String email;
		public String firstname;
		public String hs_object_id;
		public String lastmodifieddate;
		public String lastname;
	}

	
	public static JSON2Apex parse(String json) {
        //json-> data coming from response in the from of JSON
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
}