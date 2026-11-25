Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596053;
	b=KGzAmbaScwQW0tlZBANZeEUUhWGRfrEOrxBv94+cJZIZgaVZtrrr4jDDQmbDarqipSMV
	 QwPYTKgUt2fj2Oy6mZp6ohLWNhaLksl0N9Us5ipT6KIiCYabm2gzthlBnWz/2BV34dNp1
	 wSN9gvhMaenn4OftmWF6Eao0s88fymtgZZH2BvvD/8I9iuHoaXvAc0LjjsSlc8AOFSAWq
	 Mk+xM88/Yg2g7a87lNBixv2T9zk0EFtVTSzII8n2nMsxuhHd+MkzQIyRChhKx8gQJQhV3
	 pwXuJbqE5rXAkk3lqcPh5TxaP58/mb96ar/iS7TT7i//IycYGK9b6CGtP9M+5Daptbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596053;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=eSG6RLWgI4IyiDAmWXKNthgzkZSh9NdgTkFqhCnEBa4=;
	b=DghL3NedWfsJJFKQCt8EQlLB50bV0Dqrbvgdolx7NROVpqUktHmI7aai2kho4x4t18XD
	 Bcbdbz2Aoiz1S1zU5fSXudGFZrbvkN/qagzijEGrlhX+X6EBgla3unCY3hKxhvNRcxY0/
	 yRmsBBV7/NP7QBLknSNF8Jub790O2NCIKWo5Hn3ZuTklvknO1VLZylEmxYsqxp5TQfLPX
	 ErLQ9JkEBgpfCscUKjL4upwYfGxpCIUDu4FoxGYeAg/S2t90z2PWKrDiCcPzPtT6NnLQF
	 tELk9BauKXqvqYN1qgHJ/MSUTRawaAysZj7rXQkQ1ijwlWMgkmAqLByahgjeD8hUDCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="ptuCQ/4c";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="5eHgez/H";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9323606A327;
	Wed, 25 Nov 2026 08:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9323606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ptuCQ/4c;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5eHgez/H
Date: Wed, 25 Nov 2026 08:40:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596050;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eSG6RLWgI4IyiDAmWXKNthgzkZSh9NdgTkFqhCnEBa4=;
	b=ptuCQ/4cW4yFrp7/b6baekK/CA1dQu2e6r58/lSI2Bv7WwygkUupBy0IBmirOXRMQz8f69
	pewSPAOzsX6Dbb6tuV9aFUb/d0s1yGb4y+Lc5Xm4EiZl4y5j+vR8Bie+3Ftxn2KfrLLFGA
	DMMP/CnwxyrBoE93nljeGVwgO1xojnQq2T4q80jfpd84Qqbe9TrY8GfSY1K4uLvchErsQ6
	Y5vIh4VXmSYnJQolT/VkQRHBA+5IYM3OeFDSrK4uo1gw4So/wwYMEv5Vn64AMy/uoC6xWB
	KV/m9gfpXKYZuQDesxANA2TDxzYIo05CJqgTk33MTLF+JeEmRz9rdDFQbJ0M4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596050;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eSG6RLWgI4IyiDAmWXKNthgzkZSh9NdgTkFqhCnEBa4=;
	b=5eHgez/HVlvHWDHHeDTWlYMOfuCbKlTfcAqhh8BiFPrUScrGKSUi3aWfbycNuGSoZedaGU
	9Ltvp4T0UHv1C1Dw==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Build test fixtures with ftrace
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022171637.3298443-2-puranjay@kernel.org>
References: <20261022171637.3298443-2-puranjay@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559604865.92412.1186085046376447127.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     d091c3c2217cc9f0132733b2a2e2f52c1ca505a9
Gitweb:        https://git.kernel.org/tip/d091c3c2217cc9f0132733b2a2e2f52c1ca=
505a9
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Thu, 22 Oct 2026 10:16:34 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:24:39 -08:00

objtool/klp: Build test fixtures with ftrace

Livepatch depends on ftrace, so the kernel klp-build operates on always
has __mcount_loc, but the test fixtures are built without it.

On x86, build them with -pg -mfentry and generate __mcount_loc like the
kernel does: with -mrecord-mcount -mnop-mcount if the compiler supports
it (FTRACE_MCOUNT_USE_CC), otherwise with objtool --mcount --mnop
(FTRACE_MCOUNT_USE_OBJTOOL).

test-checksum-alt ran objtool --mcount only to get insn->alts, which
"klp checksum" builds by itself, and that now warns about the existing
__mcount_loc.  Remove it.

test-special-sections can now check the real __mcount_loc instead of a
hand-written one.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Acked-by: Song Liu <song@kernel.org>
Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
Link: https://patch.msgid.link/20261022171637.3298443-2-puranjay@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/Documentation/klp-write-tests.txt       |  9 +-
 tools/objtool/tests/generic/test-thinlto-ambiguity.sh |  3 +-
 tools/objtool/tests/generic/test-thinlto-local.sh     |  5 +-
 tools/objtool/tests/lib.sh                            | 42 +++++++++-
 tools/objtool/tests/x86/test-checksum-alt.sh          |  4 +-
 tools/objtool/tests/x86/test-special-sections.sh      | 12 ++-
 6 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/tools/objtool/Documentation/klp-write-tests.txt b/tools/objtool/=
Documentation/klp-write-tests.txt
index eb2caca..7cc2148 100644
--- a/tools/objtool/Documentation/klp-write-tests.txt
+++ b/tools/objtool/Documentation/klp-write-tests.txt
@@ -116,9 +116,12 @@ Traps that have bitten before
   section entsize or annotations".  Their targets need real (global) symbols,
   or it reports "failed to convert reloc sym".
 * **Prefer letting objtool generate what objtool generates.**
-  ``.static_call_sites``, ``.mcount_loc``, ``.ibt_endbr_seal`` and ORC come
-  from its check pass.  Call ``run_objtool_check --mcount`` and let it build
-  them; a hand-written copy tests your reading of the format, not the format.
+  ``.static_call_sites``, ``.ibt_endbr_seal`` and ORC come from its check
+  pass.  Call ``run_objtool_check`` with the option for what you need and let
+  it build them; a hand-written copy tests your reading of the format, not t=
he
+  format.
+* **Fixtures are built with ftrace.**  Objects not built with ``build_one``
+  need ``$FTRACE_CFLAGS`` and ``record_mcount`` too.
=20
   Write one by hand only when the test needs a shape objtool will not produc=
e,
   and say so in the fixture.  generic/fixtures/static_call.c does: objtool
diff --git a/tools/objtool/tests/generic/test-thinlto-ambiguity.sh b/tools/ob=
jtool/tests/generic/test-thinlto-ambiguity.sh
index 34f4f3a..73740c8 100755
--- a/tools/objtool/tests/generic/test-thinlto-ambiguity.sh
+++ b/tools/objtool/tests/generic/test-thinlto-ambiguity.sh
@@ -38,12 +38,13 @@ build_thinlto()		# $1 output object, $2 extra flags
 {
 	local t
 	for t in "" -DTU_B -DTU_C; do
-		$THIN_CC -flto=3Dthin -O2 -ffunction-sections -fdata-sections \
+		$THIN_CC -flto=3Dthin -O2 -ffunction-sections -fdata-sections $FTRACE_CFLA=
GS \
 			$2 $t -c "$FIXTURES_DIR/thinlto_ambiguity.c" \
 			-o "$workdir/tu$t.o" 2>/dev/null || return 1
 	done
 	"$THIN_LD" -r "$workdir/tu.o" "$workdir/tu-DTU_B.o" "$workdir/tu-DTU_C.o" \
 		-o "$1" 2>/dev/null || return 1
+	record_mcount "$1"
 }
=20
 build_thinlto "$workdir/orig.o" "" ||
diff --git a/tools/objtool/tests/generic/test-thinlto-local.sh b/tools/objtoo=
l/tests/generic/test-thinlto-local.sh
index a266263..090c6df 100755
--- a/tools/objtool/tests/generic/test-thinlto-local.sh
+++ b/tools/objtool/tests/generic/test-thinlto-local.sh
@@ -15,11 +15,12 @@ find_thinlto_toolchain ||
=20
 build_thinlto()		# $1 output object, $2 extra flags
 {
-	$THIN_CC -flto=3Dthin -O2 -ffunction-sections -fdata-sections $2 \
+	$THIN_CC -flto=3Dthin -O2 -ffunction-sections -fdata-sections $FTRACE_CFLAG=
S $2 \
 		-c "$FIXTURES_DIR/thinlto_local.c" -o "$workdir/tu_a.o" 2>/dev/null || ret=
urn 1
-	$THIN_CC -flto=3Dthin -O2 -ffunction-sections -fdata-sections $2 -DTU_B \
+	$THIN_CC -flto=3Dthin -O2 -ffunction-sections -fdata-sections $FTRACE_CFLAG=
S $2 -DTU_B \
 		-c "$FIXTURES_DIR/thinlto_local.c" -o "$workdir/tu_b.o" 2>/dev/null || ret=
urn 1
 	"$THIN_LD" -r "$workdir/tu_a.o" "$workdir/tu_b.o" -o "$1" 2>/dev/null || re=
turn 1
+	record_mcount "$1"
 }
=20
 build_thinlto "$workdir/orig.o" "" ||
diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
index 4da168d..d07eb07 100644
--- a/tools/objtool/tests/lib.sh
+++ b/tools/objtool/tests/lib.sh
@@ -41,7 +41,7 @@ OBJTOOL=3D"${OBJTOOL:-$TESTS_DIR/../objtool}"
 #
 klp_preflight()
 {
-	local tmp tool cc_version arch host cc_arch
+	local tmp tool cc_version arch host cc_arch mcount=3D
=20
 	bail() { echo "Bail out! $*" >&2; exit 1; }
=20
@@ -99,6 +99,16 @@ klp_preflight()
 	*AArch64*)		cc_arch=3Darm64 ;;
 	*)			cc_arch=3D ;;
 	esac
+
+	# Same test as FTRACE_MCOUNT_USE_CC.
+	if [ "$cc_arch" =3D x86 ]; then
+		if $CC -pg -mfentry -mrecord-mcount -mnop-mcount -c \
+			-o "$tmp/probe.o" "$tmp/probe.c" 2>/dev/null; then
+			mcount=3Dcc
+		else
+			mcount=3Dobjtool
+		fi
+	fi
 	rm -rf "$tmp"
=20
 	# Normalize to the kernel's SRCARCH.
@@ -119,8 +129,9 @@ klp_preflight()
 		     "the $arch tests would run against the wrong architecture"
=20
 	KLP_TEST_ARCH=3D"$arch"
+	KLP_TEST_MCOUNT=3D"$mcount"
 	KLP_TEST_PREFLIGHT=3Ddone
-	export OBJTOOL CC KLP_TEST_ARCH KLP_TEST_PREFLIGHT
+	export OBJTOOL CC KLP_TEST_ARCH KLP_TEST_MCOUNT KLP_TEST_PREFLIGHT
=20
 	cc_version=3D"$($CC --version 2>/dev/null | head -1)"
 	cat <<EOF
@@ -128,6 +139,7 @@ klp_preflight()
 #   objtool   $OBJTOOL (klp: yes)
 #   compiler  $cc_version
 #   arch      $KLP_TEST_ARCH$([ "$arch" =3D "$host" ] || echo "  (host $host=
, cross)")
+#   mcount    ${KLP_TEST_MCOUNT:-n/a}
 #   tmpdir    ${TMPDIR:-/tmp}  (each test builds in a fresh directory here)
 EOF
 }
@@ -153,6 +165,16 @@ EOF
 FIXTURE_CFLAGS=3D"-O2 -ffunction-sections -fdata-sections -fno-common \
 		-fno-asynchronous-unwind-tables"
=20
+# Build with ftrace, which livepatch depends on.  Objects not built with
+# build_one() need FTRACE_CFLAGS and record_mcount() too.
+FTRACE_CFLAGS=3D
+if [ "$KLP_TEST_ARCH" =3D x86 ]; then
+	FTRACE_CFLAGS=3D"-pg -mfentry"
+	[ "$KLP_TEST_MCOUNT" =3D cc ] &&
+		FTRACE_CFLAGS=3D"$FTRACE_CFLAGS -mrecord-mcount -mnop-mcount"
+fi
+FIXTURE_CFLAGS=3D"$FIXTURE_CFLAGS $FTRACE_CFLAGS"
+
 test_name=3D"$(basename "$0" .sh)"
 workdir=3D
=20
@@ -343,6 +365,20 @@ build_one()
=20
 	$CC -c $FIXTURE_CFLAGS "$@" -o "$out" "$fixture" 2>"$workdir/cc.log" ||
 		fail "$(basename "$fixture") does not build: $(tail -1 "$workdir/cc.log")"
+
+	record_mcount "$out"
+}
+
+# record_mcount <object>
+#
+# FTRACE_MCOUNT_USE_OBJTOOL.  CONFIG_KLP_BUILD always runs objtool with --li=
nk.
+record_mcount()
+{
+	[ "$KLP_TEST_MCOUNT" =3D objtool ] || return 0
+
+	"$OBJTOOL" --mcount --mnop --link "$1" 2>"$workdir/objtool.log" ||
+		fail "objtool --mcount failed on $(basename "$1"):" \
+		     "$(tail -1 "$workdir/objtool.log")"
 }
=20
 # build_pair <fixture.c> [cflags...]
@@ -365,7 +401,7 @@ build_pair()
 # Run objtool's ordinary check pass over the pair, as the kernel build does.
 #
 # Some of what klp diff consumes is produced by this pass rather than by the
-# compiler: .static_call_sites, .mcount_loc, .ibt_endbr_seal, ORC.
+# compiler: .static_call_sites, .ibt_endbr_seal, ORC.
 #
 # Only module objects see it before klp-build -- with CONFIG_KLP_BUILD the
 # per-object pass is deferred, so built-in objects reach klp diff exactly as
diff --git a/tools/objtool/tests/x86/test-checksum-alt.sh b/tools/objtool/tes=
ts/x86/test-checksum-alt.sh
index 74ebfca..eb9864c 100755
--- a/tools/objtool/tests/x86/test-checksum-alt.sh
+++ b/tools/objtool/tests/x86/test-checksum-alt.sh
@@ -16,9 +16,6 @@
 # the feature bit, so the failure looks like a machine-specific bug rather t=
han
 # a missing patch.
 #
-# insn->alts exists only after objtool's check pass, so the pair goes through
-# that first -- the compiler emits none of this structure itself.
-#
 # Covers the same ground as corpus/x86_64/checksum-alt-group,
 # checksum-alt-no-group and checksum-alt-recursion-guard in Joe Lawrence's
 # klp-build unit test corpus.
@@ -31,7 +28,6 @@ check()
 {
 	build_pair checksum_alt.c "-D$1"
 	assert_input_section .altinstructions
-	run_objtool_check --mcount
 	run_checksum
=20
 	assert_checksum_differs target
diff --git a/tools/objtool/tests/x86/test-special-sections.sh b/tools/objtool=
/tests/x86/test-special-sections.sh
index 8dfaa4f..e3db038 100755
--- a/tools/objtool/tests/x86/test-special-sections.sh
+++ b/tools/objtool/tests/x86/test-special-sections.sh
@@ -15,7 +15,7 @@
=20
=20
 # section, entry size, relocations per entry
-for spec in "__bug_table 12 1" "__ex_table 12 2" "__mcount_loc 8 1"; do
+for spec in "__bug_table 12 1" "__ex_table 12 2"; do
 	set -- $spec
 	sec=3D$1
=20
@@ -39,4 +39,14 @@ for spec in "__bug_table 12 1" "__ex_table 12 2" "__mcount=
_loc 8 1"; do
 	cleanup
 done
=20
+# __mcount_loc comes from FTRACE_CFLAGS, not from the fixture.
+setup
+build_pair special_sections.c
+assert_input_section __mcount_loc
+run_diff
+
+assert_section __mcount_loc
+assert_reloc_sym __mcount_loc target
+assert_no_reloc_sym __mcount_loc other
+
 pass "__bug_table, __ex_table and __mcount_loc entries extracted"
