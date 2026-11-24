Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534130;
	b=xLKWYAQxH+cZfsGTvthwtsqq+JqiDjJ10mqfkTpLsPf6FWvhzUCV5TBckWqxNk4v4iwV
	 miwVU3MAwz9qFPDSnODLfw2h/HQEIQuRpu+4AxNbROaQTad+/wWdK5QvBYf95bOaefqYp
	 UvjvXG3YuOHSXA6mZNa2TJtkU4urIP97N3i1Lziz70AuoaDKUOnVOj20cS4bRlW1u4HJG
	 1Cmg/lJOfKqVS6xVkA8uX1czv8KIDBPGtE+MEB9T1rd7FfbAkY/Go7yHZyCixauWuWSac
	 7hdE+KegK9b25U/ZvjsEH6fnmACxkI6VUP4RlJepp6wOp4SnLJDECTfqO2CXuYiIMNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534130;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zvW5z7zfahFNFXi+Ssaf7DpYERKkjJt0YrEyUHja2pk=;
	b=d8MkRjWfpKFbOXtMseTADPDxVknigg8JKADHsx7QThlohYiqpIoa5MWOakihuAja/cqV
	 Rp+gycSZem64M/lUASaXMawk9cwAp5DsTVQjr12+8WgHP5jG5wlYKscFjZ7WuTrVn3+qC
	 xYppH3Yigqum0IsOreDQtFzX6AeQReMMCjBwwDE6hmNikTlZlEOfZtWehvI4dN2ncV5e7
	 FJB1RXUyjZYf2CC6fyDuddTkRIc6mEC2Fc0fb+gMMscJU0LiqPkH0ZFgbUqJIhN4KLief
	 r5fKdMJ2w8RFu9rPYDAFZDDRCJc+gL5vEIblQZiIQ5ZmfC2yEYfOhnLcZMmET0/mH1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rl5TBK3Q;
	arc=none smtp.remote-ip=91.218.175.79
Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A54606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A54606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rl5TBK3Q
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZlYt6RHKpSvMzdObJH/W7hyfD0aXwfhI08mgyRDFJwI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795534126; v=1; x=1796138926;
 b=rl5TBK3QwdTeY1TK3uUsnIKSS4ENLNayfuJ6UfDk+O6b5px3VYGscxsXAKxN/aUgwpcCHM6O
 /hT7SJ+513ynvCXDaDybUTIm49KfFnPT4bIq1+zqi7PEOoDoEgVPUvSFAfzobUW4Vfwurxg4Afl
 0ygx21yKCVuBT7ig1OntiEGk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 1820b8d53bebf8b1;
	Tue, 24 Nov 2026 15:28:46 +0000
X-Mizu-Trace-ID: 1820b8d53bebf8b1
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Date: Tue, 24 Nov 2026 07:28:42 -0800
Message-ID: <20261124152842.2634495-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
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

When a stage-2 fault may need new page tables, KVM first tops up the
vCPU's page cache: if it holds fewer pages than the fault might need, it
is refilled to KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, which arm64 sets to
40. Unused pages stay in the cache until the vCPU is destroyed.

With 64 KiB pages, that is 2.5 MiB per vCPU, and most of it is never
used. Stage-2 has at most three levels and the root is preallocated, so
a fault needs at most two new table pages (kvm_mmu_cache_min_pages()).
As every last-level table covers 512 MiB, an 8 GiB guest needs just 17
table pages to map all of its memory, while its four vCPU caches get
filled with 160.

On a production host with 64 KiB pages running 101 VMs with four vCPUs
each, the caches were still 86% full. The memory used:

                        before      after
  per-vCPU capacity     2.5 MB     512 KB
  all 404 vCPUs         869 MB     <= 202 MB

Let's lower the capacity to 8 with 64 KiB pages, In the production
usecase above, it frees at least 667 MB. That still covers the two-page
minimum and leaves room for several table allocations per refill. 4 KB
and 16 KB pages keep 40.

The temporary cache in kvm_phys_addr_ioremap() uses the same capacity,
but it is topped up before every page it maps, so 8 is sufficient there
as well. The pKVM hypervisor memcache and the eager split cache don't
use this capacity.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/arm64/include/asm/kvm_types.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
index 9a126b9e2d7c99..28568da9ea4a7b 100644
--- a/arch/arm64/include/asm/kvm_types.h
+++ b/arch/arm64/include/asm/kvm_types.h
@@ -2,7 +2,12 @@
 #ifndef _ASM_ARM64_KVM_TYPES_H
 #define _ASM_ARM64_KVM_TYPES_H
 
+/* Must cover kvm_mmu_cache_min_pages(), at most 2 with 64 KiB pages. */
+#ifdef CONFIG_ARM64_64K_PAGES
+#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 8
+#else
 #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
+#endif
 
 #endif /* _ASM_ARM64_KVM_TYPES_H */
 
-- 
2.53.1-Meta

