Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883845;
	b=EtA1Wr0MkXBskkNzWIl8FkEx3DoUsVkOZ0TKWG4F44Go4DVbKFKWhEI8WZy6tynVtw3W
	 vsHOgaEMhJh2krMimg9HG2l5hbMd6eOtEh0+HZ/6ZlMNdyxyLNY4q3/En7SZR3ZDZ8pD+
	 ilb5PJ5BKOFmONkJ9mFIr1wJaqFsSRnffCAHhDE7BDjA2/GCsNZsv85W5v0FMH3F9tTiv
	 X9LfMBHkfNw+nuqCuMiBFPOhZEhPJO8o0KmJU+FsMCkFMjwgy1tubNKFj+L2A8IXXmvKL
	 B5KPiUVgLbTAt6BxuckYLiCOHLdmJIz+FCz23iSSJQ/emjo8gnBYVoj/UuUUFgFc8ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883845;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=PSugv26hSO3nTw6NP1ZPqYzhL0ju0QuL8ubdlysmRtA=;
	b=mAmzw4VEul/3qL+8wiZI2srnzjQRuyzLaVxTX99vAp1fUh9oR/0dBZOFO/seNd2Hh8xf
	 /ElsvNgVZFwyqRnF9GO38F4u8VNxja2BifWrA7sfCbzuiYfJvy4wg76gN4xMcHaeK4Qzx
	 8Zg+Dc1YO8AtlWcNEA0Kdcd9imZpilzE/gFFPU0cJU5Dv6w3uK4A/bZH0oL0rWWIxMAGH
	 gVmuEmP/R89RBiYVzx8lp6bgbS7ZhyfzyMwGGCgga8MQ6Tyq1QqLTd44R8quFKut1cALM
	 emV1PKe01VBuy31OumBZZryc43HY5MeholEwuWquu55JwPX0R6NVkLZRnD/jk6GCmAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b="WMVs8/AN";
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F9E606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F9E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=WMVs8/AN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=PSugv26hSO3nTw6NP1ZPqYzhL0ju0QuL8ubdlysmRtA=; b=WMVs8/
	ANOYQcyfhELxIlejfN5uVVKi6Sw4zQMSxcLSHs4v0gNDa4QkEvVcn29dlMBmryYm4A+fEgRCzqMiC
	+C+MDnZE7t7fNFK4NvxSTD7m+PPD0n34IUYoSXw0AvkKoYuhFOSvRwodV/ZZ5m4nByGgFm1ZsYJ73
	411IMYy8dh1NvL0WElT7jD3xvzrxlHZ6VJKJYpONBvICT8xR5MKvgqHyReoqGrS9JXsFjYeRHjM0X
	/O5apS5r1YAB27LqRARXDOQEg4X95VygSU1aqThkmiJ3AWOXPQ7j/+KYLi3ck18TjRlUOW8dwpyi8
	szCZxo23PIOl4VJpAMYdjgF+mNlQ==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xXLPm-00000000T6n-241E;
	Sat, 28 Nov 2026 16:36:42 +0000
Message-ID: <8b372e6dbcdc0d8cec43b832fdb94971deee9c19.camel@surriel.com>
Subject: Re: [PATCH] mm/vmpressure: exclude costly-order reclaim from socket
 pressure accounting
From: Rik van Riel <riel@surriel.com>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>, David Hildenbrand	
 <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"	
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport	
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko	
 <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Barry Song	
 <baohua@kernel.org>, "JP Kobryn (Meta)" <jp.kobryn@linux.dev>, Johannes
 Weiner	 <hannes@cmpxchg.org>, Jakub Kicinski <kuba@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 11:36:42 -0500
In-Reply-To: <20261127-socket_pressure-v1-1-1d3a60c1dbb7@gmail.com>
References: <20261127-socket_pressure-v1-1-1d3a60c1dbb7@gmail.com>
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

On Fri, 2026-11-27 at 20:27 +0800, Xueyuan Chen wrote:
> vmpressure() accumulates reclaim statistics but only checks the order
> of the last sample when closing a window. As a result, costly-order
> reclaim can still trigger socket pressure indirectly or discard
> accumulated low-order reclaim statistics.
>=20
> Skip costly-order reclaim before updating the counters.
>=20
> Fixes: f2a950170f7a ("mm/vmpressure: skip socket pressure for costly
> order reclaim")
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
>=20
Reviewed-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.
