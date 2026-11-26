Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714893;
	b=b68zwjM9/Qh4x8N4Uou3BdgClxxNUt58/mC0t9oHLxyQH+n3ULGCgFUk4ii0NzfBiZAT
	 fTLJ6t6U94N0/1dGNoWLf+WhBSvcg6/RV7GF/mF9xHy34rkwLLqgdTUwo4+49oKNKMqmY
	 e0ACbL3kZvq4edJKE0yJZkgKFLqfmUATICL+4og6x+d6c44t+lUk1ee38WkGJj17vaaRk
	 p0pdYsMcpobqSuGwLC7xSSuM2Hd4wDWm4FbroPkhrlKrTQYjC+eSnRN78KyZO62D5MjBW
	 A3vmQszdND3RPaO93jw+GqbhMPXn3bWUlulfYpARQH5MxcbLk7vD6ElIbUTRJTSnfkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714893;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=+3IE4ahtHNeYXKAbhohuMqg1ApMu7OpkeIRKUByF/e4=;
	b=q+5hMS+UQvbIW6E75esCKg80KCk8zcjWSRamiiIJ7RFfEtV+/rACEMb1IpAGF0K/lVWD
	 UTxkM5t2LNTJKf7rVIz2BcBdrTJUU/ppBuDWkig9d/ZcKG4shi/8XKTg7pdICpjGS7yly
	 KTwH/YPgW45OW51/Cz3pbYPb+n476Gr14TJa9P2yIATFyoM4RCK9Q6f+Gsl5+52RaQlv1
	 4KG7mQNSkKLjIa2DFEnKnJ7ITqzIYFh9cDkaR6YGyCn9D60RZL45aSIj/PoNWj/b9Ys1Q
	 o40PSwNVPdTMsfu9sPVBLwM5aFBorsQpSDzpVN9qVP5pc9pQ+ae9LPGiVoD+pWz5CwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=bt4LY3tt;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEDE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=bt4LY3tt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=+3IE4ahtHNeYXKAbhohuMqg1ApMu7OpkeIRKUByF/e4=; b=bt4LY3
	ttXGwKIWVDxUCAN49/2bPwKm7HHkslLRWJ09XHY3pl8TZ0APiaR+OLHJ7MGTIubXmINEIyl+97LII
	hq+oKxGK+W0Qm21VFO8Iml0ke+Z6s1m0fxTvzNc7KHlDh0wL/XSKjLeuP0dNHEjIIEHucKghwGDHu
	4hnw/QRx8FCDx5tGPTFmHBl0fG3JIpC87vv1+P4dPosbmospOy9rSD/YO94eiaCA14ut/w5M/N4At
	YH4uVa3Ql1Iupj4uWoGIi6NOP28uZ+hXUfZz0t053DjYR4ZZLhBj3J0GW834lLzUpleNWRsFtiZNl
	lQUD/bqgdW3AO6IIGgNtbL4DImBA==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xWdTJ-000000001aw-3srZ;
	Thu, 26 Nov 2026 17:41:25 +0000
Message-ID: <8e6d0de214bf930e14a53fddbd9bdb23d12410b8.camel@surriel.com>
Subject: Re: [PATCH 2/9] mm/gup: break out gup_flush_pages() helper
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Suren
 Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,  Yuan-Hao Hsu
 <aa9736195201@gmail.com>, John Hubbard <jhubbard@nvidia.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Peter Xu <peterx@redhat.com>
Date: Thu, 26 Nov 2026 12:41:25 -0500
In-Reply-To: <4fc1e334-16c8-440f-aa83-ae27f8b8d3d8@kernel.org>
References: <20261123195609.4115244-1-riel@surriel.com>
	 <20261123195609.4115244-3-riel@surriel.com>
	 <4fc1e334-16c8-440f-aa83-ae27f8b8d3d8@kernel.org>
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

On Thu, 2026-11-26 at 14:41 +0100, David Hildenbrand (Arm) wrote:
> On 11/23/26 20:56, Rik van Riel wrote:
>=20
>=20
> > +static void gup_flush_pages(struct vm_area_struct *vma, unsigned
> > long address,
> > +		struct page **pages, unsigned long nr_pages)
> > +{
> > +	unsigned long i;
> > +
> > +	if (!pages)
> > +		return;
>=20
>=20
> Will this ever be called in this series on !pages?
>=20
> If not, remove it.

The splitting of the two helpers means this is
only called from one spot now. That means we
should check for !pages either in the caller,
which is already long, or here.

I'll remove the duplicate, and I'll remove the=C2=A0
unnecessary comments you pointed out both for=C2=A0
this patch, and for the others.

The comment above the gup_flush_pages call
could probably be shortened, too.

--=20
All Rights Reversed.
