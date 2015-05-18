# Game Programming End of Year Lab Test

## Instructions
- Start with a blank Processing sketch
- You can use any examples from your git repo, my git repo and use the Processing reference
- No use of Google or Facebook and no conferring
- When you are finished, submit the link to your git repo. 
- If you are not confident you can use git, then zip up your code and email it to me
- Remember to save and commit often!
- You have 4 hours

Today you wil be making this simple game in Processing. Its called CrossyBox:

[![YouTube](http://img.youtube.com/vi/RS6hLB-IVIo/0.jpg)](http://www.youtube.com/watch?v=RS6hLB-IVIo)

You can just go ahead and complete it your own way, however you can also follow these instructions. Ive included indicitive marks:

- Create a blank sketch and empty git repo etc on github. Name your sketch and repo to include your name and student number. Push your sketch.
- Put setup and draw methods on your sketch. Make the sketch size 600 x 600.
- Write a method called drawRoad(float y, float w). This method should draw one road using the parameters. The y parameter indicates how far down the screen you should draw the road and the w parameter specifies the width of the road. As you can see, the road is just two horizontal lines and you should use a for loop to draw the lines at the center of the road. 	(8 marks)
- In the draw method of your sketch, write a for loop to draw the three roads evenly spaced on the screen. Do this by calling the method you previously wrote.	(8 marks)
- Write a class Player with the following fields (8 marks)

	```Java
	float w, h;
	float halfWidth;   
	float halfHeight;       
	PVector position;
	float speed;
	color c;  
	```
- Write the following methods on the Player class
	- A constructor
	- A display method that draws the player
	- A move method that allows the player to move in response to the arrow keys	(8 marks)
- In your sketch, create an instance of the Player (called player) and in the draw method, call the move and display methods on the player
(8 marks)
- Write a class Car with the following fields:

	```Java
  float w, l;
  float halfWidth;   
  float halfLength;   
    
  PVector position;
  PVector look;
  float speed;
  float rot = 0; // Sideways
  color c;  
```
(8 marks)
- Write the following methods on the Car class:
	- A constructor
	- A display method. I used pushMatrix and popMatrix. If you notice the video, you will see that I can have different sizes and colours of cars. (8 marks)
	- A move method. This method should reset the car when it goes beyond the bounds of the screen
	- (8 marks)
	- You might like to have a reset method that randomly assigns the car colour and sizes	 
- Create an ArrayList of Car instances and add one car for each road (8 marks)
- Iterate through the array list in the draw method and call the move and display methods on the car instances in the array list (8 marks)
- Create a Treasure class. Im sure you can figure out what fields/methods etc you need (8 marks)
- Create an instance of the treasure class in the sketch and call the display method on the treasure (4 marks)
- Put in some collision handling so that the player can get a score and pick up the treasure
(8 marks)

Additional stuff you might want to implement for bonus marks:
- Add collisions between the player and the cars
- Allow multiple cars on each road
- Make the cars speed up

[Submit your project](https://docs.google.com/forms/d/1s7naHzwjLsE2Gd_OTPXZP1rX9T61EtqX1CRfCJ6HnX4/viewform)