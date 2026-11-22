Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795384812;
	b=Xc2dQBCDUpE9+wM+p6WSZAkJKvNLdlpagygZTnn/v3nBF9kL7UcvYbvdHkm7F978n1Ze
	 vxpnERNSUB4U0KBbZfx6RljnSoaHXIbBg2LotBueL0IZMTW2GwhNecTMXVLAcvwXBbcAy
	 ZkFXIEpY6Ot4CMarBYaMl+agXUXbBmsORU+4pEo+STCv98Tm2WCYOtPSNX24Q1MF1g5Bs
	 LvPYAEA0+pPKWylVnzrUW4d6XDLWTyZjH6e8y3gFrQujCmIOYrBk18kvgj/VbihshxisU
	 UOTwjt7akZkvVQJVkShfak6FIEFnOL0xAdiRK9R4dMS+mfSm3U4KBh/0hM78jTCPjDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ObBx2wLZ1lWaJ7WR4wKxB7SLrTibQ+FBYE6OiDtedCw=;
	b=B0s9gdIxlDsaj3mFV6cwHyYz2fwnp5BK32Wnf8brFPh4ZvU8LmuFYOrJJaBH14WkF2Uv
	 A9eWjytLwtnC7vKU6LKuNFHL4MRQMIMK7351wdXyJVUdvGzgT6fuXQicoHjSBUn+S5kwH
	 hV+jWfhNET+eFpqtnQGzx/IOEfG0QhPKdg2KJixwN3MgqfHCYg3+5P825KGvDdjxjXN2g
	 9AyrfYs9RNP1IHtPFFi9g2YAdd09wue0MOJSsH5AAtubIRsfPOvCWFvXfMONnhJ2mnWjF
	 2TVJwAj9GLIfZsitxWtU1eXM5Eno0alW7p1NJbbL8UXS1t33g1LWBCXvE+XQFJzj8Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhqDne6S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DA7606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65DA7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhqDne6S
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b76ade741cso5036865e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:00:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795384811; cv=none;
        d=google.com; s=arc-20260327;
        b=iDP1/v2u3LRWCmOiZ3/29+v/UM2adkMKyznoTtUBXMualhUUKKsqMElfSQolbL6Vyg
         pX3DQSFp7EWbneVw8gSV25Ok9T1rg5pg9SYHlv4pJh9Dj5SnTFOBVX8J6aV/4oYZdwkd
         /G/yYWrevappaQUqRO2Gcmy5+VmE5NSGvnqq7E7dUiJ7YVG08EigNXe4Ot9Q+iZZB+RM
         1VUwo7cK///Gvt2w+E2v4xC3zdIwMCIp1UHBnTxq0ihrELL5ASurNRHQs31iiouMjuSq
         o+gbIY3JAMrkUr3XtUtNayOcAtJ5SbV8ZGXgrHn7AwYmsJ3dRNZI62G/IwS1jGQiNM9x
         KQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ObBx2wLZ1lWaJ7WR4wKxB7SLrTibQ+FBYE6OiDtedCw=;
        fh=CwND6x9tTPrtbRE3QG5G+rmrHMnKfvmf+yDqp/EpjRc=;
        b=gEVFtGGxMsy6qYDThWHyrwVUo9+2LoyVXW6XZ2v4Qoa19/fen2iLV4C1su4snHPPwx
         fhkSwCcXajeLfylnhOSMEulXbUMssA4sRoe4oONTrOqCqJ6nZKxqIZx1xcb3Ch7sIagP
         lnpfEvAfBAn/9RKfRAoX4BXU4NAsCUZnMVZuz+HhNpiIvP4UBACt1CkPyweQVuKQi5le
         oDVvm7+O7RU6wli5gpjUbS1ONjzdlVpmIG2bfIqR2b4eqk3yXWUW798C+6iD5UONNHBS
         FuF2/n4fZtg4yxChmCxoLHrB71uVlnMU29z4YHtdWjYhgHSR7QXVITo9bPGs7K3ZuEu1
         w4dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795384811; x=1795989611; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObBx2wLZ1lWaJ7WR4wKxB7SLrTibQ+FBYE6OiDtedCw=;
        b=UhqDne6Sjsmz/gFJDlnpTGiRkCQk7BhFefRCnayt5PM04MlSS93kPtBgfQ2UCDmZi5
         isOVkQBBPnKJ91kg0nJWpdhTZ8YIN0NDPkmjMeAadLTbF08E26JM2nWuflnhhz26pxBg
         i2Ksvqa9V/9hcb0DX3Loi3pPBm/OekYrVixGrUO5cEvJv0OKvkCnVTBYpJW3xtTuQThN
         VIH0fLy/7hAhmoviSLEE2nhwpQOdGtG0j2DRLwatgx6/DYBZlIyOPPJ03iKtmFbYe4Dm
         QpKy+5BnlSHJDEhZ4BNBe8zBD/zrECWw/g6VA04eIftthBnPKcTGBlnOWomMPYDnO9sU
         9V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795384811; x=1795989611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ObBx2wLZ1lWaJ7WR4wKxB7SLrTibQ+FBYE6OiDtedCw=;
        b=km859XLLcUScnpdeGl9d4MfgpuDAyW4aLG/i1DQq4WbRP1h3LBI28bGVqUkdcBlGfv
         Tk4ftyg6glMRbBXM10AbX7lH8Js52zdigA2RYuPQjXSLmQrmGVCt7ra/IvbUBEPmaOwN
         nu5f/zV0jAj3HoGrRQDe9XwzfXDmtwQ/J0wcqIL7eScS2w8ztB2n247+51Dav/a17KaG
         G6PMVd9RxCNPIiljnyYa6HT/7hZ/FYU4NzePLQImPfnMrlJhgncKXaFxLADxBRq6Tic7
         AWEYQY38bIRFl8hO8ql3snKbhWodQ4tSdB84svAEdUGM1Vw7upmKZjdI9PoIgShDZByT
         kz+g==
X-Forwarded-Encrypted: i=1; AL+hErE7ux8wJVVGaERcGxnmTp9OQfqzyE6zVGTDK/uHDigjQrlP1nrfni76E7l12sBjx5MoSGO/qKUR68EWPgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z91oUuVXm6gmGbgpv2g1zCl4h6IAKxUWUwJVQjKV5YYVK1uPJfR
	aOO4vpgTUJ/xxA57lsZwLgtWQSqzOcITligLyaKDJGwcGop+88JFzBq9EsEI9cldw5kX+l4HFKx
	ISQ0Uzprr3/+S7DJ6/8v5wYIirXoVc8E=
X-Gm-Gg: AZFdTZf3IFnBTzGlKbYjjNhIaxtN32T01JbpLUQvqnzvKWtI4Ul+PA/21DU4yV5hgwf
	qrf/ZS+517GuchJfl/vlpNKUUik/Sj+uH7D74QUxn++B2luOS5TodW47yQ6393IOlmHo6kI6ZIH
	YJCwpE0E7LOl6eLx+Q5A5h/+z2qEDuyD3ls5oNh7rzZi5os1nove7E5dggToje8jb99nowH77Q3
	tgYXNdqHuhRPVrHGvgKseQd8TZ6UZOlgIII4lI3vZxgqdMVu2BZtsIcfzkkowjf0e69l+kriZCm
	mKJC0sjQhzDW3FFDQBNmeh3yfA5kv3DSOKSq+xcNm3OHP7+y1kQM/gP9cAbIl2OmkLWpzXNw+Vp
	pgAlGiuirSmiMYRyNFBARYekMgW/wLeXRnCdsU0ZD0j7BIqb9kryzS93nM5xyqeeEiv7HkPLzAW
	dUWthtiFdLP5STow10qLZPvgkyrmOmFpODCbY807T9WfQPt1v81odb32alsm+nnVmeR8IFH6VgD
	QELapMHGnbgwaaorpXaUFe8xe3P3C8PokWXZ8Y=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id
 5b1f17b1804b1-4bb8881c630mr214065435e9.27.1795384810518; Sun, 22 Nov 2026
 14:00:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009024925.3169077-1-memxor@gmail.com> <20261009024925.3169077-2-memxor@gmail.com>
 <20261009041346.GHashp-hYpLl-o-l3M@fat_crate.local> <DM0ESVBT9553.2S1RWK1W7M8WW@gmail.com>
 <20261122200848.GBawNL0FcQoK918YDI@fat_crate.local>
In-Reply-To: <20261122200848.GBawNL0FcQoK918YDI@fat_crate.local>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sun, 22 Nov 2026 22:59:33 +0100
X-Gm-Features: Aa3M54qKKhsUFTei5EMS4AX7nLbtFO46YTvZfgyv2aoJQjyCxd2fcTrkMQbysJA
Message-ID: <CAP01T746W=8FFiJJUM3H-Qv09uRO6-XEi9B-8pjSgtpAPBx4EA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups for
 user address faults under SMAP
To: Borislav Petkov <bp@alien8.de>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	kkd@meta.com, kernel-team@meta.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello, Boris.

On Sun, 22 Nov 2026 at 21:09, Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Oct 09, 2026 at 05:23:13PM +0200, Kumar Kartikeya Dwivedi wrote:
> > The advantage is losing significant amount of code size in JITed programs and
> > the associated runtime overhead (you can see the numbers in the cover letter).
> >
> > Do note that we can make it more generic, we can follow up and optimize
> > copy_from_kernel_nofault() with cpu_feature_enabled(X86_FEATURE_SMAP) as well.
> > But I didn't want to go there just yet. I am happy to work on a follow up if so
> > desired.
>
> So we basically disable SMAP around bpf programs when they are about to
> accesss potentially stale memory and the only line of defense is for
> is_bpf_text_address() to really DTRT.
>
> And once we open the floodgates here, I'm sure you bpf folks will find another
> creative way to flip the kernel on its head.
>
> And all that just to save some bytes.
>
> Sorry, this is simply not worth the risk from where I am standing.

But wouldn't this be strictly contained to BPF programs? I am also
fine putting this behavior behind a CONFIG_BPF_SYSCALL guard. The
kernel will panic in this path otherwise. We just want it to handle
the exception when the fault comes from BPF.

So I am not sure I see how this risks making things worse for anyone
else. It's not about saving some bytes, if you look at the cover
letter, we reduce significant amount of code and associated overhead
from programs running in hot paths.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
