Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420377;
	b=S7QP/MTif/Y7zVJEwPI0I5KXmWpOmVhq5UE56jUVdZSNRQ0uOiOChLLw8sIP79TmcPL7
	 ppmqcDTbeGaYfeBv5f/ASpVSh1Gu4+f/2sQkKIo+L/roMwYt247dNMiaTEAJY/WKI+Jk0
	 hKpzPexfEto0iOIQJJ3InizgyKqqVO4bNWFn+wmiDUmE8a83chLQtUVvS1bM0T03n1SPe
	 pV3xk2nStyk88lCWMFzS3lFaNs8ow2nIolL3Rt+G39m4PrYQBmu6+IoGwqA98XCEPCEWy
	 cestcNvdMG3XLbAwqFPw2E96YvDz9KYo+Q4fcSHcrSnhDYNOefFOsaRaM5zyxsAtA0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420377;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xbuI8Rj5UWy8F2IEq/Z3SjrIy8y7V/ucb42T1EaghAI=;
	b=2zYqY0j0PqtoLClD/8IkB68T/QAOGLb/SgoJqZW4IdHfuaXCYB1jhYIYHrPiwiUBrOKk
	 YOZyiGLZlKMYh+jp10I78i+xefag3izodvOemisU3DSx6GgXYqQBUqsSERN582oEaE0v8
	 wuy7nLrgkQIdWrawHGbE7c1ANBknQ4dISdIhGx0hq77Co0maDcKshQynUPpOBbL1icpRQ
	 I+5AS0y3QxZ3LpTh+DLmSDHRbDtS10P6guG3uUcj4h5YZTJSy6QdXBa1dqDdw0nzGHEcT
	 M7H006ujDTv/B5y5s8i/nhn1pcBj6NRsubWap+CCpXhY9D+LoYRGcuCuIwG3rdPM/Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="NqsE/slf";
	arc=none smtp.remote-ip=91.218.175.212
Received: from mta0.migadu.com (out-212.mta0.migadu.com [91.218.175.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B1060A2611
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B1060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NqsE/slf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bXcoAIIOWQFxtLfzMXJj6hOUSFVtDBpNdGJsvYPQPNc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420375; v=1; x=1796025175;
 b=NqsE/slfyqw/SS38y/Uj4L565p2TN2+Azjb6vZ6jjbnKPa5mPpFGF6fz9JbDTGKDutjWIyAJ
 4gMlrR3qkAjEG4R61BwF41t21qo8UbNuqN0d+JhAzwus6S1PWuLxvuneg2ZNSQapFBqmqpv9yeP
 zES/snbrA0HQH4fOH3amxAWs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 62371c90a19412f0;
	Mon, 23 Nov 2026 07:52:55 +0000
X-Mizu-Trace-ID: 62371c90a19412f0
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
Subject: [PATCH 9/9] arm64: sysreg: Reject a bit position written with a leading zero
Date: Mon, 23 Nov 2026 07:52:19 +0000
Message-ID: <20261123075219.369042-10-fuad.tabba@linux.dev>
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

parse_bitdef() reads a field's msb and lsb as decimal and checks the
layout with them, but the generator copies the digits into GENMASK()
unchanged, and C reads a leading zero as octal. "Field 63:010 A" is
accepted as bits 63 to 10, with the next field starting at bit 9, while
its mask is GENMASK(63, 010), bits 63 to 8, which overlaps that field.

Require both ends of a bit range to be decimal numbers without a leading
zero.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 057dc98082b5e..01b463e271cef 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -102,7 +102,8 @@ function parse_bitdef(reg, field, bitdef, _bits)
 		fatal("invalid bit-range definition '" bitdef "'")
 	}
 
-
+	if (msb !~ /^(0|[1-9][0-9]*)$/ || lsb !~ /^(0|[1-9][0-9]*)$/)
+		fatal(reg "." field " invalid bit-range '" bitdef "'")
 	if (msb != next_bit)
 		fatal(reg "." field " starts at " msb " not " next_bit)
 	if (63 < msb || msb < 0)
-- 
2.47.3

