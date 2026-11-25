Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626905;
	b=NiddElK9fqjzG32ATILo2WDMnj/C5SUhz1q+kVW+DKvPtHkL1UygGsbT5m/YPNIsjIw2
	 p0NlKsZcSnX0ZxgYbDJkCbMYoaU6sBThO63AOqVQhXki1ca1enn1KafzOftenr7axFEIn
	 B3+3PTXpHFTsDNt0Z4ho+LXOvfFGL6K20sKL9tEFtwRZE3B/VuXZku9O8QaGjbRfwkw6s
	 zUwww44Pp6y2UVR+y2gFLtBCkPDuE3UnE21VAylskGWlvJ4c9eOnMEK1ZRJPVw2dp65V+
	 90eQ6ikrldnMiPOVKX4jJ6PhDkrSqgDBjtTIyvc/FSvXQCDS4+putr9OBn9aD8LjEvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626905;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=66XtB+U2+4to9qy3PAxUKRgvt3J9EZgv7Tv26f9LUCA=;
	b=T621ALLI9ZsRZQx4duUeWNA516IrpzQzJLBXa98S8wpEudDQi5ag/KWQ68lCOvP5DHUG
	 RIIek7NcZdK1f95LZ5jzOG4B7z8ktrh4y+oTuqTS9T5/Ev/vQKYcdUtvuTegOLQ8ZMa2P
	 NtV/E3/3bnhNF+PpG3N8VTaUuQRLY9QP4Hf9bqdrqyEiSB3pDKO7w8n+G8p93CYh8Uvvi
	 eSg2VwfE7jh4QyAuS4t23Knjtw5pvfr3saeJ1CsDGayaXSHGXLewGNXWHIJbnC7g6QVAG
	 b2/jUp0iganQXi323hfHj7i2gs2bSb9XwrRM7Tx56SNKVf8d1Bxyx91obuJfw6rAKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P4Lj0TYQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0F7606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E0F7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P4Lj0TYQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C5EA2F;
	Wed, 25 Nov 2026 09:15:00 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAD523F86F;
	Wed, 25 Nov 2026 09:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795626903; bh=Fa3kAtHgk384B8+kxGzOb41KHv8hVt7t5M1nRsdUqZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4Lj0TYQ1E2+KwPgoQLRQawek111L2jgfj75ceRrVPopmPV5WEC/jimuonWU6uuxu
	 EPZTdtrW87BBPVddh55ElWuKDXIJrsOdHpPbvGvJoGflbaT5vYzk+3qfshOpGYyIrb
	 FujYylv/+RGIMBvs0/t1VJiWOYQxE1j5mLCUP92U=
From: Leonardo Bras <leo.bras@arm.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
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
	dgreid@meta.com,
	"ARM ljs@kernel.org" <LorenzoStoakes@leobrasdk>
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Date: Wed, 25 Nov 2026 17:14:46 +0000
Message-ID: <awcXhk885lqDRAHy@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124152842.2634495-1-usama.arif@linux.dev>
References: <20261124152842.2634495-1-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026 at 07:28:42AM -0800, Usama Arif wrote:
> When a stage-2 fault may need new page tables, KVM first tops up the
> vCPU's page cache: if it holds fewer pages than the fault might need, it
> is refilled to KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, which arm64 sets to
> 40. Unused pages stay in the cache until the vCPU is destroyed.
> 
> With 64 KiB pages, that is 2.5 MiB per vCPU, and most of it is never
> used. Stage-2 has at most three levels and the root is preallocated, so
> a fault needs at most two new table pages (kvm_mmu_cache_min_pages()).
> As every last-level table covers 512 MiB, an 8 GiB guest needs just 17
> table pages to map all of its memory, while its four vCPU caches get
> filled with 160.
> 
> On a production host with 64 KiB pages running 101 VMs with four vCPUs
> each, the caches were still 86% full. The memory used:
> 
>                         before      after
>   per-vCPU capacity     2.5 MB     512 KB
>   all 404 vCPUs         869 MB     <= 202 MB
> 
> Let's lower the capacity to 8 with 64 KiB pages, In the production
> usecase above, it frees at least 667 MB. That still covers the two-page
> minimum and leaves room for several table allocations per refill. 4 KB
> and 16 KB pages keep 40.
> 
> The temporary cache in kvm_phys_addr_ioremap() uses the same capacity,
> but it is topped up before every page it maps, so 8 is sufficient there
> as well. The pKVM hypervisor memcache and the eager split cache don't
> use this capacity.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_types.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
> index 9a126b9e2d7c99..28568da9ea4a7b 100644
> --- a/arch/arm64/include/asm/kvm_types.h
> +++ b/arch/arm64/include/asm/kvm_types.h
> @@ -2,7 +2,12 @@
>  #ifndef _ASM_ARM64_KVM_TYPES_H
>  #define _ASM_ARM64_KVM_TYPES_H
>  
> +/* Must cover kvm_mmu_cache_min_pages(), at most 2 with 64 KiB pages. */
> +#ifdef CONFIG_ARM64_64K_PAGES
> +#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 8
> +#else
>  #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
> +#endif
>  
>  #endif /* _ASM_ARM64_KVM_TYPES_H */
>  
> -- 
> 2.53.1-Meta
> 

Hi Usama,

Have you tried to reproduce this issue in v7.4-rc1 or newer?

IIUC Lorenzo Stoakes introduced a change that would cause the memcache to 
skip topup if the cache contains a minimum of ~4 pages, so it can possibly 
improve that issue.

Although I can see that when it's below that minimum it fills the whole 
capacity (40) of the cache.

In any case, Lorenzo, could you advise?

CC:Lorenzo Stoakes (ARM) (ljs@kernel.org) 

Thanks,
Leo
