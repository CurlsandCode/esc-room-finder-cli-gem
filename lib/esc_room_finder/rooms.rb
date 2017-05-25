
class EscRoomFinder::EscRoom
  
  attr_accessor :businssName, :street, :city, :state, :phone, :zip, :websiteURL 
      
  @@all = []
    
    def initalize(businessName,street,city,state,phone,zip)
        @businessName = businsessName
        @street= street
        @city =city
        @state =state
        @phone =phone
        @zip = zip
        @all << self
     end
    
  def self.all
    @@all
  end

 def self.find(index)
    self.all[index]
  end

 

end