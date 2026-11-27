Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765478;
	b=di9FbUDYfAEByhn/AqxJ37f1qqZibL1tfXdhgVHxsslk11KwIZqdIZv2qzfimaEX1PLo
	 CF0+1w8/BRQzG9uMxy1hrGvjzGFQXw+MRWSqHd3vyXhyT2I0tXXqmg3G5rHcliyjUBIun
	 dtBxuzD0o6ccVFWeWqKCKOC/qdFOhdQIpC2hHwcCGgyngztUHIPdQSqLZfpYsx2ArkszU
	 hDL0AN/VaVEWltaP5RlQav/CAw4xyvtFKwM5wmCOaAlACbdjXDtQB2M9Glf0e65rswbV6
	 o27u30KJhjwFf5/qlegzlkcIHPOBEotac+jJnrwflNU2IVXNJyC3+CLtOI+INwyfAow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765478;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m5T0Bj1fzVWr9uZ7D5sividU+20WpmUdBXS8Jk9bous=;
	b=NIh6lA8YD80oLzulX7oJE3K+/d1Jg6f1xxFJcgHcial11IVQDsM+P1LLFhEU/B7amUd6
	 HOkyM3H7g0R0Oc3u8OSX7JAPH/xd5yjvrM3dliyp+gTQdJf2t2W6guukUPzoSgPbOHrc4
	 +q1Gw+Z4iqRlzWYkXROo5G0w3ldvU7KU84C1i8X8noth5GzFap8Nbg80HvNUXWOrj3M42
	 spi4xZBwtyvx7MelL0Rlv70bVQjHOV3zq28oaRuijCqqmNiT8eFVoTa8DRdhrl6WKbEqj
	 cFJyTHCRBnPV8q41Df4ffGPUYFyUQGNQBv1rJXwznamlgrFUFpun0K85trxo7Apl8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="YFebr/Ml";
	arc=none smtp.remote-ip=91.218.175.131
Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8322B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8322B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YFebr/Ml
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NJdlBiXTMBJZ5GXlmeg8rGw0h6eDEbREXq1CGYGEkSE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765475; v=1; x=1796370275;
 b=YFebr/MlDRxOzWCJnLlK9FqZH1TE4jS4XZAQfflFFqfK7K1YfcAV8Y4aloAdqD/B/o6izh97
 UiYnhgJpSvVpMChk5EU+vV2UN1QvXXKTTvU++JwLBj670Nuh8VdGpbuqxqBYWyYVUkMsTWlf4XT
 T96x9U9ZcDvu7+Ox3bpW4WwE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9626371f5da3b4fd;
	Fri, 27 Nov 2026 07:44:35 +0000
X-Mizu-Trace-ID: 9626371f5da3b4fd
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
Subject: [PATCH v2 02/10] arm64: sysreg: Remove the dead range check from parse_bitdef()
Date: Fri, 27 Nov 2026 07:44:18 +0000
Message-ID: <20261127074426.50739-3-fuad.tabba@linux.dev>
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

parse_bitdef() ends by testing "low > high", but the script doesn't
assign either variable, so the test compares two empty values and never
fires. The "msb < lsb" test just above it already rejects an inverted
range.

Remove the dead test.

No functional change intended.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 53844f5c5e525..b299342463631 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -100,8 +100,6 @@ function parse_bitdef(reg, field, bitdef, _bits)
 		fatal(reg "." field " invalid low bit in '" bitdef "'")
 	if (msb < lsb)
 		fatal(reg "." field " invalid bit-range '" bitdef "'")
-	if (low > high)
-		fatal(reg "." field " has invalid range " high "-" low)
 
 	next_bit = lsb - 1
 }
-- 
2.47.3

