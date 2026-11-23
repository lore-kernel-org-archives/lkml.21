Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404400;
	b=W1D/Hc2/wN+U3tYkWcjGhmOO4zz8hBbelVI7UrigryF+jbS4WuSDz/b6Lv5Zk9Yavgfy
	 mLuax3TDMhqxFPIglbZa7+xWXadf36gzmtct2tA+/B0h8BtHSCM53AFvRnn+iBvO1PAXj
	 2Ij5OUDrgIuXE3ufHV9bh5mI50zOe/tsZPaCkMcf776MnytKZrGZJekzebu4wFkFhBlNi
	 gODJ0KkzY5z5C3x4kVN0El/2XUKUaqj1dtFuiNIudcwi5ZlncFPjB/SHdvNzb2G1LjWOw
	 H2XZ/5PGXykyZ/kFUKC6PtlsCYQ5RbzZeTf/j4ln4exYTgZCKCOP3kWMs93nUqxJ26A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404400;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=1+cegTBR/Mxg4hlkws6xLAzLLN9NMMKBynuAC4t3778=;
	b=4PCJOKZ5I+XGXmltvSrBQm9WJ6CopMmAcvl8RUuY4JAN4Rx4nvrBHQb0JBRiwSwiwj3+
	 G4jzU9Soa4z21QI9oUGsHHF04bTp+/NeRTQuGvZvu/HZCFiH8PWVTqy1TCq61lJ2OyWvA
	 iE2AvguWUaCZvgpViZz4N9fJ6w1w+HOsG1ScfpJ0y0x8hYUV38qw+SCu05bg/TGgqqhSp
	 x7FpjH1rS+qmDGlB3Dgq5D1e5l/l+aswhmzCCTjQ8XTFF4f8x4crcgJhefFCC7WiLhZ/r
	 m0t/11nFKk0BqprUgiKm61Q54pEuv6i0fmZ0Y2kUoVq/cZhoukldglnmQ2PhPfasFgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SGMR0g2y;
	arc=none smtp.remote-ip=95.215.58.56
Received: from mta1.migadu.com (out-56.mta1.migadu.com [95.215.58.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE088606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE088606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SGMR0g2y
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TkbWYCa4MJQ1BBcXLO39QWi9ZKwMLeD/PRh+069eUio=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795404397; v=1; x=1796009197;
 b=SGMR0g2ysyRhEClMqRQFseFUIrDyr0M4S+pk0yHCer23GYL8Lvu578d2pPzUlcnTeK9mJr+i
 Xd1BziDVTP2R919tmNm966/at3n5YCHGBXAFsr2DJ5nFpLANzVzJxR+x/ypn2Y3eY9Jb1K2WD+J
 glEVjcZZEcd3nsoOdHacvYag=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2ca7b3a68f8feb45;
	Mon, 23 Nov 2026 03:26:37 +0000
X-Mizu-Trace-ID: 2ca7b3a68f8feb45
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 12/19] arm64: Support hugetlb vmemmap optimization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-13-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:26:12 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <64639588-CB39-4980-A9E3-8423AB0DF268@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-13-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>=20
> Support HVO if HW AF and BBML3 are supported. These are the required
> features for the vmemmap to be modified in place.
>=20
> On arm64 systems that do not have the required hardware features to
> support HVO, the HVO sysctl will not appear, and any attempts to =
enable
> HVO (either via the command line or via
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dy) will have no =
effect.
>=20
> Because HVO support is only known after the vmemmap has been =
populated,
> disable the section-based vmemmap optimization in vmemmap_populate(), =
as
> LoongArch and powerpc do. Boot-time HugeTLB folios are then optimized
> when they are gathered.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> arch/arm64/Kconfig               | 1 +
> arch/arm64/include/asm/pgtable.h | 6 ++++++
> arch/arm64/mm/mmu.c              | 9 +++++++++
> mm/hugetlb_vmemmap.c             | 4 ++++
> 4 files changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 4cce60c2de66..b13618f0ace5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -95,6 +95,7 @@ config ARM64
> 	select ARCH_WANT_FRAME_POINTERS
> 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || =
(ARM64_16K_PAGES && !ARM64_VA_BITS_36)
> 	select ARCH_WANT_LD_ORPHAN_WARN
> +	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
> 	select ARCH_WANTS_EXECMEM_LATE
> 	select ARCH_WANTS_NO_INSTR
> 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> diff --git a/arch/arm64/include/asm/pgtable.h =
b/arch/arm64/include/asm/pgtable.h
> index 7421c0a048ff..5dadaac54bef 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1931,6 +1931,12 @@ static inline void =
clear_young_dirty_ptes(struct vm_area_struct *vma,
>=20
> #endif /* CONFIG_ARM64_CONTPTE */
>=20
> +#define arch_support_vmemmap_remap arch_support_vmemmap_remap
> +static inline bool arch_support_vmemmap_remap(void)
> +{
> +	return system_supports_bbm_through_af();
> +}
> +
> static inline int try_update_vmemmap_pte(unsigned long addr, pte_t =
*ptep,
> 					 const pte_t pte)
> {
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a61464cf7367..bc3eea16004c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -30,6 +30,7 @@
> #include <linux/mm_inline.h>
> #include <linux/pagewalk.h>
> #include <linux/stop_machine.h>
> +#include <linux/vmemmap-optimization.h>
>=20
> #include <asm/barrier.h>
> #include <asm/cputype.h>
> @@ -1843,6 +1844,14 @@ int __meminit vmemmap_populate(unsigned long =
start, unsigned long end, int node,
> 	/* [start, end] should be within one section */
> 	WARN_ON_ONCE(end - start > PAGES_PER_SECTION * sizeof(struct =
page));
>=20
> +	/*
> +	 * Whether HVO is supported is only known once the system-wide =
CPU
> +	 * features have been finalized, which is after the vmemmap has =
been
> +	 * populated, so the section-based vmemmap optimization =
(pre-HVO) is

It's better to avoid the term of "pre-HVO", It's an obsolete term. All =
infrastructure
of it are removed now.

> +	 * not supported. Boot-time HugeTLB folios are optimized later =
instead.
> +	 */
> +	section_vmemmap_optimization_disable(start, end);
> +
> 	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
> 	    (end - start < PAGES_PER_SECTION * sizeof(struct page)))
> 		return vmemmap_populate_basepages(start, end, node, =
altmap);
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index fb6da64bd80d..a01377c37c96 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -79,6 +79,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct =
page *head, unsigned long start,
>=20
> 		/* Make pte visible before pmd. See comment in =
pmd_install(). */
> 		smp_wmb();
> +		/*
> +		 * On arm64, this requires BBML3. Its support has =
already been
> +		 * checked.
> +		 */

Please don't add an architecture specific comment here. That is =
something architecture
itself needs to consider.

Thanks,
Muchun

> 		pmd_populate_kernel(&init_mm, pmd, pgtable);
> 		/*
> 		 * Modern MMUs allow overlapping TLB entries with =
different mapping
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20

