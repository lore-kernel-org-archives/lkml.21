Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002256;
	b=2R4oW1MtvR57KS3fgQbEc3kfMxVJ5BNWrDNpxHKP1IW/QHWB05G2jraSKi+AEK9FxbI/
	 58TaNGTadWy3vRKf3X3rl3fyq/vmzVdNZqPGAR5dOyK0K0CGs6DlqBdJIiaNzMieeH3fI
	 8vni1c/39xUa3/QHOJ3RIjKh1Ag6YR1npdUdNSVVfkS4V4YzhvyAXRm+YSdepi1IUtWMP
	 k2GmIMC7Dz6zpHMf4vnjICNaJQc0ESvOIpz/4T3KlggGWOgddfkh7cHQJ7l/LPXnez+IM
	 YMBa2JFYP1mOY4c4YUXyNhMr+TJPMD1kAOB2jMtc/mdt2RvA8V1HNU/U2EeQLkBWm/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7wxyVYogwlbLITEcqMPp6Ab4ibF5XqXtt1YOnFTe6FI=;
	b=d0XY/1wn6VDOOYzGwCDMdTP+8u6tCPq0JZu30MpmOxPS8s191QkMo+19yxY22vbZtA5B
	 0uQVuJSn/SyJUSjNvXQTAWl30zWEt6YwgJFxe0G9nOkTxJrwxJUGbM+LH6ZPOwE9bhj8v
	 kMefhQ+uLSAebTLTcw3PnFLdB44voQOlKEd+zTsX2I5TV+oYBa0f+WcNflKmFyqAgzz2i
	 NCCGiit4+SXFj7pryvkozAJXKj/m8H8tv1HpB5DUJko7i9Ab/60M94u0qLzLbuD0MWsaI
	 WAr1Bzo3hl0Pgy2GnOGcDHDAAi64xp5U7d89IDjx0pR4HGMHk01mOOxcXgHN8aKmtYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jN7BU0u6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7CB606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D7CB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jN7BU0u6
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d28f75d62so131265166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002254; cv=none;
        d=google.com; s=arc-20260327;
        b=GFf84YKy69AB5+XndY/qEpPRcfRSqxfYt/MO7Oi3Ex9gIZcXxPmwDNmrptnH7Sw/lZ
         WZR9hjI2t70JV3XuMzOFwP7rKrPDjNqEsD//gK1SAfSXLe3wAWcXBOPg/Ph7Q21b4ifK
         eJZYJ1lTK/Opv0zRoT3xXlr5kvfBOyjVHpZY+7DJZV4oMZzwySVJd78UblMtGZbo9bt3
         ZP9aVM3QtgxX5EBt71vjM+a6Sn4ze0OgYMyaHjgK+rFCq5CNo20nW9oRHUyfkT+vsznh
         am5xtHisOS6eCcnlA52p17H2bze3JtAM2LA9kTNxnTGob/wDWMEMBI4p5M0aaj0NbhO1
         SHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7wxyVYogwlbLITEcqMPp6Ab4ibF5XqXtt1YOnFTe6FI=;
        fh=JFlrt3CH2TKE/3GIeaX+al8T20005XSEaFTfSARswtM=;
        b=Rebk8Q4LCTfECAx9MQjK3t8dv9mMXR/UAr1cUkjWm5VxaHEt4Z/LQEAL9czjwgVl+q
         /5BDqMaVPCTh5R+DOMdkXlkQWrYGI4ak2q6KL2ZPVb2wSWbc2cabFtteIcTEampK/bSM
         YM2TQe1pH24IkbjOj4Zzu+3g0qAK5evK24HUEmo3LZuFJ3lZBOcoYISIU2NeaoD7oWin
         HS/BL8fIX/K+sHsj178QW70fUr8XyXyst01LE3EV6TUJHcVPM9LueBAsRvSp6dmIpNNW
         qL+IvClUg1nf82cFpG3PBgCUkhqLjd3DlrEP3WP9ZRMiRb6/TirHZ8N8oUGz7lMgGzB5
         tyLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795002254; x=1795607054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7wxyVYogwlbLITEcqMPp6Ab4ibF5XqXtt1YOnFTe6FI=;
        b=jN7BU0u6VeM5zSAfAgsDJ9IyShENVOOHKCcCU6Tj6O5lMwlQz+dubJKsJAYbwPU7yJ
         6hsznruHd45cPNEkXsTvlDysvzMk2ZekMgtQWKk54R/4tCebZc41mm6s7okNdb5m/NZl
         Q3VkLw7qfhudVbmDNpoB/D9KEr+jg17v8jaaPzVjx7sRtQgGFWTP7hF6eAPFz4h6Umj5
         YoRqzs5n7yRe9aXS6QamGXu9HojILioBaDIJl5DvivDrY1HkkgGMLnJeAzGKpOmrxinI
         sH/qNInFGi/hCvH9VZ84h3bTKkzH/RRvY0dutglXPcJEJriQ0Pwm++QTnPDizZkEh1S6
         QjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002254; x=1795607054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7wxyVYogwlbLITEcqMPp6Ab4ibF5XqXtt1YOnFTe6FI=;
        b=Jamgd7NymBs40TPR+YtwuwvtvwNMjoP2DLkuRUxtO73Ta6lXFTi45XVA0vzZIyFY7r
         tz3L0LTFs9HbbL5oDjmG81PxPX3fj2DHMOuzEsKWaVMtMuBt2CQ+ScNcOF5EblRl0Zxk
         OT+pZocyKDXsCcNIA5grnGgclw5Q0DnAD0rCD1d0mte5gGGaztzOhPNKvRYtqFJQm21J
         f8zAezWlfn5brLTryEaVxiVQ2mmYJCu+dZiG3ul8IFV7qtrP2u8vbv1dcZgBGlpB2/2A
         KBjW43hzRnjDOKp1gtEEwx2dVscj9o6YAl6nfq54khkuxmrQt6DmtV0WPzSJmBzvakqF
         4Tsw==
X-Forwarded-Encrypted: i=1; AL+hErE4JW99q/vlo6KeRPGlUVzm2Jt9i+eWvGpYtyc2IFuf89X+vBkLT4N07UDPybztx3+H/nxKqg0fjeUafbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z87bFV5mqBaqpTh7/V/e3tdcAqOSTqxkqU8Ne3zAWxDi+s4qFJy
	RqjFF2WL5KiebthmS58GoHQjGaehAfL2KZSVFkrp4h3uRjGhiHKj/msrJVoDhrMUPQfqewf8hOl
	QXDlcY0iDon65Q8Woiv+aw0PniyLq23o=
X-Gm-Gg: AYBFou046W48jh6ElcqGOGvuM3CYoPgeWcY9yAX6FMQdwosnprvL8M56j1LbHbom+8X
	Y85pVqt50b8cd3D/izOlzKRvF/G4m2ult7Jf8CPgSQWQ3KVjYysgLf1+YZSHIJI60MtmjrgybPZ
	uNtFpoQ0QbZOmpaj4ovvGyMmW1Dd0Arlqe5S+nDW6reovmQ5buIS2KGdNd+6nq5Mcd7ii2mkktq
	2zmlPTuI1zm6p7/Sd8Xf8TKkliXEGgM4pXfA71OpTuTCTcOJSlCzUX0G9HMyFkbad09UVRhI9oZ
	1mNHCkBGfMYTZRgy/Tftgz5Gk6YnJMkO1A/XcGDJXZooQbonirvlowRWLImOy7V0TCC0+hxx/bU
	90OMPzVE0w04LjJ+5xP7e+31d5POz4aBoxwD39cFKc89bHfbDQuEZQgwJNwNzkRiSm8sgvpHeMU
	t4xpGav/rCcBGQ8hpK9amMqDVLXLOU1Q==
X-Received: by 2002:a17:907:2d08:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c510e4c7b01mr203942866b.32.1795002254458; Wed, 18 Nov 2026
 03:44:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251013060018.43851-1-clamor95@gmail.com> <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
 <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>
 <aPCfiJxyKOXsgNJe@shikoro> <20251021132529.GA4133357-robh@kernel.org>
 <CAPVz0n3jt04xEwGr1aiDTJ7OonYYgOy3QneteLXgdGruXGMP_A@mail.gmail.com>
 <20261118091334.3d51a5f0@bootlin.com> <CAPVz0n3=rL9jVc7DtG9FmcH0zs11+LXg1+HRRf9aagUqZf=+_g@mail.gmail.com>
 <av2Nb_likDLz1u2c@shikoro>
In-Reply-To: <av2Nb_likDLz1u2c@shikoro>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 13:44:00 +0200
X-Gm-Features: AclHuK96an4qc5B-PYbtLDwncBYBe2347MxD2hcXG5FWth-Tpd6Gs4iX79m0kGo
Message-ID: <CAPVz0n2rZSRAz2NJsPUXYncgEAi9cFGM0ApfarFq5uMoO9LqsQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Luca Ceresoli <luca@lucaceresoli.net>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 18 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:3=
5 Wolfram Sang
<wsa+renesas@sang-engineering.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav, and Herv=C3=A9, and all,
>
> > > > > > So, if you want upstream supported I2C hot-plugging, you need t=
o wait
> > > > > > for Luca's and Herve's work being accepted. Or provide a superi=
or
> > > > > > solution. Or, if you want, join the ride. You already have expe=
rience in
> > > > > > this field (and hardware plus use case), you would be a very we=
lcome
> > > > > > contributor, I would say.
> > > > >
> > > > > Agreed.
> > > > >
> > > > > What really slows things down is when there is only 1 user of a n=
ew
> > > > > binding. Too many times have I accepted one only for the 2nd user=
 to
> > > > > show up right after accepting it and wanting something different.=
 So
> > > > > now I just require more than 1 user and it is on the submitter(s)=
 to do
> > > > > that. After all, it is their itch, not mine.
>
> For completeness, let me emphasize the above paragraphs again.
>
> > > No new advancements. I moved on a prerequisite: Having support for ad=
don
> > > format in dtb in order to have support for a list of exported symbols
> > > resolution when an dtb is applied on a live devicetree.
>
> Well, I would consider advancements in prerequisites also advancements.
>
> > > Anyway, the v3 series [1] need to be updated and a new iteration need=
 to be
> > > sent. Also, same operations need to be done on the SPI version [2].
>
> Herv=C3=A9, is that the next planned step or are there prerequisites need=
ed
> still?
>
> > Rob, Wolfram, since the DT Addon framework is not mature yet, may
> > i2c-hotplug-gpio be accepted in some form? Maybe a staging driver or
>
> I vote against it. Accepting intermediate solutions will slow down the
> proper solution even more.
>
> > with notes that ABI may be changed and are unstable or maybe as a
> > device specific driver only for transformers like
> > "asus-transformer-dock" etc?
>
> Which kernel are you using? Can't you use your driver downstream instead
> of upstream unless Herve's work is usable?
>

You are very "helpful".

> Happy hacking,
>
>    Wolfram
>
