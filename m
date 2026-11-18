Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021207;
	b=KPf7YmLACVmZT0fqIVmeXupprEE3QHoNs0pszB+rJITtOUwfjlzqGuSV436UndQweuEL
	 yPEY9M2de09p5/CLNNkngsPyG7uP/bkjF5JGat43aLx+pE1M5SauZADNMkShHdfl2duBN
	 37MAlzNr0ufqV8FjOqEWZO+nwwnPp57fo973gclSUxUddeqSBfOPMIYv/4Wo6tL5/eFJr
	 6Mf/6cFtkBoIl0MKlAXbtcrX7UIkjsBR/m6DSrJlZd+ZVc0KiZaJ63B+dymOTzlSJUUiE
	 pBTl/0xUSgapkzdQbd0eZXFvgrkhBf6qcAOhVduVmFec1sOYVMYBsims6omh1kpbNYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021207;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=SmykihLdEl417Yqq8+SUekklXJBePiqsz7TxF2IOgG8=;
	b=o8VSuCjBZtWBckrVcgrrYOMVQfoKCSKZn1t7uectQoZAwftiOux5p+7kUkcwQK1Q7qRP
	 4WQ7yqpPxA9rL3nk3nwpStru7s72eNwqtZBuDMjSI7xJSms+HSrB9S0/7qBZ8Gs9RvRe+
	 5xKL5Nsg0G0QUFjIXI5nZ4Vq+84hPbXwIZDN4Kr4t2cH5KGtRYR9hui1LjehMxb9adL61
	 DecwB5SqJCOvo8dsU0x+1AlBwqHgd+HonRr+kSpRqxTv63wl0kgWk+JD8dk+PB1dbOg/u
	 y0R0OQ2mMGUojLGtkkA78a8XHXRjqAMik09RtbhjdbQOAVJrgZNydgnmjacTlaGRJOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b="chBz4N/n";
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27DC60A260B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F27DC60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=chBz4N/n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=SmykihLdEl417Yqq8+SUekklXJBePiqsz7TxF2IOgG8=; b=chBz4N
	/nOzcmyr3skH7cAiIL2It27iQWIht7GIM8+r+zsU8a4wbxSRHigyHABtqiuPxR3YpVihnDSwqmMkn
	x5BJ36TGzuPRlrYfK4yg1T+buyyb58DYDqOpwPyASonZ9TdX5cFiRyrQZKPikDkeR9g+RiSPhIepB
	EBuHRgompJdLIQqnhfYvkl2lKED83gWYX/ty7oCuSzqrnnMA+krkM2dCwV5/vEfynVd3NwXgEJntA
	IU57h2f964WjBgTB+NnWFcdqz7wiRzcOfZ8DcLZ91ldpmKcUkg8Qa6aaWqBd3gzc9h8AbnNGlUuO/
	mZ6brHmdem91j5DiDxCVVr+9bZsg==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xTj0e-00000000Xb0-487f;
	Wed, 18 Nov 2026 16:59:49 +0000
Message-ID: <5f26a5a1e72fc999823bfac94f33b3c06465e519.camel@surriel.com>
Subject: Re: [PATCH v4 3/6] mm: gup: move gup_must_unshare() and
 INTERNAL_GUP_FLAGS to gup.c
From: Rik van Riel <riel@surriel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>,  Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,  Michal
 Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand	 <david@kernel.org>, Yuan-Hao Hsu <aa9736195201@gmail.com>
Date: Wed, 18 Nov 2026 11:59:48 -0500
In-Reply-To: <20261110-refactor_gup_fast-v4-3-e779a7674274@arm.com>
References: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
	 <20261110-refactor_gup_fast-v4-3-e779a7674274@arm.com>
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

On Tue, 2026-11-10 at 22:52 +0000, Yeoreum Yun wrote:
>=20
> +static inline bool gup_must_unshare(struct vm_area_struct *vma,
> +				=C2=A0=C2=A0=C2=A0 unsigned int flags, struct page
> *page)
> +{
> +	/*
> +	 * FOLL_WRITE is implicitly handled correctly as the page
> table entry
> +	 * has to be writable -- and if it references (part of) an
> anonymous
> +	 * folio, that part is required to be marked exclusive.
> +	 */
> +	if ((flags & (FOLL_WRITE | FOLL_PIN)) !=3D FOLL_PIN)
> +		return false;

While I was playing around with some AI loop to
automatically improve review-prompts, one of the
AI engines (out of 6 different ones) spotted a
bug with this code, as used in this series.

I have a reproducer to verify it, and will send
in the fix with v6 of my GUP series later this
week.

--=20
All Rights Reversed.
