Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420375;
	b=V7pTS+8htdGHU6wm2mAw0wNzTGqd8ZPXYeV3IIsoTCJd2aanGfwz8I1nVqH1csdJ63ly
	 ka6GLmFqs01ErNckElHKtc+jiaS0YPaRSvbM+MkSEa5RnR9VJQoYLVTXuedhzx/Ebo1uo
	 2R2dSTiyG5rx+Cn84y3drkATYkULd8l2WzTRpOJdjAjhgCTJpYw0g7YqSFVjpq4sQtSyh
	 qWA87KryYOTZKEa/srQ5Gp/UIphgAJxmqmEYnvxXDKuCYmOWqfBK2a4n9U1ITgUsYUJKA
	 t+pTkmFWpjO68pAev2jxsH3omLRPJPlVvh3DBfqHrHRahGnan5nKXXio22m9rJLHmTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420375;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BcY3zhewcC/gjXkdCrNzCSoLVp0i4+/wkiIUb/zH1l4=;
	b=BvEc/AXRh/APBV8tLgq/4VyrRacvX5KkvKk7dHo4WGIRmf8/eSRWU1mvMC8KZe3Mn3jg
	 c1o17uL5jG82ukbrY1Jv941kUKLy2+PqviP6OdGdNLfnR7OwLPINoI8JT5ZCYVlHfsqHn
	 tYl3k6ZnV5oHWbHckn+T425Ir3b6o+ydnR4l3aOuae6dLelQzCZll4TVjqsvtP03W59Am
	 kyPIteS9PWd5NL6brN/5lE9Eefo/rQO6N51t06Q/k3elMyPUybHvDoe/5fbo9ppqeCcm3
	 B3AgYl4H09yGbZQKVNTjbfChelaNaoboTXuK3rMTOyqBFORtMtmyrKRda26rrhi3ovA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FIzo7vBZ;
	arc=none smtp.remote-ip=95.215.58.156
Received: from mta1.migadu.com (out-156.mta1.migadu.com [95.215.58.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E77606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E77606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FIzo7vBZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A0IV6vF9Ca8CUPIZGwVPYNr9oyhhI8zHxDxiCNop38c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420373; v=1; x=1796025173;
 b=FIzo7vBZYPtfTHdKgCqhrqY/sbBrN3huxLvuZ07DLQWIoErDRL/uw2SEJ7ft8e9d77EmaGlo
 ITsX/XpjoirdzFC/bcvtCoKTY774XKMQMctmF5Dal2kW7stdKhKZ+PQ2b8iQrCxOzZkMKagDYaH
 Xc1FUgtLJlYMML0Md9uxkBHQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a3fa72e7f477d5c7;
	Mon, 23 Nov 2026 07:52:53 +0000
X-Mizu-Trace-ID: a3fa72e7f477d5c7
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
Subject: [PATCH 6/9] arm64: sysreg: Reject an enum value not written at its field's width
Date: Mon, 23 Nov 2026 07:52:16 +0000
Message-ID: <20261123075219.369042-7-fuad.tabba@linux.dev>
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

The generator emits each enum value as written and doesn't check it
against the width of its field, so a value wider than the field defines
a constant the field can't hold. The duplicate value check compares the
strings as written, so 0b01 and 0b001 in the same field pass as distinct
values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
too.

Require each value to be 0b followed by exactly as many binary digits as
its field has bits. The one enum written otherwise is TS, a two-bit
field of TRFCR_EL1 and TRFCR_EL2 whose values have four digits. Write
them with two digits, which leaves the numbers unchanged.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk |  3 +++
 arch/arm64/tools/sysreg         | 14 +++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 1843d283192d2..cde526896ed96 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -367,6 +367,9 @@ $1 == "EndEnum" && block_current() == "Enum" {
 	val = $1
 	name = $2
 
+	if (val !~ /^0b[01]+$/ || length(val) - 2 != msb - lsb + 1)
+		fatal("Enum value " val " for " name " is not " (msb - lsb + 1) " binary digits")
+
 	if (val in seen_enum_vals)
 		fatal("Duplicate Enum value " val " for " name)
 	seen_enum_vals[val] = 1
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index ebe5c5bd6fef6..5b587a7544e40 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2919,9 +2919,9 @@ EndSysreg
 Sysreg	TRFCR_EL1	3	0	1	2	1
 Res0	63:7
 UnsignedEnum	6:5	TS
-	0b0001	VIRTUAL
-	0b0010	GUEST_PHYSICAL
-	0b0011	PHYSICAL
+	0b01	VIRTUAL
+	0b10	GUEST_PHYSICAL
+	0b11	PHYSICAL
 EndEnum
 Res0	4:2
 Field	1	ExTRE
@@ -4300,10 +4300,10 @@ EndSysreg
 Sysreg TRFCR_EL2	3	4	1	2	1
 Res0	63:7
 UnsignedEnum	6:5	TS
-	0b0000	USE_TRFCR_EL1_TS
-	0b0001	VIRTUAL
-	0b0010	GUEST_PHYSICAL
-	0b0011	PHYSICAL
+	0b00	USE_TRFCR_EL1_TS
+	0b01	VIRTUAL
+	0b10	GUEST_PHYSICAL
+	0b11	PHYSICAL
 EndEnum
 Res0	4
 Field	3	CX
-- 
2.47.3

