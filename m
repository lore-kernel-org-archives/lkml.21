Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622339;
	b=ZTrV2S8kHqHsjUUyxWQ/Ibtchfx/2tKfIw/G0dyoPXJkTDlsKSq9UvESk/oMSfNRNiex
	 ljcoXx86X7QTfQrlrgpd0nmtyQ++1zF5I92tseADK9bFlWlFVfXfmgESYaNYAn/e17VB+
	 m51h2J2ASjtHjP7OQSZwS1iMp1nmkcOlvXiTFX5t1x57I6FCXP3zVvm7KFhvaXC0XYTQL
	 ABHXTwa8I+cgnwl1M/aLAv/CViK02E8WMR0Ar5gbftSoFiYbepMtq+WMlhvlfWAZyxdUm
	 hc1MGpAc6+rHE5u5cosan4iQJ+t4EOEZc5tj0k52ZrwkhrOnj6e5k218h6BavbgoHpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
	b=3Y62OweEZdA7Y9AIER7p4k7lrJkmhlESk6E816jCfqTcEeuXHTC4Ofpqc5AtUAfNCN8h
	 RGV8iwj5CS4NrEo42zBgS7xyEx/6wk9UKZPBJO2tr5Bw5koOQ2JCdxkp6qE8LOBctvevT
	 lahIG8s1knGpgJEKr7uqTFeccl6yTKZbrFNZYkgN5Xlt8Ksq+FFraMPWsEwww5rFjreoh
	 7i2gSDyrj1rKY3bBmuXqF9/Jo8i2efja6lggEvurGSk+JzxK399NtKQgMIpQg+pwtZQyi
	 uk58QabUuG84rbuNGfhW22qU9bt55w6nTANlc+7M9GBzvj7rPirmOFQcqjhACoZQ4hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JXLAQZKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93209606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93209606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JXLAQZKs
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c51a14bd405so174773666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622337; cv=none;
        d=google.com; s=arc-20260327;
        b=dt8MqveE9rnmnOEecokfdF+cg/FB52jYwqaDneQh4pc05V/FywAiKpHGNQzS7aaauj
         pEfgz8KLS/+24v7cmssPYRqwIj9KOGvDJMybCTHFU2+eoP017dBLWeEf/Fqq4UgYlqYf
         5O05U14kCvkMXvQgdPCLR7flT1rgJzq0hCQMfnKjk9t3SuVqG+ZdZGEDrp2jz9dzg/y1
         31pnoRA1aif5yBC1+Ok4vyqhspxAwSWTCm6PLYebL1O6g1/w/7y14OHpJW4aDAHt5HAo
         yNC/LoyTAYARJCif6BbeJwM1TePXc0Bhajv0DGa9XIWsteM+Fpe9wRzhO3e0dG1Wwtcr
         vhiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        fh=jJIxdmiEpzRpsktfdp1wQPKknfsO9BSys8Jgl2QDwA0=;
        b=etST5LFhCbmtYWkdEbmkurRkhhsfSfMcNaXJDxz2/nJgbPfDSilBJIwvoyvHfM9IZe
         2gy1g6/W+lPGxiKFTG1LlTM+ALY/d5wlRNbv6AreBHSeJuZGeOuuvuEjphUH2zSRTFIi
         /KKFPsxN30lfe9JDf2sDRlgzYU+7IsjQkfrpvEqj9AlA/YC0YPwo3IZP9rspZVu8zDDJ
         Y8TJeF6geIrPD/qAPPAySRbf+Mplw3qqhmI4iN2OU/jR+eql/yknF9dzoJxnM7Tj16Ne
         ctVpnKAI7WJGrhbjpHlJc0TEKv7npppc+q/9SAY5CO8xsNwrlsZC6q3N3mitBSL4U0wq
         e0tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795622337; x=1796227137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        b=JXLAQZKs1ZDSjHSAx8TIgEBbtDLNlVrzKhWV108iyq08/vJa1ZilyaW+VZP+C9p89w
         zL8opP8hxcFgBDsMLoaZdGv/ycXTCd9D3u5FVd31cobfbVoM+0NN860gnzpF1aHPqP0Z
         1T904onxOeVaulXCOUmlEUz2LZ6eUPQRX/I7KRCCBw4WxiS7VP61fBs5ayTosbbEMFJi
         RuOl6O/P7bshxQMQVs5WfjjkpMaHMF6K2g+KWoM+m7SVLOzUu2wMg9WPlnECrTX4gFmQ
         xnUjMP6E0k55etqDk9vtDqWlgcGYiCU79Jsh4pEptim8BwEAjAzmuiDK4eGQjGqr4Mug
         CwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622337; x=1796227137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        b=o/Gpsu1Y2sCe61XZzHJSi40KMhLNMcrEMxkD1pgdkVmVmXrGldDmhcTuKFK92QAGJu
         67uFlzjlx2r6wl9nu1Gy8I78mx56XG+nkKsHnwSoelK9Lky4Tiy6JJKzNeUdA/B2jlZ4
         dbQqf3XzswTDogsPtOQH3Vc0ei4lO8DjePcKUdlleIRX1hGsihS0sQ+Iv2VggougQmgH
         ugsbsMO3TXDOy/lNZT8sDeynZwmNg3BpJita04AdQvEvHrdXci2u7M8xNjRD68Cgi0ts
         gaUcwIby/PjYcZC/0t8ygfx3Nq8M9UFCOS8NUob/+NNuo9dm/0e/0+5e0iaOeIfVKgrL
         wG+A==
X-Forwarded-Encrypted: i=1; AL+hErEFTT454qwMnngzJJX/RWtctWsYzslaLhJL2iXYNYLo7WDWwHQQFJpn6UVW/adgIpn/WV3R30Xdc6aTLFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kw1PP+k9zCXUBDwag1ZozbAO7710uGOIXgXNqWZhnZQX6MQUB
	GW0bMCs34L8L9Mmwc69ieM3ywZZ/nf/4qoL3kdPrevoB+gEniiK0y1JTpksCUxB35HdEZItunme
	t/NR5ej6HZ9KYJgjQAxgAvjf0OKuRJScn6/qudHnkQg==
X-Gm-Gg: AZFdTZeATvNL0GlRw8iWBUoFx1Z7spThJO/478MrOjf6A6nKosElpUvM03Wl+DdOV4e
	MLP9TsCrpQ6WkS5Mn+cc1YsArQ7JGsDO43hXqsxlO6dRnUyEeg0mIPAIvzif5/pR2gtrYZE2TA6
	543TxX8wtSuV2vbGqNOOtaCelrdXpZ/+e9WKOpnRykTqcVsifmQFSPwpX+ipvf90fHwDTBrgDzo
	z20icQJnliACFmOX6BhJaXhB0Vu7g2EAxSXa+HnOZ67taBcvNI2VGrlekfESHeKj0ZaOU50sIYF
	xvf0pZoVKNJYf3WZkek2CEp+Sf6eXBRWV1pEQqL+dlnd0mX6G6mA4Y3mw7HdVZDjSt7Ovr/CCHe
	5S1R1WO52GeBJgPNvmryfvlysrUosIK7d1ENDNXFdylDfwocI4RBbnsSKdB+u3uZdWKHY
X-Received: by 2002:a17:906:81da:b0:c51:1d9a:323c with SMTP id
 a640c23a62f3a-c513a88b0d1mr1175280566b.15.1795622337011; Wed, 25 Nov 2026
 07:58:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch> <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
In-Reply-To: <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 19:58:42 +0400
X-Gm-Features: Aa3M54rEPfqgE6y_yyyGlUyi0QUCYRvYug-ToPvauBq7tha0wq3SQqIuKn74zqk
Message-ID: <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Leung <untilscour@protonmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 7:23=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Nov 25, 2026 at 06:41:42PM +0400, Alexey Charkov wrote:
> > On Wed, Nov 25, 2026 at 6:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int=
 index,
> > > > > +                            unsigned int offset, void *buf, size=
_t bytes)
> > > > > +{
> > > > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > > > +   u8 *mac =3D buf;
> > > > > +
> > > > > +   if (!id || strcmp(id, "mac-address"))
> > > > > +           return 0;
> > >
> > > I don't know OTP drivers. But to me, a function called
> > > rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> > > architecturally wrong.
> >
> > There is precedent for this at least in IMX [1], [2]. To me the
> > interpretation is "Rockchip CPU ID used as a MAC address base with
> > offset X", which is exactly what the derivation does. IMO, this is
> > less clunky than the alternatives (e.g., a custom NVMEM layout which I
> > used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
> > returning the processed one, which Ryan proposed in v2 discussion, or
> > caller-side processing).
> >
> > [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-=
ocotp.c#L224-L238
>
> I would say this one is different. The cell specifically contains the
> MAC address. But its endianness is wrong. Nothing about CPU ID here.
>
> > [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-=
ocotp-ele.c#L115-L129
>
> And this seems to be the same.
>
> As i said, i don't like the concept that a function called
> rockchip_otp_cpuid_pp() returns something which is not a CPU ID. The
> two examples you give ask for a MAC address, and they get a MAC
> address.
>
> Does nvmem support aliases? Can you put two different names on the
> same cell? If you access the cell via the name cpu-id, it calls a
> function _cpu_id_, it gives you the CPU ID. If you access the cell via
> the name mac-address, it calls a function called _mac_address_, and it
> gives you a MAC address.

The cells themselves can't be aliased, but what you're describing is
pretty much what the current code does. The id field is exactly what
the consumer used as the cell name when referencing it, and the
postprocessor callback checks whether it was "mac-address".

Shall I perhaps just drop "cpuid" from the callback name to avoid
confusion? The special treatment is only applied to cells with the
compatible string "rockchip,cpuid" anyway, because only Rockchip SoCs
use this particular algorithm for deriving addresses from cell
contents.

> That way of_get_mac_address_nvmem() just works, so the MAC driver just
> needs to call of_get_mac_address() or of_get_ethdev_address().

They still need to relax the size check as done by patch 2/5 in this
series, because the CPUID cell is 16 bytes long. Srinivas rejected a
prior version of this series that attempted to return cell contents of
different sizes depending on the use case. Currently any cell size !=3D
ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.

Best regards,
Alexey
