Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198280;
	b=02bWBCKbNUnMVAVrbikqriR48HhYJpLwyCq/Eu1GFubJIGQ7iWDSCqszMhbtBTU/6c7w
	 1b2ZYBOngIs0ZpQAftLjIynF/y7bzmiSkzshGGXO0ychPT93cuQAbuopL/7wSa0OL+p1l
	 U65VvrUhV5Df1MxkUERJiwqknAV37UcANsHitDImr1iApF6z3pDh8AtWThbbVj7GEhhb2
	 2ei3FXwZIGY4WjXOkHzI7Ki8kQ3sGq49qecUYDktbm9jHOUyZICMEEty7NFrnBKpN0g2P
	 e6NBwY9pPvtqOzl1fTICOpBeApHzFdjkDz0iCg64c6dbLFUxuFPKF1P45aE5+VK1VKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198280;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=XcKJMdHlJfeRGtBDKUfgdRC3VDDPooY0HWY6IktVMYE=;
	b=mI9Etk0ZQZSP7M2PtDk9Avv821aS7aZogiTPk0N/1uCkyR1WTm92aZZT/MJ3FlKN3sqS
	 13m8oo6K4n1MKX8ousvo7z8ohzXtjaa2gzD/8NlRzfE8jSl+Ji8KEUdanrCnkdP6l9FVG
	 sqJ6vVlFIualQEm6i2GcbZkKtFnKsjLYpqM74bXzFGNu8GAmcCIS3tNSGqY4AyWpDJTXK
	 /AacFj1dimom+hI55efJSfaE/2i7/Mc7s+MhyTRmNsi6+LjpNC8exTj5RsLBxkT/DU1bG
	 yF38+Br53Omnh2Cd8G9k+6p4bAtuG0MAZUXVLNALEcbrn8XQ/kYadOpYvnxMWiWAxpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=kNeNtKLR;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E92606B99B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E92606B99B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=kNeNtKLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=XcKJMdHlJfeRGtBDKUfgdRC3VDDPooY0HWY6IktVMYE=; b=kNeNtK
	LRXTV8DlwIG2kwNqXfn856WnUegT3g/UHb9EJz3aA1cHPb4cAb6icf0Dk8LxKpS4iMpKtsuEQoao7
	VEc+sJ0H6R9PTFxeMOCD3aY4x//Jom+8b2QKRQua1xxkBfhsFONQrA06q7pnVpppGywF1zMdf74CT
	r8knGnQSJH3F04wAy427qFyeCT3DVJNfi63a7Ji0KA6gbEClMFDz6/tRdcDxAv9IHDLhCtUv8QZaQ
	tu4TIpoDRsWFaT5VYkBThFpGdnaXt5eWbmTA2QfP3OfXXVZaX6szAqtBK2X7c1BeO63i33YxSwZUf
	GnLX7Ddy4xLbU3kh7yZf5wROkDJw==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xUT4R-00000005iWQ-47pK;
	Fri, 20 Nov 2026 18:10:48 +0000
Message-ID: <5f18488c8234ee28e9c638abacf4961311d866f6.camel@surriel.com>
Subject: Re: [PATCH v5 5/8] mm/gup: break out gup_lookup_pte() helper
From: Rik van Riel <riel@surriel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, David Hildenbrand	
 <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Suren
 Baghdasaryan <surenb@google.com>, Christoph Hellwig <hch@infradead.org>,
 Yuan-Hao Hsu <aa9736195201@gmail.com>,  John Hubbard <jhubbard@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>
Date: Fri, 20 Nov 2026 13:10:47 -0500
In-Reply-To: <awCD56Ncl5_Tjrl6@gremlin>
References: <20261116210127.3837898-1-riel@surriel.com>
	 <20261116210127.3837898-6-riel@surriel.com> <avxXgTBaJkPN6XOh@gremlin>
	 <89e41824f1371b5880029f264e19b5d0589ae22c.camel@surriel.com>
	 <awCD56Ncl5_Tjrl6@gremlin>
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

On Fri, 2026-11-20 at 17:33 +0000, Lorenzo Stoakes (ARM) wrote:
> On Thu, Nov 19, 2026 at 10:04:04PM -0500, Rik van Riel wrote:
>=20
>=20
> Right, I think I need to see it in context to judge really :) but
> obviously we
> can't be introducing completely dead code like that, even
> incrementally.

Agreed. That's been cleaned up now.
>=20
> >=20
> > >=20
> > > 'need_no_page_table' isn't a great name either. Maybe is_none or
> > > something?
> > >=20
> > Maybe pte_is_none?
>=20
> OK, let's see how that looks in context.
>=20
> Since you've not replied to the rest of the reviews I will assume
> implicit 'ack,
> will do's or what not on those? ;)

Those are all "will do's", or rather already done
but not posted yet because I'm combing through the
series for other nits like that to address.

--=20
All Rights Reversed.
