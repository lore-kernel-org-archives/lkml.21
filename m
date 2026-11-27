Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765473;
	b=BGUmBZmU01oG4Y1cJJzFKm3Axds7Vq4IlURkYH8uQSNwR7AOk5gBZ05Mg5xcYKSBQhdj
	 9av4VsH+1Em+rsnKNoGO6W9Yp9Z23PXzr1DCyNV917cucqym7jlRR3On2fyf2PkO9oAfp
	 wKFbk6hzpxFOl6vdqws31lkp5eCtf8G+kVar7No7IbGRblP17ndCair5ONK9x+kqNyRWc
	 rqgJBULMk63UJjtg/rMgRjj1amvJQn0yMti9zvmEwLpPXydkPF+pE3KBnMywxHaVveHSb
	 8G4ymLk+Q8Uc5t7HB0EAMM7ohr/tQCAXOk590gYjqvBvkRPvpGIK5GK5Mf3uZ6E1rng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765473;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9QASW/nQFRwckZtkKScSXoTMKPbwzm+lBFMqrjF4EN4=;
	b=1s/1SAAeOJYZMUuxkwFfau9amVHgClbG6u5YJXt1VxmTYO9K8PZ+hPexsTYUFVInzgpj
	 YH672XvAuhjRfyVHDmNuCWUN6kic4+DdlSnHGxeZK5dZpI4vljKzEuuwDvRDsd0SqQ3Z0
	 NfEjpXVbKjCG9gjnvYvMoq1r0tHhtJ06EPWURqyJ7/CUVTAU2T8zZ6McR2M2QH7AN6ui3
	 7BGFj2ZdKeSJHk998QU8aqW44PFdy96NYpgGvrC/EEi4gTilWFApxPki6nidXJpq501x6
	 dxdSw9bhIyUjd9ZmJTF+y8dPoIbRknvsGozf5OxqIwZcmKzzv8EAZHW2dENFt9z7E4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nIvAc5+y;
	arc=none smtp.remote-ip=95.215.58.87
Received: from mta1.migadu.com (out-87.mta1.migadu.com [95.215.58.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01121606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01121606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nIvAc5+y
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wWPnTVaNR02s/u6p1bUwAEswVlCSylV2VmELoXM6mc0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765471; v=1; x=1796370271;
 b=nIvAc5+yw+FnYcUISj6Cnr5AjM+sEHKTrFp0fLS5B4TDvgjb3s8PRiEwL8CAYfSGb1bfhkhh
 /wLgT8dgVSYpwBmlCxHz5iebZwBUC/94h/enTiGrooQucRf4uM8lAJ6Gs4aqplRzE4BoXNkmD4x
 w5EGc+7VU8tSzg+UuBaNv2yE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ebfebde42fe19989;
	Fri, 27 Nov 2026 07:44:31 +0000
X-Mizu-Trace-ID: ebfebde42fe19989
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
Subject: [PATCH v2 01/10] arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
Date: Fri, 27 Nov 2026 07:44:17 +0000
Message-ID: <20261127074426.50739-2-fuad.tabba@linux.dev>
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

MPAM1_EL12 is the EL12 alias of MPAM1_EL1, but its entry in the sysreg
file is "Fields MPAM1_ELx", and the file doesn't have an MPAM1_ELx
block. Since commit 6ae7fab7d9d33 ("arm64: sysreg: Emit RESx/UNKN values
for Mapping/Fields definitions"), the generator's MPAM1_EL12_RES0, _RES1
and _UNKN expand to MPAM1_ELx_RES0 and the like, which aren't defined.
They aren't used yet, but the first user would fail to build.

Describe the register as a mapping of MPAM1_EL1.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
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

