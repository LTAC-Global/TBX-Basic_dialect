<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns uri="urn:iso:std:iso:30042:ed:3.0" prefix="tbx" />
    <pattern id="coreEnforecement">
        <rule context="tbx:termNote">
<assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::tbx:termSec">Any termNote is only allowed at the termSec level.</assert>
        </rule>
        <rule context="tbx:*[@type]">
            <assert test="@type != ''">Data category must be declared.  If no permitted data categories are listed in the grammar schema, blank values are also not allowed.</assert>
        </rule>
    </pattern>
    
    <pattern id="dialectEnforcement">
        <rule context="tbx:tbx">
            <assert test="attribute::type='TBX-Basic'">The name of this dialect should be TBX-Basic</assert>
            <assert test="attribute::style='dca'">The style of this dialect should be declared as 'dca'</assert>
        </rule>
        <rule context="*[not(namespace-uri() = 'urn:iso:std:iso:30042:ed:3.0')]">
            <assert test="false()">DCT style elements are not permitted in DCA style TBX.</assert>
        </rule>
    </pattern>
    
    <!-- Min Module Rules -->
    <pattern id="module.min.admin">
        <rule context="tbx:admin[@type='customerSubset']">
<assert test="parent::tbx:termSec or parent::tbx:adminGrp/parent::tbx:termSec">Customer Subset may only appear at the termSec level</assert>
        </rule>
    </pattern>
    <pattern id="module.min.descrip">
        <rule context="tbx:descrip[@type='subjectField']" >
<assert test="parent::tbx:conceptEntry or parent::tbx:descripGrp/parent::tbx:conceptEntry">Subject Field can only appear at conceptEntry level.</assert>
        </rule>
    </pattern>
    <pattern id="module.min.termNote">
        <rule context="tbx:termNote[@type='administrativeStatus']">
            <assert test=".='admittedTerm-admn-sts' or .='deprecatedTerm-admn-sts' or .='supersededTerm-admn-sts' or .='preferredTerm-admn-sts'">The termType must be either 'admittedTerm-admn-sts', 'deprecatedTerm-admn-sts', 'supersededTerm-admn-sts', or 'preferredTerm-admn-sts'</assert>
        </rule>
        <rule context="tbx:termNote[@type='partOfSpeech']">
<assert test=".='adjective' or .='noun' or .='other' or .='verb' or .='adverb'">Permitted values of /partOfSpeech/ are 'noun', 'other', 'verb', 'adverb', or 'adjective'</assert>
        </rule>
    </pattern>
    
    <!-- Basic Module Rules -->
    <pattern id="module.basic.admin">
        <rule context="tbx:admin[@type='projectSubset']">
<assert test="parent::tbx:termSec or parent::tbx:adminGrp/parent::tbx:termSec">Project may only appear at the termSec level</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.descrip">
        <rule context="tbx:descrip[@type='context']">
<assert test="parent::tbx:termSec or parent::tbx:descripGrp/parent::tbx:termSec">Context appears at the termSec level</assert>
        </rule>
        <rule context="tbx:descrip[@type='definition']">
<assert test="parent::tbx:conceptEtnry or parent::tbx:descripGrp/parent::tbx:conceptEntry or 
parent::tbx:langSec or parent::tbx:descripGrp/parent::tbx:langSec">
    Definition may appear at the conceptEntry or langSec levels.
</assert>
        </rule>
        <rule context="tbx:descrip[@type='subjectField']">
<assert test="parent::tbx:conceptEntry or parent::tbx:descripGrp/parent::tbx:conceptEntry">Subject Field may appear only at the conceptEntry level</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.termNote">
        <rule context="tbx:termNote[@type='grammaticalGender']">
<assert test=".='masculine' or .='feminine' or .='neuter' or .='other'">Permitted values of Gender are 'masculine', 'feminine', 'neuter', or 'other'</assert>
        </rule>
        <rule context="tbx:termNote[@type='termLocation']">
            <assert test=".='checkBox' or .='comboBox' or .='comboBoxElement' or .='dialogBox' or .='groupBox' or .='informativeMessage' or .='interactiveMessage' or .='menuItem' or
               .='progressBar' or .='pushButton' or .='radioButton' or .='slider' or .='spinBox' or .='tab' or .='tableText' or .='textBox' or .='toolTip' or .='user-definedType'">
               Permitted values are: 	checkBox, comboBox, comboBoxElement, dialogBox, groupBox, informativeMessage, interactiveMessage, menuItem, progressBar, pushButton, radioButton, slider, spinBox, tab, tableText, textBox, toolTip, user-definedType
            </assert>
        </rule>
        <rule context="tbx:termNote[@type='termType']">
<assert test=".='fullForm' or .='acronym' or .='abbreviation' or .='shortForm' or .='variant' or .='phrase'">Permitted values of Term Type are 'fullForm', 'acronym', 'abbreviation', 'shortForm', 'variant', or 'phrase'</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.transac">
        <rule context="tbx:transac[@type='transactionType']">
<assert test=".='origination' or .='modification'">Transaction type may be either 'origination' or 'modification'.</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.ref">
        <rule context="tbx:ref[@type='crossReference']">
<assert test="parent::tbx:conceptEntry or parent::tbx:termSec">Cross References must only be found at the conceptEntry or termSec levels.</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.xref">
        <rule context="tbx:xref[@type='externalCrossReference']">
<assert test="parent::tbx:termSec or parent::tbx:conceptEntry">External Cross Reference may be used at the termSec level.</assert>
        </rule>
        <rule context="tbx:xref[@type='xGraphic']">
<assert test="parent::tbx:conceptEntry">Image must only be found at the conceptEntry level.</assert>
        </rule>
    </pattern>
</schema>