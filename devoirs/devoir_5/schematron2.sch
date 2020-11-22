<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">

    <!--exo 1-->

    <sch:pattern abstract="true" id="structure-minimale">
        <sch:rule context="$rule1">
            <sch:assert test="self::*[child::teiHeader and child::text]">L'élément <sch:name/> doit avoir deux enfants : teiHeader et text.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern is-a="structure-minimale" id="TEI">
        <sch:param name="rule1" value="TEI"/>
    </sch:pattern>

    <!--exo 2-->

    <sch:pattern abstract="true" id="structure-paragr">
        <sch:rule context="$rule2">
            <sch:assert test="self::*[child::p]">L'élément <sch:name/> doit avoir un enfant : p.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern is-a="structure-paragr" id="sp">
        <sch:param name="rule2" value="sp"/>
    </sch:pattern>

    <sch:pattern is-a="structure-paragr" id="projectDesc">
        <sch:param name="rule2" value="projectDesc"/>
    </sch:pattern>

    <!--exo 3-->

    <sch:pattern abstract="true" id="structure-div">
        <sch:rule context="$rule3">
            <sch:assert test="self::*[child::head]">L'élément <sch:name/> doit avoir obligatoirement un enfant : head.</sch:assert>
            <sch:assert test="count($rule4) > 1">L'élément <sch:name/> doit contenir au moins deux balises 'stage'.</sch:assert>
        </sch:rule>
    </sch:pattern>

     <sch:pattern is-a="structure-div" id="div">
        <sch:param name="rule3" value="div"/>
        <sch:param name="rule4" value="div/stage"/>
    </sch:pattern>
    
</sch:schema>