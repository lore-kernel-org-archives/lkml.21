Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731077;
	b=VVVr/HXBctABaiQPZvzjODRMjheY3IJ7E6nS9RIl+x7SAR1Q9eRNPYqzhzWZAWo+9TcF
	 BWKwiyEstJMMBwjHzoKtmKdbZAMEbQDvgMQNZd82sC07LEWE1eDdrVxgkcHUhqgXT5yEP
	 l6XhIlXP7OjMz4asjK/4Cor6t3Zk7TIYpSIqGDMBDmMiCP0pH3OdSj2WEwVjKnF3k9mmY
	 lITYEBCvEplU46FBN234SazeXmRI/sjzxCZGbU4jrAALH8LkqwdsSBQ9MKprZy1sBgwXD
	 Gnjqcwt7OqzJovQh1uW5VgG5MmWPBiFrlb9ZJdxVTUXmojYNXiXoD/l7vLasFDokV2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=EBJHUco/hzG0Sju8J8Gd4qY5V0VOeKsMcHwF08fQyis=;
	b=h10S5IY8Rr7Uh1fnHrQ+WJZAjzdkBZoMSN0fEueWkl4GQBvOdaf7oqS03CXCfkB3bdxs
	 rSbgm2nbOJrpVrUGGzTefG8CTrjN7EzASS4e3jybX6miP43bzIesdYglwoBux0YWFCUlu
	 XCk7B14dvA/ea3Jr2bg8xSULOqIGutgMtPFV7vnYdeZyEQPJWrK22k25YK6LKtBTyZAlW
	 gznspOpgzEydeWxzVX/VY2oTzVhjq2qDTDraLljD8S5bFsrTiI0FXsVucVFo/On1nKDWX
	 DZqIbGYLLSlxLfMU1zHBaSYw1/o81zh4e4ryxgqiYzP83wmklWfXk+1pI0XqMzMlYcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K4P0sV8o;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EAC606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EAC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K4P0sV8o
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-94961b68685so608705085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795731076; x=1796335876; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EBJHUco/hzG0Sju8J8Gd4qY5V0VOeKsMcHwF08fQyis=;
        b=K4P0sV8oBUN1OFFzIPzXx/xgERW0VP6DhJf5sKWY44lG7EQAHJ9qJbf2ooJlb3eIjd
         rdgM7ThXyX6p4Eyz+vf6nCL4fXqXhEjzyVXUP2GCuyraTnu9TV7PZncrs2fbMRvBNZE2
         0opeX4MjYwds8ARwXT4Z73tO8cKEfglFh/+evyj6552eO2xS0Ub3fAiHyC7ICpP5KwZm
         OTvyAYtKilWlZ5Kwy4ilsR4BHXfnP1FehQiNfLwIAf9aD3nAxu5NQSo6hRk21HKlToGu
         ZgyG3MVcI4SueOB5jXtePjBcs5CMmlMDcu84Tjhl25y5zS5ncfemajvMOociU9yLADU+
         9Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731076; x=1796335876;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBJHUco/hzG0Sju8J8Gd4qY5V0VOeKsMcHwF08fQyis=;
        b=vNWmk2vsIXQ70fzeU2Y4J3CJNUR7rZcVIQjcHulr8xfMP1sm+XGsFC7gUYYMqcS5VP
         51Pk/3zmzoIx9RdTLKEbEaBqvHjiHDv+CvjVm2x1hL1VoYDtdH8ZJ2Tx6yEgCC5JX2ck
         LcjzS8WxeWwqhlI7kwhACqImSlctvA/XIrq+NID0ZS+yPfysZON1qsGDN7a1tzvuVLMo
         qpi3+5sFCuHRm/u808M1RSEN3TjEKii/TduW3QvxGVsqdocJE+swfbmznBVXnmHHKTUz
         ffNlqR+0ZrQGve79G+Ghyf/HvVslZlYuXm9nzi8bsNGyKdGiq02gsOkEIXWZ2UHULFAD
         /7eg==
X-Forwarded-Encrypted: i=1; AL+hErHQhyLBGsLW7PbUGK3Vy20r2BH7vls3f8I1aRJDwGu7xIUjGqsA/70toZOyDnMQVsFLjx0vZV94y/nzstI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NLsT0eaCV5w9Qn2H3yTleA+hEdiNkFEu/8FJ45V+bdL9UKj+y
	mMsE0zWzMX9oMx7yZ7MJlQYjFx4ydKD64dux5s8F+bLDlfcpUtyAD4ZjdidaLWtAD1JLEjFQl+D
	QuvRk
X-Gm-Gg: AZFdTZe9FpRuvKIBjF2sufuJaZj7XUh+2TJhi9b0ygO2yTzKlHk9pEJcCQgooLSb2qJ
	L8qRl+nUeTKsxjq3aNXN1s715UqOHrI7hFMSZ/Y49W52DOxOq2vFccGJ2M/KFoVtaEEGfYEqrrb
	WMwUWe8Z1cMGxNbcjEVgCFH9BEYYN2htnGLqSx1V4aVnju42TxJsrHaZDBIlH9xmxOxcUxS/p04
	0VZNKN9KVrLacii5lPYn9XYQawCB98C8vqi431DbOb6SeJRXC0JAqURoihV1HmOCxGUzxYs5lY5
	U2vcgYIBIZRK1/E1mRpTdRTSH1521H6FvW+yvfn6Ufrn/iQu+/NaDwsU1qHeJqmk+Y9d1uQ15H1
	fqWLcGn5jWt5hYPJHL+vNK0ntqvu82a173xMC2El71+8egwkTKKjCyMxM314Tl1O02do/+G7OqD
	/P07OReAAj8wp/34IzMOZ1QGTv2Tp8i4bmaXiLmQPjG1XWp6i8ltk/AFdGSNrruR4u9LuSSIuCJ
	9PLwrHYpBsheQaTv4NcGdBX1xBAnIPWIKWxJQ3sMtQdCh4xfI1VGYjsccqGsO0Sn48nq/oDa7/o
	BRYJAGKdQIYo+Y8j09uCoW3H7d7p6+01wZ40WdHsHgCDyqmLZLSZJn8=
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr3910620985a.68.1795731075981;
        Thu, 26 Nov 2026 14:11:15 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3a646fsm1686563185a.22.2026.11.26.14.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:11:15 -0800 (PST)
Message-ID: <d44dd85413d264b3536dcc2938ce7066a9fa0004.camel@ndufresne.ca>
Subject: Re: [PATCH] media: sti: hva: Remove bogus mutex_unlock() in
 hva_hw_get_ip_version()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Jean-Christophe Trotin	
 <jean-christophe.trotin@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:11:14 -0500
In-Reply-To: <20261117011400.1667-1-laixiangwu@cmss.chinamobile.com>
References: <20261103013440.1138-1-laixiangwu@cmss.chinamobile.com>
	 <20261117011400.1667-1-laixiangwu@cmss.chinamobile.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8ZFNuaxoCdWsEFtb942r"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-8ZFNuaxoCdWsEFtb942r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 17 novembre 2026 =C3=A0 09:13 +0800, Xiangwu Lai a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> gentle ping for:
>=20
>   media: sti: hva: Remove bogus mutex_unlock() in hva_hw_get_ip_version()
>   https://lore.kernel.org/all/20261103013440.1138-1-laixiangwu@cmss.china=
mobile.com/
>=20
> When runtime resume fails, hva_hw_get_ip_version() unlocks
> protect_mutex, but the only caller (hva_hw_probe()) never took that
> lock; the line was copied from the encode path which does run under
> the lock.  The patch removes the bogus unlock.
>=20
> Is there anything blocking this patch, or does it just need more
> time?

I'm trying to figure-out if its even worth the time to keep applying patche=
s, if
there is no ST reply next week, I'll send a patch to remove it, and that sh=
ould
also fix the issue.

Nicolas

>=20
> Best regards,
> Xiangwu Lai
>=20
>=20

--=-8ZFNuaxoCdWsEFtb942r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiuggAKCRDZQZRRKWBy
9GJKAP40X/F3Jok+Mf+mGyPEt9dc4YPrSePyENDVB5NhmdUlBgD9G+Xkv+NsCBfL
wi/Et2PiHfDw4fFbZgFDQaYC+XR4Vwg=
=Cnt+
-----END PGP SIGNATURE-----

--=-8ZFNuaxoCdWsEFtb942r--
