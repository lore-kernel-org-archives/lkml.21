Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795791652;
	b=mMbZgvRTR4G8yXD8VgAlgyCdt+GU6dl/JE6oGaKrwxsmKu1HpwJhveymYwYzju7ZqM9o
	 goFkjGCA/h8sQbT4ucZ4snir6ln3X0DVUcYYJytjeaO3/mM5KRzzViPBOKwwk3YMhD8en
	 gMM/uPrHOs89rOzGEEphpuxYC87yqV1U5G01u97Qc0beEuk/Ry4nG2b3X1wgloPqTor+c
	 ws+h12MU2VeXVJCBgFq6S49T7M4JYDR8bpO9CEUk42VTiMPfZCmZ9AWc+Z0N3VAE2g9IX
	 1FLd5CB+DPxfLiEoAiX/Yso4wjg7BELLNeusjcSMuUeYGoQ9DRnBSiiLG6TzW2Xvbvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
	b=hIyxMurrhYL2EpdOn2RuSIh4PjO2sxAylQv9TOjB5PRjVEI5iA84FhD6Py4d7t0UzmUb
	 XSYEyafpKZ8pfFnT/dLepaqTU84K2xrQ5UnWQe90GdjtywRLeOK2kVYJKtFAPdtmXk9gr
	 XioRmXe/xOjtbKj+s3lIcwfR+bAf0pRV9OhIdYXOoamY6WcBv9A7ScSS6nE4KTAnGM/0h
	 t0VzIw3oi8EIdZrNYG1qfbxDdc7/Y/qGtVXg3jxY71c2PhhoQDcxNg7Mtk75CtdKOIO2v
	 roRHXo53CZZXidblJlT3+LmzKapgUedrazGt/R5GLgG3Ha7L6Jhm2RPhpTVg2E+HKeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5tRXD45;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE66606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE66606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5tRXD45
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso17418468eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795791651; cv=none;
        d=google.com; s=arc-20260327;
        b=kgRJ2oIPLSnUkci7QURCuCYLwJW1mQ1KAYOzngv+TyBRFISgHOXSuhFTYjAG9WvEgQ
         fj9vVEUbb6IBWOUFYIxvX1Eat1xzn0MXEVGo/Y8L3F3i+UnwhbI/biznibXirhxulcdT
         4pJDzDSDI+2IK4mfEMm3zL9+VWRdMjo6ZZq7wWHhxb/SkNZYPij3zJO1ttz6uOcZZ73W
         +8sOEVp6nIpNsDJCy345xM+bIWNUTvOdtrkxReeGbQowXBjt+M0ckGEsq07XMPzh9rLB
         mx4eGOplU7JMWLAAQeRBRFnfbq/4K7k34o/PupQ1e/LVhE6Nqd8f9L/RaM37IOlyrSlq
         LL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        fh=sv866ntPxiWdtDwziJTd9XpB3WhP997uBtJT9bWxiB8=;
        b=ZPfzxo7KyD5j96ND3pB7O/2gNi6MxSP77lX7OIqs3Nc7yWjitfuOvvnhrNnAnsl8g+
         O4BkhYjfSdgyeHPFxw6TxfDEhfBpLLPqOYqebD7/q2uSeJBBBtNk+L5yGpL5uFsMqbqs
         /x9XHcRfruaXQowe68o0MPpI31YLQ0L9km3Jdm8/BFsblwjDNZY4m1UXiEJEIWJ/NtPq
         6kHyrRlCCSJ4kiqghYdX+O5zgD06Xjai9xj/yCMUKq00H74o0DlBvttCmdKKqhM63kYo
         EU6u+kh36bvu/g8GFYwLIxctZAuCwmzVsX49n5nY6ZeCph0hY7tM4lVISxSrOnUh8kwc
         yREw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795791651; x=1796396451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        b=U5tRXD45RYe9IaJtJSwOLXc+jl2P7zuSUJEzxnTx7fDaEcBvntAtagjLA0p9TYutBg
         kjNNmfAd7cfIhrx7sOJC6EwTPkRy5JpXd9fQa/nfqUIQFLzWyCZ7NVgiyRFsRS6VidTn
         +cxInGGlA06HQ31MqTnZfVjlS0lPABiVJCcENh0k7C3Ows8cEQ9D9InFMq3XkpEZrKW8
         FgbcpP+9gw9MpsjAyoOTy3ig+7VxaKaig4+mBJnrpJ8uMdFEWvR545M07SViGkRIpVEO
         +dIfXkHa5UlzN8brC643dI3gjxeIhOwPuY/nWJq/FP0Ul8VnHOjeVuTYLltvmkSWJ48V
         0Dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791651; x=1796396451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        b=ns13vzGLJX5BI/4l08odjIr7sPTrKhbiEfDUQ6JrUs1ut3GYqqfCZdrt0lN9F8ZCqr
         TryYjfVhIv2bI2eM/87S3U8P9x/Qs7lE2UxV8KOiNMha2SGNfBKj0AlycCnHC4p8ptWY
         uXcCIf+gjdOvkzdJhN7mhXCQp6csvNVRLbwMjqeAvS1vnfK8hYUdO+yfMtp5f+0kot8F
         TpJEdDh468XuJyOchCzRqjkoZ7jHIv+y5v1Ret953cJTt11sS76osuKBSA+6nAO5djLg
         IEjOx0jG1YKFC9c57PnSbv6u+TBicnJHOpynmXVyyADjC4v+C4WUXf9sJd0l1onEWsol
         oJFA==
X-Forwarded-Encrypted: i=1; AL+hErHI00ElaY5426PbH3e+Kr63h6aLOIXzpnUyzxQPm2AjGeSdvkkbB//h5ZKvhL34ncUB+XwbHDE2MWMkoRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+G6ZChMM3dgBP4ClZgpHHaBI8uFEZw2MTFo9Vw8xbcwd0jRV12
	YZDZ04/xBWR2cb6zUm6nIs/lQBpa3Pkqr7sd+Trxg6Sjn+duc4ppi7tY/kg1RbSZFpUVhp72Sen
	z/juSja6ZmuCiVL2r+okZEpMMbEH+YwE=
X-Gm-Gg: AZFdTZdzrSXxkY8/oM6/9VOrrcP316zi+hPFwMkwVdL5BX8CiVVErvKT14YSKCQwhJK
	i4RtbdCgT828Iq8PXtj5anyBB3HMlPCfrS3keUve9v/WKt74yEtarJo5yc+1mHqpt9yZuKpnbtL
	4Xdhsfx9Cx0UqY3Zxj0tIq8x50L1YJ6U2rmBzyFekSi5M9cAq6LaC+3WFWzeeO01HZTUaLBLJh2
	u8WSpRlCT6r6vVDOfmwWDBw6BJ6HZ9QnHDrIQM38/FhWKMGy675pF4uszf8t4zvorN1m3ZzaNe9
	lw39FoqiNl77cgbUgR844HyEj5wiTczww8ylUz5dci5IJf6EjWK64/NrrEDG+krv9atExMBDmO6
	mq3Kzz7BPxjCDYy50/ZFYbczjpPDUYL+kal/nURyd51O+tJLYrtESGR3nLgacLuvVpmmk5cqh7D
	Lh8dOvC4giBfjkTtM2S0QKj4bPmWG+pw==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id
 5a478bee46e88-3857111f65amr27118776eec.32.1795791649409; Fri, 27 Nov 2026
 07:00:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115085826.89641-1-clamor95@gmail.com> <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
 <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>
 <20261126124719.GJ38590@joneslee-macbookpro.roam.internal> <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
In-Reply-To: <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 17:00:37 +0200
X-Gm-Features: Aa3M54rzV-ViZY9z6DJq1q92HT_iE_h9VqHJH3pyc5wvVXF_KFD3s5My6-b_8Bg
Message-ID: <CAPVz0n3UgNrS1vJnPhbaEFN1rPMyM1eBHHhVt8X+Vq_Lvc8p1w@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:5=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14=
:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thu, 26 Nov 2026, Svyatoslav Ryhel wrote:
> >
> > > =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 13:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
> > > >
> > > > > The AAT2870 supports a dedicated main power supply input alongsid=
e parent
> > > > > power supply for its internal regulators.
> > > > >
> > > > > Add support for retrieving and managing these supply regulators
> > > > > (vin-supply and in-ldo-supply) using the regulator framework to e=
nsure
> > > > > proper power supply dependencies and power-up sequencing.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/mfd/aat2870-core.c            | 5 +++++
> > > > >  drivers/regulator/aat2870-regulator.c | 1 +
> > > >
> > > > Is this a build dep?
> > > >

On the second look, it is a build dependency. Since prev patch
removing platform data changes regulator macro as well. It cannot be
applied independently.
