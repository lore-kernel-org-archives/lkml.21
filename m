Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648140;
	b=5UFmISCMzvjB+vs4K3xFwV0nG+Tq36LjKhb81TrCdmz9exccFvvS538rCfZjK7tYKgB9
	 jTQ86eoRUeQNiHN5ZB3crfsKSbrRUyLEcTiZlgF7YqDaOXKaC0HSlNKToY9SIIhx/PFcK
	 ULwL0Cj/uVgKXomgv3YoANo/N1nYPWWCwbp5i2xqSdSTu6vRfA10WuPauizCLcP7IpEEz
	 6wJMvtCfYly9g8h8D2CWdvw1Se8vEoc0wQkbaM1m/m1HL4fsikYYgX8Ep9hG8GwH5gn+Z
	 Iyx10UBXEh4Nghdw7DM49001t86D6d9mcZmu9aYfM7i9/pux1zYr/i0t0JN/lsp5aAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
	b=4W+iCCE9wYq7rCTv83lyDqwJLz1kxqb3VXwEHQs1RUNBR4fkMtJrQQo3aIr4F0rvSeS6
	 ntcAOjCrsVu/p/SCS6pIkPxXNPADvJI2AsurB31rs+0OqbHUgJz/3q0lanKe1ZDvheuWV
	 TwjQYiAdIevBr+ejcryODLt6iL4r0BXsljB2fAXBUepjVqJlSb3Kx6Ooc78DCEuOzqKYz
	 tgYaG2gU/Nprj18D8zrkue/zL6u8AHEYiETNg1jXBWdAg4adjW9sMLnZE0837e0YYFokd
	 8DT/Pr7y6VsLQVYwf5HmjqUSJkoIO+KfscWBvqdCu1TBN1JE6pnPPjWeri9roqHC2gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgEQxPvq;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3648606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3648606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgEQxPvq
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f045b921caso37523915ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648139; x=1796252939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
        b=MgEQxPvqyytLZXf90OJPdh9PK1QbYUQGR9tBs/gU/iq2JMuoIc1EOF5PMb/JixBK+Z
         wZdsRu1GceHsqwSdB+3O2/7Uf7ghDdLNUL7SLKmR8/BiYzlM1mkLX6XZUrB07Tev7973
         X7MksrtBfscb8nNYJbxGM+eNYzSr71x9jR0MLpzAgaxAa53nHoo9ysokjg+ydCbjgkum
         arsJzwe58DZENu8fxE6FjTT5rKBGlRJsyFCeIjUGG4w0BdBAA0Jpn1+K96zKAZvSAaz2
         90vgLS9ls0SHShj4sXXg5R8AEfgvAuPpE5qByrYdt2raTvSBo95lFHi8Jk2qURMPkz7v
         cZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648139; x=1796252939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
        b=Ba+UtOuI3+rAcTFl/UfG96JA4d4Ktzo+m6ThLin+q5FZE0LjiwCP9b6rRENal81a/m
         TU9KyLD3U35xP4p7ucS+ei5jXp+nYI/u48soLcCZaPiu5KJ/I+1vwUIge0qACG/XQxgN
         7IgaMytziotOKwRoWuWkASherbiExDuL672zvCEGO2JoXzOypePT4YCdfKox4WocOoLa
         YrLyJRNo3txUYHY95J5zBelJVN3ATSutdavWbWyvFaZK3D0FnVGN86nsX7LxnSMdIS3y
         9UNXfeyBtC0R7l4KFaxFBtfyS2Peby8J7/h2xFVzcWRwbEOcFoRM6ZdXuUHX+pOmDZ4E
         KueA==
X-Forwarded-Encrypted: i=1; AL+hErGZ8kyKshn9YvWT/415VzHUtvsstYTLwltE+IzIX1cb80LUDvRtDMsY6H6u76lcLtAStMu0zVIMo4Jaouw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wc4lWAhHWdgjJQ1FAYwOQUvjfCTEmZKS0KxP/VNcTQIoqnM82
	zsy4Vk2BGY30Ah/eguSMvX3lz6SpFDVAuLBDjh564VEZm4VpK5RzrLKr
X-Gm-Gg: AZFdTZdSl0XSiwxp8698Ltz4XaEb+LV6iwHkfY+53oTGjKWBJH0pxvaOsyVenaqi9Yt
	ugS+NY8z3UHEJrcOGW7qweVdQFHOPxwHyTjSypBKLRY9lbvPHiW4N4D0fAnyANJUqwGogcjoMtB
	OJtkTyh1OzVnQ1C6kTvd+hEiRtEnIvLxRXaL7pCOLWGXiMVoObAogrifmIO91wbof+O2WAkb1Vc
	zfKVegYe9mJtCzU70IgugE7vF5LcTo2n8QMpCubdJRugLc54eT2FMUkjxEL/MCdCYl3XJuVGhBu
	ssd7ES3eSDD2njhQfoVIee97q6dpxw7z3cUmwgbh1XsgSmT+hmZmt1AT71pZYGMnIAt5fNlky1I
	clNLYKAkRnT0jC1KK7NbA3cZMitMCOc6+idBDCX3HqsCmz0y1Omyofaz+UhuEDnGjKXZG8T5FZ3
	Nu0nxfn4jfCCDbPL3G9wMrTB5ydpjixkxUmHjim0cSfpJX91yQgEY8CNKSaHA009MqdGFusX2g0
	GuINf5UAlrm+FY6GzLZd3WVLga3JUlGL3uE1fnTCSiOPFqAQVQtVyxk9ieFNpgQZNPpO684ECwo
	RM+zY+Z8BbE/7LaI0u/y3Pem/KWGSP1wyICCYD9GdZOHkX9+
X-Received: by 2002:a17:903:19e7:b0:2ed:b7e4:f5b with SMTP id d9443c01a7336-2f03f18a7d9mr181302175ad.40.1795648139044;
        Wed, 25 Nov 2026 15:08:59 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm9395193a12.21.2026.11.25.15.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:08:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 78DBD420A76D; Thu, 26 Nov 2026 06:08:54 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:08:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix
 that can be applied
Message-ID: <awdqgBF62SOKaU0Q@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-6-w@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="/uqKRyynA7J8RM0T"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-6-w@1wt.eu>

--/uqKRyynA7J8RM0T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:05PM +0100, Willy Tarreau wrote:
> +Most fixes sent along with reports cannot be applied as-is because they =
were
> +damaged by the mailer or lacking a commit message, forcing maintainers t=
o ask
> +for a resend. A fix must be applicable using ``git am``, which is most e=
asily
> +achieved by letting git produce and send the messages (see
> +Documentation/process/submitting-patches.rst).
> +
> +When the fix is meant to only be sent privately, the preferred method is=
 to
> +send the report as a cover letter of a series, followed by the fix::

Documentation/process/submitting-patches.rst guidelines also applies to
privately-sent fixes, no?

> +
> +  $ git format-patch --cover-letter -1
> +  (edit 0000-cover-letter.patch and replace the subject and text with the
> +   report's subject and text)
replace the subject and message body placeholder as appropriate for the rep=
ort

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/uqKRyynA7J8RM0T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdqgAAKCRD2uYlJVVFO
o8cvAP0UI4UPI69NykSfDcgis1xBWe2etCvfNQGcwSBb/jIkFAEAk4tq4aFkzzMk
UKJQhOV/RP0fTwz7if/m457ISve37wU=
=72sa
-----END PGP SIGNATURE-----

--/uqKRyynA7J8RM0T--
