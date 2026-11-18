Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012972;
	b=HWWv0Ml05c1BB/Is46aLo8lZvEbs3fsdRwKdeXQpFKEO2ZHgwSkfgSYIkiSku8c0qFOk
	 zz5Pl6CRUK/NDthvmoMCVzujFuh3JWQflYq1Q2B7aC9UWBw0qGakh9j3Zk9xMyQYD8L09
	 TguGD8EsdDgXhpAsmWg7mtCluTqEPZmN9vTfaWMjRMmBeMpffUupVyCtlanVqG9c20BKs
	 UwOzYGuufZZweOrM+qK33C6A5DM2v3a2yLasvadn1aJedBob9kkakzNq49G4HjZbnlzgz
	 sPXW2fXbJKsufl8R7i9ACEjxUYCVYNuYkr0eqOGJcLAR0VeeXro+XtrkkPTl0X+HqHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XUoJPQ+bQcBMLjchQg2sOom+qhVfJBoy/IZRsgGe9ys=;
	b=aT+lFcLEDwWnrtCKnd7C7d4440TIJM+2wzVyyrp+oEf9DgL/adRWBjHpPY6dTMmEcXgg
	 RiEVjYEOJ0Wp2Y5jaCLO78chfbXJAQ2VJRkDqgfRA8wiYTHwcsjPXj+f7Fq1elnKKLghY
	 nfS9uggw0tUN2V1SMlLu654mUGGHQ1pDxQSodkh+pco05G0gLaHxFrXtcKuuUx2tKhgXo
	 euqkLQitVn8DdKKmz3zm9oUrH3fDCG4cNYlzS/jsRx1oLJ0l1ARgnILpSbgQhTDFKG3nS
	 rCIcRTjqxPIxygJEQ7id6d5mzlq7I8sUK3QP2R+kg87m2jggY2IbWyOFTJ1A1Yhq8XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jTiQDbi/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED1606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6ED1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTiQDbi/
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so129040966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795012970; cv=none;
        d=google.com; s=arc-20260327;
        b=htHG6VgZae4T0hABkglVLwX5a20rlWp0PiNHySX9sxbSWyxBDncfu4zQsZwORXYZvy
         ijl3SO0jNibYfeDGSkbVKuQYbLdz9L9ifA1O1vBaKxRCUb8XjvdkFUCi1Dik9P7s7l8X
         bzftRhZhQVKHb+Jr+DrrRkQIx8t3mprDIALBf/ItzimFm3YeKLQscoBlbD5wEH8o7adL
         J5ePxLBoCd2VtrfUS4BOtNst2dcWlQN735ozlJ6Ynluf5lzH64btmYmMoEjf4ATO0e8N
         BUEvp7pRCMQvWBgMLHAVLjMb8wQuSznUhcUKuoSWD6jGgn/JeJCkZnPi5iE8fWTYp8hF
         qhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XUoJPQ+bQcBMLjchQg2sOom+qhVfJBoy/IZRsgGe9ys=;
        fh=0dZbL8+t1dLbDvkenPe5Wmq/2JfGOMlRsI/kZwKCmew=;
        b=XHaVDL89JAnNS8nhW3rLj272S/Jv/0MGrHdXNB7htoxL5NsO4+qhC7hNb7dirZI5HD
         +nmuiwVnummeReD6VVHSVwGtf1ssLOS2N3lhtOYXT8m0IJ9KnoaEgTYPNTCFhLAWnvtb
         038Exo1LBPn7MruYNldUviAzCt3NLQsIrupH+rv5/Q1tFtURYxzMAvgcflG1qk2PcvUl
         Y5qikVDnqVYRlGQxHCPwcZBK+IWXmWDic1Us+EjhS/xgrn/mJ8ORoR0txN8TwrfU1Zr/
         +FYTXopDSMnKDpkMxgAOeBleyrFRt4uHMOW2jWTmFMHcRiVrcClWDhj7RbIl8pRfzxRr
         6kbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795012970; x=1795617770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUoJPQ+bQcBMLjchQg2sOom+qhVfJBoy/IZRsgGe9ys=;
        b=jTiQDbi/ZtDF9t7SdZiTQkBZF6ofbKF1K/q0w7e3sDchHSUAOksiNycNOD7xKOPLqg
         zhnYNkawYM2wCk380hedn5Rd00ZQCh4tOqAUmiix3gR+AyyaiA+eDJ/E3PlvsFYJYzC3
         BE5HqaDLzWfvWJS3Hry0BVCbMDMI5JnmBMXQHsPnZUpnpwRYbt/Inu1lk5gxec8XS/tJ
         RgIcD4ZkSKHPIeYSAzprNwYjsKa6lt2s/20I5DNtB+ZNJC/bEB1+JGDUHI75kO2qkRK+
         jsqtJb/tW9GUrFzizei7Y9LEWjJjsSv3KmCtAV9m1v0QIPJwfAItP6FbSgZWRCz/WfjH
         PTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012970; x=1795617770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUoJPQ+bQcBMLjchQg2sOom+qhVfJBoy/IZRsgGe9ys=;
        b=KgSZCOp1YStxTuLPrdTXoizyYYo6QP/LElN2TJUvuPkNCSE83nrDBklW2RMuMLdwFu
         FRc5YCj49HlxS3uYuQPaWoKQvpQiyhX4ME59/Ecbz8kSN2GWtsbdegC8jeUjZiLKwZ/j
         BgLJhdrbTnMA4sw6JNTWIxGFncXM4yEZWTZYuHRxEtqkaLGzvbYq750w7sNbVAr8WwlV
         5gkKVLXTaoXRHi0AdNj57/PCNmnBdBrjWUFVUN8r/vwpTq65hGoCuJPAkD/HUATyyqYw
         okJOvC7r3qS1Q/pXPHp5GoJkF659hp0k/bKmGV2thEAWrnlBEidBzNtPPTqUbidSj6gf
         GyFg==
X-Forwarded-Encrypted: i=1; AL+hErHSTlrTGEZcCsNDzW2IMAIEo1k5omheDXzzVE+P1bmpytgMJi+7n2yVOb90yeAQwGbe/fpYBfy1vlj8JIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J22rx9dW64M2M92Nra16IrHHWyGIN/YWPW5jri26AtfAZoOGk
	WoqvWg5sMzmhYSc2+wpPpmxCbfFOaGDnbP6Rv726ixqWEXc89wWjFNijvzaj9xQfSXf6beTvXOl
	eL7p+AhU12dKlv8rbYlWaPA/qzvZfKZQ=
X-Gm-Gg: AYBFou1e81h723li0nEMh8ZVnvsWC9a9UXmiXM1SknwMpYJemOOPHOdxMCag2ircWLi
	+UKQkG+6d3Z+Jv6byXhiUxzYB7pkYJhjMJ9j6rOXZm1CFdV9EA+ifRN/NVQcmc1V4qlox4jcFOz
	cBRFFFTZMbJd16ljmAwTY3DkgJmAE7xXDkMtQGaeflJw+fbC0Y4KfvgR0jBwSHRtWdaC0W9rzcU
	/xqMR+OoJa41PVqXaYri3DKQxu9TJLvdJP0h/dW8mVRynNC7mW6rminaEmkrt5Mv0d9iWA5BGT+
	KA7VhTW4ErYVRblonR0E8XiAW2sUTE8WmoDWZYRa2s+p0+xSnYcvyqnlvF+bf0XH631HPRb5Yg/
	Oj/iA+C3saWJUOug9oJ5P4r3XYK4N1u7nxDUqrApww8jxPT0AC8MoaQa3exASChZlmfGcwuxBj2
	sKoICQVVV0cYKa60HnYAYtcS7bbWWwog==
X-Received: by 2002:a17:907:940b:b0:c29:f5d8:9c73 with SMTP id
 a640c23a62f3a-c510e324a07mr241805366b.34.1795012969839; Wed, 18 Nov 2026
 06:42:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118134555.195479-1-clamor95@gmail.com> <20261118134555.195479-2-clamor95@gmail.com>
 <av24x_dcu2hggP5y@shikoro>
In-Reply-To: <av24x_dcu2hggP5y@shikoro>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 16:42:35 +0200
X-Gm-Features: AclHuK93fhxoBlMqicbFK9Gc1HJyqVV4hippm2euH0OtywPbIka7CYKr7EMAras
Message-ID: <CAPVz0n2jSrZ+ya=7JgARDRTFZ8-cu=209GGiOK8KYAwph1hGDg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: Document ASUS Transformer's Dock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Hans de Goede <hansg@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 18 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:4=
0 Wolfram Sang
<wsa+renesas@sang-engineering.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
>
> >  .../bindings/i2c/asus,transformer-dock.yaml   | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/asus,transfor=
mer-dock.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/asus,transformer-doc=
k.yaml b/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
> > new file mode 100644
> > index 0000000000000..5f4a40539c2b4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
>
> This is not an I2C controller, so "i2c" is not the proper directory, I'd
> say. "connector" maybe? DT maintainers may have another suggestion.
>

I have placed it here arbitrary. I am perfectly fine with any place
schema maintainers point to.

> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml
>
> Hmm, this bindings only uses "i2c-parent" which is not even described in
> the above file. Not your fault / problem, but we should describe it
> somewhen somewhere central maybe? I guess the above $ref could be
> dropped still.
>

Child nodes too. IIRC i2c-controller.yaml covers those.

> No comments on the general approach, I'll leave this to DT and Asus
> platform maintainers.
>
