from carta.session import Session
from carta.browser import Chrome
from carta.constants import VectorOverlaySource
from carta.constants import BeamType
from carta.constants import PaletteColor
from carta.constants import CoordinateSystem
from carta.constants import ColorbarPosition
from carta.constants import FontFamily, FontStyle
from carta.constants import LabelType

url_without_token = 'http://localhost:3003'
using_headless_chrome = True
custom_chrome_options = ['--use-gl=angle', '--force-device-scale-factor=1','--force-color-profile=srgb']

def test_session_initializer():
    return Session.create(Chrome(headless=using_headless_chrome, options=custom_chrome_options), url_without_token, debug_no_auth=True)

def raster_rendering():
    session = test_session_initializer()
    session.wcs.set_view_area(800, 400)
    
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
    session.wcs.set_view_area(800, 400)
    
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
    session.wcs.set_view_area(800, 400)

    imgs = session.open_images(["HL_Tau.POLI.fits", 
                                "HL_Tau_StokesIQUV_clean.pbcor.fits"])
    imgs[1].set_spatial_matching(True)
    # likely a bug: AttributeError: 'Numbers' object has no attribute 'session'
    #imgs[1].set_center("4h31m38.429s", "18d13m57.20s")
    imgs[1].set_center(267, 252)
    imgs[1].zoom_to_size("1.88arcsec", "y")
    imgs[0].raster.set_colormap('nipy_spectral')
    imgs[1].raster.set_colormap('nipy_spectral')

    # atomic setup
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
    imgs[0].vectors.set_intensity_range(0.0002, 0.0009)
    imgs[0].vectors.set_bias_and_contrast(0.1, 0.9)
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
    imgs[1].vectors.set_thickness(2)
    imgs[1].vectors.apply()    
    
    session.save_rendered_view("vector_field_rendering_atomic.png")
    imgs[0].vectors.clear()
    imgs[1].vectors.clear()
    session.save_rendered_view("vector_field_rendering_reset.png")
    # molecular setup
    imgs[0].vectors.plot(angular_source=VectorOverlaySource.NONE,
                         intensity_source=VectorOverlaySource.CURRENT,
                         pixel_averaging_enabled=True,
                         pixel_averaging=4,
                         fractional_intensity=False,
                         threshold_enabled=True,
                         threshold=0.0001,
                         debiasing=False,
                         intensity_min=0.0002,
                         intensity_max=0.0009,
                         length_min=0,
                         length_max=10,
                         colormap='tab10',
                         bias=0.1,
                         contrast=0.9)
    imgs[1].vectors.plot(angular_source=VectorOverlaySource.COMPUTED,
                         intensity_source=VectorOverlaySource.COMPUTED,
                         pixel_averaging_enabled=True,
                         pixel_averaging=4,
                         fractional_intensity=False,
                         threshold_enabled=True,
                         threshold=0.001,
                         debiasing=True,
                         q_error=0.0001,
                         u_error=0.0001,
                         thickness=2,
                         length_min=0,
                         length_max=30,
                         rotation_offset=90,
                         color='white')
    session.save_rendered_view("vector_field_rendering_molecular.png")

    return "Done"


def wcs_rendering():
    session = test_session_initializer()
    session.wcs.set_view_area(800, 400)

    imgs = session.open_images(["HD163296_CO_2_1.mom0.fits", 
                                "HD163296_CO_2_1.mom1.fits"])
    imgs[1].set_spatial_matching(True)
    imgs[1].zoom_to_size("11arcsec", "x")
    imgs[0].raster.set_colormap('nipy_spectral')
    imgs[1].raster.set_colormap('jet')

    # check global settings
    global_ = session.wcs.global_
    global_.set_color(PaletteColor.RED)
    global_.set_coordinate_system(CoordinateSystem.GALACTIC)
    global_.set_labelling(LabelType.INTERIOR)
    global_.set_tolerance(0.1)
    assert global_.color == PaletteColor.RED
    assert global_.coordinate_system == CoordinateSystem.GALACTIC
    assert global_.labelling == LabelType.INTERIOR
    assert global_.tolerance == 0.1

    session.save_rendered_view("wcs_rendering_global.png", 'white')

    # check session.wcs.axes here since it only works for interior axes
    axes = session.wcs.axes
    axes.set_color(PaletteColor.WHITE)
    axes.set_custom_color(True)
    axes.set_visible(False)
    axes.set_width(2)
    assert axes.width == 2
    assert axes.color == PaletteColor.WHITE
    assert axes.custom_color == True
    assert axes.visible == False
    axes.hide() # this is equivalent to axes.set_visible(False)
    axes.show() # this is equivalent to axes.set_visible(True)

    session.save_rendered_view("wcs_rendering_global_interior_axes.png", 'white')


    # reset testing state for other wcs components
    session.close()
    session = test_session_initializer()
    session.wcs.set_view_area(800, 400)

    imgs = session.open_images(["HD163296_CO_2_1.mom0.fits", 
                                "HD163296_CO_2_1.mom1.fits"])
    imgs[1].set_spatial_matching(True)
    imgs[1].zoom_to_size("11arcsec", "x")
    imgs[0].raster.set_colormap('nipy_spectral')
    imgs[1].raster.set_colormap('jet')

    # check session.wcs.beam
    beam = session.wcs.beam # BUG: This only applies to active image. We need to be able to set beam properties per image.
    beam.set_color(PaletteColor.RED)
    beam.set_position(280, 320)
    beam.set_type(BeamType.SOLID)
    beam.set_visible(True)
    beam.set_width(2)
    assert beam.color == PaletteColor.RED
    assert beam.position == (280, 320)
    assert beam.type == BeamType.SOLID
    assert beam.visible == True
    assert beam.width == 2
    beam.hide() # this is equivalent to beam.set_visible(False)
    beam.show() # this is equivalent to beam.set_visible(True)

    session.save_rendered_view("wcs_rendering_beam.png", 'white')

    # check session.wcs.border
    border = session.wcs.border
    border.set_color(PaletteColor.BLACK)
    border.set_custom_color(True)
    border.set_visible(False)
    border.set_width(2)
    assert border.color == PaletteColor.BLACK
    assert border.custom_color == True
    assert border.visible == False
    assert border.width == 2
    border.hide() # this is equivalent border.set_visible(False)
    border.show() # this is equivalent border.set_visible(True)

    session.save_rendered_view("wcs_rendering_border.png", 'white')

    # check session.wcs.colorbar
    colorbar = session.wcs.colorbar

    colorbar.set_color(PaletteColor.BLACK)
    colorbar.set_custom_color(True)
    colorbar.set_interactive(False)
    colorbar.set_offset(10)
    colorbar.set_position(ColorbarPosition.TOP)
    colorbar.set_visible(True)
    colorbar.set_width(20)
    assert colorbar.color == PaletteColor.BLACK
    assert colorbar.custom_color == True
    assert colorbar.interactive == False
    assert colorbar.offset == 10
    assert colorbar.position == ColorbarPosition.TOP
    assert colorbar.visible == True
    assert colorbar.width == 20

    colorbar.label.set_color(PaletteColor.GREEN)
    colorbar.label.set_custom_color(True)
    colorbar.label.set_custom_text(True)
    # BUG: missing colorbar.label.set_text()
    colorbar.label.set_font(FontFamily.COURIER_NEW, FontStyle.BOLD) # BUG: setting BOLD results in ITALIC, missing font size
    colorbar.label.set_rotation(90) # NOTE: igored when the colorbar position is top or bottom
    colorbar.label.set_visible(True)
    assert colorbar.label.color == PaletteColor.GREEN
    assert colorbar.label.custom_color == True
    assert colorbar.label.custom_text == True
    # BUG: missing colorbar.label.text()
    assert colorbar.label.font == (FontFamily.COURIER_NEW, FontStyle.BOLD)
    assert colorbar.label.rotation == 90
    assert colorbar.label.visible == True
    colorbar.label.hide() # this is equivalent to colorbar.label.set_visible(False)
    colorbar.label.show() # this is equivalent to colorbar.label.set_visible(True)

    colorbar.numbers.set_color(PaletteColor.ORANGE)
    colorbar.numbers.set_custom_color(True)
    colorbar.numbers.set_custom_precision(True)
    #colorbar.numbers.set_custom_text # BUG: this is not needed actually
    colorbar.numbers.set_font(FontFamily.COURIER_NEW, FontStyle.BOLD)
    colorbar.numbers.set_precision(4)
    colorbar.numbers.set_rotation(90) # NOTE: igored when the colorbar position is top or bottom
    colorbar.numbers.set_visible(True)
    assert colorbar.numbers.color == PaletteColor.ORANGE
    assert colorbar.numbers.custom_color == True
    assert colorbar.numbers.custom_precision == True
    #colorbar.numbers.custom_text # BUG: cannot get this value and this is not needed actually
    assert colorbar.numbers.font == (FontFamily.COURIER_NEW, FontStyle.BOLD) # BUG: missing font size, bold results in italic
    assert colorbar.numbers.precision == 4
    assert colorbar.numbers.rotation == 90
    assert colorbar.numbers.visible == True
    colorbar.numbers.hide() # this is equivalent to colorbar.numbers.set_visible(False)
    colorbar.numbers.show() # this is equivalent to colorbar.numbers.set_visible(True)
    
    colorbar.ticks.set_color(PaletteColor.WHITE)
    colorbar.ticks.set_custom_color(True)
    colorbar.ticks.set_density(1.5)
    colorbar.ticks.set_length(12)
    colorbar.ticks.set_visible(True)
    colorbar.ticks.set_width(2)
    assert colorbar.ticks.color == PaletteColor.WHITE
    assert colorbar.ticks.custom_color == True
    assert colorbar.ticks.density == 1.5
    assert colorbar.ticks.length == 12
    assert colorbar.ticks.visible == True
    assert colorbar.ticks.width == 2
    colorbar.ticks.hide() # this is equivalent to colorbar.ticks.set_visible(False)
    colorbar.ticks.show() # this is equivalent to colorbar.ticks.set_visible(True)
    
    colorbar.border.set_color(PaletteColor.RED)
    colorbar.border.set_custom_color(True)
    colorbar.border.set_visible(True)
    colorbar.border.set_width(2)
    assert colorbar.border.color == PaletteColor.RED
    assert colorbar.border.custom_color == True
    assert colorbar.border.visible == True
    assert colorbar.border.width == 2 
    colorbar.border.hide() # this is equivalent to colorbar.border.set_visible(False)
    colorbar.border.show() # this is equivalent to colorbar.border.set_visible(True)

    colorbar.gradient.set_visible(True) # BUG: do we really need this?
    assert colorbar.gradient.visible == True
    colorbar.gradient.hide() # this is equivalent to colorbar.gradient.set_visible(False)
    colorbar.gradient.show() # this is equivalent to colorbar.gradient.set_visible(True)


    colorbar.hide() # this is equivalent to colorbar.set_visible(False)
    colorbar.show() # this is equivalent to colorbar.set_visible(True)

    session.save_rendered_view("wcs_rendering_colorbar.png", 'white')













    """
    session.wcs.grid
    session.wcs.labels
    session.wcs.numbers
    session.wcs.set_view_area
    session.wcs.ticks
    session.wcs.title
    session.wcs.toggle_labels
    """


    #session.save_rendered_view("wcs_rendering_beam.png", 'white')

    # TODO: add test for session.wcs.axes which is only effective with interior axes 


    #return "Done"
    session.close()
    return(dir(session.wcs.colorbar.gradient))



