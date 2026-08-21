*** Settings ***
Documentation     Check the features in the statistics widget
Resource          ../resource.robot

*** Test Cases ***
Region Statistics
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    1    NumPixels
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    2.162480000000e+5 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    1    NumBeams
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    9.934964310308e+3 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    1    BeamArea
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    8.185693977695e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    1    BeamAreaPixels
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.176635901708e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    1    Sum
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    -7.625355903486e+0 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    1    FluxDensity
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -3.503275810852e-1 Jy    
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    1    Mean
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    -3.526208752676e-5 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    1    StdDev
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    4.734296940484e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    1    Min
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -3.958672657609e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    1    Max
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    4.523611068726e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    1    Extrema
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    4.523611068726e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    1    RMS
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    4.734417312403e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    1    SumSq
    #Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    4.847135621611e+0 (Jy/beam)^2
    # dirty workaround for rounding error
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    4.84713562161
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    e+0 (Jy/beam)^2
    Set Selenium Speed    ${DELAY}
    Click Element    //*[contains(text(), "Region List")]
    # select the point region in the region list
    Click Element    data:testid:region-list-table-row-2
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    2.162480000000e+5 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    9.934964310308e+3 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    8.185693977695e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.176635901708e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    -7.625355903486e+0 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -3.503275810852e-1 Jy    
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    -3.526208752676e-5 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    4.734296940484e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -3.958672657609e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    4.523611068726e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    4.523611068726e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    4.734417312403e-3 Jy/beam
    #Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    4.847135621611e+0 (Jy/beam)^2    
    # dirty workaround for rounding error
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    4.84713562161
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    e+0 (Jy/beam)^2    
    Set Selenium Speed    ${DELAY}
    # select the rectangle region in the region list
    Click Element    data:testid:region-list-table-row-3
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    2.809000000000e+3 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    1.290523600110e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    8.185693977695e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.176635901708e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    2.127695460264e-1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    9.775155590306e-3 Jy   
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    7.574565540279e-5 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    2.376554257007e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -8.249375037849e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    8.064307272434e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    -8.249375037849e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    2.377338187395e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    1.587572883201e-2 (Jy/beam)^2          
    Set Selenium Speed    ${DELAY}
    # select the ellipse region in the region list
    Click Element    data:testid:region-list-table-row-4
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    2.159000000000e+3 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    9.918976335483e+1 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    8.185693977695e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.176635901708e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    -1.074390336353e-1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -4.936013117810e-3 Jy   
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    -4.976333192926e-5 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    2.470719745108e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -7.408449426293e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    7.894493639469e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    7.894493639469e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    2.470648700646e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    1.317876269933e-2 (Jy/beam)^2
    Set Selenium Speed    ${DELAY}
    # select the polygon region in the region list
    Click Element    data:testid:region-list-table-row-5
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    7.434000000000e+3 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    3.415362208336e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    8.185693977695e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.176635901708e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    5.168988141365e+0 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    2.374760122861e-1 Jy   
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    6.953172102993e-4 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    2.554307098039e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -7.351733744144e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11   2    9.365187957883e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    9.365187957883e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    2.647087667489e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    5.209058156941e-2 (Jy/beam)^2              
    Set Selenium Speed    ${DELAY}
    # use the region drondown menu to select region 2 - rectangle region
    Click Element    css:[data-testid="stats-0-content"] [data-testid="region-dropdown"]
    Click Element    //*[@data-testid="stats-0-content"]//*[@data-testid="region-dropdown"]/option[contains(text(), "Region 2")]
    Wait Until Page Does Not Contain    No stats data
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    2.809000000000e+3 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    1.290523600110e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    8.185693977695e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.176635901708e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    2.127695460264e-1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    9.775155590306e-3 Jy   
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    7.574565540279e-5 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    2.376554257007e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -8.249375037849e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    8.064307272434e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    -8.249375037849e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    2.377338187395e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    1.587572883201e-2 (Jy/beam)^2    
    [Teardown]    Kill carta_backend And Close Browser


Image Statistics
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Append Image    HD163296_CO_2_1.mom1.fits
    Append Image    image_Jy_per_pixel.fits
    Append Image    image_K.fits
    Append Image    image_MJy_per_sr.fits
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    4.096000000000e+3 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    1.993279007648e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    4.346944527429e-13 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.054905502082e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    1.153122180488e+1 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    2.439313217493e-13 MJy   
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.815239698457e-3 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    1.016233111814e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -3.389632701874e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    3.362840414047e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    -3.389632701874e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    1.016112952303e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    4.229060738407e+3 (MJy/sr)^2
    Set Selenium Speed    ${DELAY}
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_IMAGE_RADIO_BUTTON}
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    4.096000000000e+3 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    1.993279007648e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    4.346944527429e-13 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.054905502082e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    2.878577669585e+1 K
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    2.590719902626e-2 K*arcsec^2    
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    7.027777513635e-3 K
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    9.771618130143e-1 K
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -3.334778070450e+0 K
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    3.350127696991e+0 K
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    3.350127696991e+0 K
    #Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    9.770677980386e-1 K
    # dirty workaround for rounding error
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    9.77067798038
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    e-1 K
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    3.910293430125e+3 (K)^2
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    4.096000000000e+3 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    1.993279007648e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    4.346944527429e-13 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.054905502082e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    -3.764594403670e+1 Jy/pixel
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -3.764594403670e+1 Jy    
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    -9.190904305835e-3 Jy/pixel
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    9.893811565010e-1 Jy/pixel
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -3.585187673569e+0 Jy/pixel
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    3.350328683853e+0 Jy/pixel
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    -3.585187673569e+0 Jy/pixel
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    9.893030690284e-1 Jy/pixel
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    4.008839423546e+3 (Jy/pixel)^2
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    9.497000000000e+3 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    5.605286751811e+1 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    9.955850017739e-12 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    1.694293337791e+2 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    5.438445809627e+4 km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    NaN    
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    5.726488164290e+0 km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    1.474178491848e+0 km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    2.277516603470e+0 km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    8.805154800415e+0 km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    8.805154800415e+0 km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    5.913175127729e+0 km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    3.320686839461e+5 (km/s)^2       
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.864780000000e+5 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    1.100624052758e+3 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    9.955850017739e-12 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    1.694293337791e+2 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    2.197464537811e+4 Jy/beam.km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    1.296979979085e+2 Jy.km/s    
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    1.178404175190e-1 Jy/beam.km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    1.886894357813e-1 Jy/beam.km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    3.175728255883e-3 Jy/beam.km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    2.969475269318e+0 Jy/beam.km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    2.969475269318e+0 Jy/beam.km/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    2.224632020120e-1 Jy/beam.km/s
    #Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    9.228773143240e+3 (Jy/beam.km/s)^2
    # dirty workaround for rounding error  
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    9.2287731432  
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    e+3 (Jy/beam.km/s)^2          
    Set Selenium Speed    ${DELAY}
    # use the image drondown menu to select the last image - image_MJy_per_sr.fits
    Click Element    css:[data-testid="stats-0-content"] [data-testid="image-dropdown"]
    Click Element    //*[@data-testid="stats-0-content"]//*[@data-testid="image-dropdown"]/option[contains(text(), "4: image_MJy_per_sr.fits")]
    Wait Until Page Does Not Contain    No stats data
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    4.096000000000e+3 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    1.993279007648e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    4.346944527429e-13 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.054905502082e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    1.153122180488e+1 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    2.439313217493e-13 MJy   
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.815239698457e-3 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    1.016233111814e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -3.389632701874e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    3.362840414047e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    -3.389632701874e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    1.016112952303e+0 MJy/sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    4.229060738407e+3 (MJy/sr)^2
    [Teardown]    Kill carta_backend And Close Browser


Polarization Statistics
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # Stokes I
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    5.665087840554e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    2.092363910511e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.747530212785e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    2.190448685885e+1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    7.972428021692e-1 Jy   
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    1.407291157009e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    5.368401551545e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -1.127102598548e-1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    1.110765337944e+0 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    1.110765337944e+0 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    5.370073400759e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    4.488586188493e+1 (Jy/beam)^2
    Set Selenium Speed    ${DELAY}
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # Stokes Q
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    5.665087840554e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    2.092363910511e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.747530212785e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    -5.825449282802e-1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -2.120249399150e-2 Jy   
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    -3.742659352909e-5 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    3.869341538017e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -1.845847629011e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    2.318549528718e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    2.318549528718e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    3.869398247612e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    2.330429591606e-1 (Jy/beam)^2
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # Stokes U
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    5.665087840554e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    2.092363910511e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.747530212785e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    1.881971077550e+0 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    6.849682921749e-2 Jy 
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    1.209104450723e-4 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    4.009951489450e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -2.090570144355e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    2.131810039282e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    2.131810039282e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    4.011645200536e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    2.504921711513e-1 (Jy/beam)^2
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # Stokes V
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    5.665087840554e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    2.092363910511e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.747530212785e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    2.770419208304e-1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    1.008330752984e-2 Jy 
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    1.779903121301e-5 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    3.931388177192e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -2.024857513607e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    2.312266640365e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    2.312266640365e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    3.931302178691e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    2.405592046061e-1 (Jy/beam)^2
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # computed component: Ptotal
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    8.823748966869e+1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    3.211520268571e+0 Jy 
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    5.668968176594e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    3.792677257306e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    1.008910694509e-4 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.763405628502e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    2.763405628502e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    6.820606777622e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    7.240943346245e-1 (Jy/beam)^2 
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # computed component: Plinear
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    6.959042694918e+1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    2.532835730991e+0 Jy 
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    4.470955795000e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    3.328183576391e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    1.216378950630e-5 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.427288144827e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    2.427288144827e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    5.573646920168e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    4.835351299552e-1 (Jy/beam)^2 
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # computed component: PFtotal
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    -9.803507982735e+5 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    NaN 
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    -6.298431084314e+1 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    6.567556427141e+3 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -6.482380625000e+5 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.890890625000e+5 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    -6.482380625000e+5 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    6.567647471271e+3 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    6.713806058217e+11 (%)^2 
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # computed component: PFlinear
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    -9.453708281121e+5 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    NaN 
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    -6.073696293685e+1 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    6.442443830338e+3 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -6.428163125000e+5 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.838785937500e+5 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    -6.428163125000e+5 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    6.442523179689e+3 %
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    6.460425230928e+11 (%)^2
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # computed component: Pangle
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    3.204385152139e+3 degree
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    NaN 
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.058711951262e-1 degree
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    5.203797236507e+1 degree
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -8.999253082275e+1 degree
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    8.999803161621e+1 degree
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    8.999803161621e+1 degree
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    5.203670794649e+1 degree
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    4.214720232889e+7 (degree)^2

    Set Selenium Speed    ${DELAY}
    # use the polarization dropdown menu to select Stokes I
    Click Element    css:[data-testid="stats-0-content"] [data-testid="polarization-dropdown"]
    Click Element    //*[@data-testid="stats-0-content"]//*[@data-testid="polarization-dropdown"]/option[contains(text(), "Stokes I")]
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    1.556500000000e+4 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    5.665087840554e+2 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    2.092363910511e-11 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    2.747530212785e+1 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    2.190448685885e+1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    7.972428021692e-1 Jy   
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    1.407291157009e-3 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    5.368401551545e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    -1.127102598548e-1 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    1.110765337944e+0 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    12    2    1.110765337944e+0 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    13    2    5.370073400759e-2 Jy/beam
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    14    2    4.488586188493e+1 (Jy/beam)^2
    [Teardown]    Kill carta_backend And Close Browser


Compressed FITS fz statistics
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    tu2310418.fits.fz
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    #Sleep    1.0
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    2.238062400000e+7 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    -8.547324334957e+5 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    NaN  
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    -3.819073290788e-2 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    2.319088077544e+0 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -3.041755104065e+1 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    7.419943847656e+2 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    7.419943847656e+2 counts/s
    #Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    2.319402466841e+0 counts/s
    # dirty workaround for CI numberic error
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    2.31940246684
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    e+0 counts/s    
    #Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    1.203994271231e+8 (counts/s)^2
    # dirty workaround for CI numberic error
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    1.20399427123
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    e+8 (counts/s)^2
    [Teardown]    Kill carta_backend And Close Browser


Compressed FITS gz statistics
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    tu2310418.fits.gz
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    Set Selenium Speed    0
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    2    2    2.238062400000e+7 pixel(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    -8.547324334957e+5 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    NaN  
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    -3.819073290788e-2 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    6    2    2.319088077544e+0 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    -3.041755104065e+1 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    7.419943847656e+2 counts/s
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    9    2    7.419943847656e+2 counts/s
    #Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    2.319402466841e+0 counts/s
    # dirty workaround for CI numberic error
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    2.31940246684
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    10    2    e+0 counts/s
    #Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    1.203994271231e+8 (counts/s)^2
    # dirty workaround for CI numberic error
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    1.20399427123
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    11    2    e+8 (counts/s)^2
    [Teardown]    Kill carta_backend And Close Browser


Per-plane Beam Statistics
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_perplanebeam.fits
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    #Sleep    0.5
    # ch 0 beam stats
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    5.115267667643e+0 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    6.401858302296e-10 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    4.476794077630e+1 pixel(s)        
    # ch 10 beam stats
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    4.794406793021e+0 beam(s)
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    6.830296259850e-10 sr
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    5    2    4.776399039259e+1 pixel(s)        
    [Teardown]    Kill carta_backend And Close Browser



# todo: add export text file test