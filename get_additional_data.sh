#!/bin/bash
mkdir -p inputdata
curl --verbose --retry 5 --retry-delay 30 -o inputdata/grid.zip "https://tiedostopalvelu.maanmittauslaitos.fi/geoserver/karttalehti/ows?service=wfs&request=GetFeature&typeName=Grid&outputFormat=shape-zip&cql_filter=gridSize=%2712x12%27"
curl --verbose --retry 5 --retry-delay 30 -o inputdata/finland-latest.osm.pbf "http://download.geofabrik.de/europe/finland-latest.osm.pbf"
ogr2ogr --config OGR_WFS_PAGE_SIZE 5000 --debug on -nln syvyyskayra_v -f "ESRI shapefile" /vsizip/syvyyskayra_v.zip/syvyyskayra_v.shp WFS:https://extranet.liikennevirasto.fi/inspirepalvelu/rajoitettu/wfs?typeName=rajoitettu:syvyyskayra_v
ogr2ogr --config OGR_WFS_PAGE_SIZE 5000 --debug on -nln syvyyspiste_p -f "ESRI shapefile" /vsizip/syvyyspiste_p.zip/syvyyspiste_p.shp WFS:https://extranet.liikennevirasto.fi/inspirepalvelu/rajoitettu/wfs?typeName=rajoitettu:syvyyspiste_p
#curl --verbose --retry 5 --retry-delay 30 -o inputdata/syvyyskayra_v.zip "https://extranet.liikennevirasto.fi/inspirepalvelu/rajoitettu/wfs?request=GetFeature&typeName=syvyyskayra_v&outputFormat=shape-zip"
#curl --verbose --retry 5 --retry-delay 30 -o inputdata/syvyyspiste_p.zip "https://extranet.liikennevirasto.fi/inspirepalvelu/rajoitettu/wfs?request=GetFeature&typeName=syvyyspiste_p&outputFormat=shape-zip"
curl --verbose --retry 5 --retry-delay 30 -o inputdata/kesaretkeilyreitit.zip "http://www.retkikartta.fi/wfs/a9e9a1840ee69e32d59af86dd1ffeb44/?request=GetFeature&typeName=retkikartta_euref:kesaretkeilyreitit&outputFormat=shape-zip"
curl --verbose --retry 5 --retry-delay 30 -o inputdata/ulkoilureitit.zip "http://www.retkikartta.fi/wfs/a9e9a1840ee69e32d59af86dd1ffeb44/?request=GetFeature&typeName=retkikartta_euref:ulkoilureitit&outputFormat=shape-zip"
curl --verbose --retry 5 --retry-delay 30 -o inputdata/luontopolut.zip "http://www.retkikartta.fi/wfs/a9e9a1840ee69e32d59af86dd1ffeb44/?request=GetFeature&typeName=retkikartta_euref:luontopolut&outputFormat=shape-zip"
curl --verbose --retry 5 --retry-delay 30 -o inputdata/point_dump.zip "http://www.retkikartta.fi/wfs/a9e9a1840ee69e32d59af86dd1ffeb44/?request=GetFeature&typeName=retkikartta_euref:point_dump&outputFormat=shape-zip"
