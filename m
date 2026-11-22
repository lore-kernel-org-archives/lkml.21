Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373111;
	b=CwrRP6+LS5mZl/LTOQW/HZkUYfAVnhB+3U/y2GAKcaiFEAx8KvUtoBN2+0E+aNRIoTOk
	 +RO7yoVhTmU/rmmojWRujU9qW94oVQn52NWJl8rj+5CPcxsmnZGd3NWOsSx6BAZnjxKOM
	 6B2LYD14cKpu7LuxOyr14FTlMh/X3wT6ew0GvGm6TcW8usqpZ7x1gOd71O0P5Pkh2JQ94
	 peaqOMF74hC2lVDax4viGPaGTWofCxNjqSQXUoDtFOGzjyKFfoFrZYp8KW/mFeEJkWYHt
	 m5XqbLGioD5UY9+x98Bmz3UrcjChm1CnkHKtInfYDHqLnTqpQaTE95rPIekpE+xHG2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BkLWabiVP2N6o8/3oJvFuhS7Z3IRmMXaOcCIdqoyE3U=;
	b=REOxy2+s0lu6JVuEiBdfETzp5bL+GulIP+5LzV5o9mko5uFl5/kDRn8JauvLZZhUApb+
	 Omr/F4z/ubtnVnZKQljwborn6QZ2FVe81uZIitNQDAfwjceXoH5Sntb6Es12t3eGBCbkk
	 C0v7jr7vceNIEhSt2rTWW2X6jB4Mg1If148DRLhLD+vHDjk43k/n42BTfvwP/QciGp8GW
	 /wOcoT6SQJPUdvu/pbsVVTP6SwBd70qsTmeuCcUovhg7GzMZH6mNRsJ+QarRwds1I8F+r
	 7BzK5dAALB+pWfqZSWtyVSHnIrCV43XIcjh0pOdvygcrPFBQkjdBc0WT5nDBN+J9M5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ege2fUvm;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F194A606A6BD
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F194A606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ege2fUvm
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so2066548a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373110; x=1795977910; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkLWabiVP2N6o8/3oJvFuhS7Z3IRmMXaOcCIdqoyE3U=;
        b=Ege2fUvm4tDnVF6M1HbyceHv3gNSs/nU9+p5oLcaBILL7XO4qB8cU/bAFOK8G28RDc
         kkQ+/4NrRj+EZKEC1Ph5qrnAql46ZxpLOoA6aap8+ZKtSQQNHn+SA0OnA4wHnyhhGPdI
         B/aruta9Yorcx8Sq6M7oWp1kOJVjBG0XFqw1edHazos0lK5rhykrrTuwUG8tvXwbsl2Q
         Ljk4IJSl/jJBxp2cXvHbm8gYqYbmLXXtjoxbWfoSjl8EyITdEOcX+/RNe9CUUUKf1xcm
         bBdLqqJx/eVonZtlgctVDeWOy+GRRUU3nIWXWOILKeGy7ASB77uArEYBlyQKIxynVivz
         OJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373110; x=1795977910;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkLWabiVP2N6o8/3oJvFuhS7Z3IRmMXaOcCIdqoyE3U=;
        b=oGW+tOCx9s3RmSXMb58p8ql4MVEvamlOBL68yWdqPnzj1Q1kw4SVccGyXKG5DdwOHl
         GQYc5mUEPcQz7g+MObjZy9XS4UGm1YqJKBRUSgYfrP537IG9RE2gWnXrnMRENfGK49EE
         DPEoWXiRHy9oUWUUsoSSBy0Zuq2YNyfQFqfckyk9MvC2PiJfna6DMF68dox+KIaQmPy7
         q/gETiCgfyNFn3AH5+hQpJ23udDAt1/iubXptI2j9aWnPAffwi3yJPKhR+F+VImcblel
         ueNJmHIP8kAzAxmBkqNGu+VETR2Y6reCOp6eVoOHoHiucvfCjP9EmUctNlF0SiLXlySV
         UswQ==
X-Forwarded-Encrypted: i=1; AL+hErHa7KweDAbU4dwzpDJ/acbtueXj4vt7yq/rvK+XnIfAMLSmUzPiRAgDI+HvPm1bn8vWq4WAvC4tJ/0bVeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yW1J5fvtXgUZO2/18I7NyAHg/znRtYfYoMSefXLsQXofzIQk0
	2JBil/Z0+j8z49AQ2+uPSOVGgnsMQJ1R8/FTsYGxEY7tpqNdn1j8tlkH4sN0QctU6iRvOtXen32
	LX5Aciidy6wAtPlc7nFbEhA==
X-Received: from pjvh9.prod.google.com ([2002:a17:90a:db89:b0:3b4:1549:36a6])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4d10:b0:3b1:b66a:c05 with SMTP id 98e67ed59e1d1-3b41c8e0c5dmr7640072a91.14.1795373110066;
 Sun, 22 Nov 2026 10:45:10 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:45 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-12-jthoughton@google.com>
Subject: [PATCH v3 11/19] arm64/mm: Align vmemmap to maximal folio size
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() derives a tail page's
head by masking its address. This requires the head struct page of every
folio to be naturally aligned to the folio's vmemmap size, up to
MAX_FOLIO_VMEMMAP_ALIGN.

On arm64, the vmemmap is offset by memstart_addr, which is only aligned
to ARM64_MEMSTART_ALIGN: as little as 512M with 64K pages, where 16G
CONT_PMD hugetlb folios exist. VMEMMAP_START itself is sufficiently
aligned for all supported page sizes and VA sizes.

Raise ARM64_MEMSTART_ALIGN to cover MAX_FOLIO_VMEMMAP_ALIGN, and assert
at build time that VMEMMAP_START is suitably aligned. This is a no-op
until arm64 enables HVO, which selects CONFIG_VMEMMAP_OPTIMIZATION.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/mm/init.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 4e7682dfe366..7186d86afc41 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -35,6 +35,7 @@
 #include <linux/kmemleak.h>
 #include <linux/execmem.h>
 #include <linux/arm-rsi-cmds.h>
+#include <linux/vmemmap-optimization.h>
 
 
 #include <asm/boot.h>
@@ -92,11 +93,22 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
  * in the virtual address space.
  */
 #if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
-#define ARM64_MEMSTART_ALIGN	(1UL << SECTION_SIZE_BITS)
+#define ARM64_MEMSTART_BASE_ALIGN	(1UL << SECTION_SIZE_BITS)
 #else
-#define ARM64_MEMSTART_ALIGN	(1UL << ARM64_MEMSTART_SHIFT)
+#define ARM64_MEMSTART_BASE_ALIGN	(1UL << ARM64_MEMSTART_SHIFT)
 #endif
 
+/*
+ * With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() masks the address of a
+ * tail page to find its head, so the head struct page of every folio must be
+ * naturally aligned to the folio's vmemmap size. The vmemmap is offset by
+ * memstart_addr, so memstart_addr must be aligned to the largest folio size.
+ */
+#define ARM64_VMEMMAP_OPT_ALIGN						\
+	PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / sizeof(struct page))
+#define ARM64_MEMSTART_ALIGN						\
+	max_t(phys_addr_t, ARM64_MEMSTART_BASE_ALIGN, ARM64_VMEMMAP_OPT_ALIGN)
+
 static void __init arch_reserve_crashkernel(void)
 {
 	unsigned long long crash_base, crash_size, cma_size = 0;
@@ -218,6 +230,8 @@ void __init arm64_memblock_init(void)
 	/*
 	 * Select a suitable value for the base of physical memory.
 	 */
+	BUILD_BUG_ON(MAX_FOLIO_VMEMMAP_ALIGN &&
+		     !IS_ALIGNED(VMEMMAP_START, MAX_FOLIO_VMEMMAP_ALIGN));
 	memstart_addr = round_down(memblock_start_of_DRAM(),
 				   ARM64_MEMSTART_ALIGN);
 
-- 
2.56.1.809.ga0b61035b5-goog

