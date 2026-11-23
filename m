Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795395611;
	b=B2pWs5zFjj0rcjjyydbxJ2QnkliYirfrkJm26OR5jf0zmX9+q5sfXtQMwKB8i+yVhVf0
	 XSSSquIRVK2gGgeuyoI3w173tC+P4xtWwWkOt1808lgSmrSlGQY64/7LwgiarC1eQxe9J
	 1ohdbPFUQGtbG6YKG2YLCuyUSH/Rr0idFOfkWZ5TK+44FpqzQR7amkT8KyuC5Ydf26JXD
	 aNXQDRpbO8ksfr10SiuMUH3AlQrfnGgcQiVNu1tlnRxvKTogBKjr638/oJ797wdyRdY1m
	 eMtb/3i7q4PH+qyqpwbNFopxleCfU/nF+QzeHO2LMmDtm2apBQvIkgP0eqfXpSJ+Kag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=piG+kL4iC1Z4Hpe7xi5Xl4SWpL8eCvTsaqDj3n9+VHY=;
	b=45+272XA0ejN+B1vgfHdbR++Asip08CKPoky1afRPvyRxpmCYlgJqEaklAa58BI6uXnz
	 4ysY7o3P3iVN6jVcPYCSaTMRD2WcvZS203PAReMj5QB/tFY+ZAh4+beK4e1sraPuSYzeV
	 EZCNtUgUsZ6Vy8G5rG9yptWDqQL9EFZXNEKiOzxgl80kvlHIbVMV/4Fb1oxdAcsrT76mK
	 W4J0YeSGSKls2NUwvqeKL5PaL7bFzsB+pvsbHszmcOOO/wkfOlbKUP6r/zweI39I1ybqW
	 QE/Y9Cwjf9zbFaWuKMa3M575Vd7/1KinMC8mWIYWJ5gcHE3m8A1CMrhTph2ekkLtUEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zfX3rwEI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.64
Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE41606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE41606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zfX3rwEI
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-4a38f5e9aabso211189f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:00:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795395610; cv=none;
        d=google.com; s=arc-20260327;
        b=lNM9FGkcbdRM31Sp7LukD1jnCoPGuIFPSr7L0Nlmn+ouFv8qwqLOM33fOuVVVzgfCl
         22bGgF4KPuoWomoLzwgIseC+T41s45qOTLD3+swQ3zY7yJbDjCfq2j3R4O9+Hb0odnB1
         Sd3rxiao19g+JNYTl4X1qGWoxwwVxKcNT0zAUooqnQ9wFEKPTWGRTJm4/jfbO891mCEH
         6bi6Kg8lLcR7Tacn4Ph2L25rWCgE2O27+4VU1gwIXTJ0itso0slmVYmJa83j1SpNb2H7
         WJbNngFJ8azgiZ+LB1gaFwIBOot0P4oWrKnxzk2nGisn4WpSvt/SoVVWlDQkfxw2eEo7
         rT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=piG+kL4iC1Z4Hpe7xi5Xl4SWpL8eCvTsaqDj3n9+VHY=;
        fh=In+mV8K3mjr81gV0XylThbEQT5cZu6/eGbX7gi5ukzs=;
        b=BZYh2nJqAhEkJwJafAFdwtvXWSW2ASebajnAytJVlG1yf2l1cnRSGHSFk3VMlgMm/3
         Z7sSHVjXpV/aExYJyLIiNHRcsE+w+3K8Ddz18OVqr1bOANYUhaTbw6IwX4ye/n0bWg0F
         b2QgtQCS2npru6Y8WeD8b2em6ic+UU00/zIuOiyYhrEV79zNTWB3a4C+j9SmAWfgHv4T
         Z3iUROOipq4hRz14u7LfhlU1/O0ngYbtz9tQJDeKza/1zZgwxCQpEMR6smZM/qDUlJSF
         wQJ9dfx2tMPcTwH6QBKXTyWvw+FWLvpChb+WSYWhVjPW3LWN9YI9nkDqnQcqqQWdEsX0
         rhUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795395610; x=1796000410; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piG+kL4iC1Z4Hpe7xi5Xl4SWpL8eCvTsaqDj3n9+VHY=;
        b=zfX3rwEIZ4ZO/jWh2ws3j4Y3Aa9Kc/xx3cnFdFkVAkJaPk2BM3l5XRcFpoSR7q+YiC
         6j5dTQRhOIjVE+zM1agQ4QU38WcG3aO8/8qeAR23noGcTrNmXyBNK0F9kHwMF2oan1+U
         AnQOLnlXW3gOudzhRe1ISQpOcJ7uL5Tg9ECgnfW7hezDZIiINeJR5YV6VbemoyBQ5xf7
         BtBJ+XPxjue2tflFEm6xcM+QVU98LDPI2eB9jHMFAmG3IIKAWsxDKnbjMGbDvLFo6++n
         4pgqlQAb7qKsTqvcFu1fYqoJwfvWFBrPUaL/ZRrjxDXCPMzwHGtn4BDIqSLMk1luC7kP
         sR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795395610; x=1796000410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=piG+kL4iC1Z4Hpe7xi5Xl4SWpL8eCvTsaqDj3n9+VHY=;
        b=VMECZ0iNVY7Mh0258LREHvqf9WzVMji6z3d21LSa8bGwkjzi6vUDf9U4AIOzOKgz4S
         nxWPiOLqbxgACnXF/Q0JpdX4cdgSqCmhHG5CmOvgknJvvWM9KfAQlob2vUjoMPUdUqJt
         BGK+LQ0vr39qXaP7zEypJ2HYZkma6/TdllA5pDbJoxCZA1xyu1996be+iruFpzwK6Cja
         hiCO/VA4oz+WzlMw0D9rUpas6dLESCXkC+hIUu1jYd2WSbvVd48GUpzzBu8AKDIAWMT2
         +czJh9imVMvttJRTC1EvPiG7U/dkN08BdPCaWgbnCXCzYKYyIC6OWveauQhUrcbVXtGl
         DfLA==
X-Forwarded-Encrypted: i=1; AL+hErF+JITbBIFWxOCD1me5PsvPHYZUAFtWIoi2A2OYou7yOfz9TMOPo0WniNmU2aoY6CjuM8L4fpQms8tGb9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bqx0w2KkbeqNJvicC/CQ2ayM6e/Q7ULzhBBgDYSxo/UXPHv0T
	nPs6eaQHYfIBXE8B1XOGXm0DzMeH+3A8vDOxiyqBkPqhjMnqcj4t0tNyx8pq0i3y3NXkhw+g8uK
	eF7zzuB++pTnGCCfZKV9PFBPIJ1mwG10=
X-Gm-Gg: AZFdTZfpYHRJ2ceLSi5V4qwaRLg5U2RbI0Hxff6nOfErl2+iHWOcStPwOnK0Hr9vb1e
	7yQpvwzBTtFfrik6+6sThTMFbPNm7PH09IWX1sf/lp1U1fANJade7JzArNjBIts3yaXadZjHB/3
	1oRiUVw6xo1n5jhc4s5CMST01dyaVD/FmgiEbfUb3RQhNS5ERF700dGBkrgh5+xCqPhAyZS4iGZ
	mge3kIk2gAx5/G00ihcdQXALGmtwnRSwrqLMXBRQqwfH+ug693D5gY8GKQHHu+nXR6UUfxFqJ6A
	VquT+jv2XL8reAppy0jCYbrLtObz3YSZOwcASjyqQprOLdRDwsBBkOcWNTZWUqz+K1GqiKIU+T8
	DFkrP2E0c5eeiOKS5x2gGpfxkyyqRfyFarINPsXaz2SxWGJff1yF/2Ocri7REL029j2SHbgPidi
	2ZBpH3TDmUfmFeMD9spy5GaOYU4khnz/Q3u7LHu1UM1HOozPV+UUWUXD7YDEsk3HIwWcAs9pxWj
	6rJK1oMS0XYV89B
X-Received: by 2002:adf:f192:0:b0:491:e477:6820 with SMTP id
 ffacd0b85a97d-4abb3a4d388mr14634915f8f.20.1795395609469; Sun, 22 Nov 2026
 17:00:09 -0800 (PST)
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
 <20261122200848.GBawNL0FcQoK918YDI@fat_crate.local> <CAP01T746W=8FFiJJUM3H-Qv09uRO6-XEi9B-8pjSgtpAPBx4EA@mail.gmail.com>
 <20261123003036.GCawOJLKK1iX47XTDm@fat_crate.local>
In-Reply-To: <20261123003036.GCawOJLKK1iX47XTDm@fat_crate.local>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Mon, 23 Nov 2026 01:59:32 +0100
X-Gm-Features: Aa3M54qOPnpUyDXKZHWNCJGKCw1YeuvD3U8ZqfH5NfXKEBHeXQ6oONmoTr3LDGc
Message-ID: <CAP01T77EgbuyhP=zU9L1hwYL6rHaSbrqQZGJR_+9AQgSWLe7Nw@mail.gmail.com>
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

On Mon, 23 Nov 2026 at 01:31, Borislav Petkov <bp@alien8.de> wrote:
>
> On Sun, Nov 22, 2026 at 10:59:33PM +0100, Kumar Kartikeya Dwivedi wrote:
> > So I am not sure I see how this risks making things worse for anyone
> > else. It's not about saving some bytes, if you look at the cover
> > letter, we reduce significant amount of code and associated overhead
> > from programs running in hot paths.
>
> Lemme summarize our "discussion":
>
> Boris: you're subverting SMAP security.
>
> Kumar: but but, performance. And we're special.
>
> Nope, not good enough.
>
> You need to go back to the drawing board and massage your bpf program until it
> doesn't need any hackery like that.
>
> I dunno, tag the pointer, massage it so that it causes a "normal" page fault
> like it would happen for any other userspace program, whatever. Just not this.

We already handle it properly. The only practical difference without
this patch is that we pay extra overhead to handle such addresses. It
would be useful to shift the cost into the fault handler, since common
programs instrumented with the relevant sanitization do not exercise
it, but still pay the cost.

I also don't understand your security concern. Since the destination
register will be written to zero, I don't see how the program gains
any new capabilities or reads anything. It cannot use this to bypass
SMAP protection.

Thus far, I've tried to provide reasonable explanations for this
change and clarified how it impacts nothing other than BPF's own
behavior. At that point in the fault handler, without this exception
handling fixup, the kernel will panic.

Instead of paying instrumentation overhead to get to that point, we'd
like to shift that cost to that path, that is already otherwise going
to lead to a panic, to instead continue the BPF program.

I don't think being dismissive, telling us to "go back to the drawing
board" without understanding how BPF works, or arguing "BPF people
will do bad things to the kernel if we accept this" leads to a
productive discussion.

>
> HTH.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
