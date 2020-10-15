# -*- coding: utf-8 -*-
import csv
import xml.etree.ElementTree as ET

def create_xml(adresse, typ, status, arrondissement, horaire, access, relais, equip):
    root = ET.Element("toilettes")
    toil = ET.Element("toilette")
    root.append(toil)

    el1 = ET.SubElement(toil, "adresse")
    att1 = ET.SubElement(toil,'toilette').set('type', typ)
    att1 = ET.SubElement(toil,'toilette').set('statut', status)
    ad1 = ET.SubElement(el1, "libelle")
    ad1.text = adresse
    ad2 = ET.SubElement(el1, "arrondissement")
    ad2.text = arrondissement

    el2 = ET.SubElement(toil, "horaire")
    el2.text = horaire

    el3 = ET.SubElement(toil, "services")
    ser1 = ET.SubElement(el3, "acces-pmr")
    ser1.text = access
    ser2 = ET.SubElement(el3, "relais-bebe")
    ser2.text = relais

    el4 = ET.SubElement(toil, "equipement")
    el4.text = equip

    return ET.ElementTree(root)

with open ('wc.xml', 'w') as wcxml:
    wcxml.write('<?xml version="1.0" encoding="UTF-8"?>')
    wcxml.write('<!DOCTYPE BIBLIOGRAPHY SYSTEM "wc.dtd">')

with open('wc.xml', 'ab') as wc_xml:
    with open('sanisettesparis.csv') as wc:
        reader_wc = csv.reader(wc, delimiter=';', quotechar='"')
        headers_wc = next(reader_wc)

        for row in reader_wc:
            typ = row[0]
            status = row[1]
            adresse = row[2]
            arrondissement = row[3]
            horaire = row[4]
            access = row[5]
            relais = row[6]
            equip = row[7]

            treeXML = create_xml(adresse, typ, status, arrondissement, horaire, access, relais, equip)
            treeXML.write(wc_xml)