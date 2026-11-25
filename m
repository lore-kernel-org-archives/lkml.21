Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600123;
	b=jnozuaEU0Wlhb6doEzfTog6WrS5iid9lgF/rlMNDfuZMGZL0YSqa95VaelH2AG1XnRtw
	 +XcbUSJNwXc4VG8yCVagKKn4C/dctJ2cGaotYCpz4KjmAVh07KOs6LaF7hPPhAYo34Jl+
	 oc1bM/RrECnzKQsscy0+e2pBDNvzk2Axu4w5ZTFtHlTZTEAWas019khGxPoS+OmYZq31g
	 9sMN7jaLh54ftNykXFTaP1+EzRIXhMqZsBTuUMvUTdYrjHkIUYETqk3GKLTK0M+IwU5qZ
	 7QUzn6zsNqF9syEB2vgnWX10u0RWjWsiCFhb66OOFYqHpg4AxSUgj+7tyXgt+AmcreQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600123;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=2VfJ6bjv4e27WAuru/P4AIutJffL5p589T07LBcmHCU=;
	b=rCSksimVTXluSsLpmsixyDwbM5UTIWoqEFSMejN+k7eXTRQUGyR4pOU/w6+12U502xIZ
	 rVjf9eF2pbN9IKWZgZ4/6oE2A7jac6hnmTiF3ufy9yQnPULEOwb4JvUVkfviZTQLsC4m1
	 b3MLM88ePish8ftUBx74q1wDmxnrqOjUXxy0gzjlrjacou2dWjEgdR7vdjLGqY/7hSH8Q
	 mfv5zpPJTGgPJymgZ8Yeqfxv86ZODfJVbmrSj143Cg4eLMiwuwyQqAMqvLNvPxvEJqM+v
	 f2/noXGs+BFEoR267aMdPagIocAHvtYH5ELMGsSDMz++JpkGh2IObvbK2F5NXIYZ8zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xdkIyMXz;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C869606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C869606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xdkIyMXz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2VfJ6bjv4e27WAuru/P4AIutJffL5p589T07LBcmHCU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795600120; v=1; x=1796204920;
 b=xdkIyMXzAD+2GKgttya0QgKXIDHXTAqb/1cV4Mu1pch3DIrX5nVIHqOF8EGiGFYzg5Rr62DQ
 5rSH9gAO1pRAekElGxgtSAEov2yJlHGLo3HwVTfTqlblenxGDi+6GqJuBWF/pcmCUWYK2beK0c3
 92sZc9UsgJ3mVtavJ69vV2pc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f807f146e8e08fa1;
	Wed, 25 Nov 2026 09:48:40 +0000
X-Mizu-Trace-ID: f807f146e8e08fa1
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
Subject: Re: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HXQShKvEu_6KVq0wZXbPjWMcR73yZ38iuePxPRZMDjXmg@mail.gmail.com>
Date: Wed, 25 Nov 2026 17:48:21 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
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
Message-Id: <5747F7E9-14A1-4CBA-BA2B-BDB8A3CC26E9@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-5-jthoughton@google.com>
 <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
 <CADrL8HUstWR2pajfYYzRqL7HziVfzZAXJas6MqJkK6pVxSzXEg@mail.gmail.com>
 <4A195604-B83B-4608-B32E-5F6CC85AE96F@linux.dev>
 <CADrL8HXQShKvEu_6KVq0wZXbPjWMcR73yZ38iuePxPRZMDjXmg@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 25, 2026, at 00:29, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Mon, Nov 23, 2026 at 9:29=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>>> index bc1353f03b08..ab33df268955 100644
>>>>> --- a/include/linux/pgtable.h
>>>>> +++ b/include/linux/pgtable.h
>>>>> @@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct =
*mm, unsigned long addr,
>>>>> #endif
>>>>> #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, =
pte, 1)
>>>>>=20
>>>>> +#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
>>>>=20
>>>> Why not ARCH_WANTS_VMEMMAP_UPDATE_PTE? Then x86, loogarch and =
RISC-V do not need define
>>>> this macro in their ptable.h.
>>>=20
>>> You're basically asking to make this opt-out instead of opt-in, =
right?
>>=20
>> Yes, exactly.
>>=20
>>>=20
>>> I like making the different architectures explicitly opt in to the
>>> generic implementation; it forces any new architecture to decide if
>>> the generic implementation is correct for them. But I don't feel
>>> strongly.
>>=20
>> We already have an opt-in config: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP.
>> It already forces new architectures to pay attention to it.
>=20
> Right, but that opt-in is different. Requiring architectures to
> manually specify ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE forces them
> to think about whether or not they need their own population routine.
> But yeah, I guess we can just assume that any new architecture
> implementing HVO should have already checked that. Okay.

Don't worry. I'm planning to rewrite the HVO documentation with a =
dedicated
chapter that tells architecture guys which hardware features must be =
supported
and what adaptations are needed when enabling this feature, so there =
won't be
any issues.

Thanks,
Muchun

>=20
>>> I'll switch it to opt-out in v4 unless you or someone else tells me =
otherwise.
>=20
> So I'll stick with this; I'll switch it to opt-out.
>=20
> Thanks, Muchun!

