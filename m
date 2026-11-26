Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729648;
	b=UaR9IpRuYrMZBlY3WqPpg0njs/bP6nVX6D7dpHcBWjP47DcqLNBdzcG/midnTWY3UV1r
	 G3EJ+as4/BfmhIJogUwJ1558m7EYOpE2Pui48KTX12xyKjGfeW4JRd9UHY3jcsIJ+Gauv
	 lJxBIe253wH2aXCyaHU/Kyn9DGpNVsWC0JlgD2lU6fcwaYFLcGgD0qm7wfTOJBj2hwrBN
	 1mom2X44aGKdPfKLPTlLKpN5/ytp7ivnJBK7g6Mv5NGQdqxz026jBM8C8Na5f3KJWmTNa
	 D5XDdX3cgzhXQbbcrI/XMmSSbwzmAfyAqXRHUeEvqmCQLmtvCl5nqvpSvGsyXV4XOXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=4WhzaWPljb0SrZHlQ+9mxsjwiIar78ZdlRX5uWCA24c=;
	b=mM6FmaCHA2dUHulWKLJHEvBrSpzWKcBSSZMSR0lbKpvEB+UU6/V/iiwi+zvz/WIUnAc2
	 jsl3X4iVoXsJJx7cbxx5K1Mnx0ymz+MWvu9xtutfL2VFGSGbPBDqq1ze+M7hFsMKwHqrk
	 8p2weBCkmE36q3qHNWn+wsVqv3ZIFCbDe3lyXUL6bA23dbISpq7F+l+aUJJNK5UhPePmA
	 FiJJf3CVpeTKMAU9IWnRZaku7TVnD2VvI/GAuCZWhR5oq44/1/EDkwPawDQ5IbGtIziR/
	 GsbIpq3B34bUZKWcSkjLq3Hp7HELguG75iHO5zItQkWRl1fhRJPUcSMreoLE6lkac7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gfAv9hgm;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4773606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4773606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gfAv9hgm
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-94961ed97bcso748063685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795729647; x=1796334447; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WhzaWPljb0SrZHlQ+9mxsjwiIar78ZdlRX5uWCA24c=;
        b=gfAv9hgmCUfUhVt9yp1cqZC3M+vVpjuvorFSUJ8lZZK7Yz6RfXYnP0V+3Tnok443+K
         bqPmsTHPQIg7G9Rst9BYY43B9uOOIGtdiRXGOQvNjM4lATa+EX7DhmE7r5a0VwuYRKRJ
         groWQvzoTpcB6PwuAG86bCI9eieAnAN3pxhauqOGR2VOVv5y9W8NqzMX+FGjTXr19KEI
         gAt0batfBCQziImW9g0m1NzpoSWJ1j35W4PBT8pXvwJ4Sgq/fuFZBKqvT2qK2pgxtSUn
         mwuekw1hX67rYb/Snknm/t7SPGami937f7gwI11amehttNorP2u1oHYu+kplgs/qtfTI
         cthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729647; x=1796334447;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WhzaWPljb0SrZHlQ+9mxsjwiIar78ZdlRX5uWCA24c=;
        b=t0r9zi9eZdb0PukG/MNyy4GFeKSGRo4lKqleRYx08Y4ER3kdWKpbBa2FWdt5Q2czHT
         z3cBjO4v5HqulhTabYLHvI4sWS3deAmr2ZbaoP5l2kyB6+r7frKdUpKPfZcRbVLwfuIP
         8ylhSFHpDc/HqD450jE8k3zbi3ctis4TvITEwdez8i54BVgyZOHh0YuhW+PeTeSa2WQq
         e0Wahi1vquc2hdXVVbs3b9V1k21iq4BxCOTq8sDPL1kNTsl9LWmwOnlWOB+KobvW51bt
         fLzWfvxiqOjwBqYYn5NHB2HofICk2BiXCu0reqADvP9mEjWmmdBxxstJf6fu/Zk51HZD
         wQVw==
X-Forwarded-Encrypted: i=1; AL+hErF5PEtJnQPSXyHLur1RHu03QNNJ1xcH7FWmLYB0/zqc1qPzJIq/nHpwPTvT6l6+y8AfJkWM/HYFI3RlCxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w8bA9jWZpnokFAgAUZYC/ARxrK0V0t5ZMVQS05lB+In7EIbnW
	ngwoSDGP7I3jNlU1fhBXaG4UJBcRJkRkfgL7DAwBzzvna4mgWulb0+SxK0D8nRR+3Jg=
X-Gm-Gg: AZFdTZegtKeMXThwGQ0SIRFcMULAjPdZ1ditTWWsrlEsc2kidPbpXXeHYY6V0c0UxzB
	kT4m0pwkV/CEhjh9GiMjDygnPZZatWmeHuhMQ/zCrapeW+FeCeINMmU+Kx/+uiEB8hm1ldgpYE1
	DL7NiIG3ruEFkP9vCStjt3+Umk8Q/h5IVnPYG1HnH9WVri3sE+hOYTvD/XK16rgxyOJsCkPeuLj
	PTkzedeGw2gmRkX73AgF+PTL4EKqX/58lcydZk3bnnGkJO2CvByeXepYfPsHwwRBC1OIBiTu2Sw
	MLbLUFsOs7cZfli/wWBvuxWJc5+8DvWsFh585yo+uoNW95GALuba1WQm0EsYC1IvZ31suTqCDMe
	h32YFVBgKXqr2eLXFw+OYiERJBcRUBuBp8ufsWLgh7BBN1aPxy1E2GFc1T9iAgKvu8vnD92M7pP
	fbBcv0BD8C2+3s3s3oomuCuzi2q21VF9WHp8AqJJu1p6j/hEnJg35acnW/9+IWiORbYyEdsGDnk
	iGYg0Kd+RHLesFIQg2D5rzx+02TroQcZJBW3PzMFq/RNi2Wfb3xB01EaU0jVQwgNKWMHo7l9Wxt
	eZmL3cXp2Oo7c06g+E1ch8dODinP57gaZ079RulTtEiLAmzXtaUwvIjNm4gH3QlYefy4MPTqe4+
	q
X-Received: by 2002:a05:620a:1a0e:b0:93c:a40d:e3cf with SMTP id af79cd13be357-949ba828099mr4010614885a.1.1795729646763;
        Thu, 26 Nov 2026 13:47:26 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm1673622885a.37.2026.11.26.13.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:47:26 -0800 (PST)
Message-ID: <efe647d6ebb9583696527ee044093ba54ff0b9a7.camel@ndufresne.ca>
Subject: Re: [PATCH] media: st-delta: fix decoder use-after-free on release
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sicong Huang <congei42@163.com>, linux-media@vger.kernel.org, 
 "hugues.fruchet" <hugues.fruchet@foss.st.com>
Cc: mchehab@kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 16:47:24 -0500
In-Reply-To: <20261028074439.2515928-1-congei42@163.com>
References: <20261028074439.2515928-1-congei42@163.com>
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
	protocol="application/pgp-signature"; boundary="=-ZnfXehKJCjfHNFCFp1+S"
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

--=-ZnfXehKJCjfHNFCFp1+S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 28 octobre 2026 =C3=A0 15:44 +0800, Sicong Huang a =C3=A9crit=
=C2=A0:
> Found by code inspection.

All the changes in this driver since 2022 (and even there I'm not sure) are
"found by code inspection". Is there any users left of this? Shall we just
remove this driver ?

I'll hold on any changes until I ear back from Hugues or someone at ST.

Nicolas

--=-ZnfXehKJCjfHNFCFp1+S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawio7AAKCRDZQZRRKWBy
9GH+AP9Oqg4ss3SaCoTvoVSD5gtzy2jhoZwSztR/b+sN5AhqhQD/U00yLZRBQByA
DzpUMteYjIWOXG0T5S+VF5c1A5P2wQY=
=+D6r
-----END PGP SIGNATURE-----

--=-ZnfXehKJCjfHNFCFp1+S--
