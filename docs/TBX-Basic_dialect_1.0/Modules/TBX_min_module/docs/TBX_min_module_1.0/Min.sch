<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns uri="urn:iso:std:iso:30042:ed-2" prefix="tbx" />
    <ns uri="http://www.tbxinfo.net/ns/min" prefix="min" />
    
    <!-- Min Module Rules -->
    <pattern id="module.min.admin">
        <rule context="min:customerSubset">
            <assert test="parent::tbx:conceptEntry or parent::tbx:adminGrp/parent::conceptEntry or
                parent::tbx:termSec or parent::tbx:adminGrp/parent::tbx:termSec">Customer Subset may only appear at the conceptEntry or termSec levels</assert>
        </rule>
    </pattern>
    <pattern id="module.min.descrip">
        <rule context="min:subjectField" >
            <assert test="parent::tbx:conceptEntry or parent::tbx:descripGrp/parent::tbx:conceptEntry">Subject Field can only appear at conceptEntry level.</assert>
        </rule>
    </pattern>
    <pattern id="module.min.termNote">
        <rule context="min:administrativeStatus|min:partOfSpeech">
            <assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::termSec">termNote elements must not occur outside the termSec level.</assert>
        </rule>
    </pattern>
</schema>