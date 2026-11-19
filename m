Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082132;
	b=K3vSiDCH6zITXvJUAEOOiyJltKem156QrsDsJSM0EiVEyjY+5SMtgjI4GlRTxEhUPEsX
	 SNevyg6KAXloCy0E+WNc+kv2ROqDkThhJPGPG/G6cwU1zExT2Oz4Gc2U6W9hBhSmUiSWt
	 6C/o67yAOsygEllbtEbW6tZ6wPqlkBVUXIz0VtCZrlaGFo/6n80FGArxKPocEEVDFiwZM
	 yjBgDIlhrhGER3p35AEAnHTtr934+oFqXeYYbLPThn/ftnpK9rQgPAvHR9t/P+wUyjlEd
	 IHPaKufaXSMOLJgFhFY5SY3hXoAyp6+bEH7o06PAm0Pywqj6KgKIlU77S09j8Frhg6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pm7Hd0hzUtoHByqnTKuK22z9l6hq5ZK5lAdKqbbdMJM=;
	b=Iec9qwypHPsjoP+TWcQf2FCf7Z87RtBAQJ7Mjd0roOF/Mm86Tok+6aYDd3JURysVZWbm
	 t0sfzfjWLA5gmntTiQYVDemYKnqbhHbK2o/JtbYEwhInvgDkFdAw9wUscSyGRp9Dl13ta
	 BBZmxGtEtPt7Yh5nFBzsmIdsz/gF2PXUHqfoSRrqmo95q3u3+4Rq/BfjycfJ8jKwjc+7A
	 MKY1Sgq9xuB7YI43wymATKJF9y9wBSsvN7JicVNMXlQr2Jmv7y2XYYum4WVXhQDHrbevz
	 AUYao03Qb3zBXCd7MGmVn6IW34e9s28Mpe7aLBLSQ3dqnXZD/pgZ5QUJP8bqxK/PK9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z63CXzV;
	arc=none smtp.remote-ip=74.125.228.135
Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02094606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02094606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z63CXzV
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c5119f642fdso116392466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082130; x=1795686930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pm7Hd0hzUtoHByqnTKuK22z9l6hq5ZK5lAdKqbbdMJM=;
        b=0Z63CXzV/fH5a34Jotdt0MnvMwqjxY6PcxChoNhMzhHjMrg1eswYkQrQnN3Qc8+Cd9
         hz2hrDa4u+BxaE5V26eKyv087GVqb17CtdsPpF2w21x9Tu1yVLM2F/1nCksmOj0Y7YQR
         ba54pVPjCxKuCzHUU/4/T/+xn98Fdn8ZgrzXPRByjzsGxyYM4+bWuwTWSCSwhoJ0wd9r
         N+bJ6zfNGdZplI/087Ekwg5al3Go3PuNwZQSmM+Q7p8whDKafFWCZlplARIDewFbvcBY
         dkGRQtbTewigBXNDIAQ1D4JuUWqrbgP1TPBfS98gjlsUy9hd+dPWDkbN1DdNxJYwpIfz
         STKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082130; x=1795686930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pm7Hd0hzUtoHByqnTKuK22z9l6hq5ZK5lAdKqbbdMJM=;
        b=BIPxBirX2snVXnyB9zTa/YwX9UQirE5elZZJAlhJJqIEDueZepQeoNxdAa4/dzI4wo
         UJwgQTTCcXOzkuOvqx2+Mn6R+5Pm0GclQiiX7xtPkPnd/hH9kcLBWpGCK7ylTj8nuS6I
         YAlbENgygoGb74NTOQd2ntrPINbap1dfxt1pYtzuUrW1DM0uwgxVLaMT/TCCJRVTUUQu
         JNGA28ApLtmS5TNBk07h5SqlWak0fbGPWX5INrbkrcxmt3Uh9+raQ//2fUb3o9QpmJol
         VVZNEk1ZFXO1j20jXI7/9QM3lX02CpLP/o7mkn7kluFucSU9NcJCkR6kZkMSrNTwqNoo
         afYA==
X-Forwarded-Encrypted: i=1; AL+hErFqM0zRu4zlF2VCQMGIpvUzdHXd7QnH182lNyPHDAbDKgiuPEaq6x00LaKGgBhW9gbwE0B3EBRl8wtXZQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RvDwR2XG9q+fCKpww/7yvDHFPctNn4DzEmnwAafy0/imIpFSC
	4qeb6Q/sjIgmY4wUJUQZkQcKeXIJW72M+Y67tXZlG3k9yTXxKmYd5xB9
X-Gm-Gg: AYBFou1GNhs0c/DUcICA9gR5E9rSQjCwAmS9JkSDJzSMd6ug1lD6/nskIjcJ4YqrFWm
	EPnHMpYPdN2E44/crp863gVJF1PpQUFXwcDh8Y+wUOMPcLWhsF1R7B3Qf46X9rYUsPSTk8f0jN1
	pa0BUqgzcqQZto9z+gCOatUD9ZdDJ2xw2iC1+arcpnbkMXfSYt92Vj01SIdjkZ21bsWbXpm8kvL
	LrBg8Snz67eIbr9Pc91bmGVi/e8VdGZ9OnDHJlh0HW52MYkBbb7zfLtYbZ6MrCGS1FZ/tX7t7og
	CoHwViYRF24Xa1fDy6Vs+Fl3i65jAb9vQ6VXlhAu1T3N5YqiJdu9NUVS9Hhyr33lu9Er8i522F8
	fVCTaZt3WxDrKCe/rFdM3HjiO9xyNSJ7uWerhfz7abFu7exO/frOnJ4pXBahbtQUn+FB+70s6Ew
	N38bylP/6c2wM5LgTh4LrTV1BqCeeHejlFHsPBfjPf4y7fAe6x5/LavVMQEwkrzpIOnzyl64b8W
	8lT/LUqKICGbrxbIZa5/BR7xOV2TjRVescdGQvc/zarYwE/AcI4C2EiBhzKWp1WDoBaFnvatLgL
	bnJ9TIvtygHtEl/bOTQkscSp1cpBCcGe3LFJtii0JLwyCV2+gIZf7pSxrXB0635F24jrf8Szvd5
	9VvjJibnDnQy1hDdgPWKECzW4eGMqVh9O4/1/3Ul5jnPbrARy9CP0is1h
X-Received: by 2002:a17:907:2d13:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c510e330f13mr490422466b.35.1795082130315;
        Thu, 19 Nov 2026 01:55:30 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231baa96sm95238666b.4.2026.11.19.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:55:29 -0800 (PST)
Date: Thu, 19 Nov 2026 10:55:27 +0100
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"andrew@lunn.ch" <andrew@lunn.ch>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v1 1/1] net: phylink: keep initial advertising
 settings
Message-ID: <av7Hj_S_B2qSpNsk@thi-server.fritz.box>
References: <PNYPR01MB1144420346F647D64C23775D2FD732@PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PNYPR01MB1144420346F647D64C23775D2FD732@PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM>

On Mon, Nov 09, 2026 at 09:58:33AM +0000, Anandu Padinhare wrote:

Hi Anandu, 

Thanks for testing this nad giving feedback.

...

> Hi Thilo,
> 
> Results from an ADSP-SC598 board (stmmac, RGMII, TI DP83867 PHY) with
> a 6.18-based kernel, with and without this patch.
> 
> 1. The case in the commit message is fixed, with both the dp83867 and
>    the generic PHY driver:
> 
>      ip link set eth0 down
>      ethtool -s eth0 speed 100 duplex full autoneg on
>      ip link set eth0 up
> 
>    Without the patch the link comes up at 1000 Mb/s; with it, at
>    100 Mb/s.
> 
> 2. In that same case the pause bits are lost: with the patch the link
>    comes up with flow control off; without it, pause stays on. Same
>    with both PHY drivers. While the interface is down, ethtool shows
>    no advertised modes and no pause, before and after the
>    "ethtool -s" (phylink_ethtool_ksettings_get() reports none when no
>    PHY is attached), and the AND then drops the pause bits the PHY
>    advertises.
> 
> 3. Sashiko's sequences (a) and (b) both reproduce with the dp83867
>    driver:
> 
>    (a) advertise 100baseT/Full while up, ifdown/ifup: 100 Mb/s.
>        advertise 10/100/1000baseT/Full while up: 1000 Mb/s.
>        ifdown/ifup: back to 100 Mb/s, advertising only 100baseT/Full.
> 
>    (b) continuing, advertise 1000baseT/Full while up: 1000 Mb/s.
>        ifdown/ifup: "Advertised link modes: Not reported", and the
>        link stays down (NO-CARRIER).
> 
>    Without the patch, both keep the last setting: (a) comes back at
>    1000 Mb/s, and (b) at 1000 Mb/s with 1000baseT/Full advertised.
> 
> Happy to test a v2 on this board.

Ack, I have to rethink how a proper solution should look like.
This has some issues.

Kind regards, 

Thilo


