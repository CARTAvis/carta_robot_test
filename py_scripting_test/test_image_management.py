from carta.session import Session
from carta.browser import Chrome

url_without_token = 'http://localhost:3003'

image_file_0 = 'HD163296_CO_2_1_subimage.fits'
image_file_1 = 'HD163296_13CO_2-1_subimage.fits'

def test_session_initializer():
    return Session.create(Chrome(), url_without_token, debug_no_auth=True)

def load_fits_image():
    session = test_session_initializer()
    session.set_view_area(800, 800)
    img = session.open_image(image_file_0)
    img.set_channel(88)
    img.set_colormap('tab10')
    session.save_rendered_view('load_fits_image_0.png')
    img = session.open_image(image_file_1)
    img.set_channel(26)
    img.set_colormap('tab10')
    session.save_rendered_view('load_fits_image_1.png')
    return "Done"

def load_fits_image_with_HDUs():
    session = test_session_initializer()
    session.set_view_area(800, 800)
    # load the error HDU
    img = session.open_image("spire500_ext.fits", hdu="6")
    return img.header['EXTNAME']

def load_compressed_fits_image():
    session = test_session_initializer()
    session.set_view_area(800, 800)
    # load a fz fits image
    img = session.open_image("tu2310418.fits.fz")
    img.set_colormap('tab10')
    session.save_rendered_view('load_fz_fits.png')
    # load a gz fits image
    img = session.open_image("tu2310418.fits.gz")
    img.set_colormap('tab10')
    session.save_rendered_view('load_gz_fits.png')
    return "Done"

def load_complex_image():
    session = test_session_initializer()
    session.set_view_area(800, 800)
    # not yet fully supported
    return "Done"

def load_Stokes_hypercube():
    session = test_session_initializer()
    session.set_view_area(800, 800)
    # not yet supported
    return "Done"

def load_image_with_LEL():
    session = test_session_initializer()
    session.set_view_area(800, 800)
    # not yet supported
    return "Done"