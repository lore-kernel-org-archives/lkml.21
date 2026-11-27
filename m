Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765504;
	b=4SqnxWnl7aUXnmL/5C0VO4pSuyTG5AadV+MDwFHUDYds9/nn6ZOsP7hQXKf5udwXJgiL
	 Chh773nK/F3f/c1PuGPqB99siSRXXjfRZjOjkJd7HsTDqE8KuJtS67/8ckJ+sdtoh6mEK
	 UxUE3WTipHvzXZ4NCkr3UEDRG623yCwIyDlE6JPFkJH2pfsXv9RbpJJoktiG2Pt2cyKhg
	 A2Fk3EJorvf9bVsm3IY1CQqfGxwiOZz/WL7ay4dexjQf8AMtnjsbYupJBsmMWkrN9Xngj
	 RcRTOOVPLI5SISxkodpnYL9f40ucvotBlUu4YgEEPC1JjzGJCjgLvW1RnjWDrPSMsIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765504;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QK3iDQgYPVeMAaN6W5AdJFnxFZX7uO7hiMLiTGM3PCI=;
	b=KpkYtoDcQqh8nFFrJQsFEEdbFC/MXsWSYwCG70F1j5P2BLTdQzu1aNl/JuwSNxAxqpr5
	 0bIGjXJKvRkXiXbq4D0t5ASBiiUu/5Z+g0DcZU99LHHCi9O22R4mmMpHpSj6JuCRHf7eB
	 rEOfkulOtHcb2GXwoimaLVK5GFzJBgAlMslxuMtPkjykmoWFbRhpY0jA5ZLRmJULUj37a
	 48VXg34giViv4A3J7yrEJYu+21gudYjXI2BSOQl/1w6KhiWRWLT2kWrAZ0olymk3lTKAS
	 x3iZbQ607PmUYUnltiCN0PrxrIpm/n/VZQaaslpsn4aw1XLZcT83D2Ku2TZJ0y2tdkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AcLajVIL;
	arc=none smtp.remote-ip=91.218.175.163
Received: from mta0.migadu.com (out-163.mta0.migadu.com [91.218.175.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E619606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E619606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AcLajVIL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jxiSiNbMWfOo9QUaR0n+zKrH/9ksb19ck5mP/+Gsoi0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765501; v=1; x=1796370301;
 b=AcLajVILShRe07l8O+SF8QTOFIKnCzKXS+ex53darWyCsfno9HyQS13cvUhJlyGfKONzbMWc
 Iy0AkYeUv+6TlERpylVRQfoM22Y9IWAaHpLSl6m7iCbGgLJhxQkR1CxlhQB1hkEBFn4FzPcN5i0
 zXYRWX+hLvxNd5qv83aVjACo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fa540e720c5a858f;
	Fri, 27 Nov 2026 07:45:01 +0000
X-Mizu-Trace-ID: fa540e720c5a858f
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
Subject: [PATCH v2 09/10] arm64: sysreg: Reject an out-of-range register encoding
Date: Fri, 27 Nov 2026 07:44:25 +0000
Message-ID: <20261127074426.50739-10-fuad.tabba@linux.dev>
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

The generator copies a register's op0, op1, CRn, CRm and op2 into
SYS_<reg> without checking them. sys_reg() shifts each into place
without masking it, so a value too wide for its field spills into the
next one. SYS_<reg> then names a different register's encoding, and the
build doesn't report it.

Require each of the five to be a decimal number that fits its field (two
bits for op0, three for op1 and op2, four for CRn and CRm). Reject a
leading zero too, since C reads such a value as octal.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
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

