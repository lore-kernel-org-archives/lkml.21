Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772515;
	b=faTZ10MSfJlm5XF2s+6k3QoIf7lloKTP0+9cI3U3u1nuQjVOLh8kOMmsXOpl6t/uAwaP
	 IoCZ3+xpr2TB7b3Jz2xb74LvNBzNTFuJc/ul+8eDWdwhf2e/bXa6bue/b3ZRoPvRGrDaP
	 Z8kCDge/E7J8wHrif9A5Mn5GcT9vg0FJaPkP3qrMo17DD7Sk5RXPP+SZE6G6LCh59aiak
	 ae3Gjb9C6osaVFiqUOOBbkhdFm7w0fz5X6kDG63oiL3vjn7J162UP2b+aEE0fvmLX7VdY
	 Jqs0e2WuI/lcE7KF0pkeWWltVNx98ZYWWYV2Lja+c84XX2n7/NSA0oVcHBuRhq+wNCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
	b=MlocTnZwVVDumJs//zURAlKXsOAAKmq/L+CQZ8mxaPB2hxtqhIIvo3L0O5FoIObWtNzM
	 Xr//edwGQ7aICOYFDPAqy/EJpWBsUGuV4qROGhbkc24SrFCHI7EGzd7CfMqrpUZEYrffB
	 9QT08j/V4+A91q9pyvMLY7aq857TJ7Qj/Fzd51Mz3nhOzk7kup/NwX4vsqlcp+4abBDpi
	 1w2HijDTOR07f9RQUu8nEJXPEJRTVpu6h9l5BMIZ7sPv1fr1LeA6g0hC+rWVYhgJ9a4WL
	 tv1YaeIVJql5iOvop+bH0l0arlCKaeDNQjlrRWkW5XK7dyv0dOEJmvhOqokzVniCvEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKIQG6gL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48507606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48507606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKIQG6gL
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386c336eab8so4318951eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772514; cv=none;
        d=google.com; s=arc-20260327;
        b=m9llOkT43gt0lsIevHuT7L5SrSudEQ8a31YvFx1WXBgG1taW6s5+fZLkCLKuYlZ9Mj
         0+bhzsPhgXOinl8/2n67ibmDTlKMtbzz01al2JSX8pU+rl5OF/1a2IvGwt2l2jDNxemO
         COQDxgR9tt/zKUCC0LMDn0LRQjlLAGYqVapsVcF7tcuUSk7meym3u3WRdnixGafgvYOk
         bMc200Oy4QmYiVht+pYwcfUaU4r4eK6rmaHwc5UUQgnpaOVgxcxYs6Sqp2kMEmeG5yQP
         8V6Cz2nh3Rj5GoumWjoKq7pIGrqYs5ohIqedKSI7qiOAsnzdytLy/M/H4XFnV2S8qmKj
         0esw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
        fh=c4bbDm0aY0FZ/xz5mrmjxCrP9kSbNrsib+DgwNVrjGY=;
        b=JDFLtcn4AHMCgbaLyeUal8A1whDvLM2rZoUQThqWWlS9hxIO532kNaNrcci6xEcgdk
         JhiCYEaj/MVDFWRiCC+h9kG2BGyDcXRxCR995Lj7ToWsGNWMfDNgCeuYlq/D+Q/Pq2q3
         O+4kL/PVkmjTZ0a/1XC1HeUfV/42JkNUqrXdANK+20/QWok6FE9iji+3BvRZB3S0CAJh
         FBv7zSlqhxJSKswKehxCKJYdzYd1CQw+FS9IfVl0VW/oYHSIDwkXpUf+159/M2SLZiio
         2ct15S1wUc9cEll/4U76kHOZPrpMsOecg2BAcBYdoMEEgq13dqdqzEWFuiFz8AOj5vgK
         SQAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772514; x=1796377314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
        b=mKIQG6gLayQpySPc++5pyBCdaz+iricn1XEKwxSX7lNyZ5a4iV//cjVXw3qCToQqtl
         sl/T/I2kYuIRr9hSO+s1m612iSUADHJ5u6WTxZRb82D3cJR819odyDr6G5Frxq3dx02m
         1ooXAOSN51uNnkL9FtsbC5jQq6KrzRUi4wkVf13Qfy0NlH8NL/40DDJSo90YjbHHPL7C
         QPmalFiVGTMTfP7s5xNdXxGUF+4twCSseIwIzrjMZUfRcMN4kBCwIvgw8Dja5AdPjjnk
         O0T0cfXan96mkJOuYIOp5ixxhshO7cxYaybHSxxdJc0Rvdnp+0zuVoRukByTQYRGV5Tn
         dW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772514; x=1796377314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
        b=KpIS69tyD24ZI6tE+6NChYyNCmd+MnTCuJrtfuce71QWj+JHJZeXUMNeJMbaJUvPWB
         g+ILHeNghoN+K2XujW6Aeg1oCJrLB1HHj9tBNzYKjTEsZWoabxuGAl1/5ldzvBRqv0cU
         tJu+sKPJP2u8XE4S73EGDTn67XP9Jk0bqdv0hmYaIgVRzyNA8NUl5nvZtt6wyAi6ezxm
         dd4KBdI3s2rxLUA9qgfs4cAzMG20KSNMHizEsJl+zGosqsR/gXfBsgFAR1bOTokpAQO2
         N7ob2wef0fJaUlvkBJQ1jsLwqOu8cw0rwcVPjiH7KA8FK6+AVZeZHjhMh+u3KMuYlc5u
         Ro3w==
X-Forwarded-Encrypted: i=1; AL+hErEVGk3e3wOzeumPV8qHAE4Ec/NTJufTLTb8AAOdk9MGIFPv9BWIxA80Rq1x3vPgPlgiupDCGnD630dyU/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WkvQmKKyRSxD4JGb6y6fur74xd3hed3fHXEm4S1Hh4NlzmY94
	QLA8ioBhj0AFNhi/NmP8bm5/j/vbptBQpkQSUMhFm+T+CwMDwGZ2jpmiQcMseMsd7ouz1S/b93k
	+AvrYjyiW+g/y5V+x0qxwWJXr45iFyt4=
X-Gm-Gg: AZFdTZfU/VMiVEUsAGdHRNUvKOzUJB+TJkfe6fPqa4sN+B3QV4ErG1daHUX/dJcrefZ
	Fved+1RtTJSMCzWlapDHSG1RA7Q7YmhrInjtfPpwpfMTfiKqNQgUQId82XJ0KEZSiU2yRbAgIBw
	/6ILEgNnTscY3XqM0PDUkBdFVZ+uAfMlnvy5DfTX7OXehJAZOe7QRQ6kudFWDaEO9K7bdJC/Yba
	4chxYjplV7/PaKa31MYXOIFLe49Zw/PQ+fUY6krj7uTNjIsTb5dgOx45y7KcDB+LE1u+kqMNENZ
	nfT6p7AsjYvGKZT/Dq/ry2Td2U7OsxkoNsymqyhuTODfEd3BV9zzibDvrSLNUigjHxErMf2cnSI
	MtaizKoqLl5Dx3MJ5Zshy88fog9VbXJyQCHKyPqr2veG/8x/V/+PkSZKnY1YGQGDQKy0uxp56ro
	mIptbWtlhpaf1QVEyVpRaSls7EUV6bsS32FJ6hYjcMXvUy8/1stNE=
X-Received: by 2002:a05:7300:d589:b0:386:9ff1:7f7d with SMTP id
 5a478bee46e88-3869ff18213mr20461146eec.4.1795772514372; Fri, 27 Nov 2026
 01:41:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-11-clamor95@gmail.com>
 <XPGRUNopQCaIq1yDhISpSg@nvidia.com> <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
In-Reply-To: <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:41:43 +0200
X-Gm-Features: Aa3M54q2qhxyDM_Zeh4LfrLo7uscd-ydHCRlf9uUlV1oDTURq66rSYIDmKEA6Jg
Message-ID: <CAPVz0n1xeNP=rv3qDMG06aSWRLTVvCfuo5tFyt9fz7KDTySV0A@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
1 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 08=
:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Parameterize configuration based on bus flags passed from the bridge =
or
> > > panel. The list of supported flags includes now pixel clock polarity,
> > > display enable (DE) polarity, and data alignment.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
...
> > > +     /* configure DATA order and alignment */
> > > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > > +
> > > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > > +             value |=3D DISP_ALIGNMENT_LSB;
> > > +     else
> > > +             value &=3D ~DISP_ALIGNMENT_LSB;
> >
> > DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to check
> > here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB/MSB
> > bit ordering in a classical way, instead:
> >
> >   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
> >   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
> >               R[7:2], G[7:2], B[7:2]};
> >
> >   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
> >   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
> >
> > I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> > panels depending on the layout. So the correct value depends on how the
> > panel is wired to the SoC on the board. Hence, I think we should
> > describe this with a new property in device tree under rgb/dbi or
> > endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> > document that this means the above kind of wiring - not all RGB888
> > panels use it.
> >
>
> Ugh, why is this so confusing...
>

Using 'nvidia,rgb888-wiring' may be confusing since as you mentioned
not all RGB888 panels use it. I can add 'nvidia,data-alignment' to rgb
properties and set 0 to msb (default) and 1 to lsb, or directly set
boolean `nvidia,data-alignment-lsb`. Let me know which is preferred.

> > > +
> > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL)=
;
> > >
> > >       tegra_dc_commit(rgb->dc);
> > > --
> > > 2.53.0
> > >
