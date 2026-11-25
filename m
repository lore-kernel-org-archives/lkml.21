Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606703;
	b=hfnAeB//K8FUuLF2ccqI3y8P0EuP+pFwwPSwKEBvszhEgi9KE0+fUVTuXMXnKH9wT2pX
	 Yg0gtfhm8qSkac104uJzTRKWo46w0P0Kvq6uRdmoJTB6YRJKOzO0DtGE4MXbsCybDkQqv
	 TVldMrZG29mJuhUcl5fHvAGoIyz9EhmJxtjl4zvuLbowtS2ISPUDmSiaX6UXEkW9LNcBh
	 KmFtaZNWEDvlawjEsPPB+Bh6eVnMAqNXgAR9TCU7OFkgxOcOc/rgREmFs0TVtnLetBY3A
	 KPd5DLiuDzaCEKifeyhdkyQT42BoB/x4PNlpSFL34P/sXgZXIRd15mha98MPjykOMBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=s2BIBd5zd4VkMYRFZWl5QkRuLP5x9yc/zhRV4K5hm78=;
	b=NLYatWY6w1i1qYMFW1bSydojwuVxtAJ5uRltfZA6hDH4aRM7q19Pwn0bSwAlFVr8JKJH
	 1CxT9oViCiblQySBG/i2ht44dIy5mKUMx7HqJmaO6sqhfWPRvmxb1Hfa3eg7AC+dQr+VL
	 bt3vKfAbTf4qFzLogfAt8ZsBUZIIjaSAUnIyE0JtVMX6Na1RkODDS2TjucivoMtoGJ1oa
	 hTE6gy16LB6UUAYevk7LmZh48Erg8std99wzz3kheYidzShcQFp8ImrlHMiAddljmR4In
	 GYFNeLXwbONPDz3b6xMvkLMl1Hruyt57ugjFj3wIvCiWJ2IG48upLgmJBnXGG/fSWMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KSxpaI54;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D31606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D31606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KSxpaI54
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so49473005e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795606700; x=1796211500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2BIBd5zd4VkMYRFZWl5QkRuLP5x9yc/zhRV4K5hm78=;
        b=KSxpaI54cIcKWf5gI0gybRkbKbqSsHskJJaBtu8FGJyA041yqykOD7fQ7w3lxItY7U
         U6CzI1hyJ6Cd0TwEeIMuK2GqFa7ZGy6jeJYyriiT9Pm1rEEm9+AD0ZzBiYOLhYoxJ+dd
         hKnF2s1f+5La/ykPimDFzAdMVZ6pZWXxNM7ay5wXp7vTEJZsy3bWMvF40GmEyWrpCWly
         geI2oIjjuq6B1hzzAHee75BiFkBTh21rh6ALomuOeq4UHC59IrsGSuy/ihOHZw2OWVEN
         NN7m6KUEML1LnrZHyGTzVkBPtKTkPsyBhX+8XMjy6wD2emnylX0cmeoEtgnBbjNh69G6
         MNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606700; x=1796211500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2BIBd5zd4VkMYRFZWl5QkRuLP5x9yc/zhRV4K5hm78=;
        b=PAhCA5MOyxgm7LS5S1PPIuc+gRVjRengndsyqnwsjD4FXVRa9mEOd7u6ZeNxo07tYc
         qZSr9Vgp7OCIPllvPqqhvT0dcMEE2qt+iJ/6N9VACpM1Tz5sH9sr4mLU+wtBJzfRbthj
         4NJ6ssSqjPzFtsE23bAT6/Kre0dXmEmkcuteMn5vI0inv10gAFQSHn5XKGLSiHZsUzNe
         6A+xa1AYy69dZokKSqSrI3cpGYc1ei1H85xXaNOqvCnDyOjwPTp80oXO5+9+MeiceZgs
         Gvetc5E7rSksIMgg0Z34s156QgdciqktGggx9TjX1neaa6q2mgl5DoPMLyl0VKcXInGY
         BxlQ==
X-Forwarded-Encrypted: i=1; AL+hErHQ6SXtXOWgVTjq+Z1tE0qqTgAQMiBFVPkRXIIpypvirmOz5lbqUzKzYosb5mC26rj2d9PfK3kqBeGz3gI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9egR+CqxX++090ZEw1ZsdwInbQxgvpbDCivsUybeDvAttWFWUU
	AQlWHOJclrQtpRWyyOGgKmKzqd9nPnH7kGrd8mjTEhsyozn7faL/MqhM2Bl61B0fpuI=
X-Gm-Gg: AZFdTZf/3JrsVhCxQnahLYA1Y75iuGTmvjMo7ig8d+j07RmbF1RH9lBVKIR3A80MszK
	EzaUQnEOI0BDUBu9jwiHQ9tnf7Dm31bdwbNEkQUtJNPGcnjuTK/2iFm/3+V8HsN5hqb5hyG7lF8
	pgKIn0aUf2Ld4t0N4gGMQeS9loehCJQ6ydJHfuFQCk4MceBoOPAEKqc36ypZ7l43pfB14YN65+s
	+S3jgTYxN3idQuGZhKcsMZwnRxY38BGa+tfQPExyRI6NsVSuJNOJ4ZLpnYbY5/GLnSAH+w8QIm7
	ZmUvvjQ2mXCOKlP3nyxzeF5/RbF51ep3jiWWQ8IMKyvJQdWr0xAluoRjLU40qJlHqxC18TMr0q+
	MzTaSMchsKSPQnuqxQSBx+Sf8NtjqItYoOYwtghHXFWsNmWLoaxdVn+W7RuNjlwVHLyhGXe8dfD
	vx8nU6zVD1K3+DnnYbVktxGmaATqClmJe3Wd1Vbvvu+LhXlCah14VCJ5PHYCZR7M90XLBp+2+ii
	mhJ1yfvcIbduR/IgeFwQgl7p8zekZ8fBecO65wsRHQSy4c/yWgxrC+cCDS/VDhctQjF6to2xDr6
	JH+AwqLb0UW5GMAhUHpAtP3h6jNmJDoTUG5PQBWNC8kH1s9eVxpjW98OhCHcTfg92GIYipfkOWo
	zndY8XwWno3jmm0PLw5h+1VA=
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr389740405e9.12.1795606700561;
        Wed, 25 Nov 2026 03:38:20 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb9067846esm334115195e9.4.2026.11.25.03.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:38:19 -0800 (PST)
Date: Wed, 25 Nov 2026 12:38:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: armandas.kvietkus@proton.me
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: Add Maxim DS28E16 battery cycle
 counter driver
Message-ID: <awbIT7KY-jYiaTBe@monoceros>
References: <20261124-ds28e16-v1-0-bed431df0578@proton.me>
 <20261124-ds28e16-v1-2-bed431df0578@proton.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jjrec77j6abl6thu"
Content-Disposition: inline
In-Reply-To: <20261124-ds28e16-v1-2-bed431df0578@proton.me>


--jjrec77j6abl6thu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] power: supply: Add Maxim DS28E16 battery cycle
 counter driver
MIME-Version: 1.0

Hello,

On Tue, Nov 24, 2026 at 06:43:21PM +0100, Armandas Kvietkus via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as this file will go away
soon. With <linux/platform_device.h> already providing of_device_id
<linux/mod_devicetable.h> can just be dropped.

Best regards
Uwe

--jjrec77j6abl6thu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGyKYACgkQj4D7WH0S
/k5AewgArBYfMFatnNpL8Psvv6tkIFRXFQrumMJZWzm4TrNGgZ0ChTINBtd3d+lq
eqw4N7FpU0I0B4hHymNl941aCVGDe2ChNrN2Vj57ZJ6kNh+XTomH5r+t9wGiYKNi
MZN+bNJdFCE+TSaeTTfkFzCmC0V6A/49lGho05mZSMOZaS8uOaLgvFQ5nE+eExZZ
o7Ynyh+REbs0ZriffD7bKmsvAuvRwXualNrIxDqg7/b3sEvknF4q6ibG59zVnv91
UGWjbKo1NNDayvISHATU2tiZdXL/ABRCIUPz5YxQA2uULskx/y6b67213Mv/B+QI
F+Z+tiGP82oeKZyu4hdSbd3Fk1APsw==
=Up78
-----END PGP SIGNATURE-----

--jjrec77j6abl6thu--
