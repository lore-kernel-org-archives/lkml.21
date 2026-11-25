Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577242;
	b=ngvN18d3iMv7oEEBCSb33rcFxf3ekkzhdLbPynO0fkOvMOrUyETllJq14d6JMchf7D6h
	 5l9kyb6Ago4om+mYr7YzCBX6e8c6UjZCxNFXeQlQfWGD78KoDnbpBoTG6v9tGVqXTIzYJ
	 lP/0KRsbq5LHut2f0WOBnAo92pO4pMj9yRfoxjS4CpSNUipB0AE6LuXR22SrnpiV++a5s
	 Nh7HB6TIi+dDkSHZmT5BNqpu/q8Hwf1px1My6YW4kru8U52VMbL7wAujY6SJIDXbdHoeQ
	 xqKTqP2RjqJILfEQ6eKiIRReJZJ56DqA4euCbiL3vNytpevaSFlzkjUJdnq+OD/c68A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=5bRyP6KOfL9XhmOssL+lcx9o6qqIInqeGasBfYuP7vQ=;
	b=P7xW1V47V9hFENI5mYLRxopWh1tnqbWdXrwD7iQtuERR61MHUa4wLPc5gxwSAsOtqn83
	 WkQyZs4VLt3tAd8UqRcy+poU5VdVHTl4dH7/BMUFswfUHQGDOVUxD+VmvbVywzXZfuyjk
	 FJeXq1nmC0JJR2+IKS1BT2zZoEeLMKj5yvCuYj32q4qBMa4DvNavBJK6XdXU1RGlFLxd7
	 7XxPEys+gOxtapWaafdM23AVju9oQAZLJB13QpKY3hdEwj/RPtl+jZ4wgEP79DBfozTNe
	 Wu/XxfGfKdvaQDTrJY2GhHXyu/pRmbB6VKA2I+xMVChR+glBPHscoGTdjaEJdqcnsLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FV1u4XTS;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8140606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8140606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FV1u4XTS
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so3547817a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577241; x=1796182041; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bRyP6KOfL9XhmOssL+lcx9o6qqIInqeGasBfYuP7vQ=;
        b=FV1u4XTSdDcGYv+Wnu/myw1a4gdaFVJCdKx105w1wQnVNnukJXD2EGG2otptXOwFRF
         acxgfrfjBpeb6kvjPVbRThzYWFJ6VEcmzzHAjUMYqimj4Jpi0wZU089VXQy4LflVTlr/
         SlrnXAmneuaXGrxTad4SCziYhSAii4Lv+Cct12k93XQrjuZ7TfgC0Jhi+btclTsUcT4O
         iQ2GMKsT2glymqqTRIFsAWx8pfUzlVTVj1lqHsMj+DiGZb+7Wtlk8ugfoXK7WlMF82PP
         Eyu7M5x71UuCQ0kA9zWuTJqNdQmuq3sifbpsTguXO+841v26fRTXjnW01ztmxlg5n1pv
         IIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577241; x=1796182041;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bRyP6KOfL9XhmOssL+lcx9o6qqIInqeGasBfYuP7vQ=;
        b=aL7NpRKeyRVLdKar8a6fOzweTHOxWhXymtK1HQEd08jzo2704A3BkKYPUb1DxFX37n
         J0u9+PlLS69tswBMv81hAqT4RO8K5tF9OlmuLhQWmp8QmbTqsr7tQTyF9DjvceiwhFC6
         UVsTRXSpZhRhhGgs7Dzv7Pr50xDVbKJD+QtXqmfs7TV/bss6eAYLp4gOKzUMWzKF8F8B
         qaWnIc14YjYJKnlGRdEOaQf/IaXY0MXlRNwcRrqXDKKzKgyj/DyiivFhbwSnQGfpTIi1
         jhlK9drbkuW0JNm2S+Kk9LphxQ5FrCqCGTZhJeZhhmbkOFAschb94CDw+MsAG/L6VUeL
         6ZfA==
X-Forwarded-Encrypted: i=1; AL+hErEUw2Cmv7Ut/TVHlR2M6Z9eCWf5q/grG+7vJVEzonQcjlNNv867ZC2FXPR7bxcPBLMcRa1vguG0U6jRnKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hvCivvDP3y4Y957+PFFiERdyts4mntjSozTkT4YXhv/dVsB+m
	9jmTqO6CqQKticDXDdGdeTaMP/9bPiaD9l/AqcnCiUElGfGGI3moiKwp
X-Gm-Gg: AZFdTZc2cU4lbjAq9EM4mVribHD2qdvyPs5aXA0WywXzQVoZ0luDmRDb9T53JNA2/Di
	Kpn/ARIb2M603W7dN3P+D2sh8vdYGyDFuE3czV3MQ9kYvGk+7tq9UAJxR5ETOBHDOrVQrw4hZcN
	jz83Yn6LwYvy9/7yPnbqF+XEycX7171Y2HbLjqQUvwi2IouiDfFoamSviJ/zAjtpNdTJVvQtJsj
	j2BAoiqz6BepbkkZT63XRGrjWHTNprx9yccHo/wvfEvRPfv8imqX+bZr8sXcbngMEErjuYanbkN
	u3SMUMwXBTS0YU8Gl4KTrWaIoFJZY+w55NF99inq8uSMS5yPa57t4skzSMklFLPsxuwyq5t2ObN
	IPUdKJLFBHvDze3pLYYvzQLpI+M58ffz/qCXqfU/kxe8IRyJ13hudhJceIrpXNVRFGXtQQzebCY
	jSIjrzExiiLmx+4wtLLRF/SrYd959OmA8rV9Ll3kiX2kPkf0CLFq5YEkLi6r5AQB/u11dgeSn5I
	IQTNTAY42seK+mv12OuIzH0MB6oE4Fen3hp/t6Zw6BmsnquZnWDiOI1PX0+4vcrsO8YCT48MQmy
	UDpds16EWMTMVkv6uggPinID6wNpnpiNUixH/qS3ejYszzSS4sjmkTmETlBl8JZRwhqeW03SSJx
	ZcgVmAgHr91mmPoo17Q4xSQxH0ZGEJtYBPEkPtgYnMOa34GxXX7QFtHBC
X-Received: by 2002:a17:90b:3b52:b0:3ab:9c73:130 with SMTP id 98e67ed59e1d1-3b41c9e4b34mr15289788a91.33.1795577240949;
        Tue, 24 Nov 2026 19:27:20 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm9716313a91.10.2026.11.24.19.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 19:27:20 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 03:27:19 +0000
Message-Id: <DN3Z0CG5YZRG.3G71W1KED656L@gmail.com>
Cc: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, <bpf@vger.kernel.org>,
 "Puranjay Mohan" <puranjay@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Andy Lutomirski" <luto@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, <kkd@meta.com>, <kernel-team@meta.com>,
 <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Borislav Petkov" <bp@alien8.de>
In-Reply-To: <20261125021733.GAawZFPYeXUtqNINJ2@fat_crate.local>
References: <DM0ESVBT9553.2S1RWK1W7M8WW@gmail.com> <20261122200848.GBawNL0FcQoK918YDI@fat_crate.local> <CAP01T746W=8FFiJJUM3H-Qv09uRO6-XEi9B-8pjSgtpAPBx4EA@mail.gmail.com> <20261123003036.GCawOJLKK1iX47XTDm@fat_crate.local> <CAP01T77EgbuyhP=zU9L1hwYL6rHaSbrqQZGJR_+9AQgSWLe7Nw@mail.gmail.com> <20261123025529.GDawOrIQcDOPhgWwF6@fat_crate.local> <CAP01T75Qps8bKFZAU2gN-3UJTB1aWw46NG5c-sm6K028rSc9sA@mail.gmail.com> <DN2E8Q9V38IF.3O738M7NGLSAL@gmail.com> <20261123185124.GAawSLLMoWwJ71nq5j@fat_crate.local> <DN386F271FUR.35EWQWGMEMX7K@gmail.com> <20261125021733.GAawZFPYeXUtqNINJ2@fat_crate.local>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 06:17 PM Borislav Petkov <bp@alien8.de> wrote:
> The hurdles are more, which is better. I guess we can try it and see what
> catches fire.

Thanks. Let's do EX_TYPE_BPF check then.
2nd JIT patch depends on this one.

> Next time, when you decide to touch core arch functionality like the #PF
> handler, please include us in the design *early* too so that we can chime in
> and check the sanity of such proposals.

Sure. Will do.

Kumar,
pls rebase and respin with the EX_TYPE_BPF check.

