Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795437912;
	b=BXycABoJs7DFbNAp89w/1W264NZbDsQGw6uGZWDPREUXcwUVwoPL0MbFL9TM17lKxd1q
	 FhWobk2lL/2CWmWzm6uqZECLNCJ3D20hbQq7DRbIh3mo1pCRWmiUvqZ0aG55q1gzgZtPn
	 Gj0BBpsvcrE2fxhPs5C3GFM5zGSkIq9tdrh1qYMoyj5yWjB1qhcEfA+j9Gu/lXuyw4Upo
	 Tn4at7drcORUTubEbhDHEBGNe6aIEYRkeMGkLuDaZcP7+qUQhthRumdTVxD70NeHriR9K
	 oTbyM8aTMg6eYDxidK/mXE7JWaik1bU+RAWf4jQCy3E2Ddvq6r5IGIeIMuIddOahCkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
	b=tbR+1sc7365hdWJ0HvUnf9BikD4QFDxD6LUVeQ6V0rJlcm4oX8Mt8fTyQR0ayjsD47kF
	 iY5WjFx/G/XCooU0FKn1nS17LngmqEjdlYVn/VGGUcbrqJ1mhmtOjZqYSTo62DELT4iva
	 Coy/sMMd2vWz51jwpchlbTWNx8bHqJ1+zNrcKG2/2/CagI5O6RNDX6jSCG8hidJnUmStm
	 8A2WCW7P2CYb0lXMxjboG9sIB60Wacz7izi5OzOIQcG0YXmP9tRNhcjBajxbtnStK36pC
	 Xa1rWQE7UHvtPiPJklL+R8qeTsu1h610K5ZLImB/kzNf+alI5lJbjhHx3Ea4jIUYEFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P/OWlvIw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D91C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D91C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P/OWlvIw
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9210f2622ccso41500626d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795437911; cv=none;
        d=google.com; s=arc-20260327;
        b=TaQ33hVSY4dwh0eLKHxpCh4BIjBesVEMDP6iNE49s3L3dvh9RHn7fZFmRRFBpABwG5
         utc7izVt7AVnbTsIJ2YRyFILwb63++HdHoI/sYTMlHTuvPDfRi1G2pkMeqzWhNYoRGk3
         Ylvzcb9TNdFRe2cI7F+usOrCbzi04vGwXiI0VHSC2r4wBEMQgngZWyQX2kPkkFs4AVf3
         3FuF+IazC9UOiptimplB2cuxaJIIlpI7alJYAZEv3QFTd1itoiynP0qpph6alz2pA5vS
         QmPXWa16wrTBKCnjqUHVy8OPp6OjYRWVe3UlzBRsLPscAP/Dn+z5PfhtckmWpqOLfG/N
         eDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
        fh=Og3ahkAwoyK2oSP417069fHWGVqqhs28kHB2ytOQPkE=;
        b=JmfTYPdtSO8/pcVx46VmebDMYUwbdm/449apEDiViSqsWtUTQ6dloUgnry6ho9Pni9
         z1PgEuT6gmmAQJBC+X7SHPt62gMkDsYbAJt2AZT3g6rHPpxhuYlYPUTsJzq7sTJF9alk
         yDt32lhs5TL0R+/s6YRaHzpOZ8TAeSBNQ80uyOXpZ9KT+4o8YTlDq26U2LxOUOYyMMlc
         W8JpItIIsLdnk9hITBVePyp0UttOagQk2Myx5Kb62t8oMzXQx6zmUiZgNMph9PWqs4Fb
         Fh+BpRIgsTvyLnPpu4e05xU7VlJgP8owRlZbOxoKQogVkdqdYIKoR8NoP6+AqQE0URKb
         OFaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437911; x=1796042711; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
        b=P/OWlvIwki7NIRipOUdk6t/vKOD1Jxhz8y/qb7dnEE4ruyiUIcDfinAGJmeuHLcTH2
         KXr1mqY6thscQxlC++Cqye6tsCFsEvOtslxbfYPWiHHse0ucW0B1x1NOgMCRaaSfjcu3
         Y0HinV2jM/CbqpPuBWCXee2JcovPumtZka1KC6VQrsPJkdrLX1eNlzGdz5RypenKlSpq
         MXHS7Jg5OrHpj1NjuQnuRjKm0bgcrL7gRSEBwxX8Wo+fvwiLmq94aYzfNKwD4hPlEWlY
         ofDYSA71bl4O2iWnUS5BYTnQTodEtJxNWVF31XbgOd3hZWTHgwWLfBkKP1/OSeAE243x
         TCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437911; x=1796042711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
        b=wOyQAdV6+/giOTqk32aiLpKQvSjWwCGdzD1gdAvvXWwdYkKFJNCM3kKRcqXOBxYUr0
         9sB1lTOWrVATU+5kAvayYwG/VNkOfIFoq5XhVu6ZuDjSSIhWOdK5XKYpA0Y9ozXURu4n
         08zWfkYi71ZlJTneQgdDg+g3Hl0yddkXxNJ68APR5lhOj4hmRQrmXXyyEh6GtQMJDsCm
         WmIIVENaVoQueQVJO4tuV7eU86yhj3aBmlpj0pUWTcM+s7Jw4dmAZWLOcqunzflkNG80
         DyvAyAPtLi+hPIAauRoHZRYGlWgHR/RYQxXZoSPDhpF5sXnyrD9ku2CFCxzHUyH8PGsP
         dJMQ==
X-Forwarded-Encrypted: i=1; AL+hErG08bpXDJRhY2ewGBivt03pZCVtvsVTCDDKSZ4KfHLU/k4mst9W3ouG3kIqjsYPFIWQS9TgNEx4Id5Q+gQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pGhPK+hz17TiJWoTSLo2PM87RmefsHX8OPK9S3V0Qdgijg55Y
	hiWonhmMmmmvlG3PBSpnAHIS6LWB/xCFFGUluHmrBrNZZMkQbgU+TEQDl3R4us6B2BOgDxQY26i
	K0yF0cqgzg5AMwSDysITCgPI1R6dANao=
X-Gm-Gg: AZFdTZcVYLdSV2yFYLhGKa+zhkR/MCXElq4xU5WF/x3r3U9H8Vc/naiTOKhdZgeZOFi
	rzHx1avE2YrVlcZ4yNCNCfqUda+At9XXUxwM4xO8aSCRIFJHx+Zt2UDYIN0XRYl/vCynBZGvj+T
	SpbOZ+vla74uxGqgT2AdPX614swavG+/71OsgV8UDKWl1kumffd/XfmDQL3rKRhYYPKmDbraoVR
	oPQCxypqJWKXN/q7GTjalBEYyu331w3MmLPACQt2NHXbxzJAnFR4yBMhGuQOsikWGzMMHD3FEqg
	mdIITgtz6yrn3tO+OpnylF05V6gtOY8xYXX53qMTTi0lM7OmvQbK8phWrQjrtTWQI0D/7OivxUn
	YjRHYWZ3urrv0oT5b5kghUhC/63UAwryaWpclmlR33OecDJF3f28zFfQOILoumRboMhetBpkXCX
	qnM4u/ZBfMIYmZA8omm5mYG03Zvw==
X-Received: by 2002:a05:6214:440d:b0:921:1ac1:34e2 with SMTP id
 6a1803df08f44-92134aee700mr213563336d6.24.1795437911221; Mon, 23 Nov 2026
 04:45:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117084748.2387647-1-jonas@jonasjelonek.de>
 <df35e0d4-9f1f-4882-bc6b-257add4e9fb1@lunn.ch> <6fecc631-e493-4e05-aa3c-61a8b0d2d1cc@jonasjelonek.de>
In-Reply-To: <6fecc631-e493-4e05-aa3c-61a8b0d2d1cc@jonasjelonek.de>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 23 Nov 2026 13:44:59 +0100
X-Gm-Features: Aa3M54oKzn5UdFFwG51i21B9Z58VromwpMQTF5kRSx2z_fy0ELZVeYW8tGG_qX0
Message-ID: <CA+_ehUy2UYqELMFhh7Gf0JZ2uwVHFg4kGFbz03DosfgQC5buJA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next 0/2] Add Realtek XSGMII interface mode
To: Jonas Jelonek <jonas@jonasjelonek.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 23 nov 2026 alle ore 13:36 Jonas Jelonek
<jonas@jonasjelonek.de> ha scritto:
>
> Hi Andrew,
>
> On 22.11.26 22:24, Andrew Lunn wrote:
> > On Tue, Nov 17, 2026 at 08:47:46AM +0000, Jonas Jelonek wrote:
> >> Hi,
> >>
> >> This RFC adds an explicit PHY interface mode for Realtek's proprietary
> >> XSGMII transport. It carries eight 10/100/1000 Mbps ports over one
> >> 10.3125 Gbaud SerDes lane. Each logical port remains limited to 1 Gbps;
> >> the aggregate serial rate is not a per-port Ethernet speed.
> > We should be careful with naming. We have already have QSGMII and
> > PSGMII, for Quad and Pent. X is too vague. So we should somehow
> > indicate 8, Oct.
>
> In principal I agree, the naming doesn't really fit the others. I just used
> Realtek's naming for now, they use XSGMII everywhere for this.
>
> > But...
> >
> >> Protocol identity and naming
> >> ----------------------------
> >>
> >> XSGMII is the name Realtek uses for this interface. Calling it simply
> >> "octal SGMII" would describe its capacity without identifying its
> >> protocol. Existing modes such as QSGMII and PSGMII already distinguish
> >> multiplexed MAC-PHY transports; the PSGMII introduction is an example of
> >> adding the generic mode definitions separately from a driver user [1].
> >>
> >> Cisco USGMII is a relevant comparison, but equivalent port capacity does
> >> not establish interoperability. Cisco defines Q-USGMII for four ports
> >> over 5.0 Gb/s and O-USGMII for eight ports over 10.0 Gb/s, using 8b/10b
> >> coding and a packet-control header [2]. Linux already represents the
> >> quad variant as "qusgmii", with its own control-word decoding [3].
> >>
> >> Realtek documents XSGMII and O-USGMII as separate RTL8218E interfaces:
> >> XSGMII runs at 10.3125 Gb/s and O-USGMII at 10.0 Gb/s, with different
> >> hardware strap selections [4]. The SDK also distinguishes them in
> >> phy_8218e_macIntfSerdesMode_get() and applies separate initialization
> >> tables. Realtek's O-USGMII is therefore the candidate for comparison
> >> with Cisco's octal USGMII; it is not evidence that XSGMII can be renamed
> >> to USGMII. Compatibility of those O-USGMII implementations would need
> >> separate confirmation.
> >>
> >> This proposal retains the vendor's XSGMII name rather than assigning an
> >> existing protocol name to a distinct hardware configuration. It does
> >> not assume a particular XSGMII line encoding merely from the line rate.
> > https://deepwiki.com/lotusmomo/airoha_sdk/3.1-sgmiixsgmii-drivers-and-apis
> >
> > Airoha also seems to have an XSGMII. Is it the same, or different?
>
> Looking at the referenced code it seems to me that this is rather used
> like 'xSGMII' - an umbrella term for SGMII, HSGMII and USXGMII in the
> SDK code. Probably the deepwiki side summarized that incorrectly.
>
> Overall I found no other usage or naming of a real XSGMII mode apart
> from Realtek switch SoCs and PHYs. Those PHYs (mostly RTL8218D
> and RTL8218E) apparently are exclusively used with Realtek switches.
> The RTL8218E might be used elsewhere too but in contrast, it explicitly
> also support O-USGMII as a separate interface next to XSGMII.
>
> > Adding Christian.
> >
> > I hope we are not going to have vendors introducing there own
> > variants, and we need
> >
> > PHY_INTERFACE_MODE_REALTEK_OSGMII & PHY_INTERFACE_MODE_AIROHA_OSGMII,
> > etc.
>
> Doing some more research on this, as already mentioned in the patch,
> there is O-USGMII: described by Cisco, being compatible to SGMII and
> QSGMII, using 8b/10b coding, 10Gbaud rate. Though, this should be
> totally separate from the proposed mode because it uses 10Gbaud
> instead of 10.3125Gbaud like XSGMII does.
>
> Apart from that I occasionally saw some vague information about an
> extension to USXGMII, allowing 8 ports and reusing the USXGMII spec
> control word and format.
>
> There is no detailed documentation about XSGMII, so assuming it uses
> any standardized frame format would be risky and very likely doesn't
> apply. The naming of the mode - given it'll be accepted somehow -
> should reflect that and not conflict with variants like 10G-QXGMII.
>

Hi Jonas and Andrew,

yes I agree with Jonas here... It seems to me any vendor after the 2.5g
""apocalypse"" (2500base-x vs HSGMII) just decided to use random
naming as xSGMII with anything that transports 10g traffic.

Also from what I can see in the datasheet, they don't really declare
a specific standard they follow aside from saying that the xSGMII port
can be paired with USXGMII and 10g base-t (following the fiber spec)

Honestly speaking from what I notice, xSGMII is more the 10.3125 fiber
spec than the ethernet one...

When configuring the the PCS with all the register, clocks and rate
they all gets set to 10.3125.

Maybe someone from marvell can also join the discussion searching
for pattern?
