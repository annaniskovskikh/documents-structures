<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <sch:pattern>
            <sch:rule context="fermeture">
                <sch:assert test="pdv_liste/pdv/fermeture[(text())]">Un élément <sch:name/> ne peut pas contenir de texte.</sch:assert>
            </sch:rule>
    </sch:pattern>

    <sch:pattern>
            <sch:rule context="ouverture">
                <sch:assert test="pdv_liste/pdv/ouverture[not(@debut and @fin)]">Un élément <sch:name/> doit toujours avoir le début et la fin.</sch:assert>
            </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <sch:rule context="ouverture">
            <sch:report test="pdv_liste/pdv/ouverture[not(@saufjour="")]" role="warn">
                Ce PDV doit avoir des vacances.</sch:report>
        </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <sch:rule context="ville">
            <sch:report test="pdv_liste/pdv/ville[not(contains(data(), upper-case(text())))]" role="warn">
                Toutes les villes doivent être en majuscules.</sch:report>
        </sch:rule>
    </sch:pattern>

</sch:schema>