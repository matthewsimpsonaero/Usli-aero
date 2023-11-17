from rocketpy import Environment, SolidMotor, Rocket, Flight
import numpy as np
import datetime

env = Environment(latitude=34.7378, longitude=-86.6103, elevation=177.0888)

tomorrow = datetime.date.today() + datetime.timedelta(days=1)

env.set_date(
    (tomorrow.year, tomorrow.month, tomorrow.day, 12)
)  # Hour given in UTC time
env.set_atmospheric_model(type="Forecast", file="GFS")
#custom_wind_profile = np.array([
#    [0, 10, 90],     # 10 m/s from the East at ground level
#    [1000, 10, 90],  # 10 m/s from the East at 1000 m
#    [2000, 10, 90],  # 10 m/s from the East at 2000 m
#    # ... (continue for all required altitudes)
#])

# Apply the custom wind profile to the environment
#env.set_atmospheric_model(type='custom_atmosphere',wind_u=3)
#env.info()

L1520T = SolidMotor(
    thrust_source="C:\\Users\\Matthew Simpson\\Desktop\\Usli-aero\\RocketPy\\FullScale_Files\\AeroTech_L1520T.eng", # Needs to be changed to the file path of the engine data (wherever that is for you)
    burn_time=2.4,
    grain_number=3,
    grain_separation= 0.0016,
    grain_density= 890,
    grain_outer_radius= 0.037500052,
    grain_initial_inner_radius = 0.011112,
    grain_initial_height= 0.1736,
    nozzle_radius= 0.023813,
    throat_radius = 0.0084995,
    dry_mass = 1.797,
    dry_inertia = (0.075, 0.075, 0.0015),
    grains_center_of_mass_position = 0.3031998,
    center_of_dry_mass_position = 0.3031998,
    coordinate_system_orientation='nozzle_to_combustion_chamber'
)
#L1520T.info()

FullScale = Rocket(
    radius=0.07835,
    mass= (36/2.205),
    inertia = (10.185, 10.185,0.0528),
    power_off_drag="C:\\Users\\Matthew Simpson\\Desktop\\Usli-aero\\RocketPy\\FullScale_Files\\OR_power_off_2024.csv",
    power_on_drag="C:\\Users\\Matthew Simpson\\Desktop\\Usli-aero\RocketPy\\FullScale_Files\\OR_power_on_2024.csv",
    center_of_mass_without_motor = 1.5,
    coordinate_system_orientation='nose_to_tail',

)

FullScale.set_rail_buttons(1.5, 0.06)

FullScale.add_nose(length=0.6096, kind="ogive", position = 0)

FullScale.add_trapezoidal_fins(
    n=4,
    root_chord=0.2032,
    tip_chord=0.1016,
    span=0.13335,
    position = 2.4638,
    cant_angle=0,
    sweep_length = 0.1905,
)

FullScale.add_motor(L1520T, position=2.6924)
#FullScale.all_info()

FullScale.add_parachute(
    "Main",
    cd_s=7.865,
    trigger=243.84,
    sampling_rate=105,
    lag=1.5,
)

FullScale.add_parachute(
    "Drogue",
    cd_s= 1.44474,
    trigger="apogee",
    sampling_rate=105,
    lag=1.5,
)

test_flight = Flight(
    rocket=FullScale, environment=env, rail_length=3.6, inclination=85, heading=0,terminate_on_apogee=True
)
#test_flight.all_info()
print(f'\nApogee: {(test_flight.apogee - env.elevation)*3.28084} feet')