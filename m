Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039072;
	b=nkBOPe4R0f5dMAAxYJEP4bJUQLhVxXHdPVWJXoYkf+MyjSlpa7pTN4GR5ahArK+qlm0r
	 k+6oHUc7etxNAHu2mDgmCT37sjpZLAZe5erQASjnkbwXvMikwMdiwkPhwzOCERkw/WG9s
	 dmE7dgnHsv+TuFDCb+8HlsdYTeCaBrKEPlZR9U7BqOPEjoMXLi45wo/6pizrJcy1UhGBy
	 e5svEM2HKuxRw7cmQLvnGplbB6YFpeoJCtX/+aEK82Nxnym3/Z8Utr5JdJKvIV1dppZS7
	 C+9vvEdc05O0SPFW+PHRuxQDdo3PUfzz60P9foO71ceYKDL7ebtB41VCNzlF8aNShSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=/vgfXNH0IHzSBw/JekYvCw/wkmdl1JVA/UJoPFTrVO8=;
	b=yyJ3mLsD9pH+cWH2/wqEVQA6hUQZK+cS32SNIk/+7xHMoeqVEhtL5K5hpvsMTN18pYpF
	 obgE0Q2dzlA356s5ADzOJFfNX527vKPBze6GgKwXPRtHEa5BazeUM3iT1Lnv1Equ3OAWZ
	 fE5190qmEtt3xqAR9wc2eVIB36c6ibYQXYytEqXoft6y2e2sIgmWSZCZOwRKJSxc8Issh
	 7N5RqJObl8SyKtfmIlPv+eS1SbQDUcdNb6J/IkmBUZ+ec4XGZ8dBKEngO8QDduIrWBirC
	 dd9gQqNvri31fjofZkBfMb6tLmlF/296B0OipkBD2JB+a8DKZbtCGOzmlXq/umjuqsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZOJ+oa1;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84391606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84391606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZOJ+oa1
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed08b07213so7569985ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039072; x=1795643872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/vgfXNH0IHzSBw/JekYvCw/wkmdl1JVA/UJoPFTrVO8=;
        b=yZOJ+oa1JTdSojU1/MHwyq/2ew76qFcIwev8pdqognMenRmBgAIBzLMSWJoBx18+jU
         j2/5/irJ3tAWpghrnu2Opwlru0K7lKdfKWe7Ar+2OzsRSIKACHuBjw+SN5UlgCEb2O47
         KMjjwXoUGNayV8e13A/vbKTmLTe0CIW6P6Dn9v6IMoHXCoUwRehiaUanaEoUXvtEsm7B
         tBIdq+a/no0w1sYL28HtNarBWSjvIt93/tni42fgduGWk5bE8jKa1+36zYA777QAGQba
         4rxFZSexAWTHrwTXdL+ZAo/kPn1qFOsQWvbMGkIxSPW+UxjBH82wwnpnqEnLPqJWQFKj
         yC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039072; x=1795643872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vgfXNH0IHzSBw/JekYvCw/wkmdl1JVA/UJoPFTrVO8=;
        b=fbUk4tzVBgEmHdhT/ShBM/Rou0MC+KwCRiS0qWRmQhb55qh+oLoBS/fl8COfD4t2P3
         xd4HORmYuqTGw9ZWIGi9gc6SR3c/oZp/CIv9UA1yJvG2Fbb+os5J8U0YAUjq9TErJ0Kn
         jY7B7WJayLLM3HxXUGIiwRgsPYqIzbv6ig+G9P0re1lhCYi+eVunEqaRC9LNl9b8lEOX
         c3FkScn1KZq/Eb7AJaZHYa4mTFC2A/oeCS5GnJ+/SzOAlc3Z6zBVGxF7ieJXddjtOIfF
         fZIzGC2Nb4VI08KEFsUkhJRLHTA0qfC5TufcDWJolVHZwNmpB4jp1hzsHbn5FplkJMM8
         Imqg==
X-Forwarded-Encrypted: i=1; AL+hErHnTjkBO9JhkujDXKUZiNGx3B+PYvOVYUdpQaHgxBQvpUOxl5xwXBdtO9aJGg500uVkGkG0npDtckqAYMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hTGNUxy7BSmIsD0OjdKcp3YyjKQvnTMiyIMTD6Os0Nrk3/6Fx
	aDNZ4qhzIw6aRvVtwQb9owmIXx5mJXz3VxhoHNnKt88/nr/Ad5Mm2FXo
X-Gm-Gg: AZFdTZdgWxOtKiOdvoG0UIlmu1LK0ruSkosBPHqIsrdl8Hd9DVO3sgeudW2HwbJtCcl
	mUX7rVzJnoZ5+pAk2mz91yL6Ox8OpB/fCWCxa+u4pJlYojknfZBybCSIOO3iXKdg9mPN972gtZN
	JHrzRngeafEvRDGJ9OrZeW3qrlU59KSwlFbGF0dlBdRJUlGHrmOSPOwk3pgT8Fgx4yfdB9xKcyW
	VE9hgkzEuO/CC2rxxC5TTkl4ek1GtMNE39pnH+erCxnHa+dI/a7skZldsZA0jpYi00pC7/nn1HY
	lkioWq42zuPS5+81Yh2oVVAn1itGrs7yyzI9v7+PTFgC0LmSC1LobRspU+uRDVn5ub+96I8AGVA
	7T+bSJFQWPs8Hgvb0zcN9Mq8RDHzXaYlOQI3Tcsylgp685aYaH0IZbzF5mGXB+xyo8CE7nT+shQ
	hCeJ7Pr92ONBEQxkMCQXrwmF66r8sPKQuhIDnJssdoNsjPpte10k5IPBAY3fDusZlWBZOA/RyvS
	aKETIiIu0Sb9Cw0HhVc4ph8UnBWPukgo61miaWzZ7LNRxeGjjSlaLMAZ40bE1Zk/7LSZlJIN1oj
	+BLaw/baPzNm6PTS6d0NPFwUqIAA+/9wFAwVOUhscldCaW5s4ii+vQFj
X-Received: by 2002:a17:902:c945:b0:2ed:56ee:af84 with SMTP id d9443c01a7336-2eff75693c0mr37754565ad.62.1795039071872;
        Wed, 18 Nov 2026 13:57:51 -0800 (PST)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm20012695ad.50.2026.11.18.13.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:57:51 -0800 (PST)
Message-ID: <cfb47f547888b0f70200c0cd5eecff2f20592f29.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 0/4] libbpf: Support kernel-side kfunc
 flavors
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Song Liu
 <song@kernel.org>,  Tejun Heo <tj@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
Date: Wed, 18 Nov 2026 14:57:49 -0700
In-Reply-To: <dfba2231-4cf4-4bb2-90b9-6261b7567895@linux.dev>
References: <20261117192153.3384031-1-ihor.solodrai@linux.dev>
	 <df72a9ab1ebcebff573485a808e45cd493665e75.camel@gmail.com>
	 <08d6be6e9e0dcf6570ecd83671e9dbe63a417607.camel@gmail.com>
	 <dfba2231-4cf4-4bb2-90b9-6261b7567895@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-18 at 14:48 -0700, Ihor Solodrai wrote:
> On 2026-11-18 2:42 p.m., Eduard Zingerman wrote:
> > On Wed, 2026-11-18 at 14:12 -0700, Eduard Zingerman wrote:
> > > On Tue, 2026-11-17 at 12:21 -0700, Ihor Solodrai wrote:
> >=20
> > ...
> >=20
> > > > resolve_btfids fails the build if two of bpf_foo and its flavors ha=
ve
> > > > compatible prototypes, unless both have foo's exact prototype
> > > > (aliases), so the fallback finds at most one match.=C2=A0 This ensu=
res at
> > >=20
> > > Why is an exception for kfuncs with identical prototypes necessary?
> >=20
> > Ok, my helpful assistant points out the following use case:
> >=20
> > On kernel side:
> >=20
> > =C2=A0=C2=A0 __bpf_kfunc bool foo(struct task_struct *p, u64 flags);
> > =C2=A0=C2=A0 __bpf_kfunc bool foo___v2(struct task_struct *p, u64 flags=
);
> >=20
> >=20
> > On BPF side:
> >=20
> >=20
> > =C2=A0=C2=A0 extern bool foo(struct task_struct *p, u64 flags) __ksym;
> > =C2=A0=C2=A0 extern bool foo___v2___compat(struct task_struct *p, u64 f=
lags) __ksym;
> >=20
> > =C2=A0=C2=A0 /* Resolves to the kernel's foo(). */
> > =C2=A0=C2=A0 foo(p, 0);
> >=20
> > =C2=A0=C2=A0 /* libbpf strips ___compat; resolves to the kernel's foo__=
_v2().
> > =C2=A0=C2=A0=C2=A0 * workaround used before this series.
> > =C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0 foo___v2___compat(p, 0);
> >=20
> > New mechanics adds an obligation on the kernel side to maintain that
> > foo and foo___v2___compat are semantically identical, despite being
> > physically different functions. (Does it?)
>=20
> Yes. I just replied with exactly same example (it's used in sched-ext).
>=20
> >=20
> > Would it be possible to use some kind of annotation, e.g.:
> > - __alias(foo___v2) (an ELF symbol alias), or
> > - __kfunc_alias(foo___v2)
> > =C2=A0=C2=A0 (resolving to some sort of btf_decl_tag for resolve_btfids=
 to act upon).
> > And avoid allowing functions with compatible prototypes w/o exceptions.
> >=20
> > ?
>=20
> My intuition is that it's possible, but it'd be more complicated.
> The question is why?

Is it a requirement now for foo() and foo___v2___compat()
to be semantically identical? If it is, the alias mechanics forgoes
this requirement.

> libbpf side might become marginally simpler, but we'd add complexity
> on the kernel side, no?

On kernel side or on resolve_btfids side?
