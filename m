Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638378;
	b=KAvARqe53DFJt+O0fwkrQAAy+bvfjHqekS0vAOlv28NdhrgZpMZoyKe7B9l65yxZR+AG
	 Gp9MaSK76/euZvCh7qdDQ3Z8c4l6QCkYoGHlFqMy0mtgKSoU/kdWIHxClhETArqzeARcw
	 dJiKv2LbRMW88yv45TF0O+cMIUcIdtGLknOohyHfMyiboWcXFAxdBj/xkUXlcfpDM5mHT
	 2CYchdB3WTZL2ntJge0pooMsBLwlqzTbsKxMTnSqLs7uEi2rWd6exC/iz82Qw2OX1eDFV
	 wBXx8lhCSshZAJn0UtFsL1+7vZmelHFiQ+k/Wv6K/s0SDYaa6+2Hof6C4Gfhs3Zg/Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
	b=ifXzdmEpYrGtYvm0mib0u/aRwkL+9Sr6g8sm17NXcqddeOLkyraiD+4a793rr07FPoHB
	 aGxtnO4o3XH5qtHk3LNNO1AecMydhxSUkhmfjcGe/DrmuiPKsOTFZaIOoWgWqRWv1K+1v
	 H05OxH9vne+1xSnWYhbS3GQETrTF/leIsmCbgpUqn82x+fmctgDsfR3q0/WzDP9WaDoNo
	 j01pqTooXPdXRk5Yqe+Ot2Y4V5jQI9F0PBocBVKoZW5vZSRdihla4PiMINUxdHL0cbw3j
	 Ic0I1//HTU3ryBgVLoL0LY+lFGAeevQFRI1uwkIqRLb1BqbKQ3DynpnJmyoWVQlWe2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=io76VFNm;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E46C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E46C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=io76VFNm
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so7234041a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795638377; x=1796243177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
        b=io76VFNm65n6nkd2KKIzu4Zej9NxI3OdPh/hfpus873PnJTEtkzasxTDIb2w2XC1sE
         wSh3zSbWfGdS7gHyI9DxF7mtuNdteHSuqkm1MkOnL4kTqSpJOolcIALvereste8V0Rhy
         wATwvDqciexz79Bp+Lqx+TFtCK2/vT8z09cmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638377; x=1796243177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
        b=IVXSKovzmkLqKXYUrNn9R+SCls+hk+PlQ02A/CgResKCEyf3BxI4Au7P07sGAuocXZ
         68KPaJffJojnzfqL4q9Ol9l14UKDvaHVcwTnv7moOV6rSXgkNQy2EYtl+OKf8/FvrB74
         YStrJ1VZVSF2Py6qBzE0fsb9g+7UUN5WmOYFsjvDsAQtrmtI69Of+sfpuBZMMHW0lmr6
         PmwYjeqAIbkH7juW4R+fduHSX2ZyySITNuE6lI9yv7x5AmZfwi0A74B+2Ra0nWwattnq
         jGYGsfC2YWUESXALzC+203rAffXx4yjwTmuiDvVJTFZMbd31zPgtV7rMDYdsxqnpo+rq
         1xww==
X-Forwarded-Encrypted: i=1; AL+hErGz9DyKnnS2qJ6yVRpDWWZEVtMMWaDkflolvaxe08QogcUDNNq5cnBjIyMeZOgXXYnvy8Cw646tUzPj7sM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gdTT52YwtNka8Kq4Qhmm5JQ2XDf8NJZmgj3ao9BHgSOA2cjsk
	1DmMQFpdUGCV/G39MEvWmgV4y+zaO0DZQvgHNKXERaXIHWqv9rmUrpQYCO10l45yy7oWHEid8eo
	jY7ODhMX6
X-Gm-Gg: AZFdTZfAUOdqDNCm99tH7JcrpuveAd9SCXoKBNs/KCd67vpiQ8j9YMoTNcT3/M8rU28
	sAVs8Cr1ott5MxxZLYtPm+5dclPwCFSBDetTvMYJKMCXyXjGg5qlPikDHWiHRvoAi3vm2zr4f5c
	sjTc75dpfxSNoGp496Vt46gwe/yBHGezTAhXwaxkdNv9i9DdMT2Ai5F6cNL1/bze2AFOCnvzE2i
	rkN5QTo5fTdHWNgu6mYMpedmqPn3Ud5/LcuotXyCWo+7CBtjDZHBOB6w43mS5ZlqcSYiPEqdOOA
	lAOvSZ0x+Q2B0hQ98bENvFGQdldcZBuF4TCXpYBqFsw+3aVhWLymRVLTSD8sqoTekScAmFEKJyM
	XqRDBlb0OOvqPI5ut6Qxv5pn43u087cc288kExzqKCqs+13gYeFG/iiAZOXIJzoBtKFwID1PQXk
	wHoU3vv8+J640AMkIbC0LIqqZJZA26kDZY1y6Mkhh9XFfJtr/KBenTvW+I3YMKY+VvoyxN5lwxs
	D0KhL3woqin6OV6u4snmurSnQU6xVkDyONG2joL8mg6C9F/tuzYUaVaQoVJGkimpVKlVXtYN+Fu
	URfP5N43+PfFU2D9cn2AF61hdn/j1woRFW1MTZKJKj3aHJtb/g4q0/Z7j1BviqBucoAC
X-Received: by 2002:a05:6402:501c:b0:6b8:afbd:64e6 with SMTP id 4fb4d7f45d1cf-6ba37edaf1cmr14359335a12.42.1795638376658;
        Wed, 25 Nov 2026 12:26:16 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbc67sm8870987a12.11.2026.11.25.12.26.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:26:14 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so33946535e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:26:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHEWSAQblQEk9ZAP6cg+MdgvTSkXlqgfeO2NuBsSyYCaqLAJ4zgQAtPBl/B2OQGTAS372bh9gFbyOr2GhQ=@vger.kernel.org
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id
 5b1f17b1804b1-4bb88806292mr393435495e9.15.1795638373083; Wed, 25 Nov 2026
 12:26:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-2-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-2-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Nov 2026 12:26:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VLjPe1U_6LOtxZO=Zkc0sRHH+28PgYVqyCGckEJ=nAtQ@mail.gmail.com>
X-Gm-Features: Aa3M54oEC-In_bkVrLr1h65W2jhYWlRAtlpUDztwO3IbOK5jMmWhEITpomu3qyE
Message-ID: <CAD=FV=VLjPe1U_6LOtxZO=Zkc0sRHH+28PgYVqyCGckEJ=nAtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, google-soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 15, 2026 at 10:02=E2=80=AFAM vamshi gajjela
<vamshigajjela@google.com> wrote:
>
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: google,lga-spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +
> +unevaluatedProperties: false

Looking at downstream usage, we may also want to add:

power-domains:
  maxItems: 1

Since at least some instances of this IP are power-gated by a domain.

We probably also want to add:

interrupts:
  maxItems: 1:

Even though the driver can work with polling (and I guess that's what
you do now), the interrupt should be wired up and the DT should
describe the hardware.

Neither of the two should be listed in "required".


> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi@14853000 {
> +        compatible =3D "google,lga-spmi";
> +        reg =3D <0x14853000 0x100>;

Should the example address match an actual instance of the SPMI on
lga? From what I see, it could be:

reg =3D <0x3a1b0000 0x200>

...you'd want to update the unit address on the node name too, then.


> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25243,6 +25243,12 @@ T:     git https://github.com/cschaufler/smack-n=
ext.git
>  F:     Documentation/admin-guide/LSM/Smack.rst
>  F:     security/smack/
>
> +SMARTDV SPMI CONTROLLER DRIVER
> +M:     Vamshi Gajjela <vamshigajjela@google.com>
> +L:     linux-kernel@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml

Instead of a separate maintainer entry, maybe just add this under
"GOOGLE TENSOR SoC SUPPORT" ?
