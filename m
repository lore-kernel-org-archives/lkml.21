Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403484;
	b=w7vqu/7v3Oaj3fIi2o0L4yicgZCNWfZ3OygtkETY2oPqjT+eoPa7wLVNLKbVH3JyETvB
	 sOOHpkZoL5aG0+cZyLCg0sj7tFcO4aEYyvuQT1ZYEVEHRbcAZigpns0AH7OrzPwetIc7V
	 LRILdopn4gjnkgRHcqsvAB6C2R+VJsLga7bLu6KO2qSZpMlyjvXuIMi7iKxwhjDpM8Wmf
	 P3tNAfK7oFIeBWa+bTYLBVTOu6sqy9cwBkvpmqno98HAKSh1YQHucGNEkeBC8ZPHHI0sX
	 cyijGl0MBprsP7TbOZIr6LT/qcYDCVDl4ICwmkwR1mXro/iUCBLbBGKJkdPLJgXDXGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403484;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=liONQZO+EAHG7ixY8JmtuIKPPkmSaSHZeOcFjrgKJBg=;
	b=RsEho475/8AEYK8xHRRWLQnHy+dvTBCA6WoXBjMCv88d8dgxwT0sx9Jykxi5eVQWYXzc
	 A658nwSRY7L+0Tu9ohh8cgaXx9x+18nqyHOllj8zaNp61DQgL4jDprDYCeVw1kQl1WPcw
	 ioQ0QN3U4imbG6EXjcs//XVfcA71d+xBcPe00RYp2YrLukI3DFaSE1BIJjVIdMHKdB7Wr
	 ibqYpgBmY8HHZusCET6JquKA8X4zwfL4e6WWUTstODAFj85nkkncb47mLgkMLUVeh8/tG
	 SGbsOKiydvLjNkRd2fi2G7fLNCyekG4qvPraLCF87WkUrAfIW4Rf8wt4Y8QV0TcM9wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xnS5oWgz;
	arc=none smtp.remote-ip=91.218.175.98
Received: from mta0.migadu.com (out-98.mta0.migadu.com [91.218.175.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D659606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D659606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xnS5oWgz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ujFplHJ3piEVGbgFTkod2LvOMRYY4YKywSoNgd1YTy8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795403480; v=1; x=1796008280;
 b=xnS5oWgzs17ElRihHvNnCWB7LwGaXrJXyK4nOEXZF3bZHeDyUzXILmJy/8Bu46oyL+hfk4AL
 gJNMLRR3t+vH6yJpSCDRaEYUlKis0xjxPS5Dkzea1ZMZqKNnkyi9vFV89oDgU60pqtvvjlZOl5f
 dxRQD/a+fpkWjUmcy8D/cK/s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6023f3f8b2fdfde6;
	Mon, 23 Nov 2026 03:11:20 +0000
X-Mizu-Trace-ID: 6023f3f8b2fdfde6
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
Subject: Re: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not
 pre-HVOed
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-7-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:10:55 +0800
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
Message-Id: <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-7-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>=20
> Boot-time gigantic folios are expected to be pre-HVOed through the
> section-based vmemmap optimization, so the bulk optimization pass for
> bootmem folios was dropped.
>=20
> However, arch_support_vmemmap_remap() may not yet
> return true when bootmem folios are allocated (e.g. on arm64, where
> support depends on a system-wide CPU capability), while it does return
> true by the time the bootmem folios are gathered. Such architectures
> disable the section-based vmemmap optimization in their vmemmap
> population path (see section_vmemmap_optimization_disable()), so the
> folios are not pre-HVOed and would never be optimized.

Yeah, when I removed support for this part of the code, I figured you
might add a new patch in the future to add support back. It is fine.

>=20
> Optimize such folios when gathering bootmem folios. Their tail struct
> pages have all been initialized by memmap_init_compound_page(),
> as they were not pre-HVOed. Pre-HVOed folios are skipped by
> vmemmap_should_optimize_folio().
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> mm/hugetlb.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>=20
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 72839e98f998..8756c0206922 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3325,6 +3325,17 @@ static void __init =
prep_and_add_bootmem_folios(struct hstate *h,
> 	unsigned long flags;
> 	struct folio *folio, *tmp_f;
>=20
> +	/*
> +	 * Bootmem folios are normally pre-HVOed through the =
section-based
> +	 * vmemmap optimization. However, an architecture that can only
> +	 * determine whether it supports HVO after bootmem allocation =
disables
> +	 * the section-based optimization (see
> +	 * section_vmemmap_optimization_disable()), in which case the =
folios
> +	 * were not pre-HVOed and must be optimized now. Pre-HVOed =
folios are
> +	 * skipped.
> +	 */

I'd like to condense these comments to something like:

/*
 * Some architectures do not support section-based vmemmap optimization,
 * so their bootmem folios should be optimized here with folio-based
 * optimization.
 */

Thanks,
Muchun

> +	hugetlb_vmemmap_optimize_folios(h, folio_list);
> +
> 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
> 		/* Subdivide locks to achieve better parallel =
performance */
> 		spin_lock_irqsave(&hugetlb_lock, flags);
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20

