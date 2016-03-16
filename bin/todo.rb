class ToDoList
  def welcome
    puts "Welcome to your Daily Planner!"
    puts "Please enter your name below."
    print ">> "
    @user_name = gets.chomp
    puts "Thanks, #{@user_name}."
    sleep 2
    welcome_loop
  end

  def welcome_loop
    system ("clear")
    loop do
      puts "Press (T) to update your to-do list."
      puts "Press (C) to update your completed list."
      puts "To view what you have so far on your lists, press (L)."
      puts "Press (Q) to quit."
      welcome_decision = gets.chomp.upcase
      if welcome_decision == "T"
        incomplete_list_generator
      elsif welcome_decision == "C"
        completed_list_generator
      elsif welcome_decision == "L"
        list_display
      elsif welcome_decision == "Q"
        exit
      else
        puts "Huh?"
        sleep 2
      end
    end
  end

  def incomplete_list_generator
    system "clear"
    @not_finished_list = []
    loop do
      puts "What do you need to get done today?"
      task = gets.chomp.downcase
      @not_finished_list.push(task)
      puts "Anything else to do today?"
      puts "Type (Y)es or (N)o."
      user_add_choice = gets.chomp.upcase
      if user_add_choice == "Y"
        puts "Ok."
      elsif user_add_choice == "N"
        list_display
      else
        puts "That's not a valid choice."
        sleep 2
      end
    end
  end

  def completed_list_generator
    @finished_list = []
    puts "Your to-do list includes the following:"
    puts @not_finished_list
    puts "Your completed list includes the following:"
    puts @finished_list
    puts "What do you want to move to the completed list?"
    item_for_removal = gets.chomp.downcase
    list_check = @not_finished_list.any? {|word| word == item_for_removal}
      if list_check == true
        @finished_list.push(item_for_removal)
        @not_finished_list.delete_if {|word| word == item_for_removal}
        puts "Your task has been placed on your completed list."
        sleep 4
        welcome_loop
      else
        puts "We can't find a task on your list that matches what you wrote. Try again."
        sleep 4
        completed_list_generator
      end
  end

  def list_display
    system ("clear")
    loop do
      puts "Your lists are ready, #{@user_name}!"
      puts "To view what's on your to-do list, press (I)."
      puts "To view what's on your completed list, press (C)"
      puts "To go back to the main menu, please (M)."
      puts "To quit, press (Q)."
      user_view_choice = gets.chomp.upcase
        if user_view_choice == "I"
          puts "You still need to do the following things:"
          puts @not_finished_list
          sleep 4
          list_display
        elsif user_view_choice == "C"
          puts "You've done the following things:"
          puts @finished_list
          sleep 4
          list_display
        elsif user_view_choice == "Q"
          quit
        elsif user_view_choice == "M"
          welcome_loop
        else
          puts "Huh? That's not an option."
        end
      end
  end
end

ToDoList.new.welcome
