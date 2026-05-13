lifetime--;
alpha = lifetime / 15.0;
radius *= 1.08;
if (lifetime <= 0) instance_destroy();
