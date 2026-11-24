Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795556033;
	b=gcm4Rd2/8S2XZoAe2vs04LSl7QNSkvEKdwFxxbqSDX3VkoUmqqSF/1N1yrDUt4BO6w6Z
	 2O3sktZZT5riv6MeA8HC47+vb9WmHgcN3eUOmKrfrXRaqz96Wcv0qY5a8x1OCpIF4iU8c
	 vDvyfDit/tjrrZwDbGe7idosD5UkrSJkGqZiX02RSJkRInlq0o660cad17pewV3WTAU/c
	 1ssi3TNwZye5mIZ/VkE/8kxJnUUbKR6XWIG6UfWoHjBtRxM7X9zhPnSfCsNQJoaZ+q3wH
	 UfQfCc/WusSN0zQA5tHifcyTYPnfLQu91elrKd7JQtxZhMNCXlgiMSVPEVWloAWhVwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=W6PMn9pXod4vY3GrJbIeHNZxznaf3qoOH4F8L81TVJ0=;
	b=svI6MSyTtFViPn+ExfNarxnwekmnP8pJ2QywfvtF3KRCMg3/MnakqTDnmBc+IkIh+Lrv
	 Ei0LmzKTifoVNTETGV3O4mEBYQar1B6RaRzpAahAvzHVVNGHbGKQ/BXN8eDH4090HcP0A
	 tFbBGep1/Ch8PR4Iapj1YYeuo4Tuv3Jh6SXBN0ho9Zh40aWzvCXpsry4KojH8NZ+Kz0px
	 XoUH4ukDnGbQrqRgo6GKrFOHTGYV+5bDHrCLVI+0e1zZEkeA8IEbAgI0gnVMK8VhSqQ7J
	 ZsK/m+F/ofM2QoTQ4fTIaCDYUsv7EdqgsNMNu5fsxseGlqK/WUp9wNgN/+ND+3i3UYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=X4nvprcP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF0606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFF0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=X4nvprcP
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b51389f58cso55077507b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:33:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556032; cv=none;
        d=google.com; s=arc-20260327;
        b=HCFLiQCdEQWeoHO4OSV63LJSKa5RQZBJcPhB5CJLR+LJJMkg03EsfLJl73wQ1Nm2cC
         94L7ol1RTR0PibnEnpIz3zGRVGYcbKJWGPUygMJc8SwgFAXQD1mIdh+FpOGNG1OSESnw
         41eeneiQ24A/gtAtopGQwiq2sIyzKa4OB4DFul294DmOM39bVYbpJoLSBNobL0DSeYz5
         vPCMIBVmVy8cy3VVORz//L+M2QqGaKQiARj0iX4SW7ArMK9EBuvf/Ks56dybotL9gguv
         W/dUODcGzAPMgN0HO3SoXkOSA1Vbw7fTelivqLNhFB/FNnHXMGps+9AK0wlE2zi+F2xO
         csaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W6PMn9pXod4vY3GrJbIeHNZxznaf3qoOH4F8L81TVJ0=;
        fh=P4CESENRHyolPJhdTc5bGjFrAI9NiYKpD3dfTEo07LA=;
        b=N0QzlpOFz21WIq2elV/j/1KDSRXCdHIK/c4IMzMXYbxhgQrp34WCH3nPYgfEONnMQH
         PHZnphlRn1YuPzj39njE4G3r1gJ+CXNmm6U4z13zaC7C0ygA7IPPXXRiMFbDvN7+TFOm
         jPHRkzMssfvbWbFe4FM6DRI58KD/Zu3f0u54MdMxNDBn5+IV7Qrc4OnDkLosm2X5QFBs
         8KGLVVaaT+il0+gmU4zlkb9ZEcbSFp8wPLyAAljwhPXAfNwlxAk/n/NpBeDMawu/S7jS
         tmaNUy+nTrEz6Vy0jj0OODyAe4Ur1MV06pxm4Bm/7SS5uGWexdnwkgYXsf8fgtOxbgoD
         RiCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556032; x=1796160832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W6PMn9pXod4vY3GrJbIeHNZxznaf3qoOH4F8L81TVJ0=;
        b=X4nvprcPmPYmq2RUiycEyPtlDXmEuBDVZyBc5Hg76jnzk2D2N89hjga1X2OeuvtaYh
         QVfLB0iCN/YOKut1UXNgz/7t0S3N900n+tgjFwFMRsmMoSadbp0kzo4JQJfLraqaW3sX
         0Wge7s9IZx+3p64zKPC5PWSyOCdRseG4kxLxnnLuGUPD6SLZxsIM2ehKG0MxxJzAjIVe
         TcrkVdxfvtCj+ADi10uKpvFlfpJLlyj9FyfMbtOM6/dfWe05FgO9L8QANWLBAx/Ryitu
         4u1Sx1hsyPlTK9OkNo38wVPiKh3WqBdTXz3JhQM++0AcRbFnTgmiDTh3lC5GSVdhXl3o
         1E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556032; x=1796160832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6PMn9pXod4vY3GrJbIeHNZxznaf3qoOH4F8L81TVJ0=;
        b=WHh2woQ64nEGn5V2QsAU9HGCYUrtqNxf03GZK7Q6LgEDs9tFGxDp8s8645Bcdgn6pc
         BPWEDQlPnW2f882N/MhlSrnOR1Wk7ChLL5HnEE0Z99JlBtnSo2HtjNCx3At20GdKHHTE
         n7VfDHC3Ka5ABp4mX72WDly/7TJh4q/sJWrVAzuZoZJZ7VLNB9Kh5YIn1kzZscgmltRo
         rNqlve3Y5j6R1eTXCZx8EUiyKYZccciIw++4RCR4gILbzJe1/kY+0zvaH7AXHzcOXccZ
         DKj42gFzvWDFj7d47jNjfUaqH2HxesLRUV0+ggze2av6C2zkkT+eURP4T7RgJgLvHnwM
         o6pQ==
X-Gm-Message-State: APuU4Z8dH2YXvPsVb9wGisSOLteKZGKuIUxaqREyOOHWCx1stmf+MlHv
	IyjQ+qxhAb+AS1DInD8PUKrkQg9/6Ja9yv/3IFaBHOmHXA8LGfjKYrehngR24dW9ITWwS6aeSJ6
	saSbNoGKt88/7YBeQH50kxoBjVq9EG1s=
X-Gm-Gg: AZFdTZdmg49xu97pn2JAZLLpnA2FKDeF3ee/BAYjE2vN/CBMah8+jpDigRWSpXYq8pW
	Rg4L+VhhJKEQFWPJLSdjgO28g+WMnPhzHB/NDN5E8JIQqb1+Qly8v61vLwSQueJWC2sYsNMrOcV
	WgAqeEOcSfMBdhaDqU/Y3vfuS2O3LXYp42UM7aLsqz60a+bly9q9ashehlbvd22MEjZ6ewJ+8Bv
	XO188pYRyxh3QR9GeXjt+pFVXkOBjszksnNH8Rl3gpVJXGaas3qmLHbUhuofrkpVWiu6KPOomx6
	Lbujz+GIWaubHm9DCxiCj2o8JGwdn3wZrIXblO60CgZUneVXW3gQIewBj03jOr9yIASwz/e+ykt
	RYPOdo9LzR1jNb5vOb3RlMsMWODGVwgmUwwATxFsSsXbnuaVsUPXeN6fMlzfmmIhTiXokAA==
X-Received: by 2002:a05:690c:6e8b:b0:8b4:e8c4:238d with SMTP id
 00721157ae682-8b520522fdemr52679417b3.105.1795556031874; Tue, 24 Nov 2026
 13:33:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.44efb263-5265-4fae-9cff-e8eaefbc0afd@emailsignatures365.codetwo.com>
 <20261106130010.340950-1-mike.looijmans@topic.nl> <1ec088e2-f588-4acf-87e6-0dbf719784bc@sirena.org.uk>
 <CAFBinCAaaovFc-Rvrm=U8Z6NG3HZKrQuM55C-xq9JYOhX6htug@mail.gmail.com>
 <21c64232-e2e2-45f5-917e-d326d159d285@topic.nl> <CAFBinCC23T67TMAGOU13a5+3jw2ps3Ye5aZgUUXJQ3cVKmVT2Q@mail.gmail.com>
In-Reply-To: <CAFBinCC23T67TMAGOU13a5+3jw2ps3Ye5aZgUUXJQ3cVKmVT2Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:33:41 +0100
X-Gm-Features: Aa3M54oLRVgybInVT0XA7rWL0Kgufc-c7J3LJY2cl1o9E_AXlBoKDaB6fe2gUmk
Message-ID: <CAFBinCAOrgZPFAx7GoA7sY4JF1uMPjVpf914dUqE0oUtSC_FPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] regulator: pwm-regulator: Revert "Calculate the
 output voltage for disabled PWMs"
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:30=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> > What happens in my case:
> >
> > - This function returns 0% because the PWM is still disabled
> >
> > - Core wants it to be 50%, so it calls set_voltage() which sets the PWM
> > but doesn't enable it yet
> >
> > - Core calls this function again and (still) gets 0% as being the setti=
ng.
> >
> > - This goes on until the supply (and hence the PWM) is enabled.
> >
> >
> > What the callers expect is that this function returns the value that
> > would be set if the PWM were enabled.
> I think this is a good description and something we can improve upon.
> I attached a patch - please try it. If it's not enough: please apply
> your patch 2/2 on top.
> The goal of that patch is:
> - keep duty cycle around once it has been set
> - only reset to duty cycle 0 at initialization and only if the
> regulator has been described with regulator-boot-on
> - (it achieves this by keeping a copy of struct pwm_state around)
>
> I'd like to hear about your testing results and initial code-review feedb=
ack.
> +Cc Uwe - happy to take your feedback as well.
Thanks Uwe for your feedback.
Mike, did you find the time to test my patch?
