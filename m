Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795537820;
	b=up5XsMg0aELIyMR9/R6cSgkzwvaAe8MgrgwL6TaNiViBcJ7wCRBNLC0Cg6QNJgdhA271
	 T0/tMdqaKxMyeAECETwuE/P9EgcHhM9S9WbA7BmSUkE8YaTfIzL115vrxT6lZew6G86pA
	 HP+BROaHLPqvadbDtjMfOEKhiX3ceLNV4GAY1iOJUkQV5LeVcfjMoW9Gu9IsQppgNf4Ki
	 GuvKfJMaRHjX7PinCDU/4QkkrUQAOgqQ2v3OBt2N2EcB4fQrNweThyCY80cdd/ldm5UJs
	 +iOVIVYDugJbR05DOibB9E4p3XRNzhxeHb1GICrJLsHBgCWtSKVs29qRpSvmXbJdP9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=faF1vod1YCIOE6mWZF0dptvadZIAmgUkLf51bGNhat8=;
	b=Lq79oKzjVNbbZBuut9MoLI/2Ul4ns0WrTHspW3XuPHyybnBWTdcI6WFTEiOVsNB6SlBl
	 0hSedzmZ/+T64tnK5aJrJ6DAdbU5s56rjrTWUdsFmaF2YyPe+yeenRD1jFkNB6Q7Bhb6V
	 aTKDDacarpgFAhzDATNFcyNW7DmLEhPmqXAZ2DJ98gpESjKx5WFX3Ok3YtqkgAnF2fxH3
	 EWfGJL8eG6XClDX01IGkI/zNUpfSXMZdUo7y3JhvmQxA2IEqFaEqQNoNW+GvUw0k/Wgh/
	 VIiOVW1gXClTf5KG16K3WFUYAiWtd/mmUYbEIoLUOuA4BFYXgdd7VBWhsX/XPDV/kOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AZa0I7GO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F7A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AZa0I7GO
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so780420066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:30:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795537819; cv=none;
        d=google.com; s=arc-20260327;
        b=NtLgeTTmLCaJxREMVMgXm83MIrkMZgUvV3ppKqF4lCXiV9jeQ6q9/eMn4PCVWryuvy
         9+/OyzH53bUuPmuH4rpregMEXAhM02X1++u66WORthYgg04Pdvz94pI96ukCRxQiGneG
         8ERTYb8CtY6xWzVel/QTGIieFRKa5aFL7If1yM8Tjms5WuBc3rL19pNwDvkJcP9xCpTn
         b/8qftAGGRSNXd+xLIzZg2XE+mSPdhU8JJAUjMIb5c+AZ/pJwsdR8dLHYUyuXExbaQ/d
         rl/qHfRGD6YQfnzx/Q9X5cWVhzKjiOVjvo4lnrdchNl4QcuOhM3VN7ilMxRzL/JM/MrB
         1KJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=faF1vod1YCIOE6mWZF0dptvadZIAmgUkLf51bGNhat8=;
        fh=gmlRoOrrMIa1ioQAq1CbmSlDUvmNmTy4ZxAIek0HWkw=;
        b=LFXOik6mengDsb0x6p9RZDe5SuTsqcp8urzwBJenwvgHPUkCQX4rCosorZtYQie7vp
         XL3PSYRwRLD9QiG7Dw2L52lvZ29xZ9AKNis9KJIUhFWlO8zuO3N9m7pdphF9kdy/4jil
         QGxYFGReVWGC2INxEYCpV2YqPj0z5iDhUwAuX6Ig2Ar3RxUL4E+fQ+ltQvHdNrT8iRFi
         ANGQmQ7T58Xo3uQTuZaDgmIEkd5TxNkRXMcNjl5Z6TaW3bcLcSWc+rD5dW3wiuVOXiut
         /3xD4jQhuOVGTcEZ6KFUFlFQbj5e4ARCsu2uqH3f9UAoM6eOmpgS9GNJsvfTRSakAJFT
         O+KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795537819; x=1796142619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faF1vod1YCIOE6mWZF0dptvadZIAmgUkLf51bGNhat8=;
        b=AZa0I7GORj33xOMt6Fo7yWu+oJZCnux71QHY5qp11msIvAqRa7v+oN0Pk3wEXEK6jM
         4TVIDXC/eakzT3sB0mwYgxVk+dCMdGnQzQK+TwjNs864iDY8HlQ5OuG4Ky2UernE/Oap
         yUvyu5JidguVdPfX8iGP8TbDlTRosv/lDX+0S3M4PcSnxzj4+bQv32nwFmdgr1p0erxk
         kowdDq/wB3g5RLUz/PfAy89txlwyGWVFW7RrY4mBhmF9JnIrtqnAN1itvmLHAIc1fj31
         52aMLgiAE2j+fkfTh5IFDtPIC+76Gn+EKfVCz0Jb3qXLzkdftAQmqgpXnlWuHEnbXSgE
         FYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537819; x=1796142619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faF1vod1YCIOE6mWZF0dptvadZIAmgUkLf51bGNhat8=;
        b=xJ3Z7DC5v+1DJ0gvDPX51HKPnrepHkDQKY7+6wXXhwXUn/WFS2x5dC/MCUB7OONr+J
         f1Rm5hmYNbTUiwPPZQRMvRKp2qsRiIdcFk6L+wYcXDs3ct46STXSky9RDhXOfhOk1ups
         uqOip7DVoR61bB1llwYaf0rwcSv3TznUG/pprSLD7rV9w8nJUkVXSTUYSG2u9fi8k41K
         LvsnCe/o17RS3C/wFybveFW4gSqbTmuOfFuVNPiL0ZberplLLu54DoB3rLs5qnpVRWtB
         csw1U2DLQLajEShxfZM3I51D4wkOo3gKGRSBu45+pwDh9kG+Gpn4mH5UDvmvJxpEbNHM
         cYqw==
X-Forwarded-Encrypted: i=1; AL+hErHdqk+xbc5ldFQ60aG6qYZPW8R7uQxPUz1mpgXCd+4vdxW5VI+87XJimmrUDnQpu7QOfRAzoRJ8D2f4SFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eqHOQghPMZ+ZS9+rEqJga4x/DcDnbPbqDqCgnoxHDWxkqnwDT
	DcBjZrVel7p97Uv2katPS4cmbW5X2D3yCXVgC2l536MGDMsPIOp8YHqRdoDFF0N2Hbg9d5Ak+Oz
	3s9e1URZsI0/ll1JjLz9sgcnuTWmCEnsw0bKzcVYz
X-Gm-Gg: AZFdTZeENQY+jG6tZskO/0lMYf1Oh2QJyMxkWm7cfscjyowKms5X4ZRd+2hnCzVm8Tb
	ZulNiYNgbN4abDD6iKpag5hIf6BufUKkiWbmvxtfAvYJXRNVGg4ebTgxy9UzlYuW548UCkXlPLU
	I63I0W9++/UJEhHVJxzKmVbG44XiyI7ebvhHiKmV2DBidbwMquw2Wl41bnbzU50KzieDABJdrSl
	AYp+oQ2VK4UpU6DGCoLMcEEM+0he868WMHC5GCx8k9D4mh/1jVZfhgYFml+eW757/OJOTBLUYg6
	VS4iepLiSDQ6DuHpc7nLcJhPj0uMf4UhwsM60a/M0Vv51b989C5YQob7e/N6320F7+BnU3gwejZ
	j3Ja9nkk0cHHISmv24tQrv1siXAzQ9620ottSVNEs9hOoGWUXoV0n85y1oBVGmvHA6ITlBFd1P6
	6egJa1Q1kHrl/hibaYJtj+wYqWFSQuJUIrSgdHuObdkWw8s20OJeAC
X-Received: by 2002:a17:906:2a17:b0:c50:f28a:8407 with SMTP id
 a640c23a62f3a-c513aac6733mr1140653866b.42.1795537818175; Tue, 24 Nov 2026
 08:30:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-5-jthoughton@google.com> <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
 <CADrL8HUstWR2pajfYYzRqL7HziVfzZAXJas6MqJkK6pVxSzXEg@mail.gmail.com> <4A195604-B83B-4608-B32E-5F6CC85AE96F@linux.dev>
In-Reply-To: <4A195604-B83B-4608-B32E-5F6CC85AE96F@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 11:29:40 -0500
X-Gm-Features: Aa3M54oagh8xEkhaXUUOR7MGGzOxphU25lezKmhke56V0En8IXvrXq6W7VgHea4
Message-ID: <CADrL8HXQShKvEu_6KVq0wZXbPjWMcR73yZ38iuePxPRZMDjXmg@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
To: Muchun Song <muchun.song@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:29=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> >>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>> index bc1353f03b08..ab33df268955 100644
> >>> --- a/include/linux/pgtable.h
> >>> +++ b/include/linux/pgtable.h
> >>> @@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct *mm=
, unsigned long addr,
> >>> #endif
> >>> #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte,=
 1)
> >>>
> >>> +#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> >>
> >> Why not ARCH_WANTS_VMEMMAP_UPDATE_PTE? Then x86, loogarch and RISC-V d=
o not need define
> >> this macro in their ptable.h.
> >
> > You're basically asking to make this opt-out instead of opt-in, right?
>
> Yes, exactly.
>
> >
> > I like making the different architectures explicitly opt in to the
> > generic implementation; it forces any new architecture to decide if
> > the generic implementation is correct for them. But I don't feel
> > strongly.
>
> We already have an opt-in config: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP.
> It already forces new architectures to pay attention to it.

Right, but that opt-in is different. Requiring architectures to
manually specify ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE forces them
to think about whether or not they need their own population routine.
But yeah, I guess we can just assume that any new architecture
implementing HVO should have already checked that. Okay.

> > I'll switch it to opt-out in v4 unless you or someone else tells me oth=
erwise.

So I'll stick with this; I'll switch it to opt-out.

Thanks, Muchun!
