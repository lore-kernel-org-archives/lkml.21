Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420352;
	b=BXFLJmILBkqukOMWb3k7wduJsQp82FfjQ5t9HqL9zLc2YAyNxeRBmffp1EuwqiWKNQ+S
	 e43bnfoLYea4qoYWp728d8r7k7S9xmBNQRHbOQK41BZ7OdzkaasOpMlwbotpBJyfOPp9L
	 xutyd80vGwoaC4ENepXlNwi2sPD9x6JKwMOI2N4SFgOv7wFiFfvY/wbLBPZ6FdHJyujA7
	 xwzgA8Ziu0DTA5SZJqjXtYGhyb1z0PaTAjvkq2U0W7oAxpcaees9yGMuEh8UWMTdUQJP0
	 Y9zilwMfAKwHXDBNoRXed2/6HZXm02nX4i12m5N9BbiPPaXF0rXIwCGs12fTQ7S7B3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420352;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T7Gl0BHsaIw0ZQTFVbcTmIDA3k5DivfNbi4SDKTIWxk=;
	b=fM94mA5m1ROzjn0Z7dPNwSm4kxW2xZQZSZ56AyuIksDU8GZg/kmUyQNmGhuiXi2/NmfY
	 RBHJa/uKoQwCxhy5Pn6SNz9HokU3KRklm7Ca3/mzZQFsh6YgqrDXS22yj8eRnw7r43ESa
	 jRsbLhI3u10AzpZD/U/23BDx64h7SPrjLP6rCnYudnikotQbxGgrO+djGNmxMlTQl1+tw
	 ZI0ji4dN7t6bYJTjutFzmXGpI9Zcqskoq2B7Rmnv7/Z+lcu4Oms6pHOMZsvcuWvoJ/aXV
	 j4TRbfkI1hsdF3/BFtJrImR8FVTbtiV/RetvZas6mTXpTy7GpPCLjBEPlJlp11KTvTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UdViQ2OB;
	arc=none smtp.remote-ip=91.218.175.191
Received: from mta0.migadu.com (out-191.mta0.migadu.com [91.218.175.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2AF606A69D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2AF606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UdViQ2OB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M2gAmx56TmZSrMtnBNalKAcRoPlTSuspteY76LphWew=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420349; v=1; x=1796025149;
 b=UdViQ2OBQQruruXbO/CGixvrdHyBL6nujWxwdi/hHaSlaz1Awhwr3R1ShOvCTWf4b/4BpFZm
 7zeY5GDQeqFParMOI6sJENdnlVDtPb5tRPXlZmtvr7Z51tBeZMuOemwzeZBiknv1kwSebwc3CI9
 Kn/zwRp0O/dQfbxm+JhvFDIg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 292ad1cbb883b4d7;
	Mon, 23 Nov 2026 07:52:29 +0000
X-Mizu-Trace-ID: 292ad1cbb883b4d7
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
Subject: [PATCH 3/9] arm64: sysreg: Reject a Sysreg and a SysregFields with the same name
Date: Mon, 23 Nov 2026 07:52:13 +0000
Message-ID: <20261123075219.369042-4-fuad.tabba@linux.dev>
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

The generator rejects two Sysreg blocks, or two SysregFields blocks,
with the same name, but tracks the two kinds separately. Both kinds name
their macros for the block, so a Sysreg FOO and a SysregFields FOO that
each have a field A both define FOO_A, as well as FOO_RES0 and the other
masks, and the compiler warns only where the definitions differ.

Track both kinds of name in defined_regs, so that a block is rejected
when either kind already has its name, and leave the kind out of the
error.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index b299342463631..8ce4981273dd3 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -137,9 +137,9 @@ $1 == "SysregFields" && block_current() == "Root" {
 	res1 = "UL(0)"
 	unkn = "UL(0)"
 
-	if (reg in defined_fields)
-		fatal("Duplicate SysregFields definition for " reg)
-	defined_fields[reg] = 1
+	if (reg in defined_regs)
+		fatal("Duplicate definition for " reg)
+	defined_regs[reg] = 1
 
 	next_bit = 63
 
@@ -181,7 +181,7 @@ $1 == "Sysreg" && block_current() == "Root" {
 	unkn = "UL(0)"
 
 	if (reg in defined_regs)
-		fatal("Duplicate Sysreg definition for " reg)
+		fatal("Duplicate definition for " reg)
 	defined_regs[reg] = 1
 
 	define_reg("REG_" reg, "S" op0 "_" op1 "_C" crn "_C" crm "_" op2)
-- 
2.47.3

