from carta.session import Session
from carta.browser import Chrome

url_without_token = 'http://localhost:3003'
using_headless_chrome = True
custom_chrome_options = ['--use-gl=angle', '--force-device-scale-factor=1','--force-color-profile=srgb']

image_file_0 = 'spire500_ext.fits'

def create_region_annotation():
    session = Session.create(Chrome(headless=using_headless_chrome, options=custom_chrome_options), url_without_token, debug_no_auth=True)
    session.wcs.set_view_area(800, 800)
    img0 = session.open_image(image_file_0)

    # create regions and annotations
    img0.regions.add_compass((300, 300), 100, 'my_compass_annotation')

    img0.regions.add_ellipse((300, 300), (100, 50), annotation=False, rotation=30, name='my_ellipse_region')
    img0.regions.add_ellipse((300, 300), (100, 50), annotation=True, rotation=45, name='my_ellipse_annotation')
    # BUG: move annotation kwarg before rotation kwarg, so that we can use positional arg in a more intuitive order
    #      img0.regions.add_ellipse(center, semi_axes, rotation, annotation, name)
    
    img0.regions.add_line((300, 300), (500, 400), annotation=False, name='my_line_region')
    img0.regions.add_line((300, 300), (500, 450), annotation=True, name='my_line_annotation')

    img0.regions.add_point((100, 400), annotation=False, name="my_point_region")
    img0.regions.add_point((150, 400), annotation=True, name="my_point_annotation")
    
    img0.regions.add_polygon(((700, 700), (600, 650), (550, 500)), annotation=False, name='my_polygon_region')
    img0.regions.add_polygon(((750, 750), (650, 700), (600, 550)), annotation=True, name='my_polygon_annotation')


    img0.regions.add_polyline(((400, 700), (300, 650), (250, 500)), annotation=False, name='my_polyline_region')
    img0.regions.add_polyline(((450, 700), (350, 650), (300, 500)), annotation=True, name='my_polyline_annotation')
    
    img0.regions.add_rectangle((700, 200), (50, 100), annotation=False, rotation=10, name='my_rectangle_region')
    img0.regions.add_rectangle((700, 200), (50, 100), annotation=True, rotation=20, name='my_rectangle_annotation')
    # BUG: move annotation kwarg before rotation kwarg, so that we can use positional arg in a more intuitive order
    #      img0.regions.add_rectangle(center, size, rotation, annotation, name)
    
    img0.regions.add_ruler((500, 100), (600, 200), "my_ruler_annotation")
    
    img0.regions.add_text((100, 800), (100, 50), "CARTA", rotation=30, name='my_text_annotation')
    
    img0.regions.add_vector((50, 600), (80, 700), "my_vector_annotation")



    my_region_list = img0.regions.list()

    """
    img0.regions.export_to
    img0.regions.import_from
    img0.regions.get
    imgs.regions.clear
    """






    session.save_rendered_view('create_region_annotation.png')

    return dir(img0.regions), my_region_list
    #return "Done"

