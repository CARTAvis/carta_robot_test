from carta.session import Session
from carta.browser import Chrome
from carta.constants import VectorOverlaySource

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
    imgs[1].contours.set_dash_mode("NegativeOnly")
    imgs[1].contours.set_thickness(3)
    imgs[1].contours.apply()
    # molecular setup
    imgs[0].contours.plot(levels=[0.0373, 0.0874, 0.21, 0.34, 0.46], 
                          smoothing_mode=0, 
                          smoothing_factor=4,
                          dash_mode="Dashed", 
                          thickness=3, 
                          colormap="nipy_spectral",
                          bias=0.1,
                          contrast=1.1)
    session.save_rendered_view("contour_rendering.png")
    return "Done"    

def vector_field_rendering():
    session = test_session_initializer()
    session.overlay.set_view_area(800, 400)

    imgs = session.open_images(["HL_Tau.POLI.fits", 
                                "HL_Tau_StokesIQUV_clean.pbcor.fits"])
    imgs[1].set_spatial_matching(True)
    # likely a bug: AttributeError: 'Numbers' object has no attribute 'session'
    #imgs[1].set_center("4h31m38.429s", "18d13m57.20s")
    imgs[1].set_center(267, 252)
    imgs[1].zoom_to_size("1.88arcsec", "y")

    imgs[0].vectors.configure(angular_source=VectorOverlaySource.NONE, 
                              intensity_source=VectorOverlaySource.CURRENT,
                              pixel_averaging_enabled=True,
                              pixel_averaging=4,
                              fractional_intensity=False,
                              threshold_enabled=True,
                              threshold=0.0001,
                              debiasing=False)
    imgs[0].vectors.set_length_range(0, 10)
    imgs[0].vectors.set_colormap('tab10')
    imgs[0].vectors.apply()
    
    imgs[1].vectors.configure(angular_source=VectorOverlaySource.COMPUTED, 
                              intensity_source=VectorOverlaySource.COMPUTED,
                              pixel_averaging_enabled=True,
                              pixel_averaging=4,
                              fractional_intensity=False,
                              threshold_enabled=True,
                              threshold=0.001,
                              debiasing=True,
                              q_error=0.0001,
                              u_error=0.0001)
    imgs[1].vectors.set_length_range(0, 30)
    imgs[1].vectors.set_rotation_offset(90)
    imgs[1].vectors.set_color('white')
    imgs[1].vectors.apply()    
    
    
    
    
    
    session.save_rendered_view("vector_field_rendering.png")

    return "Done"