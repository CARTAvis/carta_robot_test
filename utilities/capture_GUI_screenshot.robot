*** Settings ***
Documentation     Capture GUI for in-app help and user manual
Resource          ../resource.robot

*** Test Cases ***
Capture Light Widget Buttons Screenshot
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    
    Mouse Down    //*[@id="RegionListWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    RegionListWidgetButton.png
    Mouse Up    //*[@id="RegionListWidgetButton"]
    
    Mouse Down    //*[@id="LogWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    LogWidgetButton.png
    Mouse Up    //*[@id="LogWidgetButton"]
    
    Mouse Down    //*[@id="SpatialProfilerButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    SpatialProfilerButton.png
    Mouse Up    //*[@id="SpatialProfilerButton"]    
    
    Mouse Down    //*[@id="SpectralProfilerButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    SpectralProfilerButton.png
    Mouse Up    //*[@id="SpectralProfilerButton"]      
    
    Mouse Down    //*[@id="StatisticsWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    StatisticsWidgetButton.png
    Mouse Up    //*[@id="StatisticsWidgetButton"]
    
    Mouse Down    //*[@id="HistogramWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    HistogramWidgetButton.png
    Mouse Up    //*[@id="HistogramWidgetButton"] 
    
    Mouse Down    //*[@id="AnimatorWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    AnimatorWidgetButton.png
    Mouse Up    //*[@id="AnimatorWidgetButton"]
    
    Mouse Down    //*[@id="RenderConfigWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    RenderConfigWidgetButton.png
    Mouse Up    //*[@id="RenderConfigWidgetButton"]
    
    Mouse Down    //*[@id="StokesAnalysisWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    StokesAnalysisWidgetButton.png
    Mouse Up    //*[@id="StokesAnalysisWidgetButton"]

    Mouse Down    //*[@id="ImageListWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    ImageListWidgetButton.png
    Mouse Up    //*[@id="ImageListWidgetButton"]

    Mouse Down    //*[@id="CatalogWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    CatalogWidgetButton.png
    Mouse Up    //*[@id="CatalogWidgetButton"]

    Mouse Down    //*[@id="SpectralLineQueryWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    SpectralLineQueryWidgetButton.png
    Mouse Up    //*[@id="SpectralLineQueryWidgetButton"]

    Mouse Down    //*[@id="CursorInfoWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    CursorInfoWidgetButton.png
    Mouse Up    //*[@id="CursorInfoWidgetButton"]

    Mouse Down    //*[@id="PVGeneratorButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    PVGeneratorButton.png
    Mouse Up    //*[@id="PVGeneratorButton"]
    
    [Teardown]    Kill carta_backend And Close Browser



Capture Dark Widget Buttons Screenshot
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Press Keys    None    SHIFT+D

    Mouse Down    //*[@id="RegionListWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    RegionListWidgetButton_d.png
    Mouse Up    //*[@id="RegionListWidgetButton"]
    
    Mouse Down    //*[@id="LogWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    LogWidgetButton_d.png
    Mouse Up    //*[@id="LogWidgetButton"]
    
    Mouse Down    //*[@id="SpatialProfilerButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    SpatialProfilerButton_d.png
    Mouse Up    //*[@id="SpatialProfilerButton"]    
    
    Mouse Down    //*[@id="SpectralProfilerButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    SpectralProfilerButton_d.png
    Mouse Up    //*[@id="SpectralProfilerButton"]      
    
    Mouse Down    //*[@id="StatisticsWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    StatisticsWidgetButton_d.png
    Mouse Up    //*[@id="StatisticsWidgetButton"]
    
    Mouse Down    //*[@id="HistogramWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    HistogramWidgetButton_d.png
    Mouse Up    //*[@id="HistogramWidgetButton"] 
    
    Mouse Down    //*[@id="AnimatorWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    AnimatorWidgetButton_d.png
    Mouse Up    //*[@id="AnimatorWidgetButton"]
    
    Mouse Down    //*[@id="RenderConfigWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    RenderConfigWidgetButton_d.png
    Mouse Up    //*[@id="RenderConfigWidgetButton"]
    
    Mouse Down    //*[@id="StokesAnalysisWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    StokesAnalysisWidgetButton_d.png
    Mouse Up    //*[@id="StokesAnalysisWidgetButton"]

    Mouse Down    //*[@id="ImageListWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    ImageListWidgetButton_d.png
    Mouse Up    //*[@id="ImageListWidgetButton"]

    Mouse Down    //*[@id="CatalogWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    CatalogWidgetButton_d.png
    Mouse Up    //*[@id="CatalogWidgetButton"]

    Mouse Down    //*[@id="SpectralLineQueryWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    SpectralLineQueryWidgetButton_d.png
    Mouse Up    //*[@id="SpectralLineQueryWidgetButton"]

    Mouse Down    //*[@id="CursorInfoWidgetButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    CursorInfoWidgetButton_d.png
    Mouse Up    //*[@id="CursorInfoWidgetButton"]

    Mouse Down    //*[@id="PVGeneratorButton"]
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[2]    PVGeneratorButton_d.png
    Mouse Up    //*[@id="PVGeneratorButton"]
    
    Press Keys    None    SHIFT+D
    [Teardown]    Kill carta_backend And Close Browser



Capture Light Dialog Buttons Screenshot
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[1]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    HeaderInfoButton.png
    Click Element    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[2]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    PreferencesButton.png
    Click Element    //*[@id="root"]/div/div[8]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[3]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    ContourOverlayButton.png
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[4]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    VectorOverlayButton.png
    Click Element    //*[@id="root"]/div/div[5]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[5]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    ImageFittingButton.png
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[6]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    OnlineCatalogQueryButton.png
    Click Element    //*[@id="root"]/div/div[3]/div[1]/div/div[2]/div/div[1]/button

    [Teardown]    Kill carta_backend And Close Browser


Capture Dark Dialog Buttons Screenshot
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Press Keys    None    SHIFT+D

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[1]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    HeaderInfoButton_d.png
    Click Element    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[2]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    PreferencesButton_d.png
    Click Element    //*[@id="root"]/div/div[8]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[3]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    ContourOverlayButton_d.png
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[4]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    VectorOverlayButton_d.png
    Click Element    //*[@id="root"]/div/div[5]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[5]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    ImageFittingButton_d.png
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[1]/button

    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[6]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[1]/div[3]    OnlineCatalogQueryButton_d.png
    Click Element    //*[@id="root"]/div/div[3]/div[1]/div/div[2]/div/div[1]/button

    Press Keys    None    SHIFT+D
    [Teardown]    Kill carta_backend And Close Browser