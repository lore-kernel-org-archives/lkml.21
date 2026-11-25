Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641047;
	b=KKM/2XtLTWIGTylFy5SNCfiIIFeerwRYqhW5+ab162rxW04cft/iG2VtmSSw9tMOhv/9
	 cUSFREzzPhAu9CuGHeaqTTT+lslVqj16ERj+eqLl/jvLSYl37wVt9ZaZykY/yEvrlheXQ
	 eQvjlo1tMB0jXazLHz9QeLnZUXglUbrkjh/qn6cEm2CYu4JHu+tfL/UZlktsWGc7pPAt0
	 gbtGVvZGNWnN8WndFZSogeafUrKneJDm0d7ubTH7pL5yUpNrbH3J6YaE81nnoQmuazzDU
	 KKhyVWMyghS5JnMfUQy5BEe0JM0cmuRo4jigDVtDEJ3BOjciCqKiZISgLO5ub3pUm4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641047;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=A99q4BcBl9VZVOC3Y9aNsMEiORlYrb09NKTQKt5TLEs=;
	b=fCQ9qFhpvXO2GMn0BxsKvCMm9VtmUR1KRC1Vw3S58ADVXlzoMcVQjj1BHanXu1UYMJmE
	 nqiXJWWpxvCAXliw0RH1HkAI39EHU7krA5eNoQfVRNK56p7aAr+9Tf+u487rgGRjWmWQL
	 TR8D4PFyyoebKTr6i5bQgP2ri7j0BbwnbI/Tfg4HccypK4Kgv2c5xctstdtrh43j22P4i
	 ogbNhNXAPvGqQx3yEo9ppStPss5wR/VirvkRkl7yyWfDA+vfv49R/VzI6S4MmxD+i7ppj
	 TW/Y0jthwx2/LYTYBorT1TAkWSrQn50N3fsleagJtzOzPuYHC9NU26KtCIh158L8M+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=seanlyon.dev;
	spf=pass smtp.mailfrom=seanlyon.dev;
	dkim=pass header.d=seanlyon.dev header.i=@seanlyon.dev header.a=rsa-sha256 header.s=fm1 header.b=p7VDQ8fK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q6WZSUzS;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF0E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF0E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=seanlyon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seanlyon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=seanlyon.dev header.i=@seanlyon.dev header.a=rsa-sha256 header.s=fm1 header.b=p7VDQ8fK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q6WZSUzS
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8AB4D14003F1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:10:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 25 Nov 2026 16:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seanlyon.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1795641045; x=1795727445; bh=A99q4BcBl9
	VZVOC3Y9aNsMEiORlYrb09NKTQKt5TLEs=; b=p7VDQ8fKMC9UeeDbo3VCpEdA+J
	cHt1Ifk4q1vq21uMT0OW1xna+lyYE2/EHs7xPNGBYksto0KuBM6LQI4hGRUXyNjZ
	4p4jgAiZay84d5w62dSMnr6/KIZNvMh6z9QMRLOrFNAks/OYcU7LIoclNKST0zGM
	JTZdHJFvpIXmP5OTnw/FZNzxiIiDgAjqXPN6y7H6SN3uRmqA1cDmq5UT+u7U4Dpo
	5DBAWnOcnXMppCz3DrcNUCtRFP7bOz3ZK/MLfQ1PCIJLZ/7bMGq2zKQhwqitPq2r
	93LoHqL5RfRcklCvjuzsdinOdVz4Br4yw4tQJaQ2Kb6JcVhP2JKn0mu8tAkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795641045; x=1795727445; bh=A99q4BcBl9VZVOC3Y9aNsMEiORlYrb09NKT
	QKt5TLEs=; b=Q6WZSUzS2LZBm5t8Pq6CFBJH4c6DisJxx+6FZFKI+o5bgAUto1E
	I8PErD0nHrQnEE89LJGnMTzJ8Z/b5kn1FLXSKzJnc0CgVqZS9ddfJGpcVj2SBxcR
	fO8ag37v3VroSm9DaT/rY+/w/ijcd4IR6Rk23iKAdeeFl0jXHjKtUgmjFmYbRu5h
	yhg7SN023XPbSpR1l1zLUyubAAYE8E5xYKZQlez42NrtFnPNi5YtrmDYokT72h9Z
	f79/NWKBRspi4yeCMZdQp0zFcO2w+mLnI+wz0aiRoMTsN1op5fXxxD0qxREsk+Cq
	TE/Pdlv6E8hbiRD2ScX874tPhK75C/ZBgXw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=seanlyon.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795641045; d=seanlyon.dev;
	mf=PHNlYW5Ac2Vhbmx5b24uZGV2Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:IgRsAXk1pA2BB6m1nO0w2Thx+H5bgOjXtHOYvTh8yYQZECl
	ScdQ/m8SifGNnWdMrEM+5vgBdGpTuLpokVJLz1NZ1dMoCQEV6X4rGKjMoZbwtD+p
	lracMK40kBNPvct+UFzDv6MpvR7IYv10hT2yPs++H1be4DIFJGGb9cRw2Sm7XjzX
	VcNuMrzNGfD8VGoz/HxcM4K9LWBQ98FurIIkrZL7KeTwUDh6+7QgE4cC7LGbq/Ye
	taqqL0vlCivGwXgYohi+lyIJGiPZfuSn/am6cpoUS0RDNkMiPOd3kb7KaGmpizf5
	pH2FbRYPtBQeEpR+rlbS9X9xcqBSkDkNj0JakDw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PZwhtySr5e10Wc2z/iXpvvV6lJ1bIMS8FnWkAWERtvA=:A99q4BcBl9VZVOC3Y9aNsMEiORlYrb09NKTQKt5TLEs=;
X-ME-Sender: <xms:1E4Ha3LiLCeuJyjDXfm9AtVvug0VQoPs7QM6LfU4qq2qgFFzPIci_g>
    <xme:1E4Ha8oASCQ1Fo4NgBItvmUr9UiFWASAvwK5sWtub4nf6P0gfz-Qpk1ZzkesC78hC
    cba27QIVFoxqTvq-EZ5CQ9GM7h8-8fcLvxCsk0I9kIK10PJGCRDxzAT>
X-ME-Received: <xmr:1E4Ha_yOqz4-ZihpUtLeHVt-s-qh7FEpIGkpfZU2UB9V2Akq1wyjhuyWkhNUnwJL1NtaU-Q86C00cgH3CtTDtOr9nM0>
X-ME-Proxy-Cause: dmFkZTGq9xhyEA7PObUi7+JpMW3nTavsVl17sNMOjFbe0d3uhsz2ICDnEshHsE+ndc+pJf
    RrXcMS9CtNNV7E0hdx2eSyvLoj4VsH2ODSHK640b0egF8tSiqv6blPIVIrizGgdmExUXt+
    4i4g4+JWWTOtevASwW4js24yUHBvjzYFtPpHfhVF0w84VvFrHnF6X83bnc7RAcy/PEQzMz
    hgX6/0LfxXAkCP3KwDniHUOrkUVMvuxAkxGzw8AV0Y5iGSeX83TT85jgmf2QhcxBH6NJVv
    iHU99PZYjD2eQ4uGtdMHc1dzqBeeFUFYQsYbnVuKz2m55bYLpeUez4JkfJWhYajdJ1Gohi
    gJ/8tEpjtZBp6HqkehhzFI1jmu9B2b4eR43TGs0ZtP0pP5GkiV00QxiC0KR/xDm0T0gcIz
    TKE7t1mkl2gBhxXCgBYOTPZtnp7Ogh7vyJDEWAY7eo+Yv+OEavWXntvzTeToW988vuJZTO
    81BemVrDaI8ggMobmVxRYevPR8/PAEjAHlbRwL4/h3Ks/mEhM+RQ+Xtu6BBMe++ssAXkJ/
    riTwzvlmEfHXnCLrv5mhfDoFDH/Vvorr9zrye7gH/jYJam9Gh1Y9XZKWoYsHnPPDzURNQB
    5hc0evfnop7DpJrMu5/aqnblgWrQoRVXpOvRfDG2Zt7M2MD6vHjdBoyuG6+w
X-ME-Proxy: <xmx:1E4HawOjzi3wHmEgHEx1TwsstPFPeYae007KKRdD6EsbH8mgpOuMNA>
    <xmx:1E4Ha05ibV7gTOdDERtE83CZhpJbGuIgNx58uu66_M6b1wcM2Hg7Qg>
    <xmx:1E4Ha5kwPraimvqLoEIDqRu1W8NGQ7gLj1QAHI-V27Xw7u3wG8JYVQ>
    <xmx:1E4Ha9SB8zt88M_SHXyaz2s1NZsJtnrUYDps5wGtyxLm635EgOusjw>
    <xmx:1U4Ha9wXeVP45ofPeJrcG-tKCAN9U_kKTElP2dVmn8avi1O-7HcG7Lp5>
Feedback-ID: i07c64b5b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 16:10:44 -0500 (EST)
Date: Wed, 25 Nov 2026 16:10:43 -0500
From: Sean Lyon <sean@seanlyon.dev>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: conf.py: register sphinx_rtd_theme as an extension
Message-ID: <awdO05MekArFWsh9@ncase>
References: <20261119195117.32709-1-sean@seanlyon.dev>
 <87y0ahx73j.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0ahx73j.fsf@trenco.lwn.net>

Hi Jon,

On Wed, Nov 25, 2026 at 08:29:20AM -0700, Jonathan Corbet wrote:
> Just to be clear, which versions of Sphinx have you tested this with?

I tested this with Sphinx 3.4.3, 6.1.3, and 9.2.0:

- Sphinx 3.4.3: sphinx_rtd_theme 1.3.0 (min_requirements.txt)
- Sphinx 6.1.3: sphinx_rtd_theme 3.0.0, docutils 0.19
- Sphinx 9.2.0: sphinx_rtd_theme 3.1.0

Sphinx 6.0.0 is the first release without bundled jQuery, but it has a
memory consumption bug [1] that was fixed in 6.1.3 [2].

[1] https://lore.kernel.org/r/cb916eae-fdf6-504f-8f38-7928e0fa8344@gmail.com
[2] https://github.com/sphinx-doc/sphinx/issues/11116

Thanks!
Sean
