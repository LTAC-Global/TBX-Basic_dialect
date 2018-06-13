<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns uri="urn:iso:std:iso:30042:ed:3.0" prefix="tbx" />
    <ns uri="http://www.tbxinfo.net/ns/basic" prefix="basic" />
    <ns uri="http://www.w3.org/2001/XMLSchema" prefix="xs" />
    
    <!-- Basic Module Rules -->
    <pattern id="module.basic.admin">
        <rule context="basic:projectSubset">
            <assert test="parent::tbx:conceptEntry or parent::tbx:termSec or parent::tbx:adminGrp/(parent::tbx:conceptEntry or parent::tbx:termSec)">Project may only appear at the conceptEntry or termSec levels</assert>
        </rule>
        <rule context="basic:source">
            <assert test="parent::tbx:conceptEntry or parent::tbx:langSec or parent::tbx:termSec or parent::tbx:descripGrp/(parent::tbx:conceptEntry or parent::tbx:langSec or parent::tbx:termSec)"></assert>
        </rule>
    </pattern>
    <pattern id="module.basic.descrip">
        <rule context="basic:context">
            <assert test="parent::tbx:termSec or parent::tbx:descripGrp/parent::tbx:termSec">Context appears at the termSec level</assert>
        </rule>
        <rule context="basic:definition">
            <assert test="parent::tbx:conceptEntry or parent::tbx:langSec or parent::tbx:descripGrp/(parent::tbx:conceptEntry or parent::tbx:langSec)">
                Definition may appear at the conceptEntry or langSec levels.
            </assert>
        </rule>
    </pattern>
    
    <pattern id="module.basic.termNote">
        <rule context="basic:grammaticalGender|basic:grammaticalUsage|basic:termLocation|basic:termType">
            <assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::tbx:termSec">termNote elements must not occur outside the termSec level.</assert>
        </rule>
    </pattern>
    
    <pattern id="module.basic.transac">
        <rule context="basic:transactionType">
            <assert test="parent::tbx:conceptEntry or parent::tbx:langSec or parent::tbx:termSec 
                or parent::tbx:transacGrp/(parent::tbx:conceptEntry or parent::tbx:langSec or parent::tbx:termSec)">Transaction type may be either 'origination' or 'modification'.</assert>
        </rule>
    </pattern>
    
    <pattern id="module.basic.transacNote">
        <rule context="basic:responsibility">
            <assert test="parent::tbx:transacGrp/(parent::tbx:conceptEntry or parent::tbx:langSec or parent::tbx:termSec)">Responsibility must be in a transacGrp at the conceptEntry or langSec levels.</assert>
        </rule>
    </pattern>
    
    <pattern id="module.basic.ref">
        <rule context="basic:relatedConcept">
            <assert test="parent::tbx:conceptEntry or parent::tbx:*[contains(.,Grp)]/(parent::tbx:conceptEntry)">relatedConcepts must only be found at the conceptEntry level.</assert>
        </rule>
        <rule context="basic:relatedTerm">
            <assert test="parent::tbx:termSec or parent::tbx:*[contains(.,Grp)]/(parent::tbx:termSec)">relatedTerms must only be found at the termSec level.</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.xref">
        <rule context="basic:externalCrossReference">
            <assert test="parent::tbx:conceptEntry or parent::tbx:termSec or parent::tbx:*[contains(.,Grp)]/(parent::tbx:conceptEntry or parent::tbx:termSec)">External Cross Reference must only be found at the conceptEntry or termSec levels.</assert>
        </rule>
        <rule context="basic:xGraphic">
            <assert test="parent::tbx:conceptEntry or parent::tbx:langSec">Image must only be found at the conceptEntry level.</assert>
        </rule>
    </pattern>
</schema>