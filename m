Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449819;
	b=D+6M+MY2xd1OBJ4OEfu/nB/+wLDtSv0mwZNJ4QJxHAA+feVrI0ifkQB2BDJiLPz6uIiT
	 cN4XdFUUKQyT0XfCoX1zc8OgAw0ej4VcraqEL8UWbJujWb27E7I+PX+70I0ofhtj/Rvae
	 u8pqV6DDGbJE7n+ri4eOaTFj73HGo08Gc6ebjOpb/r7cz12PJluLyW84GNw59p0p7+WYF
	 hlwmXCepriQFievmF761OhQh4U3x1nql29rB9pkYeXmWuccKW99qFv9uwjI2bVFepN2xs
	 ZVTG1UO1a8YfHbKqR42Y+iIHRq3AulOrlYz7GH8ii9NZRIKmVtEXD8ltKVRkba87nxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
	b=kwdDf0xWVhYBECUNV+YksF72HXr1+5spMxC7lecRBtXXLqZYB6EnHU1dm+7cm7cMNiDD
	 urzlLBD5Crp+kkLz5zzvme8ZVgee8A+nMlRO0Y2HvCrPSjRF66qUuxOtwkJFjj5uVfoIK
	 S4DUGU3XTT1zsFTYbiC8WQg793GUHneLPowNlsraLMHXkBY1Kg5UBSpy7szM7NZKXmaQ8
	 Nrb8CVkwMFlcUvwyDUjRfmgtKLwtPZ7ZOkbjMcmvl1RLUC/OBN8LNgo9wVPq8jkN392K9
	 7QSfmnf80bCJhoFv5z1CnXmGiG/eMTWFnKRxYqG5rGvSforUvFrNuXV9M+HnXhFnTnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPxbmlxH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8605C606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8605C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPxbmlxH
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50cc7540b7so472841466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449817; cv=none;
        d=google.com; s=arc-20260327;
        b=hjr+Tcel50ckw9uLb/Of8jwXBUOhS2uJk8jeBGZNt4ocTF5dXxZhkEmtoO5cPSEY42
         DppPOtUF0MVwHyDITPcEHn0DkSOYZ9+QPRCzEoiM9DPto4QFVGYk0+sIXF2CRLK9FpUh
         +YEVEL489ns4XU50U9P2qRfIoKxJgNj1oZQTNrbF2b/xxJtbwmgF+it5ZdPsiORG27BY
         +JQ0l6dLIkR/6doFRXi/wV06b1vmaM4HPl+nB+TNUzLrtIfc4Yoi+zCscCpvqdXSIit5
         o4lCTvoo+/qLGiyQpAm+QOqU8Y8FYhkVr1ND55Mcnnf17gvT7aHAX70Nstj/CTTJ4mwX
         5L+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        fh=XqsI4OAfO6o/VZP4LEKMBJVmAVYZgOeSdr7zp7mC/n4=;
        b=XRg2Ie2EkNQzZfZ/jsvPKKU17cxOEXG3k4TKtsHv4XgsTNUt8/qVHsP+Ou74HhnKgK
         20r1Ow9eZzOCLXq63xK46oTnZJ0vIl8pGZNg013WUyOTmM/49jiJSxC+auKCJrHsdksr
         eIf41fd9S67Oiekh7yt+g6oErqzcPpFHayYg8NWWDfgsilMC3xzXlSEdozAE1+7MEqNY
         D+YH1MFaJ7vPl5uWvibg0lMFhPWo15r0rs6ql0QQ7L1+oPgiMzPTefMZH4izhuZ3OWrK
         f2Y+iqzrM1nyAgT21IUBHCkmIsMQ3xJgtT0MjDfRwbQ/NRvtIEnOMD/lODbIC+0Bi7XF
         LZGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449817; x=1796054617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        b=kPxbmlxH36KRhpUs3rX2kF9cu8fs6nKcvV2Ep5Yd1SAPElzfO4U0yee+eyo4yYjKG9
         bVabsqjgWrVObshBsNWmZu0Kc8SGNvonY7/47W6xWPu+XZzUut9DZVDasYOasQeH9Kb/
         cxLOB1EaAVkrHLcauEnwPg9EXJ3MPHywPaLoCpTE0FTTIAii7phK7Avi7MNPjJVN89DP
         s8LFLj0Mqsxb9tOW2pKJn+UDcZJsxmwmdbWgLBk3GXWSXPM0Y4SECfoiTVmHq/AsVfEi
         eK10GDKZe/X/rTJwTT3GnOPtaNslesh71E73eFd/jgj3heXtLGBeR0+t6FPE8tiFDqrG
         Ouyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449817; x=1796054617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        b=xjoN8GzUbNVc0aNjrofeC0W4f0F0KH+JYSZ3W3OK2At7SSNDR0DCeXQFbv1B9azlUc
         PzfudMQzx91Vz/j5E+lAeyKiLyvK3egrdCk/Y5+OAZ9STzzxveZfDgojKEc6NRsIooFL
         plVkDp1cgT3kLcH3QEN+bVTIXasVz8CWkdMnWn4cwsYAUOJeLUlN6GyNgqa7LwaGN4eF
         HodiEpnbFdOBJmD2IodVy9JkUmuH5rriJrEBlk6hhZ/IzYzxv4ZnZs9mNvEjTXLkujnr
         BmZw2WKb4XkqN7eNPLxb+4EVVD82yR4MKnV4Y0FQCtEMV247xNN7gTX+jDTCvUL7k9Bt
         b6uw==
X-Forwarded-Encrypted: i=1; AL+hErFuXGurkm/Uc57ZlWjZFZy/FkFxcJMiD5jvHI0Eik08uo0/L0DmM/1+SO3lFeLMIsv4MVlkeJkiPNLUj0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ks/lnqUcLypFpUD+4FtoBsPlMKGM7OmeUsp51VuDpjPgGebLf
	khl1/qDKPPY/wdMk5dSiSzVZiU6Ogg6T3RQOLEDq7RxjbUK/pY4ObU5hi8cHCUMResFfd8UeQNV
	g6CYuQ89RF/SGonzAzTs+BLNEsca89yF2RGHv
X-Gm-Gg: AZFdTZdaq7oXTxJTESKR6uYG6I2wNPo2CLS97VgtZd8gtDahnjTzyoLXh3w6SekAefm
	Cpa2SOYdidmxm6QwBkrAWXJ9QG6ZTT4Rac2Hkop5IhObepmmAM95aR1OG25Nqwsl8yJ39Gx4K3W
	pFzU9XLR2WRC4EI0sMPhrSWTM4E5z93Tp8h6dg2WFbEGMiNvAbcLgdzTLBGjpKVFty1w8qG+Lxj
	oTQar//1J+ZK1TmxCNLwJ6LCc6ks8W9F2DbMDq7nP+SJWA3M7ro9FW63LCZi0bxr5CpIhR4OoPI
	n5ieKecMsfd7ExRScBQi1pe7uvmt+T6suTB/GdEosTe26NldsrapbK6Od3IhGpW6noODA6siRJ5
	SGJHlLNlpFVhWjnIG76F7U34nzvBmsHC7jHVZGiU=
X-Received: by 2002:a17:906:9555:b0:c50:52b5:e17 with SMTP id
 a640c23a62f3a-c513a5e1d53mr819834666b.13.1795449816568; Mon, 23 Nov 2026
 08:03:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122131900.2951586-3-a.shimko.dev@gmail.com> <179543998153.3135.2533998901272176773@kernel.org>
In-Reply-To: <179543998153.3135.2533998901272176773@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Mon, 23 Nov 2026 19:03:25 +0300
X-Gm-Features: Aa3M54qYkFzn2AliFXf9fRcB52n5j1nfOYqfcsg4MxuHxjWphZmjYJahIu9j42A
Message-ID: <CAOPX745BjECumVGmNOg3HqagFVz=Bcz=x8-shzjyGjHmN8+NSQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:19=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The new `leds` block in
>   Documentation/devicetree/bindings/net/dptel,dap8211r.yaml mostly=E2=80=
=A6
>
> --
>
> dt-bindings: net: dptel,dap8211r: add LED nodes
>
> This commit documents an optional leds node in the DAP8211R PHY binding.
> The PHY has three LED outputs, and each can be given a color, a function
> and a default trigger. The commit also adds an example with two LED nodes=
.
>
> > diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml =
b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> > index 4cd0f9730d954..772329feda059 100644
> > --- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> > +++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
>
> [ ... ]
>
> > @@ -45,10 +46,40 @@ properties:
> >      maximum: 2250
> >      default: 1950
> >
> > +  leds:
> > +    type: object
> > +
> > +    description:
> > +      Optional node describing the three configurable LEDs of the PHY.
> > +      Each LED can be assigned a color, function and default trigger
> > +      (e.g. "netdev" for link/activity indication).
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      '^led@[0-2]$':
> > +        type: object
> > +
> > +        $ref: /schemas/leds/common.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            items:
> > +              maximum: 2
> > +
> > +    additionalProperties: false
> > +
>
> [Severity: Low]
> This isn't a bug, but does most of this block need to be here? The bindin=
g
> already gets a leds definition from allOf: - $ref: ethernet-phy.yaml#:
>
> Documentation/devicetree/bindings/net/ethernet-phy.yaml:
>   leds:
>     type: object
>
>     properties:
>       '#address-cells':
>         const: 1
>
>       '#size-cells':
>         const: 0
>
>     patternProperties:
>       '^led@[a-f0-9]+$':
>         $ref: /schemas/leds/common.yaml#
>         ...
>         required:
>           - reg
>
>         unevaluatedProperties: false
>
>     additionalProperties: false
>
> Most of the new block repeats ethernet-phy.yaml: the type: object keys, t=
he
> cell constraints, the common.yaml $ref and unevaluatedProperties: false.
>
> Only two constraints are new. The '^led@[0-2]$' node name pattern, combin=
ed
> with the local additionalProperties: false, rejects led@3 and above. The
> reg items maximum of 2 limits the LED index.
>
> Could the block be cut down to just the constraints that limit the PHY to
> three LEDs?

ok, i'll fix it.

> The commit message also says:
>
>   Document the optional "leds" node supported by the DAP8211R PHY.
>
> Before this patch, a leds node with LED children already passed validatio=
n
> for this PHY through ethernet-phy.yaml. Would it be clearer for the messa=
ge
> to say that the change limits the LED nodes to indices 0-2?

I'll keep the current wording for now, since
the message describes what the patch does (adds LED nodes and an
example) and the restriction to 0..2 is visible in the diff itself.
If the maintainers prefer a different wording, i'll adjust in a
follow-up.

--
Best regards,
artem
