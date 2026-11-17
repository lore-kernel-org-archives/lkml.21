Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937630;
	b=dS5iBTGV23r+RZOflxBQZzdofBwCrgC8YgCR13gge0M5H8WQzRbpzrDeKhrTqQ3LJqRd
	 3JwB9Jw/ZZ8ztibJH1rNFH+dj1w8k++aDLURuzvFj4tS0K1QV6fSKfTIfmClwOAwjHDys
	 xO8SL0jBRo9YuXLhDRMMr4wirkhw8Tp1KExizp3bmZCNpzhjz9M3TFI9990igRgUA8JMb
	 VqU3z0hLFjb7vNJ9YgYxx24rE8j41pzRaksGUxcY+OEWzIb9Zj7uYLc9dX7mhWrgK4kxM
	 34jnxZBdoDw3nBX/L/Akssa9M+P5aktmyocPBeR+XcffOI+tzNwiEBp4qbAp+diT8ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3uzp4+86b55hehi4XpFs0uw2TeA8qMCUFAPxvdP4xkM=;
	b=giAcNE+CZaLP2fsBgpkCKNDq3/MFabjzFLFsHw44aO230R2epsDO1PTMKt7f/EJA98cK
	 k4YE7AP3u+3j17ZxiMSWJp+Pvd7zdeLQtj9SZM8t/RVvEZQ/eTDDq0oij63G7x6ldAWw2
	 KhtS8S13gUdw1CufqGGE2tXDyHhvL5gsYxSdMXOosxtWexYH0ao1OzwN7KDq914XKWBB1
	 UmPhYYaO3Tnbph1JgcowlCZnNjGLz+xFz/DuW24B9EBaYbynIBK77l9yDfYRRXWc4Qs3z
	 Uaz2XWwouteScM8Kt6R2fT3ZGFoVNksZ5P811rLBEy7L3xpZ8LAzenTW20YmLLzTtSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJ5KMTG0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93433606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93433606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJ5KMTG0
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55be673e029so325701cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:47:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937628; cv=none;
        d=google.com; s=arc-20260327;
        b=ZmIvR4sXMkqZxY9pVwIvdXJ7gJxN07KF2SPqPFoKyv3PYbH/12o1+Gj1a49pqHa+xj
         wlf9V920CwGzqy7f9SMCzKGsPiCbHRBPzjFkaJIvHWK6O1j8ShjX9z7zVIrq1fSt1fh+
         4Q9COxSqN0z/IW/awWeUjbC1bRPRF8UNleOze99oylJUoBofsO22/42DCcncz6xv3sUe
         g9pfmKgv77jC/8dNUsJoyiGWzxHhZKtY+cmfY4ILli6jPRXKl6dgBF+8ILhh8OzB0rYG
         19E/JoOcX3YganPZnwDgcLL27AM2J+S2FTHaXhTuikH2TTqxT2GV6Q43ekcOWsXRDeTY
         RBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3uzp4+86b55hehi4XpFs0uw2TeA8qMCUFAPxvdP4xkM=;
        fh=Ep734CH4vVfoS92ofQ8u5+mfag0cUDFNJO/sYeLFotw=;
        b=ORMjToEAAokIP6HzYGajMr3jqFy1yy3GLpIExm0CmLubZFF2DI/ncXD9GSTFfE+8IK
         iZa/V0jgSFJyH62Lhi+au94HbPWRfvU0wgjjbJLGPT++z3mba9rMeaFrYMLTFLnro1JC
         A07lQGixqMjmCFG90g1J2OsLkWASa7rR9Pk68UVvs4BnWSi7d/604F32DPNdSErA6lCh
         ZGqriRCr65MgM6FHR/PNkPrR7raE5U58x8nCTWQbrvjiavxzcblD5kzDcF5swo0VPjwQ
         2ECVLHN9DRGomDBwSd5HUqILgOu4EwMLRtyKx0+Oe/Mnoh70kV1XkgMG3t4Io4NELrYE
         R/Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937628; x=1795542428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3uzp4+86b55hehi4XpFs0uw2TeA8qMCUFAPxvdP4xkM=;
        b=IJ5KMTG0QbNv/MJY3rTVUnk/O1ALdTRR3BpXXAZcTZP8kynWkquf6pssJOCLPPmJti
         U3p4pc0jyrnxA/W/q1fz2Y++EJU5GrR2NHtVkvgZOyk45pVjkxZOylrZfLVUIf+pshkh
         BdejLYSozOaWDU4TOUL3pqGKEDeycbbH/Ibzu1CNgKlzZUTuWygr6Jj0BQiirOaWKK5/
         6rKgKB2YoDKbtbpgmkBuJPC5LFCfnNCej22yGERJ9cUY5eCg58Gr3am1j4AysmzkBbh3
         hVc0nw4e0Fw93c6Jf/uv2Z/CLp1Jv5GdqEvSUfDf6e3wYemc5ssvv5y2S01fVPb1hkHd
         Ah8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937628; x=1795542428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uzp4+86b55hehi4XpFs0uw2TeA8qMCUFAPxvdP4xkM=;
        b=rzFdxFBLE2ydkZVjpEVCPhQQfZj+Z/eO2gYr33xMAqvHu7cC72vNrf0s3DlbP8upyv
         ff+/u0vTErv3NwLorg2iIe6So13qrjqkPVC2Hv+LuC+eXOPrby5qtML8cQhq73s3pX2v
         uJf/4MynuN/tqCoccQKvxsfRe+24qJ7v9ockGUm9SWSm0ujIc1ZL6qSt5eHpheRNBOIh
         bRDqUAnSYeOtZ3Q1Joc2mv4FdM5E2J83hYPd2Q0m69XTHr9MMPhGryOIzHbj4+rv4XpI
         CCQeU2ZUcTQVGOLp8qKis28W5WZOIgXxFMLw0HMlvew5ph7B4T3cTN5bbAk22XzT23J2
         joaw==
X-Forwarded-Encrypted: i=1; AL+hErGI6UCoFvYhX2VQYynrUJ3Vl2U01GmAO0lgH3e5JV1xZGCt8+04EyfaXzfv+GasUN25aCTBlmeQXw7/C1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SVSBIKb/+HMQenrhGLHsEs6H0oBf6PvoWYk42aOYqqj2+8TBd
	EZiC34chjzgoGPiY/Pyp6p3KFGcrcZ6P6eUTQdC9B7F3GlfzKP1fbbqeb2MrzURVI5BoBO++kjL
	hnKocp2RSKuyAkEWmrQsaBirQGTAPrpKPg4dw+zED
X-Gm-Gg: AYBFou3eITwNODgm3El3oUmAu7BiwEOe2yZFoyXaEp87ACjfpyBQcd2/c4bZkdNAjt+
	ofXqOLnVSIQ+pmR/6+j8qGLRa99qtXpk7sVRPUartG3l9s0ZRx6mcGGTAINZQ4C1t+WUpRtaQyr
	PrvhYRMPwVqcD9iExlgM8kcLNUjDcwFJIlengHAujagVd5wdziEeWm9PlJnLGOrifvpw/ya+fNv
	eCBSdRqS9Qpkd69MJcgg/K4xSDfTxaPc4Q/Dg2uvsHc0GbCSenp0TGpsFFtOfo/b2cMOFq3+7Vt
	EQq1kPnujZGEm/w2VU7jfG/Dy/nojdV/a2mifYJ9wWSEiOWFUU8YLQOgr/CiEcRTkB4upYIXJ4n
	CzBza/RApXQXFRZywyLdRntn8AXWE0gMLchhrMTu6bVvUAtQX2Ozg9hAZeL5M3NUElw==
X-Received: by 2002:a05:622a:4d93:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-55d5a579e20mr102551cf.0.1794937627637; Tue, 17 Nov 2026
 09:47:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com> <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de> <20261117-refreshing-convivial-chupacabra-60bcc1-mkl@pengutronix.de>
In-Reply-To: <20261117-refreshing-convivial-chupacabra-60bcc1-mkl@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Nov 2026 09:46:55 -0800
X-Gm-Features: AclHuK_pWCOlG4ab-5-H08lA17LztOZgzs1IbjyYwWDE0LVG_vDvfj3-KsHEHKY
Message-ID: <CAP-5=fWKo4QwAc2Ozp4ScvDdF4eKj_J3Ba06Sd2af=TwyHJO4A@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:19=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix=
.de> wrote:
>
> On 19.10.2026 14:37:17, Marc Kleine-Budde wrote:
> > > I was trying to reach an implementation that avoided undefined
> > > behavior and benefited both user and kernel code. Performance
> > > regressions aren't a benefit and fixing compilers can be tricky, so
> > > work remains. I'd prefer to avoid undefined behavior at least in user
> > > land. I'd also prefer to avoid config values, so using packed structs
> > > for __KERNEL__ code is a possibility. It seems a little sad that we'v=
e
> > > lived with a strict-aliasing-compliant implementation for a year, and
> > > we could regress that for the sake of ARMv5. I don't feel strongly
> > > enough to argue for kernel land; hopefully, Thomas can say what
> > > motivated moving the patch series forward as I'm pretty certain it
> > > wouldn't be undefined behavior in the perf tool :-)
> >
> > Can we revert commit a339671db64b ("vdso: Switch get/put_unaligned()
> > from packed struct to memcpy()")? It touches "include/vdso/unaligned.h"
> > only, so the perf header will be unaffected. Or is there an automagic
> > copying to "tools/include/vdso/unaligned.h" happening?
>
> There was discussion and I learned a lot about the nitty gritty details
> of compilers, optimization and UB. But the problem is still in the
> mainline tree. What can we do about it? Is reverting an option?

I see the config option was picked up here:
https://lore.kernel.org/lkml/179423891136.2093942.13129678709622655290.tip-=
bot2@tip-bot2/

Thanks,
Ian


> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
