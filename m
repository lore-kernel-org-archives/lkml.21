Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567195;
	b=GQPKZC6wexRhmgwU4phCAjbymamivikYEJYkxDThlWvwh4PZGShcIyOIPhyWYoH3lrlK
	 Xj/sc49GL9dg3APWkleoNJbo8UnGevKdCuLqig0sUexQhYkhdqrFx+SB+tmpY8lu1A0mo
	 2L3bSTq6O6/9dgBH/jK7M7elthEVZnnf5VML9No4uxSZfF/p4BDbeYT1BzYWKBgHeZUhZ
	 B7YL5wND6cIKag2Yo0KmzcARcsgM8r/kJuEuHSnR1WWpSbMFcBKE5sfE4ZOCj/buJwp3z
	 mCZYRp8csI88KhjM7wS/e+R/synmXdvyoej6pXTT9cKwsDrQ9xA64JErklL4kQR76Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=YKxHcqUXjQp/1J5J8B8/Kkrmh8UptW8ucEK7buHNuos=;
	b=34q1pTIPnjl3Gpmgx9bdwNrmEdYwUpwlCabWskkCssLh1Cxw8SfPIF8561jnZ5J7Qp30
	 77hW6JEV9LU7S+f1F2NZ1wVHWsMhXTjf7DbfbooJ3xopys9VNKbx87lIAlJOeBZdxH9gM
	 IF5WXMkVDe2Sbch81482XZkSe48iyNp6CwE5WdDRQg/urX954sLWnmY44pdeDnB3Khcfh
	 1OYAH+X6w0yNPDJ2A/O0Sgd5cupAosNNPPnsy5KV9GFvRM5aQYyhqs7iBAxm0jp8A2fu7
	 dDco6Q0sRWMEG+JgWUPMQaZIKtZWwL+htV1nPe7eRYAI4CF3neStFudIWo+VbhHbstw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iU0dIwTv;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93821606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93821606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iU0dIwTv
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f066274caeso21643935ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567194; x=1796171994; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YKxHcqUXjQp/1J5J8B8/Kkrmh8UptW8ucEK7buHNuos=;
        b=iU0dIwTvZSJ3oZDT4s2CYWT8eyLf6vImduktWp4JC7yaK0FWQ2FlJA+deyc742kbWF
         QVwexeYViuIyKn++vmTxSfx/1MkWT+BOkKb3tF+tY959jNCyiwk8qs55tnTEDfhJ0M2T
         mvnq7CHLh2b3871yyE6nyAJzzjpQccc6OxjVrFjxtVafR4t2HxJzOoXkgYgYzH0J7Unq
         lggF1KAHJ2om0xtla7kj5dkZHHx6ItR9cpmK9okF7uEZxkN/GaJ4MOCIFXX0rIQtRv/H
         NeyLLGLYEUpwQs+E+lM1o8DK94HnoIZUoNjbfz6QB/NYepP1Pt/oTy6DP3ErzH5Cpi0B
         qK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567194; x=1796171994;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKxHcqUXjQp/1J5J8B8/Kkrmh8UptW8ucEK7buHNuos=;
        b=H3iO9ypJW9r7UFkTO1FtFSRU8uIWeInr2foKwiJ/oEEFOSmETdBN8HLZfCuGylsKEC
         eIwT2lIXo/zQRE2xFrueX6jsFPpcbEmT9KNhLMY2zcCZ+LJZjDGj2K5fWeN9gsPRvs9U
         AvHLNCqOL52dob9qjptj6WKnhBIaHUgwAuDMYkkublrosrUtbmEVIgl4AszNAGdVanVp
         payngOov1FNVsAXT7LtB6bNM/lsqQxcgNTqNtW/rROo1N2LgpU1sVsg7j9s2i1WezMuM
         ajWJMCR5TxKvKZsz2Nbvx7NRl6tlBH5/0yHCBbMA5fG3I2TUje2NzCwfH3KONSew02AB
         rBmA==
X-Forwarded-Encrypted: i=1; AL+hErFCLPIwgALx5R5mOUarpJAJwjBycMb/GVynZyN6E/aJHwub8MFpQi9wYH1c1ZDuvJU7Xa1QWQdjxOS4VhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AQJY8cK+2j5Vr2FdNXUrdQVV4VL3tLgVNBOisTCAxBsvM//G8
	xijrgqCkSu8GwkxOUh5eKxIScseJmTrx1SfP0TJ+9yUiXLnDLA0t9TY5OAp1jMOBJQ==
X-Gm-Gg: AZFdTZcnfZo9F+fgv/fp1nRJAwKqNd1MIK2uEICZrh50Zs2oybll24YXqGFWmigsEm9
	EO+t1vm3v6ceynxdDgzZ22p1jGmJDZk3+DNtsItuReTGXluDtlFnkv6enJQ9paUvC59vNptbxZO
	AJ8JiMYAKL1dccAd/IYpnw3NcrAbfvSb7LZCvo2YuViWDrVFrWG20BVwyY/nI0CqPUX1U1bn6RF
	XrTA4WmChwKtkKpY+4aIFqTZate+Bf4bUgeUdX13eKRXlywZF2uNCgICilznJpibB+zMaImkEni
	ORR8EcoLNrjoTFuQ3VEeduFFdX8g+dOP1ya6l5SpA5f/PRGldup//0CivylX6DBo94w+MmFKvQW
	IkTv+wmjU/DDWgysuvRD3jmeEnXNL1vCBRTBYWQ8Wxt5fT/TxWvROt/XTe1ODv5ivMr6my9IvlP
	+ZNQPQ47ZYKPdeTLEXlnkkGyjJOK7pb7VtEMOolVclRGUioymFGjHFuGL0xmwXCEHjy3p1DtrWD
	A5+GDmxdYbWfVndWbIq0pjY70TjAU00GrVHWnEZwq0MweUOW0+esmTtYZvp+ISKkMaFl/EzeZrl
	iJLltLzemeeXyZhopQ+3yOAAB0pW1gCfiClIkV1/8H8ww3Nx5g0wK/LGw2cfkJkJ
X-Received: by 2002:a17:902:eccf:b0:2f0:25ea:8fa8 with SMTP id d9443c01a7336-2f03f176abamr169618335ad.19.1795567193320;
        Tue, 24 Nov 2026 16:39:53 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm75603595ad.10.2026.11.24.16.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:39:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 16:39:52 -0800
Message-Id: <DN3VG4JCILOO.YN40XHHSWRPH@google.com>
Subject: Re: [PATCH v4 03/19] kho, memfd_luo: Reference struct kho_vmalloc
 via serialized pointer
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Tarun Sahu"
 <tarunsahu@google.com>
Cc: "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Mike Rapoport"
 <rppt@kernel.org>, <robin.murphy@arm.com>, <maz@kernel.org>,
 <will@kernel.org>, "David Matlack" <dmatlack@google.com>, "Alexander Graf"
 <graf@amazon.com>, <seanjc@google.com>, <jgg@nvidia.com>,
 <loganodell@google.com>, <arnd@arndb.de>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <oupton@kernel.org>, <alex@shazbot.org>, <gle.com@google.com>,
 <pbonzini@redhat.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 <kevin.tian@intel.com>, <joro@8bytes.org>, <kvmarm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <kexec@lists.infradead.org>,
 <kvm@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <skhawaja@google.com>,
 <sagis@google.com>, <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-4-tarunsahu@google.com>
 <2vxz4idb1i2w.fsf@kernel.org>
In-Reply-To: <2vxz4idb1i2w.fsf@kernel.org>

On Fri Nov 20, 2026 at 10:19 AM PST, Pratyush Yadav wrote:
[...]

>> +static size_t memfd_luo_ser_size(void)
>> +{
>> +	return sizeof(struct memfd_luo_ser) + sizeof(struct kho_vmalloc);
>> +}
>> +
>> +static struct memfd_luo_ser *memfd_luo_ser_init(void *mem)
>> +{
>> +	struct kho_vmalloc *kho_vmalloc =3D mem + sizeof(struct memfd_luo_ser)=
;
>> +	struct memfd_luo_ser *ser =3D mem;
>> +
>> +	KHOSER_STORE_PTR(ser->folios, kho_vmalloc);
>> +	return ser;
>> +}
>> +
>
> Hmm, I am not a huge fan of this. This makes doing such allocations
> quite annoying, and I reckon we will be seeing a fair bit of them in
> many places.
>
> The key observation here is that most file handlers need to allocate a
> bunch of preserved memory, but they usually can free it all at once. So
> we can get away with a very simple allocator that hands out memory
> linearly.
>
> I have sketched out some code for this, take a look at the patch below.
> Note that it is only compile tested.
>
> Perhaps give it a try and see if it does the job better.

I agree the manual packing in memfd_luo_ser_init() isn't great, but I'm
not sure we need an arena. This seems like something KHO slab support
will solve properly, and since kho_alloc_preserve() already takes a
size, KHO slab can be dropped in underneath it later without changing
any callers.

Until then, maybe we should just allocate struct kho_vmalloc separately
with kho_alloc_preserve() and accept wasting a folio per object. For
memfd that's one extra page per preserved file.
