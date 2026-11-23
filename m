Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420348;
	b=LpTFTymFFQf81KPrUs05sxZzj82MO7YARZebalYHiZWWygbypCTfdZ31vTEVO7xfH0/c
	 vRGrFEC7FVM73fJTlHegBzm67F9fwbj865lqxfyfLfZVHHtqMGVR6rYbwunUzNVKTE/RM
	 pJr95OzYsSirDf20xGuotlLc0LwVx3kUJ7/ZvfNuEV8WdjpJ2stStlA1QO9vEcmzqotx1
	 Nfk7vPhhBSw+mibrX2DWVmTPqWITKVjKrc20wo54wYBBx5IBXlLgUPRe//wRoSswxo8IW
	 pjcKdWA62+AuJEQQcyJC33ja5rGGe0vBT99gabZYnFlRT7hUO/gpJRqE4n582ig92rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420348;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VUq1FwUBes476hqYf0N3+rNKTNIoG0zuocLy5Eg3cmU=;
	b=2krV1/0tX4EpKWZvPyLzGxwoHBERXxXZjARC2z1Dalgcb3Db00X9UfFe4jbsg7E8JcJZ
	 KnBMKQgx5fZf1up2t7ZLOfQcbSShPhyDh6wW0a/vDdtgBsupKKFjRmf03Ih8mT/dE01fB
	 avShbP+2R/NaBPRDJ1CaiygA6wH4tNFdlgztkdls+U/ib7LM+qCmBQ1BxYxUN03Ai5DW1
	 y3chOgII9Ddk11T0d6/xOLcEMTsieTeXSAoBlpMvzXqNdjl55FSxDJmFwVYpefh+Dfr3d
	 0rjUjJF3FrGVafVq0aFXS3wi8inSB45zd3PYFU488Ub8W4CJ9BvzBsYQd8rLR/SCtLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="j55B32L/";
	arc=none smtp.remote-ip=95.215.58.137
Received: from mta1.migadu.com (out-137.mta1.migadu.com [95.215.58.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5C9606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5C9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j55B32L/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PA8f4ndtDotBrMDWYs5zhgHdu0JkHQRg3GkPu9g17Y4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420345; v=1; x=1796025145;
 b=j55B32L/YJCn19yUNEE3qLhbHeudFU/ZtaS0F1MM4PtBi+TOqHPHBmXzGB8AVgI1Z8bYG0Bq
 XGSo6Gh4RWWnvgyXvj5skRHSJHGaxMhyIcvW8l4BSEfWDCaFnHrHmfnhijYWiCOeCDF78VWqVbR
 e00o49yPhbetxBPAHkHIy1Cc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5fb6a7c82f35303c;
	Mon, 23 Nov 2026 07:52:25 +0000
X-Mizu-Trace-ID: 5fb6a7c82f35303c
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
Subject: [PATCH 1/9] arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
Date: Mon, 23 Nov 2026 07:52:11 +0000
Message-ID: <20261123075219.369042-2-fuad.tabba@linux.dev>
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

MPAM1_EL12 is the EL12 alias of MPAM1_EL1, but its entry in the sysreg
file is "Fields MPAM1_ELx", and the file doesn't have an MPAM1_ELx
block. Since commit 6ae7fab7d9d33 ("arm64: sysreg: Emit RESx/UNKN values
for Mapping/Fields definitions"), the generator's MPAM1_EL12_RES0, _RES1
and _UNKN expand to MPAM1_ELx_RES0 and the like, which aren't defined.
They aren't used yet, but the first user would fail to build.

Describe the register as a mapping of MPAM1_EL1.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/sysreg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 997c62ab72e68..ebe5c5bd6fef6 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -5501,7 +5501,7 @@ Field	63:0	ADDR
 EndSysreg
 
 Sysreg	MPAM1_EL12	3	5	10	5	0
-Fields	MPAM1_ELx
+Mapping	MPAM1_EL1
 EndSysreg
 
 Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
-- 
2.47.3

