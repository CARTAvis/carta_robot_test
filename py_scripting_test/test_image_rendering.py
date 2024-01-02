from carta.session import Session
from carta.browser import Chrome
from carta.constants import Polarization

url_without_token = 'http://localhost:3003'
using_headless_chrome = True
custom_chrome_options = ['--use-gl=angle', '--force-device-scale-factor=1','--force-color-profile=srgb']

def test_session_initializer():
    return Session.create(Chrome(headless=using_headless_chrome, options=custom_chrome_options), url_without_token, debug_no_auth=True)

def raster_rendering():
    session = test_session_initializer()
    session.overlay.set_view_area(800, 400)
    
    imgs = session.open_images(["HD163296_CO_2_1_subimage.fits", 
                                "HD163296_13CO_2-1_subimage.fits"])
    imgs[1].set_cube_matching(True)
    imgs[1].set_raster_scaling_matching(True)
    imgs[0].raster.set_colormap("tab10")
    imgs[1].raster.set_colormap("tab10")
    imgs[0].set_channel(88)
    imgs[0].set_center(144, 117)
    imgs[0].zoom_to_size("8arcsec", "x")
    # BUG: cannot set center and channel via matched images
    #imgs[1].set_center(98, 98)
    #imgs[1].set_channel(60)
    session.save_rendered_view("raster_rendering.png")
    return "Done"

def contour_rendering():
    session = test_session_initializer()
    session.overlay.set_view_area(800, 400)
    
    imgs = session.open_images(["HD163296_CO_2_1_subimage.fits", 
                                "HD163296_13CO_2-1_subimage.fits"])
    imgs[1].set_cube_matching(True)
    imgs[0].raster.set_colormap("tab10")
    imgs[1].raster.set_colormap("tab10")
    imgs[0].set_channel(88)
    imgs[0].set_center(144, 117)
    # atomic setup
    imgs[1].contours.configure([-0.0209, 0.0331, 0.0871, 0.14, 0.20])
    imgs[1].contours.set_color('white')
    imgs[1].contours.set_dash("NegativeOnly", 3)
    imgs[1].contours.apply()
    # molecular setup
    imgs[0].contours.plot(levels=[0.0373, 0.0874, 0.21, 0.34, 0.46], 
                          smoothing_mode=0, 
                          smoothing_factor=4,
                          dash_mode="Dashed", 
                          dash_thickness=3, 
                          colormap="nipy_spectral",
                          bias=0.1,
                          contrast=1.1)
    session.save_rendered_view("contour_rendering.png")
    return "Done"    