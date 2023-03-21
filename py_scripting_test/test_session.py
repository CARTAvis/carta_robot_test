from carta.session import Session
from carta.browser import Chrome

url_without_token = 'http://localhost:3003'
image_file_0 = 'HD163296_CO_2_1_subimage.fits'

def create_session():
    session = Session.create(Chrome(), url_without_token, debug_no_auth=True)
    session.set_view_area(800, 800)
    img0 = session.open_image(image_file_0)
    img0.set_channel(88)
    img0.set_colormap('tab10')
    session.save_rendered_view('create_session.png')

    return "Done"

def start_and_create_session():
    session = Session.start_and_create(Chrome(), "/Users/kswang/carta_build/carta-backend/build/carta_backend", params=("/Users/kswang/set_QA_e2e_v2", "--frontend_folder", "/Users/kswang/carta_build/carta-frontend/build", "--port", "3003", "--debug_no_auth"))
    session.set_view_area(800, 800)
    img0 = session.open_image(image_file_0)
    img0.set_channel(88)
    img0.set_colormap('tab10')
    session.save_rendered_view('start_and_create_session.png')

    return "Done"

def interact_session(session_id):
    session = Session.interact(url_without_token, session_id, debug_no_auth=True)
    img0 = session.open_image(image_file_0)
    return img0.shape