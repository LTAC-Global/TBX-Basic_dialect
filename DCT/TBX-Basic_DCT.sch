<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns uri="urn:iso:std:iso:30042:ed:3.0" prefix="tbx" />
    
    <pattern id="coreEnforecement">
        <rule context="tbx:termNote">
            <assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::tbx:termSec">Any termNote is only allowed at the termSec level.</assert>
        </rule>
        <rule context="tbx:*[@metatype='termNote']">
            <assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::tbx:termSec">Any termNote is only allowed at the termSec level.</assert>
        </rule>
    </pattern>
    <pattern id="dialectEnforcement">
        <rule context="tbx:tbx">
            <assert test="attribute::type='TBX-Basic'">The name of this dialect should be TBX-Basic</assert>
            <assert test="attribute::style='dct'">The style of this dialect should be declared as 'dct'</assert>
        </rule>
        <rule context="tbx:*[@type]">
            <assert test="not(matches(.,'|.')) or .. is root() or ancestor::tbx:back">DCA style elements are not permitted in DCT style TBX.</assert>
        </rule>
    </pattern>
</schema>