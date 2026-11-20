Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795193142;
	b=fgDKCqUGPOEuKSfvNlVeFdBaKSLRaibJs7x3EyN90GNH+dLe68QbOx5FJe1/nArryh2L
	 /YWWwtI7AnL91etJnYTqO4hjRR9i/ypUIWU7stsQejhmImXdqEa8fciUnjXCArdV5OGnR
	 cpLCmEP9QKBRjUkcQt3O6qgmDBUQllmAmvfob++sY+EeMtlSk+Ie8qJSHW6HsCceoM1fi
	 GCUliLaYYmylEa2vy3XBfIABlf8MTrAs1P/VUvKY3zfZPC1xmBpKBQQbPcC8pUeFp5++t
	 eWV7+BG90DQzcpLmYDEXMXCgDrS4kTR1bH/N/Hoi7o90vfRFsiFk6OjozCi29XxThfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RMmxjj/8QhU7aBzSpEUAw1zUdegQbA0uznrcxfggQeE=;
	b=x+ghxK1Ve1uPMr9lA2+izdBOo+JBEE5tcQ+EleZefjPrdTWmKxJMo/vTwVXPogV6PKik
	 lecBSU/h////2w1Qxy27rRxvuFET+pBFHJp7yfCwrMokxV2ODfoltpBCIgXz230/AhjDg
	 SgjereEW/kPeXv641aPy/V8rLb3R6KyOiCDa/RgNwUkTArYR0MrFCHeRte2m4a5E20dem
	 orWbKL+IDvKrMJ552vbsd+ANk7BfGdeNbuTfPztD9K/5ovZbXxiAkbCvgzMpuhVRBFUW6
	 E3KqbwjUImQ/0dy0XJtHMnH7zwdMBWTyrrWAOM8wFbNSSlRl6y9dYmu0nCLwv0JaewQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tk4QqgJg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A320A606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A320A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tk4QqgJg
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so152316566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795193140; cv=none;
        d=google.com; s=arc-20260327;
        b=SO8tHHLBkLONVgcsXDNi7i5Zm8006eArDSqmzEg5JbVwAE1JMtUS1d7DUQ2xqkDZT4
         DDA43eYwKSNExNEsDsrOdX0oA4hHB6xTEKHCjj+kTARf6NX4q+ku5AeCpBCyqxLwhKrQ
         YHgTRQlbqdLVhUIZCXGBQLPB5r9ZkKbrXeBAkZpBdEi1HBNld3I67Uovf7HBsKcZh2/z
         FNvh9O+fR7wLHrqCdw6NCSZnJ0DVrApurp/YRIG1aPadhx/z7SoXcpE9bFakuVvstm16
         aXvsNaqzVtBCJcDWy+gYAacA54lnK40G+1TG3bkP/dL53c7Xbxob8Gb4gRPqzYN+jkgM
         z7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=RMmxjj/8QhU7aBzSpEUAw1zUdegQbA0uznrcxfggQeE=;
        fh=YiP01TdnKVzQyFSyhRLJe/lbWkaTac0m3l4bRO1gCM4=;
        b=ZqI/3vOpAq/8Y36FxAkLR19o3YteuZlwRenLWeCvGiE/EssEM/d8moR+HYNAoUARI0
         EkmvW9HzMQd1rrSVuxnE7gwyEg+Hu8EIS076zXO9y+07czuzD9rnxLNfpRGDY+sQ+yOz
         0E0BfTR6QAUR+cyEDY2j5k89jIp2GtAfqOdD8m4Y6DxDxXC5dVIdstzP+T1LjEEqYDbj
         d6rkcabSK/lWnCJxxhc+LTtoifi8vDg7Z6QbtuXA8OsO8P6EFQSqHiVblUIfFyeDPlLC
         xkal8qAInT/F8dU4/MkxJQ8d8WRklQwrciXz1BF4ooFECC07LIR/b1KdhFcxfkGj9CuZ
         wY4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795193140; x=1795797940; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMmxjj/8QhU7aBzSpEUAw1zUdegQbA0uznrcxfggQeE=;
        b=tk4QqgJgoAj2Av1H2+cxL6+9Uu+LXu3D84VExxEQdCWNnlA4xWgM1kZybwrk0e7f3/
         81hW8iHRIslos+yrFoWfcaV+p4/p4p9j/uruPLmC1TWEN/WIAeg5WsHlqhJ/mHddqMRf
         yf/HLemYs9YZwAXCj3GXiwuikVqa/t6nBhJwS1admnDdo754XJpQ/G29HF9usAT0vPsd
         JrMZEAHmDHwHMCkqEU4crzHXes9lb8WfikV+WI/rPlAwIb1JdtgaHQ9hjWNAGXotfWel
         8KDZXVhc8QN5Hc9q1+Bd/Kffds/cVrEr0UiJUxvgrSs6u7Lx7qFgq79t9zQEzUSwCDSY
         sutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193140; x=1795797940;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RMmxjj/8QhU7aBzSpEUAw1zUdegQbA0uznrcxfggQeE=;
        b=cii3h1tIQu7Khxgdg7CyagT9mkdpTGi54U5qjd8zdxwFduvRRjrfoK2UOFl10ka6wA
         FXVTihKmfskOWCYI8uAqMgDmOv+2zMtd/P43J3DZrwio6GvMDT92BRRIYerjXYuVzWZK
         iySk3HI+3WaosYQyQO5Sqi8ueHzIOCADHBv9yGToQJ3WEyHYTb+cf9deiswTSGLi3KUh
         UpVrIArGY/fRem9QdvdhyHlyJIcO9Igr5z/U9ZFtZ8VRiP1vBdg7x/5fuXlTJiEYeI5g
         3wbIMH4jzc4oGy0X51379+/Hu6tJH1j6egBOeXAVT2wPSGFkn3XK/gAqLhDZj4xMmS1L
         8JFg==
X-Forwarded-Encrypted: i=1; AL+hErFZBOa9I1c7iXjG0XwfkMxnEkMAMIB5QrsAuvRIgg7MLJLyZm4sXw6CDGtxOYQNNni5ad7jaIkJs/aIzm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2yXg7ysnrtpBv/pk+Pr9KHIsL48mi100z6an1QIlKj/98XRC8
	nSL1hirFCjj9gIdjCWLfFnbEfRP4SH6a9gghtaq47SAakI170IyTw77VxBQpet8BF9K1HeZMosD
	XnQMjFTgktCGiXjR1FNCn/DaUesckRTw=
X-Gm-Gg: AYBFou1xnrC+DRxoni9/+2SNBvgGcFRvChiw2HPnfcerhEqSG/9EV3DKk5h9tkBFD1u
	zFfpqWvha0pVfeStEOFecTdNeRQwHa6stnokdxcaXexrZOhPgi2wENlXKlKbsrXFZSK7XQe9UC5
	RamUJeOcXLMCWlKinWJ6ckxQQJJgtAhrEcVvXErMYJCnQZvXyBAnPmAclKmjo1adNLSXTH1aDue
	icnwyRkkl0Cc9L9bdEwaBtIdsxvWiSPN2Z2ex/5VfDtBlYj2EIOtzp2Rrg4cANFg2RqoavF+K/X
	2ME9nlsD+lp3S7r4cuYnAVfU6XwUEkxulaSrVVUkpzeTYivC1XtJmQFOx0H2u+ubwBE4sbGHEU7
	skaaru+YEoD25bz7mFgXrrqEhY7zC0V2bwDaW
X-Received: by 2002:a17:907:c643:10b0:c2e:4292:d27e with SMTP id
 a640c23a62f3a-c513a816d3amr277735666b.22.1795193139940; Fri, 20 Nov 2026
 08:45:39 -0800 (PST)
Received: from 118528743069 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 08:45:39 -0800
From: Christian <servidorjarvis1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <b0db3d3a-4715-4a07-9532-d07ffbf3bada@intel.com>
References: <CAMas6S2z+9-TyTfFTRDM+Qk2rKpRoYAUJSvmMxEwG6eAnQQn-w@mail.gmail.com>
 <066e8503-2e25-4666-9f55-f62b7592854e@intel.com> <CAMas6S2OpEag7VQAtHaFrho8VF883+EpL9XpO_sTV=ZLpmDJsA@mail.gmail.com>
 <b0db3d3a-4715-4a07-9532-d07ffbf3bada@intel.com>
Date: Fri, 20 Nov 2026 08:45:39 -0800
X-Gm-Features: Aa3M54p7J1WRglEPVmq279XDZtrAJabiN1SndsFSaRRBJhl20uAjnRmqrrkOtTc
Message-ID: <CAMas6S0sV6PuLUC+gTEaVpHq-imDYHXyRYS_UxDgD3eECqgxxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86/mm/pat: HIGHMEM pages in set_pages_array_*()
To: dave.hansen@intel.com
Cc: dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

On 11/20/26 07:13, Dave Hansen wrote:
> I'll say, though, for something this obscure, I really need to be
> convinced that it's not going to regress anything. I also want to know
> that you'll be around to help us fix this if you break something.
>
> Please spend some time on the changelogs and please do double-check that
> there wasn't a better way to have done this. Human, please. No LLMs.

Thanks for the honest answer, that's fair.

About the AI part: English is not my first language (I'm from Spain),
and I mostly use AI tools to translate between Spanish and English. The
work itself is mine. I found this bug on my own tablet, I traced it
myself, and I'm going through it one step at a time. And yes, I'll be
around. If this breaks something, I'll help fix it.

I understand your concern about AI, and I won't send you unchecked junk.
I'm sorry if my first reply came across that way. From now on I'll work
in the way that suits you best.

You asked me to check if there was a better way, and for patch 1 there
is one. Up to v4.20, __change_page_attr() and cpa_process_alias()
returned early for a HIGHMEM page in a page array. Commit 16ebf031e8ab
("x86/mm/cpa: Add __cpa_addr() helper") moved that check into
__cpa_addr(), which now returns 0 for those pages, so the 0 goes on
into the page table lookup and ends up in __cpa_process_fault(). So v2
will put the early return back where it was, with a Fixes: tag, instead
of adding a special case to __cpa_process_fault(). I have tried it with
the vgem reproducer, with and without HIGHMEM, and both buffers map
fine.

For patch 2 I still want to look at the other option: TTM never passes
HIGHMEM pages to set_pages_array_*() at all, so maybe the callers should
keep WC buffers out of HIGHMEM instead of PAT tracking them. I'll
explain whichever way I pick in the changelog.

I'll take my time with v2 and rewrite the changelogs properly. Before
sending it I will check every claim three times and run the reproducer
again on each version.

Best regards,
Christian
