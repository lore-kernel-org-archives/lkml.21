Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795406247;
	b=jTbmAvIf3HFsmU+Bm4u75UYbGWtccj7Kr705AXQarCkEp8d+G63n7pv7a/DmwN/dBR/c
	 uElIHq/Wk4zoVlmYuTaZHSxiUWQV/zv9Gj2zx1OoSiu40ZSmvygDQJI2wyjxHBpEgIhIM
	 XBu+Y3T9K7PmFxDohLvm3EGz8MfR0SDZVZzDKwl92YOb8fNtbbrNeJ2tMy0evRaat0n68
	 NH25qpdbNeuNNRObc7aeo9JYUCO5yJFh+D1B5Qi5c3QLYNYbIhzjm+koHstMT8EsOB45s
	 CmB7WywMltPRh2aHyVULXG3/C8TUPBksi1m8pK6DU/mQrrqy34t/9PPTK7LWdPeGrwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7qRxvbmJ28nrk2rOHhxSyhx4jr06fpL9CDPWnKHiTxk=;
	b=fAXZs1VEwFZvRPL9Re4JIfYDe9+ZNoH1oxoJGWWtrpr+KthNYZsV2hg3QmgzY2RuaYZg
	 rxYDEDodoALnP67Z+lAbOyfTw6iz+2DV1VUX/6G8tvht+sHIgFOCaxRco1mElqt8PPb8+
	 RELdsSRKZwm3EKDfthXvWzBvbOpSc34vZJn/bDDQQv0klDwhLX/DAt0rb6zBlnfqSQ/tD
	 skkg5pQcXr+3mly0ADoGNUFvcxGm9/wTUy+c7ootet6ELgek+jYfIB0HXhb4Kho0JnC9A
	 o5lklqVmRhWH9s381gIR2zB12Q998XzuxOHvJlpQkcRHYFzJ2n+0nmErZ/4ykl6GLbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCWfvhjg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.73
Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EBB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EBB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCWfvhjg
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-48fc51a37f3so500808f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:57:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795406245; cv=none;
        d=google.com; s=arc-20260327;
        b=h74Hoo0lRjfgE213tteJjgT86+VEcR9vsZDdanRnlbMb00XYoznO3N0vSyAFsbkxnw
         vwGIpwvY6oHWRHLmrT3E4Fm3vGzy1eGDBxU3rdd4L+7edLbgnlG8H1igF1JWBcBvYFog
         Iq+bEdt9DG0/XaADjoK+Dspj85EF0aR0gO5DvIGQDw56oLTOF9Nm7MEryi4BmzGAEPQT
         HnvtnyGr6WZ4fqX7VEUgJ33jqv8HHZlTelLY0yah+PLIESqUgeV9cJFZPLY4+3F4Xxec
         ua4CMV8AWDNbWltiBnhck/K6go39RPMvWSB3GHOiwJh4flFUpsacPtW7rB0BW2Df7uW8
         Rhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7qRxvbmJ28nrk2rOHhxSyhx4jr06fpL9CDPWnKHiTxk=;
        fh=aCEu11E6cDgr3C4F67R18xvi2BaUMRlf7T2ZSEVcUWQ=;
        b=YpOvkpKuISm4n+haMvORxorsR6IXSQie9NQeKNiqzqBOBQtZMHMG3u/iN16E/hD1Iz
         ZWs/Jh+JY8Z3lXrMcCIQ1IHEH8cGWFdKTdY4DALtLw0ToXYU4hxgu6RWrJJpXMawCAD7
         4xwxR8I/QB3CqGkc6rxzuz3DAHUbeTcem2JXjpwcflX8VM+XsI3rcnONJ7vtQ5pXcfqG
         71Tqqd1VgQbqtvX8dRVjux1VrIFYY36ujzRGw5h0wMF9NbHLnXmWEWVlp5D/wELQ7UjI
         QFCYkW6R36NrGV9YRd6TKxiD7l6S3mIE0GD3NFyoWnRfcmQAZPpDOWgxrzvEx0q8pT3G
         wJ5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795406245; x=1796011045; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7qRxvbmJ28nrk2rOHhxSyhx4jr06fpL9CDPWnKHiTxk=;
        b=QCWfvhjg1m9QtL8T0G+h+zEd6lBaR/9OWJHUPxW4XfWPVxY9CDbMA4baszoRmDLzOS
         9R9BH81IXYMM6Zj4mURHSPNHRUpBQQ0PsNrD1wNUeZebYRaJ9MR3VuXJhBLjeufojYVY
         UGBVjb0eiBfVc951zq09FZcqJGhEohQq54iPOLWHR99LgnBlRuSVomsvKsfPetews4oX
         qH7qgmJ/IZq+UPb8+BXDqubM+DiNHXTWHp1oSs7YN809G4An4Xb5c03lyzvIU4493SYV
         PGoLX2+I0GPDO9XpTritwSGSBIkWpDPmAncXDayTEWnqoV89CvDhUUM6HEX8EbWxMflj
         ochQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406245; x=1796011045;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7qRxvbmJ28nrk2rOHhxSyhx4jr06fpL9CDPWnKHiTxk=;
        b=vwFcnkkAldpaZVFgAJKns4+Q5u5493wKvtzMB1kpw/2q67jSuSEk6/OWAXYNHYya8R
         mH7SGusyswe4Bjh5vrVtnZXEXzPL00cZcIaE9yCYAAuJpvEqW3459I/b3e64Q0bBzeUk
         wMrvyJshbsKqgGrqGzzHS15yepiWWBaImm04jLfLpXAuS96GcHlTayiDkYKjflNrX9YI
         C04CW9Ks95Wcails8tJ1qbX+kWMKN/GqsT1pblvlZybx6ByLXCHlawV0iNfTrhpPvjjU
         Qf5fDBXW+8ZF2vVU5DxPIfnopqqPJZHV1yV7BQrd2XIwrXYXPCG9Jkz9Ck0TBG3GEQju
         UYRA==
X-Forwarded-Encrypted: i=1; AL+hErGydrsXVh7yJC2U+ndIqC6qVLRGHSd2GDd31pJwLey+KBDH1R9tlpszny0HyirM1zQ6+vznHzEVqPbMrto=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K2fcrrCqdToHeV1Rkmmhmj3eFYfG81OCsztDpGFYtdqddXywl
	U4lg1gpKZX6v3tZQMRX/22bGdpWs6rJND4Am/5E8wfy13FzNKK5z4QwmQ6HpGASFkv2xmAn9M+/
	b4RqqKi138rVf/Hf5266dgxJ0vDjVKOw=
X-Gm-Gg: AZFdTZcEwKnswovbna2RsA/OA+5QBrr/5bKXucM4bOv69uDLSMtnRAZWHgxxJjlzo1B
	nhclcxjeJRagInrd09eKxvnYY0dI5CgmBeqAbkTLL27SMFb15MIZyPfKM2fIxpD/5+E089cEMvF
	h7A6kRv1yAFEwxuqh4hAvQTNZwWA5/JJCmGDZDqAqBXikPp54rhEFSK1iIsBLlAwVkzWpkrsK9a
	hWyizNl3wvtHUTZWwZSJWQbrgNz9HVv1s9oCVcHb5Y+3X9oHO9AnxDvzTHhLfH1noUD8w9m8i7D
	bKoyV790UI6xXFj2zAMyjZKspwMFPYONBPaU1UGtkY1x6Elo4mxeEOei2YFCq2G5HQVyOINur9v
	rMbTaPdFwaEmbCNgcAJrdqnGEgMoBpWdGfeXgzdLAvFoUHEG1VIsdZL8z0fnuUgEByoai6Xb79j
	hKbYESUVmpQ8IjA8CuaKBGkbP6irhDsLZSnyieiBiHE28K5u9c/eT5bywd+/mOSwWWgHctJKZsq
	fTtlr4a3Ysh9cr8
X-Received: by 2002:a05:6000:4a07:b0:4a7:14d0:9c4c with SMTP id
 ffacd0b85a97d-4abab02c4femr18518479f8f.6.1795406245121; Sun, 22 Nov 2026
 19:57:25 -0800 (PST)
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
 <20261123003036.GCawOJLKK1iX47XTDm@fat_crate.local> <CAP01T77EgbuyhP=zU9L1hwYL6rHaSbrqQZGJR_+9AQgSWLe7Nw@mail.gmail.com>
 <20261123025529.GDawOrIQcDOPhgWwF6@fat_crate.local>
In-Reply-To: <20261123025529.GDawOrIQcDOPhgWwF6@fat_crate.local>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Mon, 23 Nov 2026 04:56:46 +0100
X-Gm-Features: Aa3M54qn3A-QVn6NC3O24c8qZLQ9Y3TsEAAFoy_M2WjIHYuU1yPw-r9md-0eGAI
Message-ID: <CAP01T75Qps8bKFZAU2gN-3UJTB1aWw46NG5c-sm6K028rSc9sA@mail.gmail.com>
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

On Mon, 23 Nov 2026 at 03:55, Borislav Petkov <bp@alien8.de> wrote:
>
> On Mon, Nov 23, 2026 at 01:59:32AM +0100, Kumar Kartikeya Dwivedi wrote:
> > I also don't understand your security concern.
>
> Was:
>
> "the only line of defense is for is_bpf_text_address() to really DTRT."
>
> not clear?
>
> Do you want me to elaborate?

Yes, please elaborate, because I am not sure why you think that is a
huge problem.

You're treating that function as if it's an unknown, untrusted black
box that can break anytime.
It finds out whether the fault originated in a BPF program. What does
DTRT mean apart from that?
If it starts firing for normal kernel code, this would be the last
place to break. That would be our bug to fix.

In fact, for kernel address faults, we already invoke it for exception
handling. This change would simply extend that to user address faults,
optionally for BPF code; otherwise, we panic as usual.

So I don't think it's a useful argument, except if it stems from "I
don't trust anything BPF", which is not productive.

I am happy to engage with any actual material concerns. So far I
haven't seen any except you being constantly dismissive.

>
> [...]
