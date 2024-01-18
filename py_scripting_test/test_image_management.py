from carta.session import Session
from carta.browser import Chrome
from carta.constants import Polarization

url_without_token = 'http://localhost:3003'
using_headless_chrome = True
custom_chrome_options = ['--use-gl=angle', '--force-device-scale-factor=1','--force-color-profile=srgb']

def test_session_initializer():
    return Session.create(Chrome(headless=using_headless_chrome, options=custom_chrome_options), url_without_token, debug_no_auth=True)

def load_and_append_images():
    session = test_session_initializer()
    session.wcs.set_view_area(800, 800)
    img0 = session.open_image("M17_SWex.fits")
    img0.set_channel(12)
    img0.raster.set_colormap('tab10')
    img1 = session.open_image("M17_SWex.image", append=True)
    img1.set_channel(12)
    img1.raster.set_colormap('tab10')
    img1.set_spatial_matching(True)
    img2 = session.open_image("M17_SWex.hdf5", append=True)
    img2.set_channel(12)
    img2.raster.set_colormap('tab10')
    img2.set_spatial_matching(True)
    img3 = session.open_image("M17_SWex.miriad", append=True)
    img3.set_channel(12)
    img3.set_spatial_matching(True)
    img3.raster.set_colormap('tab10')
    session.save_rendered_view('load_and_append_images.png')
    return "Done"


def load_images():
    session = test_session_initializer()
    session.wcs.set_view_area(800, 800)
    imgs = session.open_images(["M17_SWex.fits", "M17_SWex.image", "M17_SWex.hdf5", "M17_SWex.miriad"])
    imgs[0].set_channel(12)
    imgs[0].raster.set_colormap('tab10')
    imgs[1].set_cube_matching(True)
    imgs[1].raster.set_colormap('tab10')
    imgs[2].set_cube_matching(True)
    imgs[2].raster.set_colormap('tab10')
    # M17_SWex.miriad is in BARY, not LSRK, so spectral matching is not as expected
    imgs[3].set_spatial_matching(True)
    imgs[3].set_channel(12)
    imgs[3].raster.set_colormap('tab10')
    session.save_rendered_view('load_images.png')
    return "Done"

def load_fits_image_with_HDUs():
    session = test_session_initializer()
    # load the error HDU
    img = session.open_image("spire500_ext.fits", hdu="6")
    return img.header['EXTNAME']

def load_compressed_fits_image():
    session = test_session_initializer()
    session.wcs.set_view_area(800, 800)
    # load a fz fits image
    img = session.open_image("tu2310418.fits.fz")
    img.raster.set_colormap('tab10')
    session.save_rendered_view('load_fz_fits.png')
    # load a gz fits image
    img = session.open_image("tu2310418.fits.gz")
    img.raster.set_colormap('tab10')
    session.save_rendered_view('load_gz_fits.png')
    return "Done"

def load_complex_image():
    session = test_session_initializer()
    session.wcs.set_view_area(800, 800)
    # load a complex CASA image in different forms
    img = session.open_complex_image("complex.image", "AMPLITUDE")
    session.save_rendered_view('load_complex_image_amplitude.png')
    img = session.open_complex_image("complex.image", "PHASE", append=False)
    session.save_rendered_view('load_complex_image_phase.png')    
    img = session.open_complex_image("complex.image", "REAL", append=False)
    session.save_rendered_view('load_complex_image_real.png')
    img = session.open_complex_image("complex.image", "IMAG", append=False)
    session.save_rendered_view('load_complex_image_imaginary.png')
    return "Done"

def load_Stokes_hypercube():
    session = test_session_initializer()
    session.wcs.set_view_area(800, 800)
    # input files as a list
    img = session.open_hypercube(["IRCp10216_sci.spw0.cube.I.manual.pbcor.fits", 
                                  "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits", 
                                  "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits", 
                                  "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits"])
    img.set_channel(184)
    img.set_polarization(Polarization.PLINEAR)
    session.save_rendered_view('plinear_0.png')
    # input files wit explicit IQUV mapping as a dict
    img = session.open_hypercube({Polarization.I: "IRCp10216_sci.spw0.cube.I.manual.pbcor.fits", 
                                  Polarization.Q: "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits", 
                                  Polarization.U: "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits", 
                                  Polarization.V: "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits"})
    img.set_channel(184)
    img.set_polarization(Polarization.PLINEAR)
    session.save_rendered_view('plinear_1.png')
    return "Done"

def load_image_with_LEL():
    session = test_session_initializer()
    session.wcs.set_view_area(900, 300)
    session.set_viewer_grid(1, 3)
    img1 = session.open_image("dice_one.fits")
    img1.raster.set_colormap('tab10')
    img2 = session.open_image("dice_four.fits", append=True)
    img2.raster.set_colormap('tab10')
    img2.set_spatial_matching(True)
    img3 = session.open_LEL_image("'dice_one.fits'+'dice_four.fits'", append=True)
    img3.raster.set_colormap('tab10')
    img3.set_spatial_matching(True)
    session.save_rendered_view('load_LEL.png')
    session.set_viewer_grid(2, 2, "dynamic")
    return "Done"


def check_image_meta_data():
    session = test_session_initializer()
    imgs = session.open_images(["M17_SWex.fits",
                                "spire500_ext.fits",
                                "IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits"])
    data_to_check = []
    data_to_check.append(imgs[0].depth)
    data_to_check.append(imgs[1].directory)
    data_to_check.append(imgs[2].file_name)
    data_to_check.append(imgs[0].header['OBSERVER'])
    data_to_check.append(imgs[1].height)
    data_to_check.append(imgs[2].image_id)
    data_to_check.append(imgs[2].ndim)
    data_to_check.append(imgs[2].num_polarizations)
    data_to_check.append(len(imgs[2].polarizations))
    data_to_check.append(imgs[0].shape)
    data_to_check.append(imgs[1].valid_wcs)
    data_to_check.append(imgs[0].width)
    #print(data_to_check)
    return data_to_check


def check_matching():
    session = test_session_initializer()
    session.wcs.set_view_area(800, 400)
    
    imgs = session.open_images(["HD163296_CO_2_1_subimage.fits", 
                                "HD163296_13CO_2-1_subimage.fits"])
    imgs[1].make_spatial_reference()
    imgs[1].make_spectral_reference()
    imgs[1].make_raster_scaling_reference()
    imgs[0].set_cube_matching(True)
    imgs[0].set_raster_scaling_matching(True)
    imgs[0].raster.set_colormap("tab10")
    imgs[1].raster.set_colormap("tab10")
    imgs[0].set_channel(88)
    imgs[0].set_center(144, 117)
    imgs[0].zoom_to_size("8arcsec", "x")
    session.save_rendered_view("matching.png")
    return "Done"