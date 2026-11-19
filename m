Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113471;
	b=h8wxq32ZblVzR10MxoYeL8wrmKFxMSwzCUbSgk+vFds1RbJnuzKIHhFdmPVMuehELpHR
	 3ceC9gKzPGDD+nH0csaFvZLxccNkxuM3RlvcUOI5tip8XNzNWalIeP9dazzHiad6P2LyP
	 G/ZOmTY4tbKvKnlYKibQlKUJ76mblCQUTKyhn3+9T4cSwnIBPC55RluSEqIpAbye9wGwn
	 KLXE9tH1L3MR/cWNujW+xc1K2ak3pOAKdWmyY9hvwqNP5mGZwQ7hhH+aHI7RzmLsJOXAt
	 IyvO+L4sVa6mtfdoyBz2D+b8DE+zKGxkqhmdfKx7EtKLRq4ZhxBa3gTUF9CBIID84Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113471;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=hOGyuEBqNGHMugkFQIAH4ZNUVzC7p8qP2vafmtIpIFc=;
	b=KLaXmiq8R52gzqX9Z7Sd3ITvBYR2HalDUgQC188RXyr2DHiIzGUVjmWbqDu6z0MtzJjJ
	 f80TrVb3hBqdFDkZ+L6DZrRWzhB5ocGhQDZWepxoZ+pTsyYmmvprja95BTSw0BwsNoGZg
	 XFf+Mjw/d7/aPgCTNBHQCGnG8y2e+5V5bHo6vtPIxm5xZa45XBxTRj+Y/GHV2tVww9K5Z
	 vifgT2wRIu+e6xUGqG0VVsdbUjD/ZOUYryU+ZLbCG+ut8FLFTUIjbM5yNwJ5IDKCrM8MW
	 2WkfrH0/+L8eikTsgDSGiDNACPQjuWO8G+t5ZqRA1EYBnH1nGS6dGoIm7fwZXlJzd0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=FcooJitz;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C6D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=FcooJitz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=hOGyuEBqNGHMugkFQIAH4ZNUVzC7p8qP2vafmtIpIFc=; b=FcooJi
	tzDw3zVoDPq0uJIF0miKVcEZSjTaXPvikK4Dwi+ZpodFqmT+SuAcm1CEKVEMXVL5NL8Ch+MQUVIVT
	wnY8cFy3sob+4V/ZdnQfnBvBd7uWZUUOQ3amvI1p4ktKPZQOyD0dntAl+S9pkpolZJwK+XKQSEKnc
	ruJYnRZmahq9UarlwFpN1rEZhpAIdGRwJcgQdgW+PbhUMo/0Ir54ctkolC2mZJnxCV8eLynCcvmBf
	XHzGh6vwI43SKQvYfOkSf0oB8wh8toh0B0j0SbSAOMdX1q1B4D8NnYu2CSliN49ngsKuoaXebZPbs
	ca9Ijuu2l3dwkMgTmyg8BXLn3G/g==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xU70Z-00000005X5i-23qR;
	Thu, 19 Nov 2026 18:37:19 +0000
Message-ID: <d0e9436df88758bf7ba121cf4b0e53d6e59b6450.camel@surriel.com>
Subject: Re: [PATCH] mm/gup: unshare-check every page of a pte batch
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, John
 Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Andrew Morton	
 <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,  Lorenzo Stoakes	 <ljs@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, "Liam R. Howlett"	 <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko	 <mhocko@suse.com>
Date: Thu, 19 Nov 2026 13:37:19 -0500
In-Reply-To: <55dece20-678c-4726-9abe-cad5fd4dccfc@kernel.org>
References: <20261119105701.3f57ac54@fangorn>
	 <81418de6-3c5e-4f5c-a447-98f338f5096f@kernel.org>
	 <55dece20-678c-4726-9abe-cad5fd4dccfc@kernel.org>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-19 at 17:20 +0100, David Hildenbrand (Arm) wrote:
>=20
> So this smells like a bug in your new GUP user instead? Or some
> incompatibility
> with the helper when used in different context (that would surprise
> me).

It turns out it was a bit of both. The GUP slow
path was using this helper wrong.

I'll send v6 of the GUP slow series soon(ish).

--=20
All Rights Reversed.
