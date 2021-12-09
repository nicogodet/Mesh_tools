# -*- coding: utf-8 -*-

"""
/***************************************************************************
 classFactory
                                 A QGIS plugin
 Tools for management of Data on mesh (Telemac, Uhaina)
 Generated by Plugin Builder: http://g-sherman.github.io/Qgis-Plugin-Builder/
                              -------------------
        begin                : 2021-03-24
        git sha              : $Format:%H$
        copyright            : (C) 2021 by Artelia/BRGM/ISL
        email                : a@a
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""


# noinspection PyPep8Naming
def classFactory(iface):  # pylint: disable=invalid-name
    """Load MeshTools class from file MeshTools.

    :param iface: A QGIS interface instance.
    :type iface: QgsInterface
    """
    #
    from .mesh_tools import MeshTools

    return MeshTools(iface)