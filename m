Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143853;
	b=sVzzaQ362k0nNuIwOM7SApu+Ry+cxkF5PjH/JzJBtcHepD1SIh2+QGmDepXL4RxDY8td
	 aLIidIAQ2v9peox8t+OqOrk9U+07YitQY3Bgy0DRCakBvL/rcnaIPuULQgSnXYzyi2F2Z
	 NQMYaJAEi+A3E9YhsxnnnzMg28cBN5Yp62o89M6gF/HQKzsf/LL/SS3ePW8EIabHG8/Ka
	 s8O8u2AjeY+kz7szwmtfZCxfoDOJr54nbZ/aMKpcj/wOfx/Eub+nkMUXjJTt+cnZF0/cS
	 ttHyKdxH9rAFnJ3VJmuKwk/wyxiJhoigCasjlCiBUxLTmNQrz/agBwLd+XeZqVOmAUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143853;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=3fj1f9s84rqSArxiRYtZ9EY+vp9TA7GW6SELZM+VBUY=;
	b=bllThJ9kYNKTf7GekKoukLk71EAqW3Pw5szygLf9HxMyTGKBovQkiL7YiSDCoDGm7dob
	 JkEI8k2DWSZ0F5ovP9utWdTymMzBc5AwlCVZw61on8NHxFeoHLyVHQTodk2qW6+QdI3sJ
	 nUc3Kq0SrQ6MECE0lxrRHqa1YvOpSQtMSIjY3ivuM+akaj/ygADS4JRvGtaGufKEvifrW
	 q9TSy4GvKPDfemw1gDD4URPQP6P9zozAkY6KFoj2zFVQp/WS2L40Ik/gLfRDcxTZVBiAs
	 CxPaBgiKrsQs+AvK7yOhWfhuIPm8xYU060PtbQwwl6chj1e5WktgyrXiXSRZLNHWJsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=id4TkeXo;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE78E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE78E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=id4TkeXo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=3fj1f9s84rqSArxiRYtZ9EY+vp9TA7GW6SELZM+VBUY=; b=id4Tke
	XotKuwhNhtPXtJ8/mYlY5KR/HcjS64J1TJzz+ZbMG8NIfdaV0ytkPD4pTQ3WmttBUqs3dcPEuVAkt
	5qNpRPVA67DePP/jsW43zbl34s+m9y3Pw2F0UMBcZwc3gS3ASsXPsDOn7i0RTW1vQd3yfqUMV1jhg
	UZNKuFolBqTFoE/ASYUn0G3LWSZzdk646nlXEwwg+aoYYFWyIW8GphdoF1kSnnehnnn0oJIs6tP+8
	3Duc1PB3Q+y5vgmCa6uy9/ZXHij2sPrcvijjA8MIGEK8OYUTWSThTn/KeVpJG76Nfwitt3oqed1P4
	wRPmb9eT4mNUxwvgQzN+XxlbfPow==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xUEuy-00000005akT-2X5q;
	Fri, 20 Nov 2026 03:04:04 +0000
Message-ID: <89e41824f1371b5880029f264e19b5d0589ae22c.camel@surriel.com>
Subject: Re: [PATCH v5 5/8] mm/gup: break out gup_lookup_pte() helper
From: Rik van Riel <riel@surriel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, David Hildenbrand	
 <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Suren
 Baghdasaryan <surenb@google.com>, Christoph Hellwig <hch@infradead.org>,
 Yuan-Hao Hsu <aa9736195201@gmail.com>,  John Hubbard <jhubbard@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>
Date: Thu, 19 Nov 2026 22:04:04 -0500
In-Reply-To: <avxXgTBaJkPN6XOh@gremlin>
References: <20261116210127.3837898-1-riel@surriel.com>
	 <20261116210127.3837898-6-riel@surriel.com> <avxXgTBaJkPN6XOh@gremlin>
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

On Tue, 2026-11-17 at 13:48 +0000, Lorenzo Stoakes (ARM) wrote:
>=20
> > +		need_no_page_table =3D true;
>=20
> This is set true but not used anywhere? This is dead code no? Am I
> missing
> something?
>=20
> Patches should be incremental but adding completely useless locals
> incrementally
> seems silly?
>=20
> > +	}
> > +
> > =C2=A0	pte_unmap_unlock(ptep, ptl);
> > =C2=A0	return ret;
>=20
> I'm guessing you forgot to include the code that works with
> need_no_page_table here?

That code is in patch 7. The check isn't needed
yet in patch 5, and it got shuffled wrong during
some refactoring.

In v6 the need_no_page_table thing will be in
patch 7.

>=20
> 'need_no_page_table' isn't a great name either. Maybe is_none or
> something?
>=20
Maybe pte_is_none?

--=20
All Rights Reversed.
