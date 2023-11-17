from rocketpy import Environment, SolidMotor, Rocket, Flight
import numpy as np
import datetime

env = Environment(latitude=35.167, longitude=-76.826, elevation=2.13)

tomorrow = datetime.date.today() + datetime.timedelta(days=1)

env.set_date(
    (tomorrow.year, tomorrow.month, tomorrow.day, 15)
)  # Hour given in UTC time
env.set_atmospheric_model(type="Forecast", file="GFS")

# Apply the custom wind profile to the environment
env.info()

J500G = SolidMotor(
    thrust_source="C:\\Users\\Matthew Simpson\\Desktop\\Usli-aero\\RocketPy\\SubScale_Files\\AeroTech_J500G.eng", # Needs to be changed to the file path of the engine data (wherever that is for you)
    burn_time=1.4,
    grain_number=6,
    grain_separation= 0.0016,
    grain_density= 116,
    grain_outer_radius= 0.038,
    grain_initial_inner_radius = 0.008,
    grain_initial_height= 0.12,
    nozzle_radius= 0.01747,
    throat_radius = 0.00739,
    dry_mass = 0.291,
    dry_inertia = (0.06, 0.06, 0.001),
    grains_center_of_mass_position = 0.18,
    center_of_dry_mass_position = 0.18,
    coordinate_system_orientation='nozzle_to_combustion_chamber'
)
#J500G.info()

SubScale = Rocket(
    radius=0.0511048,
    mass= (13.4/2.205),
    inertia = (2.2261, 2.2261,0.0193), # calcualted using a cylinder
    power_off_drag="C:\\Users\\Matthew Simpson\\Desktop\\Usli-aero\\RocketPy\\SubScale_Files\\OR_power_off_2024.csv",
    power_on_drag="C:\\Users\\Matthew Simpson\\Desktop\\Usli-aero\\RocketPy\\SubScale_Files\\OR_power_on_2024.csv",
    center_of_mass_without_motor = 1.05,
    coordinate_system_orientation='nose_to_tail',

)

SubScale.set_rail_buttons(1.434719, 1.742694)

SubScale.add_nose(length=0.42545, kind="ogive", position = 0)

SubScale.add_trapezoidal_fins(
    n=4,
    root_chord=0.1524,
    tip_chord=0.0762,
    span=0.07718,
    position = 1.635,
    cant_angle=0,
    sweep_length = 0.1195,
)

SubScale.add_motor(J500G, position=1.383)

SubScale.all_info()

SubScale.add_parachute(
    "Main",
    cd_s=2.568,
    trigger=243.84,
    sampling_rate=105,
    lag=1.5,
)

SubScale.add_parachute(
    "Drogue",
    cd_s= 0.1767096472,
    trigger="apogee",
    sampling_rate=105,
    lag=1.5,
)

test_flight = Flight(
    rocket=SubScale, environment=env, rail_length=3.6, inclination=85, heading=0,terminate_on_apogee=True
)
#test_flight.all_info()
print(f'Apogee: {(test_flight.apogee - env.elevation)*3.28084} feet')