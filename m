Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487490;
	b=Pt1wjOlaR5MqMKCVy7+j0zX695/tNjA1UBHPVEt0MfuYtuBGr7GL2VvfO8Y6ORUalJVk
	 UCcTYRd9n8iqCDXTM6tv68AXnye6kOkG4aadoCto4ycC9uNOUxwD1OFK0/VxiL7ooBsIJ
	 Xkyv4J2fK4KGcgNXFKvuneKokwZ6XznG5kh58QtiUW0kaRGAD/ciihRGsQ0TXy+F8CoHT
	 1fvwUP4YM4ZS6XhWz9QDkPI0J3pAFbqEXJaCRrWYgGSBrvWCIagPQXGzuQHVE8cTGQaCr
	 20p2+rEnTl0/rG4fzOit4L6JViRUzSI0xYgkOhepuLqF4Xl366DYMebUUjxSrFw5wgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487490;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=I6rKiuxs3a0MpULM5n+IvwORKN/28E+DHpxd239HqJY=;
	b=ztkLm9aXIqwGozUIQrX5397uwB7BwkHfx+5vm6PFIYfNnTrsmpRKcFpVT4sjp3TLnrV3
	 S2FmJjc1KuPsY5tK0VZoaQTu/DMa9mjt5kYzBgwnCqu279OaqBA60JshrN9n4Nrg/OWgo
	 VIg2Du5TOJ6G7D+OCSnMD+5T2Mf4IWzttKPhS8IdpfXnp+0CfS9RUtyniaDDWz8bvhf1r
	 afjRcq7PhfaIH7MK6vw5cg7di7EPhPD6z8wao9WSAlTAh8rGb3JRK+avIEmmswVPR2qtk
	 H8ER5EjaAVuaVl3l68B7a4zlzhXZXmpuApVm7e6DHe7WmDSwsvwlFNlsWLG8OCSrQsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iYxLxCy3;
	arc=none smtp.remote-ip=95.215.58.184
Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F917606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F917606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iYxLxCy3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2EfP7VkiOHBjYmA3RrR9cYpETF6cn3Mh2yOE+dyeiAs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795487487; v=1; x=1796092287;
 b=iYxLxCy3t2iEF08iafMovc2K4VHY8fKBUZ7VF8edFul8A80rRelpSlaztFb9LX9t+/62a9Nq
 94Xq8OZUeH02HKres8yGNe60O5Igqrgxs6tTXYcoTpYutO88nTPfX4xWYR5DdC23eX5hdbPtaN/
 gtRZSjnF6p15ThHeievvt49g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3d25bf20d01f7445;
	Tue, 24 Nov 2026 02:31:27 +0000
X-Mizu-Trace-ID: 3d25bf20d01f7445
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 05/19] hugetlb_vmemmap: Allow architectures to
 dynamically disallow HVO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HXemwtmL_URg-WNOzdw1YCVxP3HVxX67yd=pLRGAuFyVA@mail.gmail.com>
Date: Tue, 24 Nov 2026 10:31:12 +0800
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
Message-Id: <B1DC7C6D-7E3F-415B-A0D7-3F355499AB78@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-6-jthoughton@google.com>
 <C1CC6F31-4F75-41D8-89D8-CE43465FBB6C@linux.dev>
 <CADrL8HXemwtmL_URg-WNOzdw1YCVxP3HVxX67yd=pLRGAuFyVA@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 24, 2026, at 04:31, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Sun, Nov 22, 2026 at 10:01=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> For arm64, only some platforms support HVO. Add an arch hook,
>>> arch_support_vmemmap_remap(), to prevent HVO from taking effect if =
the
>>> architecture lacks support. The hook is not HugeTLB-specific, so it =
can
>>> also be used by other users of in-place vmemmap remapping (e.g. =
FS-DAX).
>>>=20
>>> Check it in hugetlb_vmemmap_optimizable_size(), so that hstates are =
not
>>> reported or treated as optimizable (e.g. by report_hugepages() and =
the
>>> HugeTLB allocation and freeing paths) when the architecture does not
>>> support HVO.
>>>=20
>>> It may be the case that arch_support_vmemmap_remap() returns false =
at
>>> first but eventually returns true. This is the case on arm64, where
>>> support depends on a system-wide CPU capability that is not yet =
known
>>> when bootmem hugepages are allocated. Such architectures cannot =
pre-HVO
>>> bootmem hugepages, so they must disable the section-based vmemmap
>>> optimization in their vmemmap population path with
>>> section_vmemmap_optimization_disable(). Their bootmem hugepages are =
then
>>> optimized when they are gathered instead.
>>>=20
>>> Signed-off-by: James Houghton <jthoughton@google.com>
>>> ---
>>> include/linux/pgtable.h | 15 +++++++++++++++
>>> mm/hugetlb_vmemmap.h    |  2 ++
>>> 2 files changed, 17 insertions(+)
>>>=20
>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>> index ab33df268955..8cf44120e2ed 100644
>>> --- a/include/linux/pgtable.h
>>> +++ b/include/linux/pgtable.h
>>> @@ -480,6 +480,21 @@ static inline int =
try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
>>> }
>>> #endif
>>>=20
>>> +#ifndef arch_support_vmemmap_remap
>>=20
>> We usually add a 's' to 'support'. Like arch_supports_vmemmap_remap.
>=20
> Oh yeah, I'll fix that. Thanks, Muchun!
>=20
>>=20
>>> +/*
>>> + * arch_support_vmemmap_remap - Whether in-use vmemmap mappings may =
be remapped.
>>> + *
>>> + * Vmemmap optimizations, such as the HugeTLB vmemmap optimization =
(HVO),
>>> + * remap vmemmap page table entries while they are in use. =
Architectures that
>>> + * can only do this on some systems may override this hook. It may =
return false
>>=20
>> "Some systems" is not clear for me, How about rewrite this sentence =
with:
>>=20
>>  May override this hook based on architecture-specific runtime =
conditions.
>>=20
>>> + * early during boot and true later, once system-wide features are =
known.
>>=20
>> I think the description should be general, so the last sentence I =
think should
>> be removed.
>=20
> I think it's important to clarify that the return value can transition
> from false to true, but not from true to false.
>=20
> Okay how about this:
>   * Vmemmap optimizations, such as the HugeTLB vmemmap optimization =
(HVO),
>   * remap vmemmap page table entries while they are in use. =
Architectures that
>   * can only do this under certain runtime conditions may override
>   * this hook. It may return false early during boot and true later. =
Once
>   * it becomes true, it must not start returning false.
>=20
> What do you think?

LGTM. Thanks.

>=20
> Thanks!
>=20
>=20
>>=20
>> Thanks,
>> Muchun
>>=20
>>> + */
>>> +static inline bool arch_support_vmemmap_remap(void)
>>> +{
>>> +     return IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION);
>>> +}
>>> +#endif
>>> +
>>> #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
>>> extern int ptep_set_access_flags(struct vm_area_struct *vma,
>>>                               unsigned long address, pte_t *ptep,
>>> diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
>>> index 8b28063d78cc..440477288d19 100644
>>> --- a/mm/hugetlb_vmemmap.h
>>> +++ b/mm/hugetlb_vmemmap.h
>>> @@ -48,6 +48,8 @@ static inline unsigned int =
hugetlb_vmemmap_optimizable_size(const struct hstate
>>>=20
>>>      if (!is_power_of_2(sizeof(struct page)))
>>>              return 0;
>>> +     if (!arch_support_vmemmap_remap())
>>> +             return 0;
>>>      return size > 0 ? size : 0;
>>> }
>>> #else
>>> --
>>> 2.56.1.809.ga0b61035b5-goog


