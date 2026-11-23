Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402071;
	b=TYBZiyfk6bLIuGpqzn/IdWNuP0XXpYKrL9IEYI0OumWvw+MfdEJSS28JBV99kh6ohQs2
	 KgO5IFZZVsOvU2gd7RWSlYTPfKQ/pGTGhcJvWCHWfaVii207RCmTRmotQiQIs5XTVRxPp
	 eTnF0ZRH8b1h5wfSGqJVXMB5gg8swVilQWVMZbn3hmzykaMrNbrkVNPC59MAHaRZXYTrw
	 QMYetQWGcAvY+cCPCEkzu+juWqgckguzzVaNa8x9Y8Kf6E1nzW0TIokAchkFUU1WpL1k/
	 g7UclULaUW/BSUNs7hzL8yGnWEAmMazq+6n+rx8vWSFGY5w4+V7ISSo0kAbkN2tLgxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=keQB3M+G/U6WjdBKTwroAHxhrPCNUChEnSJ8dtIR1rc=;
	b=EXw3TV0OaGbWmGjtpYk+31aQtlc1ZwuKLOEZn+0/DWD7mi1mucnZvYJz/hx55oFQ7T04
	 qFeJO+4qixRHSJ+f3BcHPIkmNx6YmlQZvVkFU2xZQ3acjBnMMdNeXltfIxzb1Dw5O+a2r
	 RxNINAdSM9csr+vZ9aosnO5GTk4Zh4GSuKMs0GN++zGAZ/S5zFPy43rb9wcnieLxYPsEI
	 ePXXh2gTGLUDqJmBdR/uMgknpnjQmFVtBG2W8vN8JNhqbFCQetqxHFwPeCcU4/fVw4yTl
	 N5MtkxElfP5HYCFKFkg7FSptKMDeH6Y8c5U+iwvwtU6/BHR1iQCEOQ5eI5Dt4gsEcfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IYs+Dzbd;
	arc=none smtp.remote-ip=91.218.175.151
Received: from mta0.migadu.com (out-151.mta0.migadu.com [91.218.175.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C122E606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C122E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IYs+Dzbd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nnvohv3LVojod6b27B4KpgPlDmXt/sOZCq2yD9lZsww=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795402068; v=1; x=1796006868;
 b=IYs+DzbdoUB/2VyxbAb7oDGq6nRMXsX5EHi7ficM+zbFLgpcgHaa2vKl93lFEKb3C2ytlrva
 62gP4n3WAjLUk3lMxfvhOGd+c47xdMc79gvDZd1IXDp7+L7yLwAdTW+VzfWyptNI+NVBm/Hr6G5
 ha5RUcyaQ4Ti2fwi1L80FasI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6a387cbfdc5f01e9;
	Mon, 23 Nov 2026 02:47:48 +0000
X-Mizu-Trace-ID: 6a387cbfdc5f01e9
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
Subject: Re: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-5-jthoughton@google.com>
Date: Mon, 23 Nov 2026 10:47:33 +0800
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
Message-Id: <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-5-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>=20
> set_pte_at() cannot be used to replace in-use vmemmap PTEs on arm64, =
so
> replace it with a more specific routine, try_update_vmemmap_pte().
>=20
> try_update_vmemmap_pte() is used for modifying page table entries such
> that there is a guarantee that no fault will be taken.
>=20
> For the generic implementation, please note one difference: set_pte()
> does not invoke page_table_check_ptes_set(), but set_pte_at(), the =
call
> we are about to replace, does. However, this is a functional no-op
> because page_table_check_ptes_set() does nothing for init_mm PTEs, =
which
> vmemmap PTEs are.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> arch/loongarch/include/asm/pgtable.h |  2 ++
> arch/riscv/include/asm/pgtable.h     |  2 ++
> arch/x86/include/asm/pgtable.h       |  2 ++
> include/linux/pgtable.h              | 22 +++++++++++++++++++
> mm/hugetlb_vmemmap.c                 | 32 +++++++++++++++++++++++-----
> 5 files changed, 55 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/loongarch/include/asm/pgtable.h =
b/arch/loongarch/include/asm/pgtable.h
> index f87603135131..123eda3f6035 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -633,6 +633,8 @@ static inline long pmd_protnone(pmd_t pmd)
> #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) !=3D 0)
> #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) !=3D 0)
>=20
> +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> +
> /*
>  * We provide our own get_unmapped area to cope with the virtual =
aliasing
>  * constraints placed on us by the cache architecture.
> diff --git a/arch/riscv/include/asm/pgtable.h =
b/arch/riscv/include/asm/pgtable.h
> index 2ebd5fa5adc5..c8d05bc12cc8 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -1172,6 +1172,8 @@ static inline pud_t pud_modify(pud_t pud, =
pgprot_t newprot)
>=20
> #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>=20
> +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> +
> /*
>  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs =
that
>  * are !pte_none() && !pte_present().
> diff --git a/arch/x86/include/asm/pgtable.h =
b/arch/x86/include/asm/pgtable.h
> index 000fc6c1ca37..271cdc61de3a 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1372,6 +1372,8 @@ static inline pmd_t pmdp_establish(struct =
vm_area_struct *vma,
> }
> #endif
>=20
> +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> +
> #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> static inline pud_t pudp_establish(struct vm_area_struct *vma,
> 		unsigned long address, pud_t *pudp, pud_t pud)
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index bc1353f03b08..ab33df268955 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct *mm, =
unsigned long addr,
> #endif
> #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, =
1)
>=20
> +#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE

Why not ARCH_WANTS_VMEMMAP_UPDATE_PTE? Then x86, loogarch and RISC-V do =
not need define
this macro in their ptable.h.

> +/*
> + * try_update_vmemmap_pte - Remap PTEs used by the vmemmap.
> + * @addr: Base address of the remapped PTE.
> + * @ptep: Page table pointer to be overwritten.
> + * @pte: Page table entry to write.
> + *
> + * This function is only to be used to update PTEs that map the =
vmemmap. The
> + * only valid transitions supported by this function are: leaf-level
> + * (PAGE_SIZE), valid-to-valid. The pfn and prot bits may be changed.
> + *
> + * Implementations of this function must ensure that, while the =
update is taking
> + * place, CPUs will not fault on the remapped virtual address.
> + */
> +static inline int try_update_vmemmap_pte(unsigned long addr, pte_t =
*ptep,
> +					 pte_t pte)

Please rename it to vmemmap_update_pte, all HVO-related helpers will be =
prefixed
with vmemmap.

Again, I still recommend having this function return void. That will =
make the
overall code simpler. If we actually run into related issues in the =
future, we
can add support for it then. I don't want to introduce unnecessary code
maintenance now.

Thanks,
Muchun

> +{
> +	set_pte(ptep, pte);
> +	return 0;
> +}
> +#endif
> +
> #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> extern int ptep_set_access_flags(struct vm_area_struct *vma,
> 				 unsigned long address, pte_t *ptep,
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 2e9cf8d39c89..b4d0311bcc4a 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -218,15 +218,19 @@ static int alloc_vmemmap_page_list(struct =
list_head *head,
> 	return -ENOMEM;
> }
>=20
> +/*
> + * Copy @src into the first page on @vmemmap_pages and return it. The =
page is
> + * left on the list; the caller must remove it only once it has =
successfully
> + * been installed in the vmemmap.
> + */
> static struct page *vmemmap_dup_page_from_list(const struct page *src,
> 		struct list_head *vmemmap_pages)
> {
> 	struct page *dst =3D list_first_entry(vmemmap_pages, struct =
page, lru);
>=20
> -	list_del(&dst->lru);
> 	copy_page(page_address(dst), page_address(src));
>=20
> -	/* Ensure updates to @dst page are visible before set_pte_at(). =
*/
> +	/* Ensure updates to @dst page are visible before =
try_update_vmemmap_pte(). */
> 	smp_wmb();
>=20
> 	return dst;
> @@ -248,6 +252,8 @@ static int vmemmap_optimize_pte(pte_t *pte, =
unsigned long addr,
> 	const struct page *page =3D (const struct page *)addr;
> 	const struct folio *folio =3D page_folio(page);
> 	struct page *src =3D pte_page(ptep_get(pte)), *dst;
> +	bool dup =3D false;
> +	int ret;
>=20
> 	if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), =
folio_order(folio)))) {
> 		dst =3D folio_vmemmap_shared_tail_page(folio);
> @@ -255,16 +261,27 @@ static int vmemmap_optimize_pte(pte_t *pte, =
unsigned long addr,
> 			return -ENOMEM;
> 	} else {
> 		dst =3D vmemmap_dup_page_from_list(src, =
walk->vmemmap_pages);
> +		dup =3D true;
> 	}
>=20
> -	list_add(&src->lru, walk->vmemmap_pages);
> 	/*
> 	 * Map the shared tail page writable intentionally. A lockless =
get that
> 	 * read a non-zero refcount before the remap can still do its =
cmpxchg
> 	 * after it. The refcount is zero, so the cmpxchg fails and =
leaves the
> 	 * page unchanged.
> 	 */
> -	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
> +	ret =3D try_update_vmemmap_pte(addr, pte, mk_pte(dst, =
PAGE_KERNEL));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * We successfully overwrote the vmemmap PTE, so the page that =
was just
> +	 * unmapped can be freed, and if we mapped a duplicated page, =
remove it
> +	 * from the list so that it doesn't get freed later.
> +	 */
> +	if (dup)
> +		list_del(&dst->lru);
> +	list_add(&src->lru, walk->vmemmap_pages);
>=20
> 	return 0;
> }
> @@ -275,6 +292,7 @@ static int vmemmap_restore_pte(pte_t *pte, =
unsigned long addr,
> 	const struct page *page =3D (const struct page *)addr;
> 	const struct folio *folio =3D page_folio(page);
> 	struct page *src =3D pte_page(ptep_get(pte)), *dst, *tail;
> +	int ret;
>=20
> 	if (unlikely(!vmemmap_optimizable_pfn(page_to_pfn(page), =
folio_order(folio))))
> 		return 0;
> @@ -291,7 +309,11 @@ static int vmemmap_restore_pte(pte_t *pte, =
unsigned long addr,
> 		return 0;
>=20
> 	dst =3D vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
> -	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
> +	ret =3D try_update_vmemmap_pte(addr, pte, mk_pte(dst, =
PAGE_KERNEL));
> +	if (ret)
> +		return ret;
> +
> +	list_del(&dst->lru);
>=20
> 	return 0;
> }
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20

