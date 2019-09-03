--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--


entered = false;
hasKey = false;
lookedaround = false;


function story(aName)
	if(aName == "start") then
		playMusic("background.wav")
		setBackground("DeLorean.PNG")
		createTextfield("While walking home after a long work shift you spot a strange looking vehicle parked by the road.")
		createButton("exit", "Ignore the car and keep going")
		createButton("checkCar", "Check out the car")
	end
	if(aName == "checkCar") then
		if(entered == false) then		
			entered = true;
		else
			playSound("footstep.wav")
		end
		CLS();
		playSound("CarDoorHandle.WAV")
		setBackground("DeloreanInside.JPG");
		createTextfield("You approach the car and out of curiousity you attempt to open the door. To your surprise the car is entirely unlocked")
		createButton("Steal", "Take all valuable looking items and continue home");
		createButton("Entercar", "Enter the car")
		createButton("exit", "Stop what you're doing and leave")
	end	
	if(aName == "Steal") then
		CLS();
		playSound("Rummaging.wav")
		setBackground("ModernHome.JPG")
		createTextfield("You take as much as you can carry and run home")
		createButton("exit", "List all the items up for auction and go to bed")
		end

	if(aName == "Entercar") then		
		CLS();
		setBackground("DeLoreanInterior.jpg")
		createTextfield("You enter the car, it has a strange looking dashboard with al sorts of lights.")
		createButton("exit", "Decide this isnt right and leave");				
		if(hasKey == false) then
			createButton("searchGlove", "Search the glove box")
		end
		if(hasKey == true) then
			createButton("startcar", "Start the car")
		end
	end
	if(aName == "searchGlove") then
		playSound("footstep.wav")
		CLS();
		setBackground("GloveBox.JPG")		
		createTextfield("You check the glove box and find a key!")
		createButton("Entercar", "Back")
		hasKey = true;
	end
	if(aName == "startcar") then
		playSound("CarIgnition.wav")
		CLS();		
		setBackground("DeLoreanTimeTravel.jpg")
		createTextfield("You start the car and drive along the highway. As soon as the car hits 80MPH you see a bright flash")			
		createButton("TimeTravel", "Whats happening?")
	end
	
	if(aName == "TimeTravel") then
	CLS();
		setBackground("80sStreet.jpg")
		createTextfield("The car comes to a grinding halt and after looking around you realise you have no idea where you are")
		createButton("look", "Look around")
	end

	if(aName == "look") then
		CLS();
		lookaround = true;
		createTextfield("You look around you and see a Disco, old cars and colourfull clothing. Feels like the 80s or something")
		createButton("exit", "Turn the car around and go back home")
	end

	if(aName == "exit") then
		exitGame();
	end
end

