Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765499;
	b=3+/40FBOPDJ1jBls7yQLzT3xSLCVBgOt8GfPpvAC0FTZo2hrBP2VHj0oO/OYB7wDqQI8
	 zba4+KogCQqZu3GfOuyqJOA/IO68Rhk3IrmXJPJk1SzTWcxLT6e+70tvmlPqTsTAdXT/k
	 My2R6sDUDCgXdxrWOVdVDB2BLmv8pMl7dF+dvL5qybdfWqir1y2XII34NRUT96X5noSt2
	 vvKDX/sok8GBwl/bzamU8w93wAiuCciS5EprjM7IAJ6jvhhXq3DBLZIPYVhSsRN/IGPrj
	 7QLtfNchd46lvCtybAo/TF4+FCzbsSBl2J00bY3g3b9pEc9Y/wY3Cyb6Aq77Oe06e5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765499;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mRhs8+NkIpWLpYOBzCKycgFylDjzXxuUt8PjUFydA1k=;
	b=4l8dPvrsRyeoTSS24abEgHEKpoxkukCcnosDaMh2wjE6keA81k1sV9vy9EZqlBAVeJEz
	 c9VZd9S2XMYJxeL8gRAxTt6Rw3sSpeAfXtPkvsPuVCz3SVOvbmbHaE0EtzcxqgQCTwvwk
	 zTEhSwSN6RzvvQe0vJ9bLGtOvDCMsHx2gsDMXI9hW13v16yBwkiprBrZHwdcCQHPx9VK+
	 mR06vBDoblLkyN/jK9zMxQqYOyp6wGW1l6pzJS/esP1EUPBgMKB1CcBXvTY+UkBOxTIvf
	 RaNoEMtEcNRbexj6JSRyhWD28Jxk1AZ3fT7XioIjgYYg1UaGPwiXwqOEZbAmxyJbtHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Rnd1BRq9;
	arc=none smtp.remote-ip=95.215.58.108
Received: from mta1.migadu.com (out-108.mta1.migadu.com [95.215.58.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BE5606A6A8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09BE5606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Rnd1BRq9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zMl0M0QUmSAz5mu18JLZEbsKm6FWjal0JM5qpuC24jA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765497; v=1; x=1796370297;
 b=Rnd1BRq91mfj5TWs00P8cD3c41mifRXjRQHxD377OghRsTogr8THsSAJmf6Xq1U++sH4/gOV
 OxpClbM20st/lNWh5Hl3syyGItByRO59MWE24uafUJXLka1KbprxYgIO+hhAgYhg/iS+Hlxigm2
 aQnE7tPFYSOM910NurCKAWGU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ad0523395ea71a30;
	Fri, 27 Nov 2026 07:44:57 +0000
X-Mizu-Trace-ID: ad0523395ea71a30
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 05/10] arm64: sysreg: Reject a Fields or Mapping line with an undefined target
Date: Fri, 27 Nov 2026 07:44:21 +0000
Message-ID: <20261127074426.50739-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Sysreg block can use another block's layout. "Fields X" names a
SysregFields block and "Mapping X" another Sysreg. The generator emits
the register's RESx and UNKN masks as X_RES0, X_RES1 and X_UNKN, but it
doesn't check that X exists. A misspelt or missing X gives macros that
expand to undefined names, and the build fails only once something uses
them. MPAM1_EL12 had such a line.

Check every Fields and Mapping target once the whole file is read, since
a target may be defined after the register that names it (MPAM1_EL1
follows MPAM1_EL12). Either kind of block defines the masks, so the
check accepts either kind as the target of a Fields or a Mapping line.
Give fatal() an optional line number, so that the error is reported at
the Fields or Mapping line.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index c4fa27cd9beff..1843d283192d2 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -9,8 +9,8 @@ function block_current() {
 }
 
 # Log an error and terminate
-function fatal(msg) {
-	print "Error at " NR ": " msg > "/dev/stderr"
+function fatal(msg, line) {
+	print "Error at " (line ? line : NR) ": " msg > "/dev/stderr"
 
 	printf "Current block nesting:"
 
@@ -124,6 +124,11 @@ END {
 	if (__current_block_depth != 0)
 		fatal("Missing terminator for " block_current() " block")
 
+	# A Fields or Mapping target may be defined after its user.
+	for (line in refs)
+		if (!(refs[line] in defined_regs))
+			fatal("Undefined Fields or Mapping target " refs[line], line)
+
 	print "#endif /* __ASM_SYSREG_DEFS_H */"
 }
 
@@ -241,6 +246,8 @@ $1 == "EndSysreg" && block_current() == "Sysreg" {
 	print "/* For " reg " fields see " $2 " */"
 	print ""
 
+	refs[NR] = $2
+
 	next_bit = -1
 	res0 = $2 "_RES0"
 	res1 = $2 "_RES1"
-- 
2.47.3

