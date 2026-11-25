Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612073;
	b=2UlC7dGnhs+DDRtgkdKTSsJcFyrHrZYPJKF9+vJn3tCjOqIxNz9sRZ/G0/ROSqSk0p4H
	 xQ6OYR4TkgbiJMoBNA05sOWuHAWTVQbmemtvr0XOzror1PqcpUIMCh3dCBOKGeNg+5Ws9
	 naXlRBR6yfeiY+On7U8LxxkmL2X7MzFaBBK3NTfRxW8Fzdy5xA5w9lbe3yBNB7kcWP9iv
	 5rdFfqfNEAQXtqKoQaLjBbOlvdxrcQwdclpQDxYlV11D8TlYun3i+YYnc9XDQf62JRiHo
	 8bC0CnQTGdE4UXWVM8ArvPE5nrEZrOfEJUmKwBUNkYuWUJC4Nym6kWqI+KnTCRpFxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
	b=OaJMvwfdmfl8DdoS+smegtsEJqKkmMQoGI3WvYBTjkgK+13pGhO0MuWOyMWpexOdVkxv
	 WND2GJ88TZhus8BVXaYoFqWSybYlslJT4Mg4iE6duSuJ4L+zJM8PVeWqG07qdnEIDz6jB
	 3riBbcE4jAXTEBWYMASvwp/rWB0E2QuG5SA6xX8W2C+QzCGT+kAT+pPUqvhiD27KanHbR
	 idCBLVBrRTh/WVAm4CwxxbRZ85GM+nNk8Lx6p4LjB4ycJcI1BKIgoIdE6ITEOuk+nKD7h
	 u8nIUpugLwucXGGFAZuA2PFqHd6Fxg+/rxfEZSwX6RkftxUidbRhGfjz8LbiQLyLW4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik9OkEdc;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C8606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D9C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik9OkEdc
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5067228f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612072; x=1796216872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=ik9OkEdcz0lBWXP3zQhg/dxf+nRVg711ZuXBfy+HlYOb4kDY/FWHt+10HsOpArGfZO
         jBFqyB5gltkyarPZ01Xe5kl0v8bzel/Gg8iEMWoV7BwjCS5TYn0pM9bnJfiHRGXj/avE
         bc+JduR5pBXQkWa1Xy7BJtVpywXMbOZADSRkJ/XSgrsKc0WCLmOoD9Pdkx/eFtZPeUnr
         FJpcz0+UhBz64iLV+IXJH3d1g2jXf8G2PxJDd5XpQCGI+ZPSXWRvUYmoMhk0mFJuGapZ
         oP3pZTC2N8D5VFtECpr3nPd5IkufySQfxXAnDB8RqyYAh/4XhcxvpOmaAUdM43nAcWfs
         Vuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612072; x=1796216872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=KE/q2nErpQUVObQaA1I11U4J+INUMJ+HaijJMs5ipFh3gAg5ouH2PtB+t5HaxWYinB
         9p09Q4qkJowNpOw16HY2gvGcSkQR9syMDR2aKLaegZGf75coWPw3r767R+RktEiUmVAC
         Ox1GtuwP6ed97X/rQ7ZCSD2lvXFRIFX/fHPbmJ0TBrENDco0vRkIQMhb+BPGhpOGC2OX
         +qrh+mPxVYNYRHXsJuxVHgg5OUoB3Stm3k38D9cp5SJVNNgZjJtwl8EqdNMtyc3DUIq2
         rSN27paMxkEBPde1XAWZblUpjguItEmHfgXlA/NLB35QPNex5rbbdzIjhj7SBqOFtFTR
         d2NQ==
X-Forwarded-Encrypted: i=1; AL+hErEX87AxCN9JAkQRzbNObeYFt4avyTq9N2gt2mCHMc3h/5Kd+cvWxulVGxduSEkk5FlRkeUsskMJnLx5KEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n0zmz/+BnbaESB28umu06K4UcJATanFgrEK8/pCcBecvWeHC8
	yNphD/yCzZ2j8D0g2vYk3iKj4qREjT2arx/czqh4jnpU4Rr351clCGR0
X-Gm-Gg: AZFdTZfcYAYNyfypLxl2u+n0gypuulSI+jEYF52cRHA6JSS3A9hPGQiyKzyzHukE+ET
	xG7baW4g5WqhdPoCtv0Ip+GK760A5CNzxbT+cZPPLM+VD0DvOXgE/W4ypR1liV34E6btokC0Jja
	I+kJXXng+cKjKSQjhiquFv2UcFUVeLeaWzSyU34Lh0QlZXbQgxfptzh9NQEXv76SdGD7Rp4FBQ3
	8NK2z8wat+nDBPx7aZgW5mmnB2v0WcWEfn6Mo8fIVChbvW699yBw7lgETgmFXNb3cc8KFLxRqMc
	snZvrTbJjQ9oS8YHkVxAxmM+H/hHrDcn+HGN6dhqNWCAuDzB9vOfIS9P4zNvX5VIqOqX0OhJjSK
	3B05Y7hcK/1wxbZWEVJRKsz3gK7cCf7RsUs3C3vCjULADAAW+gZKxqqhNDm5cTvRooJr3wJPpwR
	38z7B2DwlFmcMyQd8/FefxR0+srNKEsQUkfJRf/3k/GiIKYOJIpCYHwI1juyEvS7GKJl8mcsecA
	W7627zaV39hyhTcebry/VdX0cokDD93Yk6+rauvUB386HU+e8nFH+Io+EyFYcTbAHPWH81RV7BX
	zZFoJxoltZNoMXzTZ3KFBLPCVnx7JdUIY7sDeejCtKD0+pZxt5HuGsUiGXHG0G0JZvT8jr0vJy/
	njEaPbsfE6mkaLH1HW7/r9CPcNqUL
X-Received: by 2002:a05:6000:2089:b0:4a8:647c:f963 with SMTP id ffacd0b85a97d-4abb964289amr35929140f8f.51.1795612071506;
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm33783108f8f.37.2026.11.25.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Message-ID: <4ed7e2e27c221ab900b1562c2a578b78c3c663b7.camel@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add
 Exynos7885 support
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Wed, 25 Nov 2026 14:07:50 +0100
In-Reply-To: <179560526391.84329.2026344704407829230.b4-review@b4>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
	 <20261123092244.1792040-3-virag.david003@gmail.com>
	 <179560526391.84329.2026344704407829230.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-25 at 12:14 +0100, Krzysztof Kozlowski wrote:
[...]
>=20
> > diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > index 8af0143c3e47..f62e3ed82257 100644
> > --- a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > @@ -24,6 +24,9 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos8890-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos7-dwusb3
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos7885-dwusb3
>=20
> Why isn't this enum with the other entry?

I failed to realize that that could be done while rebasing the patches
onto the current tree (as 990 compatible wasn't there before).
Fixing it in v3.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos850-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos990-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos850-dwusb3
>=20
>=20
> Best regards,
> Krzysztof

Best regards,
David
