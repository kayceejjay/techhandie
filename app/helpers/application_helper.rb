module ApplicationHelper
  
  # def entry
  #   guest = {fname: "0",lname: "0",phone: "0", email: "0", interest: "None"}
  #   guest
  # end
  
  # attr_accessor :name, :phone, :email, :interest
  # class User < ActiveRecord::Base
    
  #   def initialize
  #     @name = name
  #     @phone = phone
  #     @email = email
  #     @interest = interest
  #     @entry = {name: nil, phone: nil, email: nil, interest: nil}
  #   end

  #   def get_entry
  #     @entry[:name] = @name
  #     @entry[:phone] = @phone
  #     @entry[:email] = @email
  #     @entry[:interest] = @interest
  #     @entry
  #   end

  #   def get_binding
  #     binding
  #   end
    
  # end # User
    
    def full_title(page_title = '')
        base_title = "TechHandie Corp."
        if page_title.empty?
          base_title
        else
          page_title + " | " + base_title
        end
    end
    
    def html_link(href, rel, type)
        "<link href='#{href}' rel='#{rel}' type='#{type}'/>"
    end

    def tel_to(text)
        groups = text.to_s.scan(/(?:^\+)?\d+/)
        if groups.size > 1 && groups[0][0] == '+'
          # remove leading 0 in area code if this is an international number
          groups[1] = groups[1][1..-1] if groups[1][0] == '0'
          groups.delete_at(1) if groups[1].size == 0 # remove if it was only a 0
        end
        link_to text, "tel:#{groups.join '-'}"
    end
    
end
