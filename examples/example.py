#!/usr/bin/env python3
"""
Simple example demonstrating UTCI calculation.
"""

from utci import utci_approx, rh_to_vp


def main():
    """Calculate UTCI for a given set of weather conditions."""
    
    # Example weather conditions
    ta = 25.0      # Air temperature: 25°C
    rh = 60.0      # Relative humidity: 60%
    tmrt = 30.0    # Mean radiant temperature: 30°C  
    va = 2.0       # Wind speed at 10m: 2 m/s
    
    # Convert relative humidity to vapor pressure
    vp = rh_to_vp(ta, rh)
    
    # Calculate UTCI
    utci = utci_approx(ta, vp, tmrt, va)
    
    print("UTCI Calculator Example")
    print("=" * 40)
    print(f"Input conditions:")
    print(f"  Air temperature:     {ta:.1f} °C")
    print(f"  Relative humidity:   {rh:.0f} %")
    print(f"  Mean radiant temp:   {tmrt:.1f} °C")
    print(f"  Wind speed (10m):    {va:.1f} m/s")
    print(f"\nCalculated UTCI:       {utci:.1f} °C")
    
    # Interpret the result
    if utci < -40:
        comfort = "extreme cold stress"
    elif utci < -27:
        comfort = "very strong cold stress"
    elif utci < -13:
        comfort = "strong cold stress"
    elif utci < 0:
        comfort = "moderate cold stress"
    elif utci < 9:
        comfort = "slight cold stress"
    elif utci < 26:
        comfort = "no thermal stress"
    elif utci < 32:
        comfort = "moderate heat stress"
    elif utci < 38:
        comfort = "strong heat stress"
    elif utci < 46:
        comfort = "very strong heat stress"
    else:
        comfort = "extreme heat stress"
    
    print(f"Thermal stress level:  {comfort}")


if __name__ == "__main__":
    main()