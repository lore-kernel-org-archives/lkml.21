Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187923;
	b=qkyahRRpGB24sEX8soPf8/uOg2/hI7LmRfEHXaarq2RVEQ703Xb7QSceZWbZxrWDxe5v
	 ORvIno7FVJv6cSTaMAL1LacAogfX04dFw195k0byfRiwYN2wQkQcK8NAejH8hThFwALDZ
	 Q/NOYbipVts0UslgiqFkabZ0WNhT1iJx9tealSOh48+TdT6piKtknsta0B+HRHKW0Yrei
	 33HAlEB46ZV0EksdCwA0nyFleiS5bWAkOj+oIZPXYflkioK4f59pjUZEqO3j+UNPMpL6R
	 nganK0A5Aiq8n7xbteFF6PMosRaQiwT5ZyAT4e4CGdTe1EiVSJ4yOQ3HQ4y0ecz7TUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
	b=fJPkPFV4lbPO8PsIujK7jyRJNiBEyvnXeOuk+50EtUF6PrqGNHX2J+J9giYkO80nYGqG
	 IDFeHF/uVrxDn7izyhDuE2oyBnqubT96jWgxn39dMhPoLpfJjMvtZ0rKi61ltN7Cl6SeK
	 YGq9WI64tEV+1m7Uo8CCOMUo3M3CX2iPPXx070sVGvHnw3P/h4xsPEwUc0f1QZ9tGPHb7
	 w1+S32g6Dwo0H7ZPIPMjmi4JomF+pJBEyaU89nXnEUvji1F+nDHJJJF8GnTDpviqfffq0
	 Jx/vYz9Smv67BJkrBYs+umfPqK96AANRJwiLgLiJf5SAX7bGZQQUY5APYuNGiLiHniA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VI5rgciH;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3326E606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3326E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VI5rgciH
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a07078200fso616470b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795187921; x=1795792721; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
        b=VI5rgciH+NelPukarvxPksemY15+vM0C872yQBDjnvmYO0mEdZ1yU0qL527S10bzAB
         lx9fhmDo+3hmYNxdGuAqyY70k49ZDtFVMK49wo/egoKCgoUNM6BUV1i1omX2YHtbQws1
         2h18MfVyFPsqgjDlol5//H0c5aqLvZlDiWLEJZfD1h8dg4ZLbEn2iN+vk+ZCq8hMllmH
         0GAnNvxiKMGy1Ukraq5kyAdwlcepLS2v3Mb7RmxoD/BX1bKwKtJ4ESAU/kiMrgO20Zj9
         v1XFcP3SYyedkXfBS7coTqDIiMJz388N4BWEiwY8gRjeBUNzTbGmZ4t5P5FgctQTqwDU
         uAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187921; x=1795792721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
        b=H2m87nha9ZuP+IUWXCibD5UHxJip3LkyOgZqxQB+a0LKf5ekI/fupd88G54ihGEuKc
         LhWJH0oSwPNAT+tEucTT3u782z0q35KOjOIZaH4y85qfqoyreiKTkAcd5CueJzBe94Ve
         HegoVRhFn6UxklJCUU9h8rMO6xaUMr2qHwsXbKp4xTFqP5ax4XOcna4itC4qOFGHZWTO
         yIkoufePCpdPxFsbyKJLP+o9Kzu2Y0yhK50XzbXF9Ew6Aw05PrUmpWqoxfYU7P2fdcF7
         3KB5p97eLbT8EkVVQ3tWgIm0Ls0zrsWQjVw2tt0yYzZw6CnCMOHxiCO8NUdJhdeSyBiq
         cGeQ==
X-Forwarded-Encrypted: i=1; AL+hErFbXklwAN2QpBfCXNIP+dPLDBLvKccUb87IoLIyJGf9NAjgeIMKWtHtXvQW3U/PesmJl8awDjw0LTysZjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B2tWgtivXLtpzyShRM5pc0LjgYHBW53DK+PY5a4XiMidPzoA6
	uZ5WkAMGQcqW3mhCyiYJHavUX20tBeAoLfG+GrgttdRLyduxtQAFC3b1Kch3ij5oe3o=
X-Gm-Gg: AYBFou0h8vClbipPhFeCMEHYu7KMTy2KimTvIh76T+Q+KgDOCSMB775Gh0KNGBuudJz
	xMNY9czL+gq4sDWRsBP6h54skOvzwYOG/FTvpl0EeOgAPPzEjNLdjxGiAVFcO/xcs9MpykPezvf
	GtUfiUR8gXM6tcsStRaFsHo0VMmgySo3qHvzzEziJ7uaJ6CAWpvFr3oo1CZJHIuRQjAUE1cCC1W
	9NS935lm9i7Lvogr5o2Q4d39noTieGC0SgUJ2Xke/p8qaqa0kP24VYC82/IWTqYFLOQwT0C0YVp
	uclgA1LpZkq9b/gUw2jBxKGAqDVbBq/XrHCq4a8PLPtr0RLL+SkWGB9NhCP/n7JRxObML2AQ+NS
	GdJu1R/8IlaulrvZrKX50QSNtchZn6OxYvTNGO8su2vvOwcgD9OZ2r6w/05Az1N/KR0zOk2+pCo
	0/TRZ0G4qOSOpQ4hGK93ITVQF3sMRSd7KCMr+CQi/zy5y2Z0ZXghQ9Y18iS69PYbsXriK+NHTGA
	HD6lfqNnBOLJzgxHyqYS7jPq8dOEQW7EebOQMjCBeDx21BDiySAYX88Wc9cSvG3MicIsOfhU3vB
	5V2sJIgk6cmScWSrvAojzMp11E8NSanc
X-Received: by 2002:a05:6a20:6a1b:b0:3f8:2d33:217a with SMTP id adf61e73a8af0-4014e35c5bbmr3604027637.59.1795187921441;
        Fri, 20 Nov 2026 07:18:41 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7124:798f:1b98:bea5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm1534544a12.0.2026.11.20.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:18:40 -0800 (PST)
Date: Fri, 20 Nov 2026 09:18:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] remoteproc: elf_loader: Make
 rproc_elf_load_segments() more generic
Message-ID: <awBkzr_uxBxgeLvs@p14s>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>

On Thu, Nov 12, 2026 at 12:39:49PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> Changes since v3 (available at
> https://lore.kernel.org/linux-remoteproc/cover.1793879714.git.u.kleine-koenig@baylibre.com):
> 
>  - Improve kdoc comment for new callback describing what it is supposed
>    to do as requested by Mathieu.
> 
> I'm currently working on another remoteproc driver that cannot use
> rproc_elf_load_segments() as is because the remoteproc's va isn't mapped
> into the local CPU's memory address space in a useable way. With the new
> callback the amount of code that must be repeated is reduced, similar to
> how the imx_dsp driver's load routine is reduced.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (2):
>   remoteproc: elf_loader: Create new callback for copying segments to
>     remote cpu
>   remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
> 
>  drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
>  drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
>  include/linux/remoteproc.h                 |   7 ++
>  3 files changed, 74 insertions(+), 117 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> 
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> -- 
> 2.56.0.rc1
> 
