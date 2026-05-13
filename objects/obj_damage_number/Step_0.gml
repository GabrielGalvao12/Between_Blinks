y       += vel_y;
vel_y   *= 0.95; // Desacelera
lifetime--;
if (lifetime <= 0) instance_destroy();

