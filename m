Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714700;
	b=xhscLQlygDmwaUzGTfMPgFjRtNW+PYnj+VCWK44yjv1Jzd5g6QddDgeRT7rxY1fw+rTs
	 SOrwfv0cMnCcTnq1f9jKBJIytnNeLxuKih/VTtRR0krrlST4RrvwmBgdp2rDCQggyevWs
	 2bi3o1uE+n64Sqj30hqp1/ViAehWsHJyDkCh26iZWzeJ+yl5U91epcZhOK48LvWz4PhP4
	 7NxhQJPrq66PNb9/ERciZlr9DCvKQpbqltDAhPbzJmazIXoDlLIoiHneo7zvsmhMwgXd7
	 vljcEo89ofEo5LCbNeKInoZifd941yI/dWCIrmLjjScQUwcHjyE3ZqxU9jEwE4fJEzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714700;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=4teLVqdxHTIzeHzEWuOEGSiE2+RDD7y3+MbgjsgCQhI=;
	b=HKQ7SeahMWmihQ7t9oa4oRd2sXmrEDcDWFIrYmUtGauPPVVxHIEQBSmdEYmcgg1C3y8A
	 WdT4sNR2kVvERyXFSxBnMv3aKL3q6hKuawA9NkuI1ktyFsOwzkAcy+nDPlZ585pxfZrAk
	 RMmAm+ENTLWphKwe4bGaGTgHZExahBCOy3ra7SeJHgQbvEhFMptmMkCOCVnWgytIzFLew
	 Ao2B6+C5+qq9Z7bc3wPZ4r6flVvqkmkweyLJZmuiMNAnTQgNAB7vZ2EO8Z6COj5L/gM0h
	 fortGqcTRxK2PfESi9Cgp1RgN2svfR7t6iotqVNYa+/3PwkV9UXQuB7ratT2Oo9Hd1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=TvIwMg+3;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787C5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 787C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=TvIwMg+3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=4teLVqdxHTIzeHzEWuOEGSiE2+RDD7y3+MbgjsgCQhI=; b=TvIwMg
	+3sFwNPvLhoFzrimboVdCHWGmjGzP3mjH/aJwAcQ9ZNQb90BAkG9GHRaeOppEMN4+0sC+EImeFNev
	aODfe95REu1AP2SHRRIQC6kzDXSZ6zSSdUCjywSUgdDQ+ITZukxheaoSOnDvnbkP+Wb/5Xqc9TnSL
	wzQbXWQ9CjHXkC1g3ODtZIortRdF6u9MHAHlrss9N3xTTNrlH5KCgVnR1JmtnHM1/U18BQZ8qWksA
	njO3/qIkKahO4yNGr1+QyPNyYsLefcLjeRZgbrl0S0QUUHBRM8tJ3MJgNq/YAcXXO5z9THXi3DhKJ
	CI6T1MWBxeNT7+JGCyDpmWMK7Tig==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xWdPy-000000001Yi-0BK6;
	Thu, 26 Nov 2026 17:37:58 +0000
Message-ID: <577d25b6aa80bcfc216eda5bb4311ffe796be49e.camel@surriel.com>
Subject: Re: [PATCH 9/9] mm/gup: unshare-check every page of a pte batch
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Suren
 Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,  Yuan-Hao Hsu
 <aa9736195201@gmail.com>, John Hubbard <jhubbard@nvidia.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Peter Xu <peterx@redhat.com>
Date: Thu, 26 Nov 2026 12:37:57 -0500
In-Reply-To: <05de9fe1-9a3f-432d-9ce6-9f497852d1d6@kernel.org>
References: <20261123195609.4115244-1-riel@surriel.com>
	 <20261123195609.4115244-10-riel@surriel.com>
	 <05de9fe1-9a3f-432d-9ce6-9f497852d1d6@kernel.org>
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

On Thu, 2026-11-26 at 14:50 +0100, David Hildenbrand (Arm) wrote:
> On 11/23/26 20:56, Rik van Riel wrote:
> > A slow GUP write pin over a PTE batch can hand back pages that a
> > later
> > write fault replaces under the pin holder: the process writes to
> > the copy, the holder keeps the old page:
> >=20
> > =C2=A0=C2=A0=C2=A0 pin holder=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process (mm owner)
> > =C2=A0=C2=A0=C2=A0 pin all 16 for write
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 batch passes unchecked
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 write to a page
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fault copies it elsewhere
> > =C2=A0=C2=A0=C2=A0 read pinned page -> stale
> >=20
> > With GUP-fast, FOLL_WRITE | FOLL_PIN can never reach
> > gup_pages_not_requiring_unshare, but slow GUP can reach it
> > with a read-only head PTE.
>=20
> I assume you mean FOLL_FORCE?
>=20
Indeede, it is FOLL_FORCE. I need to rewrite that.

> I don't quite understand the problem you are trying to solve reading
> this.
>=20
> So can you walk me through the exact sequence of events + flags that
> are being
> passed?

The sequence seems somewhat contrived, but it
looks like it can happen, and some runtimes
(maybe Java?) might actually do stuff like this.

1) mmap 64K private anon, touch it (one mTHP folio, 16 pages).

2) fork, child exits/execs

3) Parent holds 16 pages, all PTEs read-only

4) Parent writes first page, COW makes it exclusive.=C2=A0
   This is now the only PageAnonExclusive page in the mTHP,
   while the other pages in the folio are not.

5) mprotect the range read-only. Now all PTEs are read-only,
   but the head is exclusive, while the 15 tails not.

6) Slow GUP pin_user_pages(FOLL_FORCE|FOLL_WRITE), which
   pins all 16 pages without COW faults, since all the
   PTEs have the same permissions, they all map the
   same folio, and the first page is PageAnonExclusive.

7) mprotect the range read-write again, this changes the
   first PTE (on an exclusive page) back to read-write,
   but GUP already did its thing

8) A write by the program to page 5 now causes a
   COW fault, since that page is not PageAnonExclusive,
   and the refcount is raised
=20
9) A write to page 5 by the GUP buffer holder
   goes to the old page, and becomes invisible
   to the program

The fix is to simply do the same checks for
FOLL_WRITE that we already have in place for
FOLL_PIN.

Want me to put the above explanation in the
changelog, or tweak it some more?

--=20
All Rights Reversed.
