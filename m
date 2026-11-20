Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177013;
	b=o352bF8GQivG5PWjXZQnaBaGxMqLWU6+DT7qVv/NCXFTQpocVFs0Pdy3pcF5CJWAHjez
	 Bcltz/myrqFeFd304mHZkn6Fo8AARu4d7nSwO9hm0LfObzP5NvYWV5+P0wan732ju7HNs
	 0PxuTB+l6LpTb4GUikRtTfF46uXGIJH8L8cflwYrShBK5kXcXgl3Xe8T+IB0LhcFrYw1u
	 5qfAQv2Qs/D6hYVWufINVQ2Lsi8pQAn3yCyVikfa7e/q4eVIjZMo2A1AGKxPmHL3SdE3+
	 3kXtpQ6OdDyyLF2waJkWn4DL8kCbEN3t5PYRWbmrzVqFHKwVlPI9Zv3JzezHaJf3nsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177013;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WFGUsPib7UYtVJ1BiXTL9SeVte53OesLIVWmVAJzm2E=;
	b=jp2wn/Vt03ZPrW/3uWv5HJdOaycOjYAdV0h2S5m60YPvQdLplGFzErms/0sv3ahv8pty
	 tyLT7ZvNrrTIMjsnRiC8DJevN8DBMLi1qY4iph21st4HV3sN+qFJa1r9B6MuwLHDMEvUb
	 P+BqEH41clc6t03vJyxJ1Y8pg6FYtGsrcWRvh/hvIVkDrcytEXsFfcQTKBJPZUrnMd8Ee
	 JagYCj6SD/a/RpDmwIuHthgEJC8I19numTctB4gCTbY+xEP/RKCPilaPjXmToQ1j8ukrX
	 YffptR3i0CaAUaG3x3BdyvMZoV0OidpCEwacH9bWumb5zf2qeTe26u1yVL+uyrBViIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fQEPpI7U;
	arc=none smtp.remote-ip=95.215.58.67
Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B733B606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B733B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fQEPpI7U
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rMvHJji9BqzVdUvxXHqbG2A1RgJoNeZr1+rKa6jfFow=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177010; v=1; x=1795781810;
 b=fQEPpI7UEavaI3A5R6eX3FsR9hpzgnSl38j0Cq5nwGsnq5iMqWeGoSQQIZM6bLsC5FkeyHqt
 S3u/REx3m3aPeNo1udcB8Txj0SCAEIMKGjKzFOQc4/aZ+QWFR43lceJOOi4m0dDZ9ooKAgGF6qb
 6gC1SW2Y7yczut054rqU6QoI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d94a9313021c98ac;
	Fri, 20 Nov 2026 12:16:50 +0000
X-Mizu-Trace-ID: d94a9313021c98ac
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: mm: Add an ISB after remapping the KPTI page-table slot
Date: Fri, 20 Nov 2026 12:16:37 +0000
Message-ID: <20261120121638.194154-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120121638.194154-1-fuad.tabba@linux.dev>
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
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

kpti_map_pgtbl remaps a temporary slot with break-before-make, and
kpti_mk_tbl_ng then reads the page tables through it. The make ends in
a DSB alone, so the reads can fault on a translation of the slot made
speculatively before the new entry was written. With the temporary page
tables in TTBR1 the kernel's vectors are unmapped, and the boot hangs.

Add an ISB after the DSB.

Fixes: 47546a1912fc4 ("arm64: mm: install KPTI nG mappings with MMU enabled")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/mm/proc.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 12aacc74f7647..7ca36d59bf77f 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -262,6 +262,7 @@ SYM_FUNC_ALIAS(__pi_idmap_cpu_replace_ttbr1, idmap_cpu_replace_ttbr1)
 	orr	pte, pte, pte_flags
 	str	pte, [temp_pte, #8 * (\level + 2)]
 	dsb	nshst
+	isb
 	.endm
 
 /*
-- 
2.47.3

