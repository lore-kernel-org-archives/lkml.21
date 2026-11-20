Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177016;
	b=j6toUamjNYgoCSQiyeZFARViC0PMnyIBv17J7+mxUCmmBDF9gHqCWd5Bkxj5cxg+pfSU
	 8MfK9glMGvtS41Q3vUcL++mbnprd35q/tIglaPeXN1+H5paurc0TJueAQHsLUfd8c0mZt
	 4lXMNKsESmJmFjzTJkBC8TbIRP+waFiatoRe+AsbG13Ybub9gv7MsvX76dQwt6igrIM72
	 eaVN+y92RmSovB1HXndyKPpiFD8+L620JPFgmuLLneZ2Tb4xzMOTQWqREGbjNacSWviHP
	 jRnZqXG/WIN6PDjLf4I+yckDMcLa4ubeiU3EYtZPr60qZEgd3Zu89oVw5NFZ0D1q31g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177016;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=spoiYnWR0WKKRs7Mhq5Q09v/YFoqQN68ueFyWXGucg0=;
	b=k80bCopZPmxKScm4TLD4ImSu12rK37NXqqFQLO8+2gpnyYAgdpnUlhfZg368IcfGsGtk
	 YGB31BEq+mkAXubiv0iH/ozvMsHupyIT/XbD7wQWkbB0SByD7fVKWw7UuDWS6sBljDlgO
	 5/xgErAdW9PZSU4EBI/j9q4hqaunoA/qjGH9owub5LUw67g8oUy010QRvzvWLNd5aM/wu
	 gBfYVbaDxq30T7QWEbHLc/YN6QaLKVvgkRWSQCyh32291u2WuMk995I+2yDqsusVBlYdn
	 aZshhxy/RYkvWdhg3FGAjlMUYPM/3/tg/Te+9x8t0hnHH28DVILcpMeQiggA5QK/1jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="BDi/9kXJ";
	arc=none smtp.remote-ip=95.215.58.77
Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45120606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45120606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BDi/9kXJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q/N+GDt8QiK0EADOOx91mUK2qbf8ppdyYXeJryKLBCU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177014; v=1; x=1795781814;
 b=BDi/9kXJf4YgRBbAHxD3RyugCbjKW0PCal1+Gv5IYm/c2FgLLV7VbqY+f1zHlScILQiVZSw0
 +03BU6gv7xmavzbyWPCdEZAWETU5MqSdYzR9jIvXi+rqN4ZAYCafaPdGc7Qhrshm5ue6emni7g4
 DpdU8ocr/xq9tuP+clLQGljk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 18135977f985d146;
	Fri, 20 Nov 2026 12:16:54 +0000
X-Mizu-Trace-ID: 18135977f985d146
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
Subject: [PATCH 3/3] arm64: mm: Don't defer the barriers when installing a fixmap entry
Date: Fri, 20 Nov 2026 12:16:38 +0000
Message-ID: <20261120121638.194154-4-fuad.tabba@linux.dev>
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

In lazy MMU mode, __set_pte(), which __set_fixmap() uses, only queues
its DSB and ISB, but a caller can dereference the slot as soon as
__set_fixmap() returns. On a CPU with BBML3, runtime changes to the
linear map are made in lazy MMU mode. With 4K pages and 39-bit VAs, for
example, such a change can update a top-level entry, which
set_swapper_pgd() writes through FIX_PGD. That store can fault, and the
kernel then warns about a spurious translation fault. When kgdb stops a
CPU in lazy MMU mode, its breakpoint writes through FIX_TEXT_POKE0 can
fault the same way, and fail.

Emit the barriers directly in __set_fixmap().

Fixes: 5fdd05efa1cd3 ("arm64/mm: Batch barriers when updating kernel mappings")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/mm/fixmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index f66a0016dd02d..951004ad700c3 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -127,7 +127,9 @@ void __set_fixmap(enum fixed_addresses idx,
 	ptep = fixmap_pte(addr);
 
 	if (pgprot_val(flags)) {
-		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
+		/* The slot must be usable on return, even in lazy MMU mode. */
+		__set_pte_nosync(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
+		emit_pte_barriers();
 	} else {
 		__pte_clear(&init_mm, addr, ptep);
 		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
-- 
2.47.3

