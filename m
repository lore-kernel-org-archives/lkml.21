Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795617716;
	b=rmW8XGKhsSJtdZ/TuPGhHEPyZ15qYf0V6KsRzVzA/JkPum+K+Fic+5NjQxwX4Z51NBTi
	 L73wVTsrXG0PE0Gx9dTfJhQkaHokQ5TONEHI8eboskd2JVICCdDvRXF0lqxJuySkOKogo
	 aIVa+WsC9k1x6QSdHmM7if26m1ZvK6P+QSjU5FO9qktqu1VoBM/FYlk9AGoe6uT9585gq
	 QN70HYuCx/b2hyyZzuRYyg636RBsxsyGGVb4DnlcMR6SPVCcpCWEqI+UjM4grEXyIxSRR
	 4ewuWpebyZPa6fwcAOLnF7sS5WnUgs4AWU1NeZn8sxyR85LgWC4QL6wJT8iTp0K2YSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
	b=GCExenQxsgkClJLCVkQUIEYdp98tGIdLLF2aSaN+tg4jO6XPOBlNudO1fT6P1nBX9LZd
	 4hQdajFE748oVnBTiPzKCzK6p53jx0P8wmSOD64HlyurQaBS5P5uTcs5HzWLMHHPx+esp
	 CzoDgIyD/dAPFRxVjhduV+6L+jT7krmUsvMb1ursbjaqBdBBHCHXern5p0Rgfp8o65Xpb
	 Z3sTwluNKVYv2g6bdenNhoNdigKrtKmjzyiu7/KEsIzJPi2EgNiXAYK9osaMrCJwyLjbA
	 I1a9I4YQe3Y+1dRgKKs5pBKjV/oDh3+BSe6WJr4YzGlJzF4kNcJ6NzXNCRomB+7EiFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=odAjoK9l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF66F606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF66F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=odAjoK9l
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c513a854320so90470866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795617714; cv=none;
        d=google.com; s=arc-20260327;
        b=ECiBs7QiAJ7o5DhA2q+hiKZKXmpI+Gai947Vfi6vAh/KktHN7MeotxhPz9Z3hOEnNu
         cmt5xh1MsPWiTB/aNKWalWbu28sdBj5dE86bTCh6vdnAMgpUXZ4PRPS0bSVe/ESm7hxe
         CJNdKxU/sQ5Mxze+J5+qyeICNas0Pu/CFEotV6VZG/xftd/pVU9a0uqkJ3yTrvWjlUCt
         FK+oENS/h8nn1KHBZ3qIWlDp58TFjqTISoXG+GNRUbitsEl6bjD/et2/ED+3KeDdLH8Q
         xJpW0RhwxyEb1XTUa09qHJXZubU2rn1Ii8QiZASaBAlrCY8dpT5nHaiTlaSmHR0atVKv
         wsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        fh=EI714wu/GWqGtj4kcCZnk4LpwEsf+v2sGN4OjXmPJs4=;
        b=n7VTDrjVDGAg8cg2tbgl9wnaDBpGnDRJTAUYqn4osh8bcIqtRA3Lg6BLA0luT0rweE
         nlchvJ11RsQ1r3B40DM4VTQaUStnd5wQlRAzrmNKVMK9eaFGwr1Tpj06K17+bbntzMyH
         B1FYPsijdBbJZ4b+7aZ4HqjxL2cw+zV0nA5U33A6yyzVsRz9RhpSyA+72Ov4LRGC9wqn
         m0VoR8KMtTh3lKTBEpZAFYbxYU59JSNRJb2VxAqFKDRIQl+gPkaQsj6aMcabTzeXWQly
         0oTjOhuSaYO49yuLYdweJABdYFv3o4/QgMffoUFlyI/OhLn8HZZCfolg0UHWWvoiL+H/
         haGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795617714; x=1796222514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        b=odAjoK9l/53NSwRmFiM24jvPCeeXxp/4vOc3k3GMNxbsBQBZi6TJxTLdHUroGvseN3
         vK+7WVGukF1Pw8D8F3SHepUtK9+iku92Ic62HRdxe+CE1Xt6C1n/QKzfSoNlyVrD/HHx
         1XBF76bqvwnNeSYplJwR4LfoEdgs8W2rAbHYNLe7KCxulvyoD33XQpFdv5HkF3lHN/pR
         c3KGrr1LXL6Th9ppIfY3ZwS7hLZJYIqUSXgBaNWlnvK/lDcgEGoMz9BQ1z74C4UAPLic
         dN9BXhAuvPxQNHoogynsDFop0FHAmOfWCSunp+TpXx0NdRPykNVSHPUgQ4abiLX9lPax
         0p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617714; x=1796222514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        b=eSE34sJBRjboRGJGxKJ0BpVMLlRjQHiAozpFglhfuFZLh/3yDe1lAb0t2GUclH0lPJ
         21WtxLzNepZZjPDNoChEZSdljHk00Qp5XE1HspA1cwvw3vquK7OePadIsuquCk2lPwj6
         7kuRk/jxO79jybVS6fOBsstUOO98ZpmyVDtMurf/TSvpAVT8FrcQedPhg0OsPJdUpJgR
         O2UPgXqlpJtM7lLHpRJOxHUi8CKPRxFZfz+go6HlFFN7esq31ywzlhT/0lASmOGb+CbK
         Smh+LVotNOVHm+7JGuTmsYPdzDKlek/V6fjZGuK4IWmQeeTw+jCpiinLVkSqeYfHRZzJ
         i6Mg==
X-Forwarded-Encrypted: i=1; AL+hErH9OPJTDsjY6pbZK0KroTEna2axUMuc8iNVeTFNdsWqqFnVUuoGjHoVly6az/zw8PI5ypUR+AnHQWnzBcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7HbMTSau0RIwTMkUSa/5fHVh4o+32oJvRovcIDhuH6UUQa3sd
	K1/qXdYyR5pAPpO3OvqEb54usNxR5w7tAOorCS87FhzCCD3lqjFtquUuhPVKY/OwJRwx+7/tD2Q
	MY62c/bjpmSgH/uuAoKyQRBWsBlsIzmsFPjs43Q0Fdg==
X-Gm-Gg: AZFdTZeVLt9PY1iMzs1AhgLTNv4kQYXTjZ88Ha1pws4LDeWEToc17y8ZSddsDpPLskI
	U3J/c31WaEoiAdqBbXYRP9ZigUp3XeR9fNIPTXVN2X8CxonFwWYH3VT6P+DDlxA8jgY9qat18ab
	W/SiUpyowA2hRJxI31XL9te87yPrlv9AYjb9FZng/owJpiySqXRjwzJ1/SrV1LZ++eoJzxmkFo4
	DbBQsRkC2RBBWNsXF15AIRxBL354Grlh+yweU9Wwv0UUhH0XhJVXNfAuGb2mSMKilstQKrV+Oas
	riKTUxCiw0Le23ZQB8X39AERA1RsYisa6vjxkpDDV1l7OKW3zftODV64hmMtSq0DJ/QyWMgeGvM
	7VgZu4DPKxAh88ySodkgfZq6qwXT/Cm8qkHai51XVtg1TqtL3p84USDUAfj7GD7JnqC2qZ0Z9FS
	aMNx7ZI1QsAK8phQ==
X-Received: by 2002:a05:6938:e04f:20b0:c2e:8eb7:53dd with SMTP id
 a640c23a62f3a-c513ab1349cmr1102866166b.42.1795617714171; Wed, 25 Nov 2026
 06:41:54 -0800 (PST)
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
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
In-Reply-To: <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 18:41:42 +0400
X-Gm-Features: Aa3M54p30Iatdogoy58JfnAd55Gl1tkvrMVT9GbSbV-cJhdMvMKH6OgZsz2cLWQ
Message-ID: <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
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

On Wed, Nov 25, 2026 at 6:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int ind=
ex,
> > > +                            unsigned int offset, void *buf, size_t b=
ytes)
> > > +{
> > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > +   u8 *mac =3D buf;
> > > +
> > > +   if (!id || strcmp(id, "mac-address"))
> > > +           return 0;
>
> I don't know OTP drivers. But to me, a function called
> rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> architecturally wrong.

There is precedent for this at least in IMX [1], [2]. To me the
interpretation is "Rockchip CPU ID used as a MAC address base with
offset X", which is exactly what the derivation does. IMO, this is
less clunky than the alternatives (e.g., a custom NVMEM layout which I
used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
returning the processed one, which Ryan proposed in v2 discussion, or
caller-side processing).

[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocot=
p.c#L224-L238
[2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocot=
p-ele.c#L115-L129

> I would probably not mangle the CPU ID in the OTP driver, but in the
> MAC driver. The MAC driver should ask for the CPU ID and then hash it.

This would then tie the address derivation logic to a specific MAC
driver, rather than to the platform, and it won't work for boards
using other MACs (such as PCIe connected ones).

Best regards,
Alexey
