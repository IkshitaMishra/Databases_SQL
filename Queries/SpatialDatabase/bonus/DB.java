public class DB {
        public static void main(String[] args) {
            //Initialize
            double r = 1.0;
            double a = 4.0;
            double R = 8.0;
            int n = 16;
            double PI = Math.PI;
            double t;

            for (t = 0.0; t < (PI * n); t += 0.1) {

                double x = (R + r) * Math.cos((r / R) * t) - a * Math.cos((1 + r / R) * t);
                double y = (R + r) * Math.sin((r / R) * t) - a * Math.sin((1 + r / R) * t);

                double longi = -118.289158;
                double lat = 34.0212803;
                System.out.println((longi + (x/1000)) + "," + (lat + (y/1000)) +",50");

            }
        }
}
