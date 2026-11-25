Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632096;
	b=0uTbUvH4Oawygdhki6YwJpI1O6kbBo3vyA70q2WlkeeAuOnYxOoauLEghfUG4Qp2xI0z
	 tFkv9KpG38qz2EPlBMGBnqpdSr1ggSYy5x4HB4kyGhRhBw5DLEbCIcHN4F2uq8Y+Rws9J
	 +tlI6YOtYEDfSJo8FxfOPI3LrXSZS+lLHR5MIaLhc5az2XXjZY8tswVdLk5oB0PORvq/W
	 FDp0fTt2RH4rytJLSFqZJhbwr0/szqjTI1cfG+j1lSYIcQFYZgMXoGmVKe+BXB5NolKej
	 tIpEUD4ACRPhhSl8R/cAS1eUNK4jv0QpkqfBJJdXYabrf4mIiJA8HWGUsMFC8IQKQ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632096;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LrB37YjSIPn8trdCr4bJ6E7VraYEZnstQn8iE1gmVfc=;
	b=VmNOV121RiAuNXraaRTj7UQfR6yt/umUjyK3GCWNwcYZZ3U1L+S7Udh1qBJpEUe2n2ZJ
	 bbHmW6h29kshW0/7fB0hTt9A5Aih4ypZuD1Q0T+mVkgpxoKBlln7qnEIBy9iKuhQuyaqU
	 Le4KwB5KsNMBYrfl+GBS+7OM271RDld9Tj0Z6MTaWqjF+nMI03dpkMgknBvSfKpKpAcrH
	 GPLniahU2Ojm9djyEsW9gADfVDtRvWyX6MC4lnleDRBkm+NosYyP/r5wLFaFKAeBBaXMv
	 2uT70aQDqkHIFi0EgdI02aow6rWbfGS2+TrDTXPffSI3kumAmqOQkmZjcYa+c3mGSeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eh9ipDlL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE47606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE47606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eh9ipDlL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 412571596;
	Wed, 25 Nov 2026 10:41:32 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F11C03F632;
	Wed, 25 Nov 2026 10:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795632095; bh=52zSmMtLrL/2Cilb3mI8GAy27SW4K/XC4afsFkJikIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eh9ipDlLCcMFGhBh5QibFlDUTE8oO+y7Tb3DQoLizW+1eTCXD02C0/+SWxoXVnOXx
	 fF7bEQMJIq1/EGwhcPfCC4r/RWN8gS/Dnl5e/jsNQGIUS3pJYbcDL5dENsw3cOM1fC
	 2yB2kcDBCKzLfNRIZnI75KHSFIzBZzMWDP0eMm9w=
Date: Wed, 25 Nov 2026 18:41:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
Message-ID: <awcr1wwqmkr7ilXp@arm.com>
References: <20261027100231.31184-1-jiangshanlai@gmail.com>
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
In-Reply-To: <20261027100231.31184-1-jiangshanlai@gmail.com>

On Tue, Oct 27, 2026 at 06:02:27PM +0800, Lai Jiangshan wrote:
> From: Lai Jiangshan <jiangshan.ljs@antgroup.com>
> 
> Switching to init_mm should prevent further accesses through the
> previous address space's translations.
> 
> Commit e53f21bce4d3 ("arm64: Use the reserved TTBR0 if context switching
> to the init_mm") avoided installing init_mm.pgd as a user page table.
> At the time, the ASID was held in TTBR0, so installing the reserved
> TTBR0 also switched to ASID 0.
> 
> Since commit 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1"),
> installing the reserved TTBR0 no longer changes the active ASID.
> Consequently, switching to init_mm leaves the CPU using the previous
> address space's ASID. An empty page table does not prevent TLB hits
> for that ASID.
> 
> This can retain access beyond the lifetime of the backing pages.
> During fullmm teardown, user data pages can be freed before their
> cached translations are invalidated. If those pages are subsequently
> reused for kernel data, an erroneous uaccess that hits a surviving
> translation can read or corrupt that data instead of faulting.
> 
> Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
> Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>

Sorry for the delay. I looked at this again and it is indeed a bug but I
doubt you can trigger it. It relies on some erroneous uaccess to the old
pages. It also doesn't bring new TLB entries associated with the wrong
ASID. The CPU hotplug window is pretty small. The efi_virtmap_unload()
can also end up with the init_mm if no user spare ran.

Worth fixing though.

> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> index 803b68758152..7e56099c5fbb 100644
> --- a/arch/arm64/include/asm/mmu_context.h
> +++ b/arch/arm64/include/asm/mmu_context.h
> @@ -235,15 +235,6 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
>  
>  static inline void __switch_mm(struct mm_struct *next)
>  {
> -	/*
> -	 * init_mm.pgd does not contain any user mappings and it is always
> -	 * active for kernel addresses in TTBR1. Just set the reserved TTBR0.
> -	 */
> -	if (next == &init_mm) {
> -		cpu_set_reserved_ttbr0();
> -		return;
> -	}
> -
>  	check_and_switch_context(next);
>  }
>  
> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index 0f4a28b87469..a96ebe904dd7 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -218,6 +218,16 @@ void check_and_switch_context(struct mm_struct *mm)
>  	unsigned int cpu;
>  	u64 asid, old_active_asid;
>  
> +	/*
> +	 * init_mm.pgd contains kernel mappings, so use the reserved page
> +	 * tables for TTBR0 and switch TTBR1 to ASID 0. Leave active_asids
> +	 * unchanged to preserve the ASID rollover bookkeeping.
> +	 */
> +	if (mm == &init_mm) {
> +		cpu_do_switch_mm(__pa_symbol(reserved_pg_dir), mm);
> +		return;
> +	}

I don't think we need the full cpu_do_switch_mm() machinery here. Can we
not simply set the reserved ASID in __switch_mm()? Something like:

	if (next == &init_mm) {
		unsigned long ttbr1 = read_sysreg(ttbr1_el1);

		cpu_set_reserved_ttbr0_nosync();
		write_sysreg(ttbr1 & ~TTBRx_EL1_ASID_MASK, ttbr1_el1);
		isb();
		return;
	}

Or just add the above to a new cpu_set_reserved_ttbr0_asid() function
and call it. I think that's the only case where we need to set the
reserved ASID.

Thanks.

-- 
Catalin
