#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bxlcnt/bxtex/tex/macros/texExtras.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/apps/defaults/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


texExtrasBaseDir="/usr/share/texmf/tex/extras"
bisos_appsTexExtras="/bisos/apps/bxtex/tex/macros"

# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Initial Setup" )
$( examplesSeperatorSection "/usr/share/texmf/tex/extras" )
${G_myName} ${extraInfo} -i bisosAppsBxTexPrep
${G_myName} ${extraInfo} -i extrasEndShow
${G_myName} ${extraInfo} -i extrasEnd_osmt2_verify
${G_myName} ${extraInfo} -i extrasEnd_osmt2_set
${G_myName} ${extraInfo} -i extrasEnd_bisos1_verify
${G_myName} ${extraInfo} -i extrasEnd_bisos1_set
${G_myName} ${extraInfo} -i texhash
_EOF_
}

noArgsHook() {
  vis_examples
}

function vis_bisosAppsBxTexPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ ! -d /bisos/apps ] ; then
	opDo mkdir /bisos/apps
    fi

    if [ ! -e /bisos/apps/bxtex ] ; then
	opDo ln -s /bisos/git/bxRepos/bxlcnt/bxtex /bisos/apps/bxtex
    else
	ANT_raw "/bisos/apps/bxtex is in place, prep skipped"
    fi

    opDo ls -ld /bisos/apps/bxtex
    
    lpReturn
}


function vis_extrasEndShow {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo readlink ${texExtrasBaseDir}

    lpReturn
}


function vis_extrasEndSet_osmt2 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo readlink -f ${texExtrasBaseDir}

    lpReturn
}


function vis_extrasEnd_bisos1_verify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local texExtrasBaseDirEndPath=$(readlink -f "${texExtrasBaseDir}")
    local bisos_appsTexExtrasEndPath=$(readlink -f "${bisos_appsTexExtras}")
    local retVal=0

    if [ ! -d "${bisos_appsTexExtras}" ] ; then 
	EH_problem "Missing ${bisos_appsTexExtras}"
	lpReturn 1
    fi

    if [ -z "${texExtrasBaseDirEndPath}" ] ; then
	EH_problem "Missing ${texExtrasBaseDir}"
	lpReturn 1
    fi

    if [ -z "${texExtrasBaseDirEndPath}" ] ; then
	EH_problem "Missing ${bisos_appsTexExtras}"
	lpReturn 1
    fi

    if [ "${texExtrasBaseDirEndPath}" != "${bisos_appsTexExtrasEndPath}" ] ; then
	EH_problem "EndPath Mismatch"
	retVal=1
    else
	ANT_raw "Verified -- EndPath is as expected"
    fi
    
    opDo ls -ld "${texExtrasBaseDirEndPath}" "${bisos_appsTexExtrasEndPath}"

    lpReturn ${retVal}
}



function vis_extrasEnd_bisos1_set {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    local texExtrasBaseDirEndPath=$(readlink -f "${texExtrasBaseDir}")
    local bisos_appsTexExtrasEndPath=$(readlink -f "${bisos_appsTexExtras}")
    local retVal=0
    local gotVal=0

    vis_extrasEnd_bisos1_verify  > /dev/null 2>&1 
    gotVal=$?

    if [ ${gotVal} == 0 ] ; then
	ANT_raw "Already Set:"
	opDo vis_extrasEnd_bisos1_verify
	lpReturn 0
    fi

    # So, the ends don't match

    #
    # Make sure /bisos/apps/bxtex exists
    #

    if [ ! -d "${bisos_appsTexExtras}" ] ; then 
	EH_problem "Missing ${bisos_appsTexExtras}"
	lpReturn 1
    fi

    #
    # Do the link update.
    #
    
    opDo FN_fileSymlinkUpdate ${bisos_appsTexExtras}  ${texExtrasBaseDir}
    #
    # Can also be done with:
    #
    # TEXINPUTS=.:/opt/public/osmt/share/texmf/tex/extras::
    #
    
    opDo vis_extrasEnd_bisos1_verify    
    
    lpReturn ${retval:-}
}



function vis_texhash {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo sudo texhash
 }




_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
