Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436282;
	b=Ois64QwgOsWg7vHGuZX7JcFFTMocN0fZyRN0vlXUB84zz1Uws+8Dk3Wqhg8NsYPzi1qx
	 XAwcVzNSmNvyzWlvb5STDpDmLeD6oaDH5MDIlrYX9ucV3GXlx4wCki9Hd2DPon0zEh2+W
	 ZZz+CaFjr1LYMbq1CNpbU9Fku44C3tMaRMiGo4kuNYixPz6SxxJVSaxx+9huWz0EwCjeU
	 6GWOyLQMo0Hiy77bYq+c4igQSHoYOBxLuBfMaaBRTLlyA1NM3JGL05LDnWBeIfUPR4Pqs
	 HPsieAQ1043b8TAWlqko7isJ0390kjaBs87KnHSTCSr1MIIj/rhi54zOglQ6OQWvAPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
	b=IpS6ucNHMo5HaShNa7Xxmf5t4RD0z1tUhi/YL+UKmy2tPzNsyHG4ipHMx1uvg5cb2Zqj
	 7hOUW/MOlYWjH2D2C9t8y+BISTu4OeZBeKKVd6uzumyzLCSzUm4jncbmE6CgBtgwi6ye3
	 /KWxASK+JGBJtprU4VbHKXD0V8+vZS/W/mSYL16VlGPFi9NwtbluB2KB4yPYbpEV1VUuo
	 nxoyyBKD7zbrODwC+Nh4FFgZWUcu0ZcPzFpWTTioTZD8NjN3kz7QAZCnxYxVymKKQCPQY
	 wruobRy7uchapSASxVccLdqRh+vQL5jf4rv5Skj2dXS46PM+qzmfdoIrpqxoETIf7WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6YfVoas;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0880606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0880606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6YfVoas
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso670695366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436280; x=1796041080; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
        b=d6YfVoaswLbKwgD3P19bFRJ7ZURGLAM6cgUFg1Az7CArc+wqW7p9oN5XEDfz/OWZM7
         BNhsP3uqnO00vH5pTASrYPmILCkbDfnqyXbzN1aOLyXO8gKYRq0+8PPp6XSsqmClS/8y
         QKiU2lH2JXFvZ/cONB9A/We4EBus2jE8TIhb0YJYYCNbsds4KUlnma5I/AYVFUNggDM7
         VwxyJX7CVMT991m7EQNBh0qTSsWXSpLL8PQg+qDdReUbN6U2+9KdXOVGrc0vAuPLIv2T
         56SIttjVScC5XssqtGrOHAGAyglgIEmqbhLOnpJbhijs2+qCpmOi+mgWNmrU6hfO5c0h
         qjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436280; x=1796041080;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
        b=ZCDyt22wEJVfBp9UoDHMUoAFQAptPjd51m65hmBQTr2yVwhDXve8jBI9IgGRmpJJg7
         8XMvVug2KGZPGR4Lerb6ZS6qCnOu5FFwJvn/smr2Q38V7l8sEvW2aRmM+f0IJPBOIhtA
         7oSRoAyNNLTgmcna+ni1T2Y6m206w4pgbFbHMRaY4NneHqi/yApkm8DiyPat/tPydelL
         y0RA//pP5giWF36eO1mwTZF0CF+ov43qZy3HHOEqKO5POGwg+I/Upbv8Q72O831BrjLF
         5bbozkEGEZvM1Yhv2ZBlQgTQcQCCWZE4QCm7IJJ0spynbZ92AXmJ+RzMneSHvy4PYzOj
         wcxA==
X-Forwarded-Encrypted: i=1; AL+hErGsayO3Fh6ukLnJvSSd1jXBjyV7AQGNhUbMd19Ss+NKeyvniZnsWXIAGawr9t7NuYkKpqaynoNxGaiaymI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+yWzAlKzauL7L3f4ByeXxpeeLyvz4z+uZovvBCYx+8PfFIpGQ
	bMjOQdj+jea0Kog2x3p6BsS2R6x0P4wEJQJMuhXcvNuM4lxE67yuZb/i
X-Gm-Gg: AZFdTZfrkR2sec/IHCTJXtzjFx0AluoW2u0sPws4Dx6ffxiHVuNy0+ro1YxJ9qwYfQw
	Kr6dJ30JhzCa0L7nellbSzTAO6IPYNcCrBzM8r4fkCW41UDZXkbfHUsDrNZ8ff6KzLQQmTXzWDZ
	CgvF1GvYYWN+JIKNOCgpqmS8e3+PDhsxyHFgbYitiz6mEma6/Y2TLqL7gJ3wCijZdbyRuML4GHj
	XaFb7J61V/zDE3Dovd/5uEHT0KJVGtm4QCZjZ+MWyDj37iBUjK8DLX8ggEcTUg/gwIT46AyJTJe
	oiPqxH00EoY/afHHxuUBcBPxSQNNg9XfCUdhYHYiQhZFR0ML+wTivQn//XpMJgDKZhnxWg9x4OZ
	ou2CW4ONIBalgmZssdoXp9wdj8+qUacz/9KgliipvUHla0XuoZGMc/W+eEM1a5YFiyU0vrLpEDV
	xGlvyJnL95o9O6i2w5X5SxoBoOYWvdQ02jQ+pp6D2EX6xFqvYM88j/l+heTO4Qmsh+gdaiNGftP
	QSoNGf/eT0YeEyEY/9lG5J31R++LbCY54XxMOuLWHS8hhqgBg83PIn7IH1LzdfuNe8DRfqXD8Ty
	JbR3Jy7JiQBbr7CSTqvKjx0bJyIs3BzjXeVTFzSL0ztPPIIumR54fE9f
X-Received: by 2002:a17:907:6d26:b0:c51:50c9:741c with SMTP id a640c23a62f3a-c5150c98208mr692273566b.10.1795436279974;
        Mon, 23 Nov 2026 04:17:59 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm397263266b.51.2026.11.23.04.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:17:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:17:55 +0300
Message-Id: <DN2L1II131YK.3M3CEKXTOAUDX@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi
 Poco X4 GT support
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com> <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com> <OZecqgdcxZrbwT7Ps6SDq9u1Q2EeF9jng68KHoWs8vTEetcTU8GAfC5LYcKzDGEZlr5Rlzh4rgzVh36JelFK1zHk3Dgh3TVGqj_a5Y3hv6Y=@protonmail.com>
In-Reply-To: <OZecqgdcxZrbwT7Ps6SDq9u1Q2EeF9jng68KHoWs8vTEetcTU8GAfC5LYcKzDGEZlr5Rlzh4rgzVh36JelFK1zHk3Dgh3TVGqj_a5Y3hv6Y=@protonmail.com>

On Mon Nov 23, 2026 at 3:04 PM MSK, Roman Vivchar wrote:
> On Monday, November 23rd, 2026 at 1:59 PM, Alexander Letuchiy <asalde.le1=
@gmail.com> wrote:
>
>> Hi Roman,
>>=20
>> On Mon Nov 23, 2026 at 2:41 PM MSK, Roman Vivchar wrote:
>> > > Bootloader dependency
>> > > ---------------------
>> > > This was tested with a modified LK bootloader that is not public.
>> >
>> > How are other xaga users supposed to boot the kernel? You might want t=
o
>> > port uniLoader instead, or if you're on an old enough security patch y=
ou
>> > can even replace stock LK with U-Boot. U-Boot chainloading is also
>> > possible.
>>=20
>> Right now I am replacing the stock LK with a modified one that knows
>> how to handle mainline DTs without expecting downstream Android nodes.
>
> LK is known to mess up GPIO and clock state. The earlier you replace LK
> the better.
>
>>=20
>> In an ideal world, I would like to replace LK directly with U-Boot as
>> you suggested, though U-Boot chainloading or uniLoader are also valid
>> options. Luckily, the security patch level isn't really a concern here =
=E2=80=94
>> xaga is already EOL and hasn't received official firmware updates for a
>> while, so LK replacement works across the final stock builds. I
>> definitely plan to look into a proper open bootloader setup for other
>> users in the future.
>
> You can take a look at mt6768. It's not upstream, but we replace U-Boot
> and TF-A with custom forks, as well as provide tooling to prepend
> meditek-specific headers for the latter.
>
> Best regards,
> Roman

Thanks for the pointers and the mt6768 reference, I'll check it out.

Best regards,
Alexander
