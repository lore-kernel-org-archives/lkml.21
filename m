Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765502;
	b=eQrJK3vfPqqNd7DSw3yddbPOhS0KV3PtJeF85rvzX9IvK2hTvWNoat2/Kv6zPTvjp3u/
	 QsnXLihdatNjvVXtJtOGk8VK7d0dHwzKEbhu7QbEFZtr53uHarm1g5fFf9aYiHPJqjgN/
	 WRIOnv+QcWblw+5rB6stCDJ1/ctNVPvC/1DYjLskMgn3TjWxt+4T3D8eFcKaCu5MSKixt
	 xEM3fDpGWgy4DeNcUp+sKVodAGDGQikGiCQTkrCLRU6oQdds4f/3KcaB+8GKORESRq01o
	 eiqyUL4IsiXGerB9OsqU901Eh782zsGcF8NWmhiKP2WIWalJz8ogTU2PAvhZ55FmHEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765502;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rjFAFSnQzww/PMhe+fBcGKSmoYrWoHrEwbrRVCL/1+U=;
	b=qrvLno3J3YnXqeCgvhUf6KGEKrRUfNs1kzU/u2ZVrURVXxHhPlo/QXmVGZLrmbirK/HK
	 od6Z4iail5UpD3kDwR2gJV2sk24DoGjOkgxD944rQclwOPggGIm1o+sAv9NG5NQJFzwYG
	 /Zo2ahGLcQaCbJdcTxX+YoXM1LCwE2QNkYrhPkfss18lBzX446bLjn+to8/UZzpxDz8D8
	 YnjAloJbDnrTv8k6QtZX1tjFhKde1DP3Eqedm+UEdQHog8AwwXdrG/o5LPCPgKURtyMuT
	 A2YYPMG+vdxpNvJ0VVyWUMizoktXd59wPj+PhOTdRvZdyq8sxodQeLNLq/12ZL7QM4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jXR76Lgo;
	arc=none smtp.remote-ip=91.218.175.154
Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982CF606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982CF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jXR76Lgo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=91/MbW0Ihq5jKcyTwvbVGk1O26qhFoJZjfsNrSheUvs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765499; v=1; x=1796370299;
 b=jXR76LgoW5U3C9Y1wdBOB9e9PkSN85+XjTdklfsWZqcrEbzMtCoYaQKiNJ6NNcyPhRG4Pbib
 JC4D0huHCQEexg1ng5tEGZNmC29Hg2xTyFKIw2SMFzvZCeXoBGnXAcky7qkn81YzxWUZmoWUXbB
 FrzbeD7sh9DtLdJLRG+rPLpQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4f765abdede48262;
	Fri, 27 Nov 2026 07:44:59 +0000
X-Mizu-Trace-ID: 4f765abdede48262
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
Subject: [PATCH v2 06/10] arm64: sysreg: Drop the leading zeros from the TRFCR_ELx.TS values
Date: Fri, 27 Nov 2026 07:44:22 +0000
Message-ID: <20261127074426.50739-7-fuad.tabba@linux.dev>
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

TS in TRFCR_EL1 and TRFCR_EL2 is a two-bit field, but its enum values
are written with four binary digits. They're the only enum values in the
sysreg file whose number of digits differs from their field's width, and
the values themselves fit.

Drop the two leading zeros from each, ahead of a check that requires
every enum value to have as many digits as its field has bits.

No functional change intended.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/sysreg | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

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

