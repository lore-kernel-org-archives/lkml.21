Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030920;
	b=JBMKPbXJirmaj3Xew9DqDxFJWR+ryTIPrWFAoqI2NVeknxXeapaw0pqN/5fG8Zm4Tygi
	 3xWU2etBm4NKTggUGRm3Wv+vFMJYkE/h1I7I+xb7EzlvQlrDAlmTs8FENu9UPqoizUvoO
	 K/M2/u8oAemWyGEBQWuiDJud1YI6EAWEPOsxpQN2voiC7lTGz/f97CUlq/X9V8j4njNWq
	 zW+qGwSBaMFQPUZx8qC1Ezl6QibZd5hsf7Lv1vSYhTAE3/UMKzYNQzeP2oz62hMXD9R//
	 GyNNC2nAuUkIFNlQ9frDCJSx1CpdRCb5iU3Y4R7xvHchFx3hu9y1UCPhOabW47zQ2LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UBjeXZZm40bR5HDOgO+Dkyyi9wZC4GuhCapOxJ6PXxY=;
	b=rQToUyre3jwZJx6uiKTMCjdkqFIFoSn7/JFc/F+gJRmfeQ8zwUvNaOjXGvZzQ2d8qw4S
	 +yGyBgGCAn4SPN4wGHgGEEwT5do4qIIOQ6QLph2TViMlagjf80xyR9G8mtCx+e8vcm5ds
	 REnaUffHVBHA0EM7cb/cS0ZjISIWxlrQE8yZoQCXyVXrblocXN17JapUtTJdJTD6dAA46
	 YxwVbm1E0viwSfbjNOgs2bkG8RoUlFcxVDjiEJA5hNbQHOzxDyBRePzmvvhQz87k7NPvg
	 9CcIcEa7AYuI1m4DVQWcWv8Rj5IO0zmKveHBaVykPbi8bItBUkwCT6kmCF1dVBFXYZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elsk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2UT5mIj;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE68606A7C6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE68606A7C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2UT5mIj
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so968917b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795030919; x=1795635719; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UBjeXZZm40bR5HDOgO+Dkyyi9wZC4GuhCapOxJ6PXxY=;
        b=l2UT5mIjyhFC63AtrXmNDaOFHb0k0+3mB3N0bxmf0S+aUzWzOmFEy3M7GDX/04tgjk
         NxgxLuH1J0TMYdiRwMStxwvj5cdJRcaCkf6m6b5Dh/EcE1Sc0tfUXMjrAzggWTkK3te6
         VeMd/sIsHlbKNV7wJiCGsm0mnQPkMheFIS0rk0Fygh9AbAwliayj0t1iGH4YOUUPEo8R
         /gsu7RimYSankMikXw5IIYqsm87KXd5h+tKFSOx4H+5RsHT4oMttKvCEGrVEMi4sIUMe
         zCcSwVoM4xmou9E3psA43xgG7HGNgdW0xToqsaRJoN5reBt8CuhNHbaTqkzY8BuxcZa5
         Mz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030919; x=1795635719;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBjeXZZm40bR5HDOgO+Dkyyi9wZC4GuhCapOxJ6PXxY=;
        b=a4SZI0HEXbnOZ7TVJaz8fA1rmlxEBstr4+h6Ov7GXYj7pMiRG/9nFQw6HpVHsMOSYP
         82xqRIluAeRoOgdB0R724YL8a/emHHa9JXomPGd3LQ4tRhPne3Cv/1w7oKcq7gl1Jn89
         A++PYCYQecEJcuzdbz12t/gt69V4DePVdT3rGO1aExzeImFwhLilTIAiWCUV0YdtDmim
         yI4GHqTX/GbZ2oNebCsN8nP8yvBhZbI93VFA6VJIZ9jEzxy1AAHZom2Ii9KO0tWPTeRh
         uv6zMAVIE4vIRu58rlMCp6ziL/MXL7rlpE4nLZMakAiTnm1FJ9F9RvuBJnuh4UpYzN7K
         BfBQ==
X-Forwarded-Encrypted: i=1; AL+hErHN5dd5feUuNkktCOw8moIy9o4/A31naqpSeeX3wOr95sZlCTiLEfmYVi0eXCTv3JoZzbJTtC3sUDFqgMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rzfj8c37a/5p/WcmbLfuLqnFiZfElajP+MzzoQhke0mLevstd
	fzZ2IM8yJ21tyBjNv0SPYlE5rWmVKGmejoTooaWCsMFFnvdubDEhqzPwGFKSjDpf5lJE7KdzNw=
	=
X-Received: from pfy9.prod.google.com ([2002:a05:6a00:a489:b0:8be:87fe:7950])
 (user=elsk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f81:b0:886:46c:8a1f
 with SMTP id d2e1a72fcca58-8c5d45df160mr3456060b3a.35.1795030919125; Wed, 18
 Nov 2026 11:41:59 -0800 (PST)
Date: Wed, 18 Nov 2026 19:39:19 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118193921.683813-1-elsk@google.com>
Subject: [PATCH v2] checkpatch: externalize function-like type macros
From: HONG Yifan <elsk@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>
Cc: HONG Yifan <elsk@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

tools/testing/selftests/kselftest_harness.h defines FIXTURE_DATA() and
FIXTURE_VARIANT() to expand to struct type specifiers
("struct _test_data_##datatype_name" and
"struct _fixture_variant_##fixture_name").

Because checkpatch.pl does not recognize these function-like macros in
$NonptrType or $NonptrTypeWithAttr, annotate_values() parses them as
function calls and tags a following '*' as a binary multiplication
operator instead of a pointer declarator.  This triggers false-positive
errors across kselftests whenever helper functions take pointers to
fixture data or variants (over 150 sites in tools/testing/selftests/),
for example on commit d2b82fa39fda ("selftests/mm: add a GUP selftest"):

  ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
  #319: FILE: tools/testing/selftests/mm/gup.c:191:
  +		FIXTURE_DATA(gup_test) *self,

Following scripts/const_structs.checkpatch in commit bf1fa1dae68e
("checkpatch: externalize the structs that should be const"), read
additional function-like type macro names from a new companion file
scripts/type_macros.checkpatch into $type_macros (named to mirror
$const_structs/$conststructsfile and initialized with the built-in
typeof and __typeof__ keywords) and use $type_macros in $NonptrType and
$NonptrTypeWithAttr.

Seed scripts/type_macros.checkpatch with FIXTURE_DATA and
FIXTURE_VARIANT, and list scripts/*.checkpatch under CHECKPATCH in
MAINTAINERS.  Valid pointer declarations and casts no longer emit false
SPACING errors, while malformed pointer placement (such as
"FIXTURE_DATA(foo)* p" or "(FIXTURE_DATA(foo)*)p") is flagged by
POINTER_LOCATION.  Keep typeof and __typeof__ built-in as C/GCC
language operators so $type_macros is never empty and typeof() keeps
working when scripts/type_macros.checkpatch is missing or empty.

Signed-off-by: HONG Yifan <elsk@google.com>
---
Changes in v2:
- Externalize FIXTURE_DATA and FIXTURE_VARIANT into
  scripts/type_macros.checkpatch instead of hardcoding them in
  scripts/checkpatch.pl, matching scripts/const_structs.checkpatch from
  commit bf1fa1dae68e ("checkpatch: externalize the structs that should
  be const").
- Add scripts/*.checkpatch under CHECKPATCH in MAINTAINERS.
- Link to v1: https://lore.kernel.org/r/20261117220522.904290-1-elsk@google.com

 MAINTAINERS                    | 1 +
 scripts/checkpatch.pl          | 9 +++++++--
 scripts/type_macros.checkpatch | 6 ++++++
 3 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 scripts/type_macros.checkpatch

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..b0dca8edb154 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6264,6 +6264,7 @@ CHECKPATCH
 M:	Andy Whitcroft <apw@canonical.com>
 M:	Joe Perches <joe@perches.com>
 S:	Maintained
+F:	scripts/*.checkpatch
 F:	scripts/checkpatch.pl

 CHECKPATCH DOCUMENTATION
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b8b64f720191..7500e1cf447f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -71,6 +71,7 @@ my $codespell = 0;
 my $codespellfile = "/usr/share/codespell/dictionary.txt";
 my $user_codespellfile = "";
 my $conststructsfile = "$D/const_structs.checkpatch";
+my $typemacrosfile = "$D/type_macros.checkpatch";
 my $docsfile = "$D/../Documentation/dev-tools/checkpatch.rst";
 my $typedefsfile;
 my $color = "auto";
@@ -1053,6 +1054,10 @@ if (defined($typedefsfile)) {
 	$typeTypedefs .= '|' . $typeOtherTypedefs if (defined $typeOtherTypedefs);
 }

+my $type_macros = "typeof|__typeof__";
+read_words(\$type_macros, $typemacrosfile)
+    or warn "No additional type macros will be considered - file '$typemacrosfile': $!\n";
+
 sub build_types {
 	my $mods = "(?x:  \n" . join("|\n  ", (@modifierList, @modifierListFile)) . "\n)";
 	my $all = "(?x:  \n" . join("|\n  ", (@typeList, @typeListFile)) . "\n)";
@@ -1066,7 +1071,7 @@ sub build_types {
 	$NonptrType	= qr{
 			(?:$Modifier\s+|const\s+)*
 			(?:
-				(?:typeof|__typeof__)\s*\([^\)]*\)|
+				(?:$type_macros)\s*\([^\)]*\)|
 				(?:$typeTypedefs\b)|
 				(?:${all}\b)
 			)
@@ -1082,7 +1087,7 @@ sub build_types {
 	$NonptrTypeWithAttr	= qr{
 			(?:$Modifier\s+|const\s+)*
 			(?:
-				(?:typeof|__typeof__)\s*\([^\)]*\)|
+				(?:$type_macros)\s*\([^\)]*\)|
 				(?:$typeTypedefs\b)|
 				(?:${allWithAttr}\b)
 			)
diff --git a/scripts/type_macros.checkpatch b/scripts/type_macros.checkpatch
new file mode 100644
index 000000000000..c910a09e2ebc
--- /dev/null
+++ b/scripts/type_macros.checkpatch
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Function-like macros that expand to type specifiers (for example,
+# struct types) and take parenthesized arguments.
+FIXTURE_DATA
+FIXTURE_VARIANT
--
2.56.1.708.g77570a6a1d-goog
