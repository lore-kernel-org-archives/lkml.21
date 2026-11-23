Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448209;
	b=m7PJKs92Oa7b4vn9a59INx9oLp/de1aHZUMFNOx8tCY8AbqtD/jZbfEM9FSgKx1IeZFI
	 pwQG/FEf1FMY0wZTaDsaLhBs7ybSMDcvsLMSP6TPYaaPgN0p/mMGdJtRUDfPQett6R+nQ
	 /oZo5YACOxmbcoAZrvDaYg9+dPhKGoRITOryTprgCouJW3Pl/LbsyhAFiyk6dGfKyZqJv
	 T7Ngtlqfd3cym2GXQtfsbeWPZLVDRMgez3UKw/kIsgi8ojEr4g36kpJMy+hYPEJ0ruK8m
	 tKvs04WB2yI1fEpfIzyACOZy296JbCJnBf9/MrrUTKtKkAQ8t2VUKVplep0+6Rh/F+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
	b=VUl1mh73q+eRTHfreuPOSDd0lbnUeYFk7vLyfIQyQLhU92jPPvdvAQKUDk8+xkL4By7H
	 CIDLMqfPuQSMfsw9K3/18KGdxmM9rhnBGTLj1EOPsVE7iZhcKzh8qEDbHkBEwVAQEjQ2w
	 zSvAy/caeM3CpBgqE00WAlapky6xDO3t/TOpPPd9Li/OnbBt0FRVk6jEi2EnrlnCNT0dy
	 lu3v8p7F5VPLeP0f3utBu4afH0T9us6Zp0+iszNaEJ8FNPvQYw7RmfyYNzBFOEKPpi07L
	 sMRJ9fteSWHRdQC3/fF+OMTV7nEJcvml4+AdjsWgCwFj2HufQuj3SCUxnfXHYDttu8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhVeuiyD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE3606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1BE3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhVeuiyD
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38587f3de36so4151180eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448208; cv=none;
        d=google.com; s=arc-20260327;
        b=rcdAsG1xppAO4FKMbHTgq+Hil4/j/33Fw5lZMwg/WV+0dK1IVvdHiNOfTt7SI/EnBI
         i+x1WJXpsg5mizxV2at0UkQOojQ0HCDKU5ZCakZFYT1fQegO6CdaVlLVqtCQmCOvaATh
         ml8NnUtlbshyYGbn6XWf6GWfQ16DIZDvgltKS2ynt0cG46wTp491opGSbYXkIK3I7XoA
         CaarCoxh+LyQTDSiiQYaFy5qxjKkYb+Vtal9j05ffbm1QB1aCV5sWdtot0lMDv19JJ+x
         bLHLsroiCtR8brLhDPOWIFtiurC9BAcMdWCrj3gW42Yjq8pMorYdJNlsjQseV9UhhmvO
         ImbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        fh=y60k+accAs4t3c5YEWLhbNyUsxLf+Xi+viwdbknFCJ4=;
        b=IIt4qaKoqh2TfzIYmAvgYaVMzylpcUMSgVCbwmzq89j3vEqTJWHeKPb/pYnD0/3Iah
         nymWQXlVUEbTvFq8nav+5bJR+C++hkgs74BrgNMj8Voc5cjGsYL+py2KVbPzcVicievx
         jsf0rKPfdkb1VsbynkO+yvFRvxhf+x8aZzFhUo5cYw/uqlhgldpA2RwYw9K7lN0mR8Tx
         goehM1VD9HbBEZr3nfZ2KXJGHuvtBsqE8gGJSIChPltpgRYaaHadiY8DVdxQa4JVaKmr
         3h1RvQqkLNfLFSgpheLRmwv6pprneB6zzhMCLodmDD14ukrDf8pr9uw1IahZ7FyPX5sL
         B34Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448208; x=1796053008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=rhVeuiyDGD6m7uUohgi9T0W/7eHgowCSzNgM6wFCIaF3tFDNkwX7vA3Ae2675ZGqR8
         zB6651frVOqzOa68J7FiE29B0IyQMmWvjYyPZYUxc4c7V0P4XfXFAed6Ww6FwyAIBHXN
         i0Gaexq7ulQrJBhDuPSVE2JVDW5nQYgL7VDuFrqsMlg4h1ZN+4tpb7QIsnoZNX7NuWl8
         hyJKkfxmyGDo1tKTEzjKYm0/aQ7KGPBLo1SN6/HXQQa2lImCFF/O/58GXvDDk0qWo0f/
         9qgqNhRcbxIqjiwJKCsQ4s7o1m+upIyOc5+6Oghf3OGv0MaSzHXP68pGCZJe3K11M1zS
         VaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448208; x=1796053008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=wLDKJBBSYXVrkYTHgXlL677Im55WXuAF09ahlqS5CmAiZkEAWQP9BRSDsl86uZXWUL
         R4EbBcC//vssTcIcr4P37UfAB5ajNqr20UM4PywD9VTQ9Wu17d6qX8CqHTyWMF1UlHmd
         ZldB1/g1Fjac013HPvQ7R3cWoLDHVgJm5F9f4KEOopVAV8GRHKiZWrfrWtj7Jzj8pYkA
         Xu3zd2R4chneTt8451oRPXpfehezcJrGSChnmxU7oe3H/LJo7MLrA6JSZ7bY2BE1iBZP
         FSfRmwlDsogWzHIOz//gkOuOrSHBDHAHIPHaHarebZWz1VxZDQvmPit/bE5sUtNpwEjU
         P+Nw==
X-Forwarded-Encrypted: i=1; AL+hErEBYOhsfJaotoFLDhG2+3dAmulvx0ucjkQZRBLU5golU7LxejqYj0yIP1SJBo2t0xbXB2OERHbQPNAF/Os=@vger.kernel.org
X-Gm-Message-State: APuU4Z+18wbboAzBOuEnL2zowkoOQ6MgXsjiC0RCh8wlRj0SZsUGjGYO
	mWcZ5DaQ3bTTx+f3kGbxV5H7t388BQS7n69OF/YyxpqM894bKXxkcg5rvzJHx/3LCjHhI0aCXOX
	84RzJvmbkdzy+N2MadDKwqX6jXCfUfbo=
X-Gm-Gg: AZFdTZfSAag0tNKxAjaU6rgoZWEW18YVLtli39cow0TETRgbcK1X+I3iKZfgYjvx45b
	RRVLQtvMcDYLaxNHbAi8udWQlLN4VGp5bFq+5EbNw+L3ZpNhEuYc1ZLwAZn+RyzLwKNu6nkoLpp
	wgK2JLjnJ33h/4RDT2p4FleJRaTDBWae7As0mE9rUj5vKLd7KNGDw8bOTYX8TaZ1TKz/lsw2BR1
	nHSeTM1sHMBZGCuHsj6eCh5Zzjnj/s23R5cDvU2i71bApcJPtoZtjyUj9i/zPDvLxGnwgOksmYd
	IM3C1COUJmDr+NMunZwaaGYtdBfMZDKsz4QWi6nlfCC5s34iVD9Dqp38iXgxt8JCq9fXyOpljpg
	3Mr3OM+9bN/XEsiaWZ4cs3/smpexoSUZfnhv7FYczcO37jgk7LYVjNzgNcDGc5VHOaH7HJ+ceWe
	928a3CEowt5D4xMltJ/BRoacP7r/Cxrc8DvGWC8Psh3aL2Kq2RZLI=
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id
 5a478bee46e88-3856c4b844cmr11761769eec.1.1795448207689; Mon, 23 Nov 2026
 07:36:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-3-clamor95@gmail.com>
 <20261123145520.GA2412988-robh@kernel.org>
In-Reply-To: <20261123145520.GA2412988-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 17:36:36 +0200
X-Gm-Features: Aa3M54rUDkGOVQLPkkzUTzUHY6vBcwEurritNE5bPXzc3P_S34AV-IYkX1z3J3o
Message-ID: <CAPVz0n1sOsC2N+MWEZXN3DYGBgLicS=+e-q53KjBYcJtLiWXRg@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:11PM +0200, Svyatoslav Ryhel wrote:
> > After further investigation, I have found that Tegra30 requires a sligh=
tly
> > different programming model than Tegra20, the maximum VI clock differs =
by
> > nearly a factor of two. Additionally, Tegra30 does not require the
> > APB_MISC workaround.
>
> If the clock rate is a function of the sensor or input resolution, then
> wouldn't the h/w design prevent that scenario?
>

VI clock rate depends on hardware. If wrong clock is set HW may still
work, but be unstable, which will result in unpredictable behavior.

> Does having the APB_MISC workaround make things not work?

It does work, but my main intention was fixing clocks since Tegra114
does not work properly with 450MHz. That was why I even start digging
into this. APB_MISC workaround remove for tegra30+ is more a side
benefit.

>
> It sounds like things worked or could have worked with only knowledge
> about nvidia,tegra20-vi, so I'm not sure this is really justified as it
> is an ABI change.
>
> >
> > Therefore, remove the fallback compatible and add a dedicated compatibl=
e
> > for Tegra30 VI.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
