# Flow Fields - Hackathon Project
This is a simulation of flow fields realized in Processing(Java) under a 4-hour time constraint

Credit to The Coding Train for the helpful guide found [here](https://www.youtube.com/watch?v=BjoM9oKOAKY&list=PLJ4719mkxmAg438ROtpsuNQJ5CPqe70jx&index=20&t=19s&pp=gAQBiAQB). Much of this project was adapting this to work in Processing, along with some fun individual exploration of vector and flow fields.

The entire project, along with pictures and videos, can be found on my [Behance](https://www.behance.net/gallery/185467187/Flow-Fields-Hackathon-Project).

## At a glance
The flow field is created by simulating **ten thousand** particles moving across a field of vectors. The vectors are semi-randomly determined using a Perlin Noise function. As the simulation runs, the vectors slowly change using the third dimension of the noise function. A visualization of the vector field can be seen below.
![A visualization of the Perlin Noise vector field used for the particle simulation](./Vector-Field-Visualization.png)
The particles are generated at random, and their movement is determined by the vectors. For each particle, the nearest vector is found and is used to calculate changes to the velocity of the particle. Each frame, a semi-transparent line is drawn between the particle and its previous position. The low opacity allows for a better visualization of the 10,000 particles, giving the result more depth and making the image seem to fade into existence. Seen below is a simulation run for about a minute.
![A picture of one of the flow field simulations](./Flow-Field-BlueWhite.png)
To see the whole process, along with videos and more pictures, check it out on my [Behance](https://www.behance.net/gallery/185467187/Flow-Fields-Hackathon-Project)!
