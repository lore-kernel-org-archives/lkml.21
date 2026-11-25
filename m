Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596054;
	b=ZdmP5DpJMXPCzsbbtBtADbqdoFER7U3Seh0Whve5YReu01csAh1YJbnoy2O+PTPdv5rC
	 z7I0esJtLnpZHdbWMD19gFxJ461/crWwN5Kn8LOJKBlJO3ezrBWbvnfRZ4D5kPVbfPSBX
	 Syof/p5xi2m3m7V3ftDcuzAydXF+WLH7NkfECHOGNhpERiFoFa31nBB4+B56/0rR+0hrk
	 l0sexksylL+78oNoovyFHsoptJpMtNFTnKz+jCHpWBOklBxr9MNp6dDqYqmGQnkSfVP7L
	 opH+C4FlXasrNB3q9mO2JJDwgAl2TPfiUeFUX7CVBkYDA0//rQmR7O5Ffqgmta7hGLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596054;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=DeZuNgxUqV26UbSiOPmE+rgPdB4WCN1CGFONsE2BDTY=;
	b=pWvwBUNIZlGK5Hh3KGEgBPi0yUCnpMUdPsty/pcHo2ZmGusRMG+1ld/wdnksMY3jqrE8
	 5+W8sxBD0pMa+QHaLcgGtmIsOE/lmkcILaeH4sIhkHBnNB803xjbNlZoT/DPYZC7GmfrH
	 7iNbtmBnnnmHLxTUuxl182yyIdpxaxy/3Up0z2i2kLR/Z+zAS3Xm2qqLvbahIrQh3drj7
	 LSgUinT32k3hFBrj6PO2SRccmHR+E/j/UOkSg90ug1+08pHUbRy6IwXc4/k80FvJn5eSv
	 BiJ2TBQO658efqlj93yVkUmpWY1NF/mewDLiIMdPUMxQgqRBQBxk732V8sbKWEDSW4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="doos/SCP";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qcGeAvaI;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF60606A330;
	Wed, 25 Nov 2026 08:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF60606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=doos/SCP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qcGeAvaI
Date: Wed, 25 Nov 2026 08:40:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596052;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DeZuNgxUqV26UbSiOPmE+rgPdB4WCN1CGFONsE2BDTY=;
	b=doos/SCPywsW/YGwRePMWQ2HlvMbddit3Soy4lmELkdocBIeyhkHH6CCeu2MHMnc/50gr/
	vHhy+X5mkmOFFBWB7AzO0BLOkyPCpyocDuoPpUhDATg0VxueYd5EepKLVtOPqvC8P0S1Qx
	QITb+Y2fSCbpmoRHASOiCyYwdOBA50YpDwjZ+ImJxiwyVSPD8Ik0qQ+px4+yXCb/L4zF82
	0XNqGWKBUFxnhYK0aJX7uOOx6iALM+g2x+qL3LgNb1u88iyOJG1bFuc7AO/M/I0IyjRZwT
	ryHQ5x94sqfFVXH3juGLhLgfPcohLwf7GwUHLi7v7ovoMpbg0E0aemDqPgpcow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596052;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DeZuNgxUqV26UbSiOPmE+rgPdB4WCN1CGFONsE2BDTY=;
	b=qcGeAvaItO4IU4KMrjTTgqR7ch+PLT1wKbtrxvRyE9I6eWI+wGtXhUOgnyaZwEJcqLsvkC
	N/IeroweVH02CKBw==
From: "tip-bot2 for Dylan Hatch" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] klp-build: Allow passing options to make via '--'
Cc: Song Liu <song@kernel.org>, Dylan Hatch <dylanbhatch@google.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112220355.1952137-1-dylanbhatch@google.com>
References: <20261112220355.1952137-1-dylanbhatch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559605031.92412.4503502777380655455.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     961ebd091e3f0927b228a7321581c7fc4b32c27c
Gitweb:        https://git.kernel.org/tip/961ebd091e3f0927b228a7321581c7fc4b3=
2c27c
Author:        Dylan Hatch <dylanbhatch@google.com>
AuthorDate:    Thu, 12 Nov 2026 22:03:55=20
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:24:39 -08:00

klp-build: Allow passing options to make via '--'

Livepatch builds rely on reproducing the original kernel build
environment, including any make flags or command-line variables used
during the original build (such as 'CC=3D...', 'KBUILD_BUILD_TIMESTAMP=3D...',
or custom wrapper Makefiles via '-f').

While these options can already be passed through the MAKEFLAGS
environment variable, passing them directly on the command line is more
ergonomic.

Refactor the make invocations to use a common MAKE array and allow
passing arbitrary make options after '--' on the klp-build command line:

  klp-build [OPTIONS] PATCH_FILE(s) [-- MAKE_OPTIONS]

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Link: https://patch.msgid.link/20261112220355.1952137-1-dylanbhatch@google.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/livepatch/klp-build | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index b52a848..1fd405d 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -125,7 +125,7 @@ trap trap_err ERR
=20
 __usage() {
 	cat <<EOF
-Usage: $SCRIPT [OPTIONS] PATCH_FILE(s)
+Usage: $SCRIPT [OPTIONS] PATCH_FILE(s) [-- MAKE_OPTIONS]
 Generate a livepatch module.
=20
 Options:
@@ -158,11 +158,23 @@ process_args() {
 	local long
 	local args
 	local patch
+	local klp_args=3D()
+	local make_args=3D()
+
+	while [[ $# -gt 0 ]]; do
+		if [[ "$1" =3D=3D "--" ]]; then
+			shift
+			make_args=3D("$@")
+			break
+		fi
+		klp_args+=3D("$1")
+		shift
+	done
=20
 	short=3D"hfj:o:vdS:T"
 	long=3D"help,show-first-changed,jobs:,output:,no-replace,verbose,debug,shor=
t-circuit:,keep-tmp"
=20
-	args=3D$(getopt --options "$short" --longoptions "$long" -- "$@") || {
+	args=3D$(getopt --options "$short" --longoptions "$long" -- "${klp_args[@]}=
") || {
 		echo; usage; exit
 	}
 	eval set -- "$args"
@@ -237,6 +249,7 @@ process_args() {
=20
 	KEEP_TMP=3D"$keep_tmp"
 	PATCHES=3D("$@")
+	MAKE=3D("make" "${make_args[@]}")
=20
 	for patch in "${PATCHES[@]}"; do
 		[[ -f "$patch" ]] || die "$patch doesn't exist"
@@ -317,12 +330,12 @@ set_kernelversion() {
=20
 	stash_file "$file"
=20
-	if [[ -n "$(make -s listnewconfig 2>/dev/null)" ]]; then
+	if [[ -n "$("${MAKE[@]}" -s listnewconfig 2>/dev/null)" ]]; then
 		die ".config mismatch, check your .config or run 'make olddefconfig'"
 	fi
-	make syncconfig &>/dev/null || die "make syncconfig failed"
+	"${MAKE[@]}" syncconfig &>/dev/null || die "make syncconfig failed"
=20
-	kernelrelease=3D"$(make -s kernelrelease)"
+	kernelrelease=3D"$("${MAKE[@]}" -s kernelrelease)"
 	[[ -z "$kernelrelease" ]] && die "failed to get kernel version"
=20
 	sed -i "2i echo $kernelrelease; exit 0" scripts/setlocalversion
@@ -526,7 +539,7 @@ fix_patches() {
 clean_kernel() {
 	local cmd=3D()
=20
-	cmd=3D("make")
+	cmd=3D("${MAKE[@]}")
 	cmd+=3D("--silent")
 	cmd+=3D("-j$JOBS")
 	cmd+=3D("clean")
@@ -539,7 +552,7 @@ build_kernel() {
 	local log=3D"$TMP_DIR/build.log"
 	local cmd=3D()
=20
-	cmd=3D("make")
+	cmd=3D("${MAKE[@]}")
=20
 	# When a patch to a kernel module references a newly created unexported
 	# symbol which lives in vmlinux or another kernel module, the patched
@@ -859,7 +872,7 @@ build_patch_module() {
 	cflags+=3D("-fdata-sections")
 	[[ $REPLACE -eq 0 ]] && cflags+=3D("-DKLP_NO_REPLACE")
=20
-	cmd=3D("make")
+	cmd=3D("${MAKE[@]}")
 	if [[ -v VERBOSE ]]; then
 		cmd+=3D("V=3D1")
 	else
