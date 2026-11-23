Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420377;
	b=RYvGZsqZ1CrpWgKtbJERmxSXyHalUltyzVDd+bHjQ7TdCvTr2FXtDKFGuiiaGLDtNTAq
	 aaNKe8cEgBou1Ue9h+FK0mAderHV0mpRg+OZSq9JbyxfZIaz/MQ5MFQrhD10VEYlGBah8
	 lOl14o2Fs2mUpsd6EOm/5cu1yxbNXsZreluMogGU005aotMF4Tgy9EQrLIqdsKNdFyBiq
	 51pgZqjDbmK7zfabISbeGsRFYpR+V+1Oof5p4olrGuwMxBPmgaJrvhhmUt2X8h5z1/HX5
	 N10choQQbT26KJD0iKQF1y5Rn++zyVKEppmsO7l6qBE5QEB8VYf+WLvGOogKcZSCSTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420377;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qIJrEsV8q5q46A4SsJPRQvMZx8idsb7sIBvke3Yk/1c=;
	b=HyUF2qY+5YTd5Dbc6qRh3HaCnRVzMiAGpYmBW+cQAj0zhZ68DWYrRUWIW6bkIJfwU77/
	 9u1XSXPmhkPh5sqCsA0T0sEWm9d1iY0P2AGPqURB2NvBEUUXRvaTzOycKVfNo1S8Ljxq6
	 DMV3PNl5YmuC+v7DFFCmu68VHisuVeiSb4L/r+4osTgAuS4yMzocWVbBBs1wc5ZUABqDm
	 sXVdB0ViohNp+WXq1DlPR6F7P6dGcxosuOqd75p3p37c4aRplCnq+swPIpTPVxHtVPDrx
	 R3+TMcJA9dWSCGxmdytVl/RcSkL6XDecCVYquU8XASuyVZVxUlRhmY6aD3x4SshazuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="bY/x1nM6";
	arc=none smtp.remote-ip=95.215.58.163
Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574A4606A69A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574A4606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bY/x1nM6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Tw6dB4B92oC7xpmbobifcQLnjJ3eaMJDfve4ZFo9YAw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420374; v=1; x=1796025174;
 b=bY/x1nM64e3fEjvdFSh7LZ93NgGsJMGuQDn0JXXUvCFtmlrls7Yi2p4bR7ZG6Bn3+GeD/l0A
 bCpo8QDrAfTR1dapAgJueQdao4sr+XqL7j1UyHduDSlzq+QL1n97DV0mbPVQ47R6NYiBVQWyVK7
 xBPbqnRsIoH+2KtHC0oqqjqI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bbb240c3c967fa07;
	Mon, 23 Nov 2026 07:52:54 +0000
X-Mizu-Trace-ID: bbb240c3c967fa07
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
Subject: [PATCH 8/9] arm64: sysreg: Reject an out-of-range register encoding
Date: Mon, 23 Nov 2026 07:52:18 +0000
Message-ID: <20261123075219.369042-9-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
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

The generator copies a register's op0, op1, CRn, CRm and op2 into
SYS_<reg> without checking them. sys_reg() shifts each into place
without masking it, so a value too wide for its field spills into the
next one. SYS_<reg> then names a different register's encoding, and the
build doesn't report it.

Require each of the five to be a decimal number that fits its field (two
bits for op0, three for op1 and op2, four for CRn and CRm). Reject a
leading zero too, since C reads such a value as octal.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 0bd6aab8aae0f..057dc98082b5e 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -43,6 +43,12 @@ function expect_fields(nf) {
 		fatal(NF " fields found where " nf " expected")
 }
 
+# Check that one field of a register's encoding is a number in [0, max]
+function check_encoding(reg, name, val, max) {
+	if (val !~ /^(0|[1-9][0-9]*)$/ || val > max)
+		fatal(reg " has invalid " name " " val)
+}
+
 # Print a CPP macro definition, padded with spaces so that the macro bodies
 # line up in a column
 function define(prefix, name, val) {
@@ -198,6 +204,12 @@ $1 == "Sysreg" && block_current() == "Root" {
 		fatal("Duplicate definition for " reg)
 	defined_regs[reg] = 1
 
+	check_encoding(reg, "op0", op0, 3)
+	check_encoding(reg, "op1", op1, 7)
+	check_encoding(reg, "CRn", crn, 15)
+	check_encoding(reg, "CRm", crm, 15)
+	check_encoding(reg, "op2", op2, 7)
+
 	define_reg("REG_" reg, "S" op0 "_" op1 "_C" crn "_C" crm "_" op2)
 	define_reg("SYS_" reg, "sys_reg(" op0 ", " op1 ", " crn ", " crm ", " op2 ")")
 
-- 
2.47.3

