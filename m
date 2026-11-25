Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592163;
	b=d4sOI5LY2ef99ekJOeEp+qabJHIf6n3z188G8dXGuLHZdcMWxC4ELvJfzMTJT1Y2AOSo
	 xdN06d44EIgK82KWU4cIF2G/CzBYz3NLfYz1QzHMbnXZjptOZ+aunSd2JwLaXHcz3h3Zp
	 4XkzoQNSoTd5BQ0JU+DrC5oILXaHUTznZIwoA9dXTGgDlqQMzUVG2GB6I/LS+iMLt3hah
	 n2XnG0C3V1zuppYiPktj5ibpUYpRIifzG8leC16ZKL4jpHRRlMkXe5I7eN9Zw8YFNCoMH
	 sfh50O97m+azQDnQQUXiJTgObhze/U0ZpchbhGEXs7V2aabrpgeP68oR0K6iy2dLwhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592163;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=tPfjmyQdI1wI78ZQpZVsv6HuB0zGqQ8CU1z0eSNCe1o=;
	b=3pEQwVsStTbvw1kvivxXwdj+rx7CFMJomrBwnBU/PI+9c3JB6hCDhqXUunBcsnKKkhuC
	 JaUlkNa2aZ09i2MfAThKf8A42WJa3rg37bWpUvx7azIqRHeXIY5tiwseLQ5M+wDbxLWxn
	 /zS9fen6/e27uRc+vavmPuwWEICW2LxljeanF8Ra5bdu9BAesFAYUE87URv0GcSeAtgZp
	 d5D+OwdtsxlUQ9yvbl9ttKmEH36hbxk/9RhzKKrI3aoXuQle2cMAcbYozaTIbp2SPe+jF
	 MZ1cEdp4nO0PjshHUuMXDx7Ent13VCmdsZmOaXRonSfuTsXkhrS0Vto4SC5/8feljcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=cem+NKqN;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=5c1ggHKN;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3B4606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3B4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=cem+NKqN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=5c1ggHKN
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 23B93140020E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:36:02 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 02:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795592158;
	 x=1795678558; bh=tPfjmyQdI1wI78ZQpZVsv6HuB0zGqQ8CU1z0eSNCe1o=; b=
	cem+NKqNK+7HTiXuZmA36wnUlbvMxx87aOPckiLjhzI/ic2Umq6MYEEVHmfAPL27
	LktYDQ5sLpLPden4DB8mejq6aChyJIyGFDpR5mNz6SSj10bpJoJ5jr9Qnri6Ypuo
	s8e9EJpl5xWu24fiT2171SvXJTNRknJe8F9cUzgm2ZtXQLBpSb6R9Cktqxt5TDPp
	AZ4pjY/jMakJ1TGocFsB3Ai2k6BcorMr17AmNfvLTQX5e0K0BEYlPI7+KsZu9q6c
	t2esCGCW4MKeyyVINXnJfO4DpCnONPFb9xW3mZV0fmbKyGVSPV+RG72VIUNHLT0w
	o5McUYzKq1erFiTs/Sv/sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795592158; x=
	1795678558; bh=tPfjmyQdI1wI78ZQpZVsv6HuB0zGqQ8CU1z0eSNCe1o=; b=5
	c1ggHKNhKei6a3hNAXodpTDD3H1tQQt6m4Ntkl0KBoCsA2Z0YQPwQrI3O7jkig2c
	TI2eWILD+qR0FUkiDhqelg4W7uYWArvkcaq4fFKQAhuwpQEpm4lwj9XjHj1W+6/n
	HmuUWmsyuNu1XVpZ6nsMkzbbvJSiuR9ft1Cg4AFO1IDs8ONdiFhUDkiEzOATWiSJ
	IFRtB8XiJmJfLnxGbdY5UtHt1K5CiHgi2C5dgiBtBYS7shAVAHdn9zrNnNiCT0Nk
	tTNgmNuJ+FmP+g9FC66Lsz6G5RGrvVm6HzTRgKkkIgJUwrXOVbEbA12qv0WWGnNe
	lEznBbHtg757gHs4SypcA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795592158; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:u8IL5WWrx5+eBKR0y4d6zhXDuUvs0HnMFgUUjiYvwCT6QjB
	wk8OFOiwtEITF5rl3H9w9hvpySbcyM+fFbD9DIFVNhQ56IOFhEkTTMNQsM4ujTNf
	QAnFl1tKLJUJF9XWlZKsFZX20ehPPPGaW7XzuBWc6gdaCD9prmTh+F/LfO+3zAkI
	H2n7Egpr/Q8VmJOIu+kjmFWzFPwmXai/azSxqOVu+1vZakewr12roze0AFtFSVuW
	OIDEAbUfSNkCUFIE5lIUTauacxYkTFYNqbrsKzamO9JZJXyfPsfxnt2SMYgpDuL0
	yD0MvVTxSq3SFga29sujxFhXNYSLvSPfIyHbLEw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bW5FRmYnw2iDbGd3eaFqNwmv5yh6L3aE4etpdkNBVtk=:hrxNOVHbBregGpHYaJkR12E7QCIoh1riEQpTvoafJcg=;
X-ME-Sender: <xms:2o8GazeeYYgqzcHbNF_rkxQUz2xUjTw4w7KdYfxAqHoKp4uKltD5Pw>
    <xme:2o8Ga0Cb-C2mTlcMLLysGSzYCytbCAAzx7nvnAOHckQR6VpSqXyunPm5QvyX8ezKE
    kzhD7f1ERXgFkR47o4X0QEE-pTPAMIjUVJzs20mC1I4l3O5q-LCi0Ns>
X-ME-Proxy-Cause: dmFkZTF0yS0MDcn3oitaXGaLh/T1Znmg+Y9viFJsGCCIYBwtFyg2c0Bv0woD65rVl9QQSb
    1qORFKt9sFj/jdf+I9Tkd2aPYPC4KDYAH90W1e+HnOPgTFUnKUoQb7njRDMZjGi5F26v5B
    nxnVyEU+KbjqSNcshxyga9nWtk40g7NGqt0TKfaWP3udAENirjS4CIX5YQrkGFMEQ98Qq7
    lQqj1gDL5YSeG57itLhbj4VvwS605kDR4g9zG1KoLrtcic815vwJxOONPE3kBaC+zrsLuo
    4MHjpylZpzypBJ61EnVMxfcH0G05eAC1eXw2iwV5dpyBWCUQyRNcYxZCTjjhwurGp77HNY
    zJ+uRFY4Vy4yCO7Y29OyfeT/tm4t7kR9yj3h0Pj7l1eiV/KZK2I2zQ0P/UF1dCaeJsi3TL
    IvA5FSNe9BQa2FJ1fzYFkJn+iQRNk1g2DIsl4hSO7uVZbosNujyAanL/JB3d7XOEVKMhHx
    JnX3eBZ0aLmg3tKMSPDBR03Xpmw+w5GBD7qSON4nWDNOYKS0NiE7T6JJFfM5Z21W/dKe0q
    0haSJTwyoQ5+naV1u0J7qfKBfKjgdwpmBknK/K08ylvZznq8wN07a6q9SEGfFmKzX33pnM
    o1mmFUGvmsbljuMVCqzqBlFoUyiSKrbTl8aX26d4QkB22ixWTHbSX4OIeOnQ
X-ME-Proxy: <xmx:3I8Ga_AURC0D_YghEUtDgnbxvzmIONyRsmDHyq1IY18JKof8WuaK_Q>
    <xmx:3I8Ga0mFdWzf74Zt2M2SzI5MXifHHXolm8HLTcQ76w6G24uHp8kjAQ>
    <xmx:3I8GawwUooTJQRDV-Ta66znUVLDILwpe7Cy3dCOpAmHA5f06hSGhkA>
    <xmx:3I8Ga-Ru_m5iP6nXTYQ8DpyMd-d9_8pIKIDKV3BLYAvEwgISrBdO4g>
    <xmx:3o8Ga4hsgHYTAMDLV1k-zkwlMWTqJUoQR3pDvU7iXXWPcOb46v0LnToP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8101A32A009C; Wed, 25 Nov 2026 02:35:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A9foQpwh9yuF
Date: Wed, 25 Nov 2026 08:35:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brad Hawthorne" <brad@sim.vu>, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Cc: "Vladimir Murzin" <vladimir.murzin@arm.com>,
 "Linus Walleij" <linusw@kernel.org>, envzhu@gmail.com,
 linux-kernel@vger.kernel.org
Message-Id: <70f2038a-5ed5-4a38-8a62-87b292e102a2@app.fastmail.com>
In-Reply-To: <20261125025852.1160075-3-brad@sim.vu>
References: <20261125025852.1160075-1-brad@sim.vu>
 <20261125025852.1160075-3-brad@sim.vu>
Subject: Re: [PATCH 2/2] ARM: v7m: clear the Cortex-M33's ACTLR.EXTEXCLALL at boot
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 03:58, Brad Hawthorne wrote:
> +/* Cortex-M33: clear ACTLR.EXTEXCLALL so that exclusives use the local 
> monitor */
> +__v7m_cm33_setup:
> +	ldr	r0, =V7M_SCS_ACTLR
> +	ldr	r1, [r0]
> +	bic	r1, r1, #V7M_SCS_ACTLR_CM33_EXTEXCLALL
> +	str	r1, [r0]
> +	dsb
> +	isb
> +	b	__v7m_setup

Doesn't this prevent using Cortex-M33 on SMP configurations?

     Arnd
