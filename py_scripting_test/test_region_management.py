from carta.session import Session
from carta.browser import Chrome
import carta.region as Region
from carta.constants import RegionType

url_without_token = 'http://localhost:3003'
using_headless_chrome = True
custom_chrome_options = ['--use-gl=angle', '--force-device-scale-factor=1','--force-color-profile=srgb']

image_file_0 = 'spire500_ext.fits'

def create_region_annotation_pixel():
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
    # BUG: can we also support center/length/pa?

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


    #img0.regions.export_to("./pye2e_region.crtf")

    # get a list of created regions
    my_region_list = img0.regions.list()
    assert isinstance(my_region_list[0], Region.CompassAnnotation)
    assert my_region_list[0].region_id == 1
    assert my_region_list[0].region_type == RegionType.ANNCOMPASS
    assert my_region_list[0].center == (300, 300)
    #assert my_region_list[0].size == (100, 100) # BUG: when we use add_compass(center, length, name='') to create a 
    # compass annoation, we use length as a float to define the size. However, the CompassAnnotation object has an attibute 
    # called "size" as a tuple (float, float). This might be confusing to users.
    
    assert isinstance(my_region_list[1], Region.EllipticalRegion)
    assert my_region_list[1].region_id == 2
    assert my_region_list[1].region_type == RegionType.ELLIPSE
    assert my_region_list[1].center == (300, 300)
    assert my_region_list[1].semi_axes == (100, 50)
    assert my_region_list[1].rotation == 30
    # BUG?: what does my_region_list[1].size (a tuple as (100, 200) in this case) mean? 

    assert isinstance(my_region_list[2], Region.EllipticalRegion)
    assert my_region_list[2].region_id == 3
    assert my_region_list[2].region_type == RegionType.ANNELLIPSE
    assert my_region_list[2].center == (300, 300)
    assert my_region_list[2].semi_axes == (100, 50)
    assert my_region_list[2].rotation == 45
    # BUG?: what does my_region_list[2].size (a tuple as (100, 200) in this case) mean? 

    assert isinstance(my_region_list[3], Region.LineRegion)
    assert my_region_list[3].region_id == 4
    assert my_region_list[3].region_type == RegionType.LINE
    assert my_region_list[3].control_points == [(300, 300), (500, 400)]
    assert my_region_list[3].center == (400, 350)
    assert my_region_list[3].length == 223.60679774997897
    assert my_region_list[3].rotation == 116.56505117707798



    assert isinstance(my_region_list[4], Region.LineRegion)
    #assert isinstance(my_region_list[5], Region.Region) # BUG?: "6:Point" is an instance of class 'carta.region.Region'???
    assert isinstance(my_region_list[6], Region.PointAnnotation) # "7:Point - Ann is an instance of " class 'carta.region.PointAnnotation'
    assert isinstance(my_region_list[7], Region.PolygonRegion)
    assert isinstance(my_region_list[8], Region.PolygonRegion)
    assert isinstance(my_region_list[9], Region.PolylineRegion)
    assert isinstance(my_region_list[10], Region.PolylineRegion)
    assert isinstance(my_region_list[11], Region.RectangularRegion)
    assert isinstance(my_region_list[12], Region.RectangularRegion)
    assert isinstance(my_region_list[13], Region.RulerAnnotation)
    assert isinstance(my_region_list[14], Region.TextAnnotation)
    assert isinstance(my_region_list[15], Region.VectorAnnotation)


    """
    img0.regions.export_to
    img0.regions.import_from
    img0.regions.get
    imgs.regions.clear
    """


    session.save_rendered_view('create_region_annotation.png')
    
    i = 15
    return dir(my_region_list[i])
    #return "Done"



def manage_point_region():
    session = Session.create(Chrome(headless=using_headless_chrome, options=custom_chrome_options), url_without_token, debug_no_auth=True)
    session.wcs.set_view_area(800, 800)
    img0 = session.open_image(image_file_0)

    my_region = img0.regions.add_point((200, 200), annotation=False, name="my_point_region")

    assert my_region.center == (200, 200)
    assert my_region.color == '#2EE6D6' # BUG: missing set_color method, it is hidden in set_line_style method
    assert my_region.control_points == [(200, 200)]
    assert my_region.dash_length == 0
    assert my_region.line_width == 2
    assert my_region.name == "my_point_region"
    assert my_region.region_id == 1
    assert my_region.region_type == RegionType.POINT
    assert my_region.size == None
    assert my_region.wcs_center == ('7:11:54.9804278286', '-11:27:55.5820918111')
    assert my_region.wcs_size == None

    my_region.set_center(('7:10:00', '-11:00:00'))
    my_region.set_name("my_point_region_renamed")
    assert my_region.center == (320.6804809099717, 319.8820730158677)
    assert my_region.name == "my_point_region_renamed"
    #my_region.set_size = 10 # BUG: no effect. should not have the set_size method for point region
    #my_region.set_line_style # BUG: should not have the set_line_style method for point region
    #my_region.set_control_point # BUG: should not have the set_control_point method for point region
    #my_region.set_control_points # BUG: should not have the set_control_points method for point region

    # 'delete', 'export_to', 'focus', 'lock',  
    # 'unlock',



    session.save_rendered_view('manage_point_region.png')

    return dir(my_region)
    #return "Done"

def manage_rectangle_region():
    session = Session.create(Chrome(headless=using_headless_chrome, options=custom_chrome_options), url_without_token, debug_no_auth=True)
    session.wcs.set_view_area(800, 800)
    img0 = session.open_image(image_file_0)

    my_region = img0.regions.add_point((200, 200), annotation=False, name="my_point_region")

    """
    assert my_region.center == (200, 200)
    assert my_region.color == '#2EE6D6' # BUG: missing set_color method, it is hidden in set_line_style method
    assert my_region.control_points == [(200, 200)]
    assert my_region.dash_length == 0
    assert my_region.line_width == 2
    assert my_region.name == "my_point_region"
    assert my_region.region_id == 1
    assert my_region.region_type == RegionType.POINT
    assert my_region.size == None
    assert my_region.wcs_center == ('7:11:54.9804278286', '-11:27:55.5820918111')
    assert my_region.wcs_size == None

    my_region.set_center(('7:10:00', '-11:00:00'))
    my_region.set_name("my_point_region_renamed")
    assert my_region.center == (320.6804809099717, 319.8820730158677)
    assert my_region.name == "my_point_region_renamed"
    #my_region.set_size = 10 # BUG: no effect. should not have the set_size method for point region
    #my_region.set_line_style # BUG: should not have the set_line_style method for point region
    #my_region.set_control_point # BUG: should not have the set_control_point method for point region
    #my_region.set_control_points # BUG: should not have the set_control_points method for point region

    # 'delete', 'export_to', 'focus', 'lock',  
    # 'unlock',
    """


    session.save_rendered_view('manage_rectangle_region.png')

    return dir(my_region)
    #return "Done"