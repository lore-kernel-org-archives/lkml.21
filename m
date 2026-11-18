Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014913;
	b=nrTt7DsVFdg3MQYNwTCMuUdwQcgr587KymeSixEB5V8bwt9t1WjnJtG8q3gMs/EqcYtp
	 zZU1qcA/5GPvE+zUNoGiFtjNJOTS+t0vrJQ11Wumle6PkhamfVp0dSUtrQ8FWWQy+EXYG
	 NZVXzNA7F/nKvLeBA8eooTZyCCRTESVfxAryOIG3fMABkSrUUO3FK4J3JVe5NzhZuDdsY
	 nYuYBgvl3/Pnnd8VRiGjQyCOmjbgmZhcJxWxJiPYr0w89NrgvGDN68efN6rDB9wqw0gS+
	 mUzQaCCKyB3+bjKQDgCRWdECC5ZhCpPEnv7SUgA+GpqAcL11oCjKUTFQx0hlblEoI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NMyCaXf5z5oe2JRwa4VbW5PgsfLFNCTM5DQAiHr/6xY=;
	b=zfJgC6h2Uf3oKh4KmYO1uIZCqf5bUU0irWdFHbUUbsMvSXX0AM5eBaahJJFQ5m7xZ0CG
	 tMRjLYHY5KMnuLBrapqmfMlBlANHkJCYMRLVYIUmztdIG5fy3v3l6zPnWzEs9L3gklawx
	 4d5Ew/LpWv5i7KZGVJnsK6XZkv8/Fn9LRClTkPDp401U0atXPnMzpIWSFxOiu8fJyIACH
	 4EN9V9X+p7K+VXsLNV97EbdGXI31NHIi4YiQ+vjXlxYc0aRkK7PltUPpSyzKEOYpX6rFU
	 QiuEHn2qbN2lwY3j2A5KXKD9QoJVmsFOiOO1BQNQ9Rl/Ph8XNr5WONbXjCe8yTn/Zaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G2sbHmTJ;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD1606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDD1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G2sbHmTJ
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so453597f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795014911; x=1795619711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMyCaXf5z5oe2JRwa4VbW5PgsfLFNCTM5DQAiHr/6xY=;
        b=G2sbHmTJxnn9AryRJ1C9vdBFsZIxWO5CY4znWjY37BviMXZ6YmGkKWn0iknOjwbIcg
         IKE28F4mDKPJLF1dGkjicw9WidqXKG4lmU4VKLtFhGCG+vRH0drm4hBhMGDWhOakZfwM
         yyNpEWPRpp1IJ2WPjpqURzpDAiYGbMIfVm31/gHE9LyeqCTvCvXCP/gohTaOMTQbs1wq
         Ku+T2SEg1IqDq4p1GMh7qIoERVTr1yYr0z+TahS2XVeDA6USMKAmTNxaBSVD/9NOZw2+
         Y5iAxihxD6gwRg0040vskhrxPvMkJmaewSc+4NgF3vuk7wLYkuSJyN3Z0GgBB+tJs7HW
         dV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014911; x=1795619711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMyCaXf5z5oe2JRwa4VbW5PgsfLFNCTM5DQAiHr/6xY=;
        b=NsPmLdV4bBSjCXXybueo08KFLZAThWqX9qfb3ga5gXll+62YFF1Ha7S7q5VhkWKX/D
         uVTUdd2n1P4IPuKbHUSCXu+T5VYcNIGTBEVFxs5tAt81s6qNNoEUQiuwoubNxRVxG7/x
         Mkj+AhHv6aeFMQ49qZPrJ2RVsCedDPQdLn6feX/KpsoaWkK3s+9SqrrN/IImYI21elqi
         avwIod6nrZZ5TQWKmw+VtHtDaJr1WGFfU1QveX1Jg1v/+MTzc+6DDtd2QSr6JPs6V4nt
         eKAvhf8PLjGoa32ND2iNXMy5TsdPC1a2OJ4jjV8B9zrz/UMgw+rWREpNH1gpLJpY03lb
         ks0w==
X-Forwarded-Encrypted: i=1; AL+hErFwlqXcGSeK2iRJZIU8eKTjIxpfP4+ulCaMwp59Un515bYyRCbINzW0xgaSn1oesaTil60QqOGyQEhPILo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hGs2Js2uimNbcHqnmPIl81RpJ4T5wcnF7fY48OZUSZPChkMhu
	w6K/DX89gyuMFuZ3GS43M8ONQsAAckZTXTSdyiDjJmHvD5ZTulCs0ayGmpnyMkNnVRY=
X-Gm-Gg: AZFdTZdOb3dhHUZMnmkU02VNtQ1f3UGSei9vWVgtIHCz5nG5riQBxBtP+H1oirubPvj
	C7ZvCpAFa7i94ascm/XANakUiZLiCFpVizMJVfXYLLNqRAkO93NTOMQJR+TCWhKVcU4UoTL8j6j
	pVJ8LQwFzsUQpQrbH3sRGUtcJ4k1zbNNFtLAwvmY0jOwxu6dOauzNm3SKVzpYtl51wHlGcsBMtd
	PgijE2PeBDVVUgR2mXnFDlGw2kCxv7j9mu58xE93qOnzqxhXQ9Jxtali+auxSPQS7Avhzngejtd
	/F2YcncCC0yj8Lr7ljT/z5QfQp3hDWyafQ2O7phve/Tb0v+AuOxygZl6QOoeY3q8FfQM65UkH8C
	2MeE1AN1Kky2vn7IqsiN83hFg1QnNV022JjCrGP6bVcsd+nupIIHQkiTm4NxzCDZY1r6hL+jrzn
	mOCyTtXjsQmVKTxXeIcV/7DXwvyaEa2+EELGY8v5p2L3MRjWi48SSDDeETACtwD8/ewmbPouBMg
	AVl2EzFlneKdTnYqRTIYwn0rAVE4p5f5REwIyWtuU45zRnuSd0nWpNNlF67vHAndMRh9y+CIzeJ
	0t6VZZsWjZNfkUyT7yBxsiuLqly5hJd//ffZ3BFmBzZAbwp1hnX9PjgQA4h2KaIQAmz/m5IC3PB
	JSNxe7oT34v7kW7Mn
X-Received: by 2002:a05:6000:46c5:b0:48e:6357:c76d with SMTP id ffacd0b85a97d-4a63d2cf09cmr4070440f8f.21.1795014910678;
        Wed, 18 Nov 2026 07:15:10 -0800 (PST)
Received: from localhost (p200300f65f19a904f642bba75325d003.dip0.t-ipconnect.de. [2003:f6:5f19:a904:f642:bba7:5325:d003])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4a6575a5c28sm5424703f8f.59.2026.11.18.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:15:09 -0800 (PST)
Date: Wed, 18 Nov 2026 16:15:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 0/2] drm: Use named initializers for arrays of
 i2c_device_data
Message-ID: <av3AMIcRXCy7PxOQ@monoceros>
References: <cover.1794386771.git.u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="yqlhfm52kcn3z6dt"
Content-Disposition: inline
In-Reply-To: <cover.1794386771.git.u.kleine-koenig@baylibre.com>


--yqlhfm52kcn3z6dt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] drm: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello,

On Wed, Nov 11, 2026 at 09:49:43AM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> v2 is available at
> https://lore.kernel.org/cover.1784545092.git.u.kleine-koenig@baylibre.com.
> The first patch of the v2 series was applied, so this is a resend of the
> two remaining patches with the collected tags added and (trivially)
> rebased to v7.4-rc1.

This series is superseded by
https://lore.kernel.org/dri-devel/cover.1795002467.git.ukleinek@kernel.org/
It contains the first patch as #2 and the second as #5. (I only noticed
now, sorry.)

Best regards
Uwe

--yqlhfm52kcn3z6dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9wPAACgkQj4D7WH0S
/k4AhAgAoL9dnbHgbbj8R0XrasdtXwSZVvDr8O01kZzWsXqYjwvs7LdZui2+YlsN
SkiOdu3/FT2+Gh6i0J3OqqX12WBliJIgrYx6zY7BFQeKrYTM1WLkGQuyp42IZp+A
ppLIuB/v0oaI/GNGEBkaNCIHFN9oOkIBac3jJngETehLC2ryvpWGee6tLhONicwh
whuVxHfT5tP7ghp05rH3XP2KnElh326S2eO0KOpiJkADAWmzqNOCkN7wmReFW+Vx
SPYjcuT+4QJBUm8Qv6SuMDL+QlPoOjBZcw6TgIAxWU3sCjR57xcSiCDTbldaSeJg
4sepDhgw5sq6F2F7Dq4/sEiPzbBvDw==
=1snT
-----END PGP SIGNATURE-----

--yqlhfm52kcn3z6dt--
