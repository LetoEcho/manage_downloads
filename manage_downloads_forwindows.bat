@echo off
setlocal enabledelayedexpansion

:: Establecer la carpeta de descargas
set "downloads=%USERPROFILE%\Downloads"

:: Crear las carpetas si no existen
mkdir "%downloads%\Documentos" 2>nul
mkdir "%downloads%\Imagenes" 2>nul
mkdir "%downloads%\Videos" 2>nul
mkdir "%downloads%\Programas" 2>nul
mkdir "%downloads%\Comprimidos" 2>nul
mkdir "%downloads%\Audio" 2>nul
mkdir "%downloads%\Torrent" 2>nul
mkdir "%downloads%\ImagenesDiscos" 2>nul
mkdir "%downloads%\Otros" 2>nul

:: Mover archivos según su extensión
for %%f in ("%downloads%\*.*") do (
    set "moved=0"
    
    :: Documentos
    if /i "%%~xf"==".pdf" set "dest=Documentos" & set "moved=1"
    if /i "%%~xf"==".docx" set "dest=Documentos" & set "moved=1"
    if /i "%%~xf"==".txt" set "dest=Documentos" & set "moved=1"
    if /i "%%~xf"==".xls" set "dest=Documentos" & set "moved=1"
    if /i "%%~xf"==".json" set "dest=Documentos" & set "moved=1"
    
    :: Imágenes
    if /i "%%~xf"==".jpg" set "dest=Imagenes" & set "moved=1"
    if /i "%%~xf"==".png" set "dest=Imagenes" & set "moved=1"
    if /i "%%~xf"==".svg" set "dest=Imagenes" & set "moved=1"
    if /i "%%~xf"==".jpeg" set "dest=Imagenes" & set "moved=1"
    
    :: Videos
    if /i "%%~xf"==".mp4" set "dest=Videos" & set "moved=1"
    if /i "%%~xf"==".mkv" set "dest=Videos" & set "moved=1"
    
    :: Programas
    if /i "%%~xf"==".exe" set "dest=Programas" & set "moved=1"
    if /i "%%~xf"==".msi" set "dest=Programas" & set "moved=1"
    if /i "%%~xf"==".apk" set "dest=Programas" & set "moved=1"
    
    :: Comprimidos
    if /i "%%~xf"==".zip" set "dest=Comprimidos" & set "moved=1"
    if /i "%%~xf"==".rar" set "dest=Comprimidos" & set "moved=1"
    
    :: Audio
    if /i "%%~xf"==".mp3" set "dest=Audio" & set "moved=1"
    
    :: Torrent
    if /i "%%~xf"==".torrent" set "dest=Torrent" & set "moved=1"
    
    :: Imágenes de disco
    if /i "%%~xf"==".iso" set "dest=ImagenesDiscos" & set "moved=1"
    
    :: Si no coincide con ninguna extensión, mover a Otros
    if "!moved!"=="0" set "dest=Otros"
    
    :: Mover el archivo
    if exist "%%f" (
        move "%%f" "%downloads%\!dest!\" >nul 2>nul
    )
)

echo Archivos organizados correctamente.
pause