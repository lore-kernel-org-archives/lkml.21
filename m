Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555038;
	b=zva/0Mg2qcp4whRHiDiS3sLQOdGAdF54Kkk3Dwb1X4qmjr0CheASqaDeEUO13ES2QAOU
	 7vuFhO9YX7BMCHHB1ou4RNoriLx1okks4l41EILPc2bj86Lt2zFJbtzTzppKrm8fqBw2Z
	 y06ZaFQ2zQsBCdE1fgLqf2KY97pL+fhX/MIpfNLn78c/6xHcgAhLnc4Hut5jggfk1i3kg
	 hpz20/7Hix4JE/0sWrNj1a8H/JoRrRk9DOLVaqMWwRpVLXx39Wiq9xayGXQvEgugWo9vn
	 qjl7vT+2BKtfxv1/TcTaMatgRwqkUcjlEhJnp7dy9CBId9jXC0rE8j9U97KpF9Jhh+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
	b=Bd9El60pUWw8j4pDyDOySNck0GJlgm9+6OCMS0trTPMaWe1ZG/nGg9t1QdHn31AHdWZJ
	 PoSfdBOvJgkSTnqOzk3DphGiNdPxgaEthNTbiLBpW5QeLik3i1eVV42DW60N/Pcz0dn9w
	 ij/X9Qki6P86z877HuwxYCK3pIJXUslXgeIb43YamWcKg9pUjNA2oSvQjpaCYXaACRIB4
	 BZdtFH1KWFQGrpw/XnjGpd9PHs4sXYLEElcp2I+Zl/P3r+zTj2HjDgWv4wgX2n8JtK1N2
	 hT411HUJeh/iT44ibyOjdZuJF548JzL0ZBjWWdVPu/vf/tPWjlsALjMKNUjYQSYIgWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="MkSXuN/x";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2F606A6AF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E2F606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MkSXuN/x
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b33e2ffso133435e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:17:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555035; cv=none;
        d=google.com; s=arc-20260327;
        b=aGnRYFQNkUlUzSj+sQDvjk8dICZ23zwviK75gdW/Hg9MyWx1T/MSMVr6jJ6fUtVMYv
         FMYASHy6LOzY+fiO0mVB+s/8VwlyIYx6p4vvWnY5ey7+36BdJIQst1Wf60+cFZB8b9JQ
         hQZzWIObdKBP8g1w3wKb+dbEv+viO55j4J2kU60H+Ik/6ZnXk74hg6fs3m6AD3+Qd6tP
         qpFJ2vTZuz3PJjI54O8DPYtnktGKsniIdb1zTjelxUr3PQyOnonPxffBzKyAzsaiYZnH
         EBc4ckmm2I1ONlr2a0Vl91vyiw+ygZvCXzxzyEnRjrScRazQLIHTByIbXSAOQVdh7oZl
         CTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
        fh=ffyBX+5MB4eCvyj6s5IBUVt5CWtxJoCbLQGeA5pddNw=;
        b=YN0nHxy+VlgvwRwC6SHqNteD+Oc5z/yK8k3QVWhR4FBSOnZVgQrddIiqovuIX3bqF7
         +D04fELXVksKwEVepW8xoXPZ6NcH8oUZ98ivZfNk2pIdm9jxOewqmjzhhOy3joMQWYDL
         LEVm9DzMFJ1jv35DKXInrQu4F15nwXecxerCCgpQT9nhJuHt7kQkhnBQfNsPL2Y6QkrV
         c/vQTU45KKosOf07o2A4yM1rPR2ofqAKuIEXPvT97CIHSzmwLs0aOFYqzgBz8WmzevlM
         40uikZhes81UMAbBbtablejTKVgJ7RDuHeMsU0GrndHhABpZ8HrfkYaZ6cxwdLzvSC7n
         5gQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795555035; x=1796159835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
        b=MkSXuN/xdTgpLprAaYeg0DUZVlUmwLE3QyG/Oo8oVmOu0/SNd2kvpbkOWXVN5tgQh/
         TonNMVSbIqyueZeYUWRvcXD3n8lMbaOPzHucCw66VnV/LH2wUH4aW7EcdmciDE/Y5OGF
         7Lxm76B7Blpx0f45YadbB9p2dBDewxo4/7zBOn8EzOmrf9MLEOlMXJbG5HO0oRQCq7YT
         28QZU5IjCmmthE6LYlSlZ47gSKWC48k7RdJeZWUgSM+3j68zeX3q3x81pyxQGYt9pyxE
         vi7Ya8wNILGVLHZ5pNxnANCRtCpbTuA/1AwQOeAUUbo1iZm/h5ijkrltUGAxvs2mLWRr
         IfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555035; x=1796159835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
        b=tUxWP8ZnmBR9gjboot1zo2pwQYuMgOTzh4aRGBm+qqrG0Syy0Agu6xA8RSH972ulaR
         bIPW0VLIeWSE/xK73OTgcTZipb37vB7Pox54JJ9mFld+MiSlQ7vY316Jl5/kqysln+QW
         xuvmRiOQtqXOVq+2LuZNR5MDx+RY24g6B/W760RbbWzjuVKktygEo+7GH4SM9zfYJdhU
         cZmmN2y5lsALeMbcKAMPBdDtdKrB+AnESTHBYwrPAnQVJ+brer63Q8TgoEVyA8X1G4/k
         kUjyzTcV/WpENCejxEi0bnqtJrHQ8OWBCLNsSZvY3klhdB5Q4xWf7PI1+YDPzkp+F6IN
         ph6Q==
X-Forwarded-Encrypted: i=1; AL+hErFaMDRe0MOeoDFFx8abeyud8KdiPf5hbB6uVeJO6k4ly2PZlNoH0RAo0ib+a/9VMCYDjyeMOHfrHWx/Qw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dhZLFt1kN/FE7rgqXxktqTJbYLlVN1KsDZo4XboN/O6m2NJp6
	10Th5WLNEiNK9ov9lBwNWm+LT/0hktXISddRXVsZMWqeadzFZKcroe5Fsb6H75FC+LMWt/DAeev
	ss6J1qdPZJOVrRIaCRQeCTgMevYXRUh0ACB0qXGjy
X-Gm-Gg: AZFdTZc9+Z3UAgSuIVQlS3OuX8naUSHnq2AG2YU0MRw0af/jNF9aOC6LJ1pV88hZIV+
	pk32toNChqKPR/JqibW1bgbHRxi8w2jLN292BM8WEu1iZiqM5RmkahEykdfwJZ4XnfnvTlv5h9m
	rVKIS0Wa9kAiEgNnPrVTrEE8qVl+931GaoFjtyeIjxzb9ebRXCHAxqK47bAk2nEfDU0DpHbrsre
	9i7IWotQKJm/pewT+eCKvfMBRjzUz5wmzyTDgiNFq/DTi1f1nZd5TKAM7N2pHg2Kj+Rj43CviWN
	wurYYimHDZAMwIlqYx/EAvWZsf9jeRmEOjbpQD1/LCF7xHt776erUH/i509F5XS/1I9cWyFLbIx
	1tpRAHjM/Gc4DvXRHLanozeWqNR0m6Vb77/RjPAijkgbPyUS7T/gtU29OvOXgtLHFfmLfRkU9D3
	jkv6EqzoBiBoXwj+RV1QVlrUNnbB0WAnwJM1BA40HyP5w=
X-Received: by 2002:a05:600c:41c7:b0:4bb:7ae0:3158 with SMTP id
 5b1f17b1804b1-4bb91683f09mr1702525e9.8.1795555034613; Tue, 24 Nov 2026
 13:17:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev> <20261123-feat-udmabuf-huge-pfnmap-v2-2-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-2-3254f801fc36@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 13:17:02 -0800
X-Gm-Features: Aa3M54oDsXG-xXA0liYSlMAI56IBmdX9Wf6SVnF95VXy1mB4cBPNV8817l0bAvI
Message-ID: <CABdmKX2156cpvWHEg7hVNGqqhgg-+v1Vj4G_bAK01kk6huq=4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] udmabuf: map huge page backed ranges with PMDs
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philip Yang <Philip.Yang@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Natalie Vock <nat@pixelcluster.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:45=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> QEMU and crosvm hand guest memory to the host renderer and display as
> udmabufs for virtio-gpu blob resources. The guest memory is a memfd that
> is often backed by 2 MiB huge pages, and the host process mmap()s the
> dma-buf to access it with the CPU.
>
> udmabuf maps every page with its own PTE: the first fault inserts a PFN
> for each 4 KiB page of the whole VMA. Mapping and touching 4 GiB this way
> takes over 200 ms and a million PTEs, although the memory behind it is
> 2048 huge pages.
>
> Add a ->huge_fault() handler that maps a PMD-sized range with one PMD
> when it is backed by an aligned run of contiguous PFNs, and falls back to
> PTEs otherwise. Have the pre-mapping on the first fault skip the ranges
> the handler will map, so that their PTEs don't take the place of the
> PMDs. Once THP is disabled for the VMA, the ranges already mapped with a
> PMD keep it, so pre-map only the PMD-sized range of the fault then.
>
> Mapping a udmabuf over a memfd filled with data and reading a byte of
> each 4 KiB page through the mapping, base and patched kernels alternating
> over 3 rounds of 5 runs (7 for shmem 4K), median of the per-round medians
> and range in parentheses:
>
>   backing    size        before (ms)         after (ms)   change
>   hugetlb    256M   13.3 (13.3-13.7)      1.7 (1.7-1.8)     -87%
>   hugetlb      1G   53.6 (53.0-53.7)      6.5 (4.2-6.6)     -88%
>   hugetlb      4G      211 (211-212)   23.6 (17.6-25.2)     -89%
>   hugetlb      8G      423 (422-424)   45.8 (45.8-47.2)     -89%
>   shmem THP    1G   52.8 (52.5-53.1)      6.3 (5.8-6.8)     -88%
>   shmem THP    4G      210 (207-214)   20.7 (19.5-21.1)     -90%
>   shmem 4K     1G   52.0 (51.6-52.7)   51.8 (51.5-52.9)       0%
>   shmem 4K     4G      209 (209-211)      208 (208-209)       0%
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

This commit message should explicitly say this patch depends on
Lorenzo's series in addition to mentioning it in the cover letter (for
merging / backporting). The mm/core hashes may change, so just by the
series title or patch subjects for now.

> ---
>  drivers/dma-buf/udmabuf.c | 85 +++++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 81 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 018937435356e..9f53d33fbdd9a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -44,12 +44,63 @@ struct udmabuf {
>         struct miscdevice *device;
>  };
>
> +/*
> + * Return whether the PMD-sized range of @vma at @addr is backed by one =
aligned
> + * run of contiguous PFNs, which can then be mapped with a single PMD.
> + */
> +static bool udmabuf_pmd_mappable(struct vm_area_struct *vma, unsigned lo=
ng addr,
> +                                unsigned long *pfn)
> +{
> +       struct udmabuf *ubuf =3D vma->vm_private_data;
> +       const pgoff_t nr =3D PMD_SIZE >> PAGE_SHIFT;
> +       unsigned long first;
> +       pgoff_t pgoff, i;
> +
> +       if (!IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP))
> +               return false;
> +
> +       if (!IS_ALIGNED(addr, PMD_SIZE) || addr < vma->vm_start ||
> +           vma->vm_end - addr < PMD_SIZE)
> +               return false;
> +
> +       pgoff =3D vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +       if (pgoff >=3D ubuf->pagecount || ubuf->pagecount - pgoff < nr)
> +               return false;
> +
> +       first =3D page_to_pfn(ubuf->pages[pgoff]);
> +       if (!IS_ALIGNED(first, nr))
> +               return false;
> +
> +       for (i =3D 1; i < nr; i++) {
> +               if (page_to_pfn(ubuf->pages[pgoff + i]) !=3D first + i)
> +                       return false;
> +       }
> +
> +       *pfn =3D first;
> +       return true;
> +}
> +
> +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> +static vm_fault_t udmabuf_vm_huge_fault(struct vm_fault *vmf,
> +                                       unsigned int order)
> +{
> +       unsigned long pfn;
> +
> +       if (order !=3D PMD_ORDER ||
> +           !udmabuf_pmd_mappable(vmf->vma, vmf->address & PMD_MASK, &pfn=
))
> +               return VM_FAULT_FALLBACK;
> +
> +       return vmf_insert_pfn_pmd(vmf, pfn, vmf->flags & FAULT_FLAG_WRITE=
);
> +}
> +#endif
> +
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>  {
>         struct vm_area_struct *vma =3D vmf->vma;
>         struct udmabuf *ubuf =3D vma->vm_private_data;
>         pgoff_t pgoff =3D vmf->pgoff;
> -       unsigned long addr, pfn;
> +       unsigned long addr, end, pfn;
> +       bool pmd_ok;
>         vm_fault_t ret;
>
>         if (pgoff >=3D ubuf->pagecount)
> @@ -61,14 +112,37 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *=
vmf)
>         if (ret & VM_FAULT_ERROR)
>                 return ret;
>
> -       /* pre fault */
> -       pgoff =3D vma->vm_pgoff;
> +       /*
> +        * Pre-fault the rest of the VMA, except for the ranges that
> +        * udmabuf_vm_huge_fault() maps with a PMD once they are accessed=
.
> +        */
> +       pmd_ok =3D thp_vma_allowable_order(vma, vma->vm_flags, TVA_PAGEFA=
ULT,
> +                                        PMD_ORDER);
>         addr =3D vma->vm_start;
> +       end =3D vma->vm_end;
>
> -       for (; addr < vma->vm_end; pgoff++, addr +=3D PAGE_SIZE) {
> +       /*
> +        * Ranges mapped with a PMD before THP was disabled for the VMA k=
eep
> +        * their PMD, so pre-fault only the PMD-sized range of the fault.
> +        */
> +       if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && !pmd_ok) {
> +               addr =3D max(addr, vmf->address & PMD_MASK);
> +               end =3D min(end, (vmf->address & PMD_MASK) + PMD_SIZE);
> +       }

This fixes the v1 problem, but it means that a task with THP disabled
takes a fault per PMD size instead of the whole VMA. Including buffers
that are entirely backed by 4k pages. That partially undoes the
f0bbcc258e81 ("udmabuf: pre-fault when first page fault") behavior.
That's probably fine (would be good to see results for shmem 4K under
PR_SET_THP_DISABLE), but I think the commit message should mention
this also applies to 4k buffers.

Also probably worth mentioning / commenting that
/sys/kernel/mm/transparent_hugepage/enabled =3D never (we use that)
doesn't get you here because the THP tuneables are bypassed for
VM_PFNMAP VMAs with huge_fault().

If we stick with this behavior when THP is disabled, can we just do it
unconditionally (using pmd_addr_end(vmf->address, vma->vm_end))? That
would eliminate pmd_ok, the thp_vma_allowable_order() call, the skip
branch below, and keep udmabuf_vm_fault() within the faulting PMD's
page table and avoid repeated full-VMA scans (e.g. post
MADV_DONTNEED), which seems like it might be worth the extra faults.
Worth checking the shmem 4k numbers to see if the extra per-PMD faults
are negligible though.

> +       pgoff =3D vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +
> +       for (; addr < end; pgoff++, addr +=3D PAGE_SIZE) {
>                 if (addr =3D=3D vmf->address)
>                         continue;
>
> +               if (pmd_ok && IS_ALIGNED(addr, PMD_SIZE) &&
> +                   (vmf->address & PMD_MASK) !=3D addr &&
> +                   udmabuf_pmd_mappable(vma, addr, &pfn)) {
> +                       pgoff +=3D (PMD_SIZE >> PAGE_SHIFT) - 1;
> +                       addr +=3D PMD_SIZE - PAGE_SIZE;
> +                       continue;
> +               }
> +
>                 if (WARN_ON(pgoff >=3D ubuf->pagecount))
>                         break;
>
> @@ -89,6 +163,9 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vm=
f)
>
>  static const struct vm_operations_struct udmabuf_vm_ops =3D {
>         .fault =3D udmabuf_vm_fault,
> +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> +       .huge_fault =3D udmabuf_vm_huge_fault,
> +#endif
>  };
>
>  static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>
> --
> 2.43.0
>
