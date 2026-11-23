Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419372;
	b=F3nXqD4NlyLk2A1kBJAc4Aa/OHVGqf2c4ItA3/NlQcL1A+yRHedVnW6F8BNuzPBfhEe3
	 Hn4g8NDLCtSGjFTpseU9sOQ/TIyPMcmMhINHMAwdohk7nj3D1dDNq6o3fUSP6J+HrhGsG
	 zhnFk5S++C318UtbSrZJvaHfox1ipR//LgW9xBEuI7Rdq7QcRPXEo5KPY7HoXFyvvWYbY
	 zzl4JZJktH0PpPgJdK23ZwMnv+HvDK+SVv7Q6/UftGrSFT/BMsc52rmPV248BflHngea9
	 zegOI/ji7FAT/DvDZWs1CYzWJ1FZR/ZzQweRwTEv5bPNas0lmdIlSw2hmZ+GsNZjB7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419372;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=eb1bmF8F2PVJN1FG3qeHre4JjGzW9zZyj8slSTuCErU=;
	b=WBQR5aSgT0lOGFTjtzo/X6AGmrbmis6CrjWtg71KpCTlmq8vFU9XQ67VPM2EgoVT2W2h
	 GZpcsQd4jLbgh9Znto/P3TbyWoYBWmd88+hToCWh2GDSMLPnxX8MD6hnJZY6jBmbPCYB2
	 OS5ZI4E5NVtZ1LucYjYxeYnI/Op4t8qvimKpBxWlVErBZFcRD+Tr1Ab8m+I8RUt5Vww8u
	 lKhbLeSWXw3SiO2kbGB42nAGqFx+v3e/9ZSjB2eUW+f3kFEVkfKjJM1DKo61IYnmhCZ7y
	 SBckTrfE+mwHuwoygA00ygIrUP/9htir0oM2mMk9AiKygTdmRcMHUix0Ed5lehdWWYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YYvIr9EH;
	arc=none smtp.remote-ip=95.215.58.145
Received: from mta1.migadu.com (out-145.mta1.migadu.com [95.215.58.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062CB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YYvIr9EH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GbNG4aEZgYnqy60cKkuKbdz31c//1P7sSXGaCQ5qE5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795419368; v=1; x=1796024168;
 b=YYvIr9EHb8oMW0yl9xYKYgzWue6MyNaCzF3Xo8NdEcZyUSU2qjyilfNv3rCpIZMKrMA3nVTp
 oyg3Ubyhvbt+AMWskEm9O/xyn4eXIfGFQ7CGMUjeAhB+DQvWFcpJ4T7at3T9/o3WU/8bK+m8SBY
 DgmhVIjb3DMX0NCYlXlmEo5E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d61e3db878656799;
	Mon, 23 Nov 2026 07:36:08 +0000
X-Mizu-Trace-ID: d61e3db878656799
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so6214e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:36:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErESNMfTNx58J3z8qJtvAzGwMuWhlza8D0R19UNxiyJXk4BDa7g43hv7elDfS5WLW94Yza531dgz8vU/JEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W+5haPTWbDV2D2WQ/yO01QevMag0ni7VxCOHJXXWIypB1JSLm
	p+ZK6YkmnTIjYFkfEDuP9rLr/qc9IYfwvzr1Bd7WcJ/d+ddHKS7g9Gy4kSud9F47UQumOivuZm4
	lQhQZOonNO+DJQb2fFKxXaqzqAD6Y22wluzEt7yvn
X-Received: by 2002:a05:6512:1250:b0:5c1:4cd1:131e with SMTP id
 2adb3069b0e04-5c21a261fbamr165167e87.11.1795419366920; Sun, 22 Nov 2026
 23:36:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120121638.194154-1-fuad.tabba@linux.dev> <20261120121638.194154-4-fuad.tabba@linux.dev>
 <6782b5ee-3dfe-4076-a79c-fbeb2c2ac7da@arm.com>
In-Reply-To: <6782b5ee-3dfe-4076-a79c-fbeb2c2ac7da@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 07:35:30 +0000
X-Gmail-Original-Message-ID: <CA+EHjTziXrRdR+guikKbj93Az96T+AMx_=0sVeyWG5C4fwaaTg@mail.gmail.com>
X-Gm-Features: Aa3M54qbIcVsswZvgTdf3Pr5w2t6747s-c6Tnij9t_PWy9hwC6gUmChWfQyq38Y
Message-ID: <CA+EHjTziXrRdR+guikKbj93Az96T+AMx_=0sVeyWG5C4fwaaTg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: mm: Don't defer the barriers when installing a
 fixmap entry
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ryan,

On Sat, 21 Nov 2026 11:01:49 +0000, Ryan Roberts <ryan.roberts@arm.com> wrote:
[...]
> > kernel then warns about a spurious translation fault. When kgdb stops a
> > CPU in lazy MMU mode, its breakpoint writes through FIX_TEXT_POKE0 can
> > fault the same way, and fail.
> >
> > Emit the barriers directly in __set_fixmap().
> >
> > Fixes: 5fdd05efa1cd3 ("arm64/mm: Batch barriers when updating kernel mappings")
>
> My memory might be betraying me, but I think this change went in before BBML3
> (BBML2_NOABORT)? In which case, the bug is only exposed by the latter series?

It did, and the set_swapper_pgd() path is only exposed by the later
series. The tag is for the kgdb path, which doesn't depend on BBML3.
When kgdb is entered from a breakpoint in process context,
in_interrupt() is false, so in lazy MMU mode the barriers for its
FIX_TEXT_POKE0 mapping are still deferred.

[...]
> > diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
[...]
> > @@ -127,7 +127,9 @@ void __set_fixmap(enum fixed_addresses idx,
> >          ptep = fixmap_pte(addr);
> >
> >          if (pgprot_val(flags)) {
> > -                __set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> > +                /* The slot must be usable on return, even in lazy MMU mode. */
> > +                __set_pte_nosync(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> > +                emit_pte_barriers();
>
> I wonder if it would be clearer to wrap __set_ptes():
>
> lazy_mmu_mode_pause()
> __set_ptes()
> lazy_mmu_mode_resume()

That would work. However, there's the stable backport. 6.18 has the
bug, but lazy_mmu_mode_pause() was added in 7.0, so 6.18.y would need
its own patch. This patch applies to 6.18 unchanged.

I'm happy with either, or with a followup patch in the same series.

Cheers,
/fuad
