Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162610;
	b=iZTHmCATaSSxU/vhyD0l0eSmiL8GdCm1wZHN4Y6WrrK2/SIr3bn1QiSwpUxAyZc5FJ6z
	 hAwDRogiTbWbPc2rUXpQ4X/cwplEZ+E1vuxG/TEo/YqjPNOIaSwdPvqDCUjJOSjrHqAu5
	 Y/nCiNXcXIjVvoRL4AhucwLxIVBBGudQkRDl9YgX9oMA31xCVQOR+gtzOsMcZ0fYOWV+4
	 nAwZFx32+gEPyTiLwjO339xp42VMT+jWBKPNGJNLXtJLeUIWYmNdmOM5W7Nhf7tV5c5lr
	 Gbq9PJ4cBo0G5KpXALrMZ3CPWbwX61srgOu7Zn6UOKjojf1zIpy4OOMWfJzMLHP7PwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
	b=OxgvE7WiEkLitTcbNE3zFL9WRhhgbRjYSZE917QFmsxB5NTHDLQnD6dop5eYTiZQaHjV
	 0FZEn4J9rSyiVzqYmxov/ysyDmKexxVCTelfBB3S12iX6QUNlZEgWQuP8inlG1lmd5WBl
	 m51I4QMY/rFFlhJKiXbMkrAOg+OAT/6tNJx32YxDrIgm+ftJOJllBIQCa8yiqr49GaAyg
	 KZw87BY9eQKS+32Q4+dfTRyEM6jNdsImykfCKHE16pDRiQgh1ctq15IO1bqFyW76nq3re
	 oMfrnSUtODEJsaVcsJ74Vj18Llrm6SrbIIlbaunrpAcsB3MIYXWQYte0GzqvRUv2g1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OidJyP58;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6759C606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6759C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OidJyP58
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so170675241.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:16:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162609; cv=none;
        d=google.com; s=arc-20260327;
        b=BuWfU6XTooZm7FSQ/Uynqej4bKFdgnpiuZHju8JyjbHEF/SDkLe9klpXHvKK5M49tZ
         NR3dz9uiJdl7wp5nnIoP6rh5WXIoEW3vJ2OAdbFkdQ+vsdBOAz+lIyu79+VhNGSAPAEk
         M/NWYDIDn7Hehf+6kG+LuLXqe2CXBY7pFfxDvpxcBRWWtqKV929CbtgN4FG0ipc/OPk1
         QxowKov2fk4HFTBpNY68WFRJhE25IzNsRcog0mB+1NN74W9qtyv6wDzIC09TVLRQVjGr
         gWY7+TVuKru5atOS5vsfbrUIiT3ERPdx2ve/+yvvTIxezf1XZuDTKPfxMF0OLtmXQHRZ
         UhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        fh=1ONBzGGbhpv067IyI/g4rjjOhjIxaNAb+wyyvZwTLkM=;
        b=Dl3c7wYO4WvcKnxOFUcWzUpual2Ny7s+ipZEBIiMkj64GlPXIjgpMsnV7GMp2WEdbE
         Wdf/G7SkzPiaGp1SsyOfT2OZ+NKaXt68CrtV8HGkon70rbpie4kBAR7MTpUgT175X286
         qQ5tp4g5fNStgjjahhmXppt9P5pwk2ZNtkljZXSOE0/47KH5Kt93N2jOQn9ksXkNin0F
         dulpZmfBbE4RnHdERol4x5Oa7qGWOKIdFyvHXloEvUyRagbocaz3Q6pnmvzMC6LeniEV
         CKESOTKY9gIgJHaGIDkueKWHbZ2b5bxhj/LAZajz7aASP8aFJGbujfysBznT2cDM6W0W
         qNEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162609; x=1795767409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=OidJyP582FX73SpilfBJrOmiXhxrJOYCltwuoU44dARQd6knYJbLoNgzzr2QZ/AjoL
         HGCKHEEsI3bmshiQlfpEnTfkM5hcAJsX9eANMoJEg9e3CY466eqHmlenferkg4xMEhkc
         xpOd6DLKN5qeg8dTs+yv7+uyQgIAz4Xzk2X/hfkkSTc67c9yvB0IWX/bcw/vN7UF06Oq
         KNFPsahTkSsJrS8+tZFSqCtMwRLOddaXqTkAsYE3tFmraWqdL37SQVgkUcjqC/2YhYmQ
         4AbAtUlx78qBQjO5gKgsyULaQp3LIrBnyCzG+hBL4bE867SrG+nklbMutTFgtKsdHJOz
         IZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162609; x=1795767409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=QM4nFwW40SQObuewFThBitGyAvdekJDlJtSuTzUE/yPq9Y+0WEXnDPFCQ/ftGVuuaz
         o/YkeE0A9pPmUnj1IucpkXlxmLfzLPzD/aSrAUdUz3rIik9Qxc0KWssttOhotFAtqse1
         7jjSkxY4jtJVEhToLzww6sGK9hoVWmkL8xrSNB7Qnpb84HUUamnBwZ69PuCAHN9Rmnf8
         +sDdimaVHvet5feXIObzT13j35LqatUmWlzyxYTkBpOZ004XhxOnWF7Wwj6SxUW4bzKQ
         aJY4p+imxcssoJ245C5QiDmxxICPSjkN4cw68sdWFbffakk+0hGxEVN72qOhpLhn/kdJ
         kq6A==
X-Forwarded-Encrypted: i=1; AL+hErHSmpiqhYgiMJ/iFwtX4kiu86fr4WgKnqFdDV99Ak0a5m/7oq9++hYs9p44YvxlUeX8k3icOrCFzm+pHYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aS7zmrEzuUK5UHNGbPzDuzIVhjVjxKZDfkJQN1Y0NOKV4EQ20
	LcMmsLCNLxaTJQT3nP/iVnWnkqgRfi6szkoe+k8xTXrpxXawhKhqfzGorykm+Cjg1aqORk2J4wu
	vW+2jKT442f3tuBDnLWiXRVmyYg7r8Es=
X-Gm-Gg: AZFdTZfZRSFY4v6CC/H4XLHhCoCWfusePPxo9qesr92fi9IIgCgYZR6VxOsEEk/DmUR
	yXFEnIMYAAcFM4RqALw5XiJFt51ChKLCR26cuWZ6YtIlfmg9Y+RQK2BzswW1Ge0Vyzra60TfGaM
	GG6/USKCDbhdQpafI294IDIzmGElM5F+zztuoZisTh8Gelub/nMEbuzBVCtoIHlpQ9h59PCSvO7
	B/KxOXm5gtrv+wJDzm8KTKVmq6goT4IOLjuh3B+SNJCg6byEcwgWBM2oXFbtBVS+HAYIW3DxlXw
	tMsMFAD+vLnfFFsPgJSS+MTVXSp0oITH9t8vUZvz9fmhC8XdHKnLaIvLm6eAMobpwDmxhBi6nRO
	54xoPTwxOoZslPbvwJGYDit+MYo4tHw8XGPoJKwUvqIKfopo8fX07UqrsoOyWBYediXVdizeJja
	VSijrDirHgf6wQunpmlUYRS4Mj4H4jIlQBEQqPYfJ+DDgzPRTth5+3YShWgRFckA2jy7+gS13y/
	Ja42Y65bbxfNtgi571HipXI/wTlYg==
X-Received: by 2002:a05:6102:5cc8:b0:7c5:4da3:aefb with SMTP id
 ada2fe7eead31-7d7396b4513mr725084137.34.1795162609310; Fri, 20 Nov 2026
 00:16:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
 <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com> <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
In-Reply-To: <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 01:16:38 -0700
X-Gm-Features: Aa3M54opK0HsAqJ5IKoxodsp8AVX0yGJFnC-piFBxQLeC7dh0z1JF0IENGFsfTk
Message-ID: <CADvTj4pkgZj77566ni_ifFJODRC0XvvOddiOij4kGRxoseBqfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
To: wens@kernel.org
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:02=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Thu, Oct 22, 2026 at 8:09=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > UARTs use APB2 as their baud clock. Expose its existing clock ID so dev=
ice
>
> And how did you discover this? How did you differentiate this from it jus=
t
> using a combined clock from the UART bus gate, which is also driven from
> APB2?

I got APB2 from section 9.2.3.5.2 of the H616 manual, which says
=E2=80=9CSCLK is usually APB2.=E2=80=9D I took that to mean the UART needed=
 a separate
reference to APB2 in DT.

> I'm not adding this simply because you want / need a baud clk that you
> can set the rate on. That's the wrong way to go about this. You should
> just add CLK_SET_RATE_PARENT to the bus gates. And making the bus clocks
> variable is a whole different discussion.

I tried your suggestion on H616. With CLK_SET_RATE_PARENT on the UART
bus gates, I can change the baud rate using just the existing gate
clock. So I don't think we need to export CLK_APB2 for the UARTs.

>
>
> ChenYu
>
> > trees can describe it separately from the per-port bus gate. Keep the
> > existing clock numbering.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-b=
indings/clock/sun50i-h616-ccu.h
> > index 6889405f9fec..e3318772c92d 100644
> > --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> > +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> > @@ -11,6 +11,7 @@
> >  #define CLK_CPUX               21
> >
> >  #define CLK_APB1               26
> > +#define CLK_APB2               27
> >
> >  #define CLK_DE                 29
> >  #define CLK_BUS_DE             30
> >
> > --
> > 2.53.0
> >
> >
