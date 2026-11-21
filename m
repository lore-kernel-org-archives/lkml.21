Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219779;
	b=dYDXsKBmdYreUUfWcdgIs1CEvNRrs0K0+lJi94D7lBFeaauOxtUHuLoC2Tuk2/IyF2Yr
	 1QNaqUpxmAelhKHAtYJUhPMbxXUcCYVhX8qfMqeke6qZdZHPhw44XQ5WEo144JD14mdfd
	 V2615yV0jOBLGiHgwM3jurbMYyNNN5Rhp/wQjlW6nlB1GKjhGNVMaqvEsZUXkaj8juP5l
	 yRU6oTv6FV5N9lukI3F+8LdmP4F290syVlcR+N4rlog+CqpsGioKz12QNa2ki6pjNglzm
	 heonyWWcK44wZF5ahomvt9QzC0GAZIZVQqbqxBm7tkJKbnNz0zdQsVtx4acfn3muh+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+dMKHR5mBoEcX/ua+H4VZoPPVxYx9Id1gISC1lJtoPA=;
	b=JxENwmmjgb+hToyyDx54NfAIm6kkuA2sAVCs0EuRq3imbp4K8JtDpyDWGCLbr87rWyDG
	 nzqKa4c1QlnFU81NM2br9UkiRutKbVSQib5OvhFJiCNvI4eOXnKf0hefmmsqFJKrppwDg
	 4C5uHnvKizdA9AtiKQzwognVA+Fg+qUt95mTzYzSVFpqYHnx4LuulMhcWqGtU9Ij1xT73
	 keeH3UHlpkRF98ZEkz3wRDZpkZzbT1vVeF85Kac12wBbLlXCHUOBm+DEE4L3ZE+KDY4Vi
	 nf/jQ2wc0BwuaoQFiimnKS4AqGAS+OYbnlAwwE1xYHERc6BtPv0SvfS/UeBAEYuez9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jthp5SZl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFACD606A6AB
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFACD606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jthp5SZl
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-54492d8a988so110281cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:09:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795219771; cv=none;
        d=google.com; s=arc-20260327;
        b=lIBGhHoxXb/K//V9eEnPU44V3Q+fXXaM2yz6fpJCcgud9a2bARlOOtA9WeGItFxpQX
         rWv8c9958gsguCtP8PkWVQT6ITY8Mg12BvoH8Ah62kErrGJoMVtfppGBVlcLMEjGU1G+
         SlSI8Z1zteMAk4XNVA79tC7UcKmtOrZq/FDH0wfasC+S5ME3MJfKwI2wJLUv1OJnA1Sc
         ucZ0y94xnSjTtow6oAufBjdSiLjLXScdpalfWgUwDw6GFLTGThzBd/6qEmalTBe4De08
         C2l+sXt1vEALxX/jueKoLaH+IDeEV6ZCoSVdsmy0XsOK8HkUF7tANjNKyJCi2+Bx/sDm
         GSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dMKHR5mBoEcX/ua+H4VZoPPVxYx9Id1gISC1lJtoPA=;
        fh=m3FmzX1WFJb3beKv7N4Pc5IjplKI4FNvEt3K8O/aUb4=;
        b=CZgRoPIwLGFbV6u9CZfkEP0dwhCzI1kNCqQ/rkj6R3IuHiQBwRftDm9a1FukzxxToA
         Ylsq9yjFIj12B0+kTWjUUoKjy/S6k/sb1CQ5feu41rJnT3sXRChx4CoMyodtMq+dcXwi
         76c/k/s5kK7UcDbmMhmZ+ou8sioeYy6luWl1oKxzEYrGJHJce0wg4zJycFe5ZcwP8kY2
         8rweZALyC6ViNuGG2rRUpf0mvGVE+vNNew1QvFRV1anEoIxcMfKN1G/typSotvxlBgFI
         9OYgp/4kbc9sipc8jby8zWLInMmLDNk7RSSa6CCr4Q5iw9ysRLGqnOBF6zKd7NS6sEmG
         jb5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795219771; x=1795824571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dMKHR5mBoEcX/ua+H4VZoPPVxYx9Id1gISC1lJtoPA=;
        b=jthp5SZlNFH5Li07rOwl8E2YUU+PYSMZGaCyuJIp/cIYxT6CkNw2QiIroKUzQFksez
         wipihkxCvezdE5SCfv2K2QnCreL+hSCLRr1VxqL+kLwPHRH42wYCIAWJZCy15Lz+KEBZ
         LBl0BGjVms7doBoGRHOLs50QBEOIj3oUePQm9vDt4ACD/qsiyZ/lV5/oDQ6I9waA3rnr
         PdM9Qo6Cy3UJYQI06xLIEAsLXXXeajA7eHXKfabO0AmFS8ABtMM5W/ToK+NzS0IuwACP
         w7aarkUJWMjCC8kGviUxVScPJwxCqIqsOVRmNOqiygXBciL3Wu7r2liq5vtnwkQbPCCm
         Gi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219771; x=1795824571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dMKHR5mBoEcX/ua+H4VZoPPVxYx9Id1gISC1lJtoPA=;
        b=o+IuDLg1oqia5J4JvdQ1b8/FQYDJ2c2ZFqWxfw+acxyBo3gpVmqtqxuWhp271+P78B
         mziGjxPOwPBxOS8y4mF8clLZ9+gHVW+gyK4Pl1ubErelPNhY4oZczJC7d4UEuHMMVcEi
         oQePle+qZgwmJNHgdTFR/5zmxtFNM4cEe1N6vPdG475Ox6fjJj2grSt7O6LX72X4DDf5
         Xi9TANYMVKZMyRaAiroNQopsAx37v2PNM3F5Bko+6qvyI9GuTeItSdGv9Ak76dZvJL4v
         CPnWklOoHrvJGAlzPI0bCopMyLY1cjUjoYm7lRJ/dOT7+rqzgCVoDc5rn3OWrZ8u/eGA
         z9zg==
X-Forwarded-Encrypted: i=1; AL+hErGfoRQP15icyERY34al629OnMFNM1t0iMpnqEawvXurcyjkrf46tu/kaiFHLpKzw0phblqCJoNmTINBTgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ciq+HswTPDLxZp4L4TEL4rVBVJWzpi8D6M5VvgS3OI6FIgMYM
	5q4ag7GKjAnvWV4j8/n86YPbykG1lDBzWSDrthHWYEo0EVqv7qG7mJeFSk9IwDc7mDcfk5VAuT7
	crtKA4LcOOgOCX3xRCS4wD3V4BE9PINErxS1p9e3E
X-Gm-Gg: AZFdTZchPUzR29mv6EZilY9VwxTGTNOKCiNHGAJ3EosmrC83btudUYj4Es2wxTX9tuM
	sis83oN2q/RaOLiVVKAs3ND+vWIMGIaRyuyO0UZ0xA0mwUNR4ui0P25bxBESbW9zIGKO8YAIzjs
	Iv7eCVOtqDmwOWnMSOwsie0GEvBgZ0zvu7DtZ+COBOMrePk80BlXxcHWZjrgGnHf0CUsNMHBVwR
	DvQYOnjh7Yhb3dGqkvnL0NiiC10uWxH3JyEor53CjbgH5lX+AQPV0Z2qki5qsZOJJqTBrqmN/jV
	AnugXqEmyetuTp5dKWWQ35cb6Q5wycJ2cbnZ+m2tFPmLVu6dL8pMnXZGwRFsFbOgqmqvP0nT3tB
	69Jgy5SvKQ1ZUJbNe0UfQXgTD03MHiFrkwueAfb5Z8YkjIXl0gCRxRMmvfw==
X-Received: by 2002:a05:622a:260a:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-55d87eb670fmr7626051cf.0.1795219770051; Fri, 20 Nov 2026
 16:09:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com> <20261113164152.2095566-5-irogers@google.com>
 <av_bGKcyato9YHD_@google.com>
In-Reply-To: <av_bGKcyato9YHD_@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 16:09:18 -0800
X-Gm-Features: Aa3M54oEg23XwIywUM7xCazlV1aZ6ADuzxfe0YE_c6ZVLGLnwXlwTRPiuHL2zps
Message-ID: <CAP-5=fV+q=vMuo7kf1YroivHgboTNtcYzYuVp6iJ582Jj081Bw@mail.gmail.com>
Subject: Re: [PATCH v13 04/21] perf mutex: Use kernel style
 compiler-context-analysis.h annotations
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:31=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Nov 13, 2026 at 08:41:35AM -0800, Ian Rogers wrote:
> > Enable -DWARN_CONTEXT_ANALYSIS alongside -Wthread-safety for Clang
> > builds in tools/perf/Makefile.config, replace the custom lock safety
> > macros in tools/perf with the kernel's compiler-context-analysis.h
> > annotations (context_lock_struct, __guarded_by, __acquires,
> > __acquires_shared, __releases, __releases_shared, __cond_acquires,
> > __must_hold, __must_hold_shared, __must_not_hold, __returns_ctx_lock,
> > __no_context_analysis, and __context_unsafe), and remove the redundant
> > macro definitions from tools/perf/util/mutex.h.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
[snip]
> >    # Enabled Wthread-safety analysis for clang builds.
> > -  CFLAGS +=3D -Wthread-safety
> > +  CFLAGS +=3D -Wthread-safety -DWARN_CONTEXT_ANALYSIS
>
> Why is this needed?  Also it seem to belong to the next patch.

Thanks for the review! linux/compiler-context-analysis.h gates all of
its Clang thread-safety attributes behind `#if
defined(WARN_CONTEXT_ANALYSIS)` (matching the kernel's
scripts/Makefile.context-analysis); without -DWARN_CONTEXT_ANALYSIS,
the macros expand to no-ops.

It was placed here so -Wthread-safety stayed active across removing
the mutex.h macros, but moving -DWARN_CONTEXT_ANALYSIS to patch 5 so
Makefile.config is only touched in one place is cleaner and still
builds cleanly at every commit. I'll move it to patch 5 with a comment
in v15.

Thanks,
Ian

> Thanks,
> Namhyung
