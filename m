Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778911;
	b=KSvP7ZxMsIvJvNm3qXdl5yL2Sk9dKUqlTVNFFQKFWT9bj7QIGlPWxkdFLQNkAEhbzy19
	 grnezmCzSoApR4mhQuaV7XDv0pZiAVzD308EQln8bzChjNi2J9xmj733VCnWci939tTWU
	 YlLAgzYHeuuFCdIC/uELV0bZMFOp8Y+XBTDsL1T1/wjaf3wFB0vgXdsHO+BFMtg497ezb
	 F3ulbQ3IsWtuLuJ10KO2HPwQF3EoFabtbxvz+SCdGVuZgZbHqCiNt70dKvtrCy8iaMO3J
	 CiurUN78vA/NLSTimchMKhyBPCs6cqZMAjWxD+HF68X6HlPxZn+/WxtabPRYAMURRnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
	b=geM45fzjlYwKWf4KQqDQYElnZi3TJYfStsPBWB6XhaRuTFjJGOgpjqII+u+HUeDwalEb
	 FfV2q9S3UES2wBMAlgZavXyjPgEM7WAnxGCBbDxuzVjlBCX7lHRG+8etmwkIyGsfWs2jM
	 qyxKHh7+xpneu05mmBtZ9AIUQL0wofaKtFyLqL6xhTAyQmFEE4j3GudnSTn7G7mpTin7Z
	 zbtEWqi1oupt0L50DpYWQWBRy3itTK4xtPNyBpUHRbb2ZRb+6cWnkgM5YAxGLGj9zfCex
	 KbHMzePvTtF+DDVdQ8HT2DDTdcw+DYUCh/qv455zkWs5KBqVVAcxPwtEkO5/RJx7Uhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Lmjs/KDz";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868C7606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868C7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Lmjs/KDz
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1440374966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795778909; x=1796383709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
        b=Lmjs/KDzvtcIm9lpggRo+RmdkASo29A3iVlJO1YX1D3xBx573IwZI7dk8QmpgE2QE+
         /E01xYRXC+XNyMzFpz+QFXdSNfNkszBmc5bcQe6w+0Vfo+hj1bEFgrChI0ABhuh7OZuV
         6JyjC727+46/3Fy1YJ/Y6DBJ3SIsivpz5nP7A9jzH5/lv+PJdrqRF45gtB0tGiUoTBPo
         yodhMNX57M4VHLkpg1k1aAmcpkFJOQTF1fqNFNe2Bo87/n92a9TxrhpcJMBBE7DYgfyV
         w3EtS146tTJacFP4VErTIpoqBHeXze5Q0UuY+Y1nLJ9bI6zMWccNR/RWjzfFl0f5W6Cq
         fPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778909; x=1796383709;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
        b=FN61HR0Z5RKEVYLN5jKPP9HUGUuHYLQtw3FU0Ugnzuc+i8u1YiPXnQqlJuUtBO0qX6
         Mtj59Z5FRDo/HeDIBqgnLNw1crWql/v5nvaOytnb2EJPptmV3QZmV/LxRqnklmFXoPNa
         Lz2Bag1evsscKOf0ZIACRSY8nBDvy3/uo7KU6e2PBnMg9k6VgmFpiBV8Azjk8nsS2gOZ
         UFnUpEnD51pChjRg3EjM5SMktl/NzgHs84s7CJlYKBZi05M9kRvdEpa3NDsvGk4yLJUB
         0xAFGn7mAlJoZpvN3R8MajtYkXYiPWyO9mtgBpapUW5NAEIIQXVA+nSZpaGDGGPgObAc
         JPYQ==
X-Forwarded-Encrypted: i=1; AL+hErEf0zCs7dxBQJJpaGEA/+jwKOMWu8a57ZoDKy8pgXyrI5QhAvTMWOqyG2vCbFJ3tJ6s04OPYepRXW1KAIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+w5nTucSjgBGV5Sf69ut2svadSqlN1nVT6+4G8wA6asJqCt7gy
	u8AgMSMdIeR8kwo90LLyEr2AjetWWqIh9IKKPOet87lJHVNDZxlFt1C0ZzJlcjC1rjY=
X-Gm-Gg: AZFdTZepZuxeKO8++EoMVI0yrP2oUK+WOH3km+0+kjr2liRnKmDuMcnTyRSO9Zh31G7
	f3OKWmNXxVKNWVxZ2InWC5V6TUou2C0/TNsPI8gLFaii0hO/qSibne/bawvVetqO4LrO94OqY4y
	xk95HYZyynjNgA6mxG/Go/KlxR5w8zH4wJ4srIzYBMaU9zLO6nL/y+Vb+uJ5I6kck5ImyEAJTiB
	IUdl9h7eKNNvQ4/zgmzkeN6CZzK04jd60CTSYE9NuK/0kRZOLqGhOlsz0Kz/cNFTskziZqCOQh5
	AwG0Y+NJCfX46wXUZsnXi8HYj4hGrn0uY4SJoQ0R76XW2CLIyexCYYzPMYgMK+JdgyBnbuXjY1T
	wbq0RFCSNkh/tdit55LXwm7dezne2eqzeyfaZYAsCdbTP/s5STDZyvG6XQmXMZ+u5dT54A6/z2/
	1DHVcmjRCrJwDnqDDh7hSDd7IPfRpci1wekPOncv+FBQIVrRf++TzS01/wLCZe710aLpW0xP33O
	0N81DnhuzYGZJgZ7YlJeBDwBLUg0k3aJ+tho5huxQ7e/r7k5ilSQ/K4NqmIf42+bThIjPZ6I9HK
	NNaQWAxn2EMozY59HwBbNc5ZOYvD1z0CLTPP/HbGu4/ifW2P
X-Received: by 2002:a17:907:3cc5:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c513aace8bbmr1830615466b.9.1795778909013;
        Fri, 27 Nov 2026 03:28:29 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm851858666b.45.2026.11.27.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:28:28 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 andre.przywara@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo
 Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa
 <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Cristian Filipescu
 <filipescu.cristian@gmail.com>, Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
In-Reply-To: <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
Date: Fri, 27 Nov 2026 12:28:27 +0100
Message-ID: <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 27 nov. 2026 at 05:29, Jernej =C5=A0krabec <jernej.skrabec@gmail.co=
m> wrote:

>> +
>> +		mmc0: mmc@4020000 {
>> +			compatible =3D "allwinner,sun60i-a733-mmc",
>> +				     "allwinner,sun20i-d1-mmc";
>
> That's not really the case, is it? A733 emmc has support for voltage swit=
ching,
> so regulator should be added here for voltage switching.
>
> I suggest that you drop this node until proper adjustment is made.

I'm not sure what you mean here. AFAICT in the documentations, the D1
and A733 provide the same registers and should be compatible. They are
so far.

The driver does not implement CMD11 but this equally applicatble to D1,
isn't it ?

What we might be lacking right now is properly voltage selector on PORT F.

>
> Best regards,
> Jernej
>

--=20
Jerome
