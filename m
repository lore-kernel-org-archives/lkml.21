Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420348;
	b=k/KJxnEKmy5Q5/+pi6dKQFH5BXutlTQKuV4Ujcd1HzhO2GsDYThQo+v5Z6JjobnglkHm
	 dXego4UOIlmtZqJzcJvZ8olENGm/FeV+0arEkGFgFfT3ibIUHVnZlOWBT5JCzRunNxtIN
	 dkwRT3QNxDibpDpAGE+JWY+SUp+UwyPAuDwY3SJzGqPBS4jyh8O8ENq5GnrRQU5CQvfpn
	 BxZE1dBcY4B+ODWwCiPy4nQ4yQ/oLWRa2riZkeE5CNvBqlraOPZy8EnsggdoDJIt1NhtH
	 KN9vIG6At09MPnFHlsqGZcmNd3mBQ3escuqruMGtn0/3X4FKB2MyWvNhbRPJyz3Ghgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420348;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ovUFY90e6TBeDEMLcD+XQ14+5xbpH/4Hs85p1IaHKwc=;
	b=vh0yZKrsdydzu8ox+p3ayxEbvcjIF+DQVhDBR+bYt4vWr4EbKZffW2Rn1hbD/uL+2fHG
	 XTC4ecVkzUTr5ua566dgYaECFoQdgrQLSRKyczLXZNIV996ckKxqyZ+HtHe2bN/vPJ6wg
	 r9YP7oOaoD/svRUJl5lOIvtx4Mg5Dvm7+ZX+Xln9Jli+RXioybWyYU23T3Me2+uWCEVIe
	 5N96XbSf2PutOETL2TtKnXNvpSmPFD0Ew7qZzbKO4OOJVYgkTrLywwPezTO709kX08Wv3
	 q6S9bgA/lRQrILA6w1fz8Fv/yYAfpA5p1GVQllH6Qm6uQiM+YgLtSQ8Y0ACgKtihcAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oLbU4aP6;
	arc=none smtp.remote-ip=91.218.175.187
Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B540606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B540606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oLbU4aP6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0Wb1aSE//fFVyU0JXIDWtBGcmmyyDDV9MfInC/0NCF0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420346; v=1; x=1796025146;
 b=oLbU4aP6+t1oBCPfyT4jNAr4PNz8033nOYN4BFFbBWhBdJ03CFJBYynFPsKCk7xk/cyKaHvn
 UF0YiUEMIs4AAkTR/xLqjA7P+mSuS6pYe3VjmIPTbOuCxYH+qhyip/pLDlK3u/Uwu7ZLfUBdAeh
 0Rsmzhn0Za3CRVw2tQsD9BOw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d63a0246b9e4f8c7;
	Mon, 23 Nov 2026 07:52:25 +0000
X-Mizu-Trace-ID: d63a0246b9e4f8c7
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
Subject: [PATCH 2/9] arm64: sysreg: Remove the dead range check from parse_bitdef()
Date: Mon, 23 Nov 2026 07:52:12 +0000
Message-ID: <20261123075219.369042-3-fuad.tabba@linux.dev>
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

parse_bitdef() ends by testing "low > high", but the script doesn't
assign either variable, so the test compares two empty values and never
fires. The "msb < lsb" test just above it already rejects an inverted
range.

Remove the dead test.

No functional change intended.

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

