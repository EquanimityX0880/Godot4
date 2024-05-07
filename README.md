# Godot4
Tinkering with the idea of indie game development

I tend to do more code reading than code writing

I last read about how the Godot engine handles file IO and how I might be able to use this to save progress. I should be able to add objects to a "Persist" group and iterate over each parent node/object belonging to that group by saving a Lua-style dictionary to a file somewhere in %appdata%

Before that, I spent time reading about raycasts and how modern shooters don't handle collision detection the way the older arcade games do. Tunnelling is the main issue first issue one would run into. The faster a projectile is, the less opportunities it has to detect a wall, to determine how it should penetrate, or if it should penetrate to begin with. It very well may just continue on its path.

My notes on this are incomplete but they are included as a Junyper Notebook file alongside this README.md. In an earlier project, I was able to plot out a 3D trajectory by instancing Constructive solid geometry (CSG) spheres with raycasts pointing to the center of the next sphere in the trajectory. The idea was to reduce the likelihood of tunneling by adjusting how many raycasts existed along this parabola by considering the bullet velocity and considering how close the bullet gets to a surface that either stops, deflects, or otherwise allows the bullet to penetrate. Because I lack experience, I only managed to get this system to work properly only when the player pitches. Yaw rotations broke the way I programmed trajectory calculations.

Lastly, this is a hobby project that I spend time on when I have mental bandwidth leftover after work or after spending time with friends/family