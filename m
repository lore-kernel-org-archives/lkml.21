Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649784;
	b=fcouzPy23P6nCQN/YWSAqdqX3VY/kyHXlx8MWr099FgEJY8Xyv8MqA9qUJJeSnFJ5df8
	 SnVBgmIK137PZ6iio15ztKaeF3+xeNigcnp/E+udero58uo5jxHsYTNTRyE1Vsac39kHe
	 gBVLxwH+ooVZaPETUQ/biM+a21rPGU2YfdGtQ8Rtd7Qbvxy/wBMGSt7fmZU2vpjcFz3GR
	 AE+DD7kPv8tXzDPpcjBnkuk5suOKIT1xdDI4OC8x/G6cTd4zmSCgQ5Etc3khd/kHe0a+p
	 3cK8u2JZRwjOv1Ax0siSMiq5A4y0nYGJX6ENc8n8KNJdkF/Ma+PnmWtOhhPce1k0daw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
	b=N45CGTPVgP0ILnlZ8EYcWtFEHFBSdPE00afji5w+NA/vSrCo/LZ//LhIFzpciSpeQsSB
	 uSQ0P3uWh78BgIsW/ley47qaWIn4ZYPKk+yWshop/3n7p7w5x0ACv60IqId7kjL4wl9wL
	 dPeEW83EdkaVuawE4V/zWirOwvfzf7wG5KsFFlG8waRIvH6ttBTbZewRTu3oCwp7sd1iD
	 xUBOR4jCcaEU887q+nLuu7NrGQdDBZZys3EMfd3W1Jui6Ep23S1ICx/Ovm/DwXCxgaEJf
	 KYreYpW7JMCuU/7KAXP7Mzav0nl6ikNTgppWIxXKYEDllApLZWnWPvrWitlae703hkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR9+m7iT;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA8606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9EA8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR9+m7iT
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f03920c4a0so41172715ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649783; x=1796254583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
        b=nR9+m7iTvWR/jIkbcf9Z+O6bsNRp72Axj2s0OUlmt9yupfWpUT6wQsOmbmA/yZJycV
         li74Whz8zjMczAWHicw6f0f6u4EbjNGeTVeld99kVxbyTQpe2UH7YhtyOh0QMNjRMOep
         HDFIn6AteS/5VpRAOObaLgMoB1UpY+xLEepGGj+nAnWWf7f47TiOtegrcKmxE4VtrxQH
         8OOQxOA/8pggzN/01WLKokpRZletP0m1gmJ/5enVlmreyR7RdJTTGCglXNYekVu8ZEY+
         6SHfiqaacf6otbN3RQX1njz4RCmmRFNHgVZyIWxQeQ/vINPUGxE0gI+gO4JZjNy/S/m7
         Nn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649783; x=1796254583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
        b=LkXjy8QCwkHfUxHZ3yFU6tDCoLZ7F9H9P9OGBv2k51T8DZl8wHyCxJHQqiouZLp7mM
         lKvTsvGnImMxnRNhJD4HGyp4MGDJOo0JDo9n7vIzmFRS6HeGGIFt8OwIz9NjhCHlGPMo
         DagnsuPd1Jfm8eK/BdyFrSMcAxVeXBXqr73ZZviIMZeC5EHFQrt0DheZiZfgh2nUjqYT
         n9sB+FZa/5iWU8bMHtrI/+/SYGLwyB9DM3pEUM9D+z7t8b1V5Ckr52rpkkJWOmncbmhz
         nCHfBNTTrK8vPInyBMC+H49/fNZ/9T+/eJNrgNH64+bN2X1D0CIcPcuSiiPeCejXsrry
         XABQ==
X-Forwarded-Encrypted: i=1; AL+hErEbMuieJTk4AvQ0Zh3C3i1eUAApLW1WBwhmNxlX4qDm9jiC+hpXtkOsj2xLVmEiYZvlZNAE4ZB5dFKOZwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8clH5tE/RlFq/AGiugQt8OtEmSv80g2p/UEMp3ABWIt960J0E6
	rCiF6tBmSmSLqB3D/BbeCCBpiNtyZanrEmYb2QFLXTglVnEOxG4CNFoH
X-Gm-Gg: AZFdTZekAG2wZlQhqWtLBN70NttijH7df0eJA/Gr/T54pmv2SLHuWcXucmLlwaHqq1i
	egKnDhGl0fwgTt6XIaCJ6UC3OW8cKQE4g+PAXgmGpxmGZGH+ShWFi0jUmcdcaYfvWEHks/D1FpK
	GOopjXjOt1Plqm+gpuaEsH+Epf6j2hePv5pfk7U8Fp6k4YUzwOS0ERKdhnZBntm5m6d0YZwxGZW
	SIUqzfWvZ/Qk8IqjEw+shA/JRQ1F38B4+fjBbFxtxn2evXLOb+QAUflp/juMtAz3qCxg6Pz1/Pt
	KFQ5bnxc9zYO//XsDG4v+YYrP5bL4KF4odECRTOPq3eVfsJHyqjKA6NNiWyed14uuE47HM9DAyZ
	24rBAumYLfQ7XWuy+osO2hYM8bS6OUT85Hv8uA5cNVNYlBlTuCkf4l7tK5I0Lxqz0cajeqBC34e
	rLEPCu4XdVc5TdXRw59xn2+Voek3yFQEAx0pLhE3jQfuLssfUPvUubyVAWE5/spU+gnrX1U4wGB
	H6kev+pc4t0EBdsNhHjozBQtKcskl835Gx1z+LiSpPp2luxGuXwEEf9exA2XfKyzxsNY05xlYFh
	vbvoysI4XSpbgPeZOKhSIDzIYgs3
X-Received: by 2002:a17:90b:4ec4:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b41c8fcd3fmr17046919a91.10.1795649783039;
        Wed, 25 Nov 2026 15:36:23 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm19602862a91.9.2026.11.25.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:36:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C3C7E420A76D; Thu, 26 Nov 2026 06:36:17 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:36:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, gregkh@linuxfoundation.org,
	Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix
 that can be applied
Message-ID: <awdw7OLaYvXcGPgj@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-6-w@1wt.eu>
 <awdqgBF62SOKaU0Q@archie.me>
 <awdrPui-KI-SK_5N@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="Kjo8vLeaeTg8pZ2D"
Content-Disposition: inline
In-Reply-To: <awdrPui-KI-SK_5N@1wt.eu>

--Kjo8vLeaeTg8pZ2D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:11:58AM +0100, Willy Tarreau wrote:
> On Thu, Nov 26, 2026 at 06:08:54AM +0700, Bagas Sanjaya wrote:
> > On Sat, Nov 14, 2026 at 08:00:05PM +0100, Willy Tarreau wrote:
> > > +Most fixes sent along with reports cannot be applied as-is because t=
hey were
> > > +damaged by the mailer or lacking a commit message, forcing maintaine=
rs to ask
> > > +for a resend. A fix must be applicable using ``git am``, which is mo=
st easily
> > > +achieved by letting git produce and send the messages (see
> > > +Documentation/process/submitting-patches.rst).
> > > +
> > > +When the fix is meant to only be sent privately, the preferred metho=
d is to
> > > +send the report as a cover letter of a series, followed by the fix::
> >=20
> > Documentation/process/submitting-patches.rst guidelines also applies to
> > privately-sent fixes, no?
>=20
> Yes, why this question ?
>=20
> > > +
> > > +  $ git format-patch --cover-letter -1
> > > +  (edit 0000-cover-letter.patch and replace the subject and text wit=
h the
> > > +   report's subject and text)
> > replace the subject and message body placeholder as appropriate for the=
 report
>=20
> That's a wording detail / preference, not going to respin a series for th=
at!

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--Kjo8vLeaeTg8pZ2D
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdw7AAKCRD2uYlJVVFO
oy3qAQC4EPhrAXmftWcO+Qjt6IRMGr42yV+tdJa0t7L7OWolnwEAxVxjaT6iGwY7
vDe54HMMZEorAqWYR7Jt1hlwu+PDuA4=
=BL++
-----END PGP SIGNATURE-----

--Kjo8vLeaeTg8pZ2D--
