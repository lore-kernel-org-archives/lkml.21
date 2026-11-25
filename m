Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648580;
	b=f5FgYa9bDS8J9B4Sv0z3a1cpA6xVYdzmMQOFg1vsvA/LtClpnA6CRn+s4JH4qOkZ96Mq
	 5XOc1smJckH34+MJpsxFTN5/Zt9AkO2bq0mh1RwlFf05tY+1i+IxnEhXceTOJG7opptFl
	 DEfC0L0V9GhvmwpPp1X9Okt8HEN2Zr/iHWxyBTfr6ZM1mOWt4kOcnisBHvIWLSkc1XEo3
	 mc2i3yMWr0JPTf3t8wRKuRHPcayXxTVbbqg6WYU7+ODuCNIyrmvVI5t+2DvV56ahanIVH
	 eW9+67SVjHLnNrknJX8Ldsc9oupaKunje+mqCJ5RfejO/t0HPtg19flQAMW8YNpvD/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
	b=QcNuASQtD4WBNUB8ASnu2L9Cm7nOa00iNSBks1VrPKgVordcCyHkR1P6Z/yjBNFwR79T
	 e0NQsQrCsnDrklCWaY9UQni2cbdTaXZ+fsr7DzcrOmKjeBHYM5KQrNOB6LTsR7flPlOW1
	 kahuIehnUhRnR2J/EIAjnvZtNdbYVWPk6YoGqS1+Axn9f7vV13a3Fl5nIdCwBk6Ig7c3L
	 SWcEI4zgFM4IE9+BtnhnD9y4JwdvXLnzxxms+TzwuTLVV+XUnS5M1YywmRuMC/c1ZKwIR
	 Z8RZIRHq8NQ48VdPpHYhnRGsqd1StfM32Qswjw1Dlvsv4do57MxMBJL1S0istlF3yLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKVIZ7Dv;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED5A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED5A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKVIZ7Dv
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so2456155a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648579; x=1796253379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
        b=jKVIZ7DvKZtbXaP2DWsG09+5JZ3RgD/mzAYzNjFfghXqE8SLLfTjgQVYyBObvfZCIE
         u46RPFKr8glGu10TadtWqkJSA+3yPwR6nZ7qoJY3i9sH2LNi4yvOq2SMZBS3h3J46CnL
         CkVwe0jjwltsnc7kUiZHEkusvRGEg86aCCiucpp/NAxej67F4qRP4AsCDV7CrqXlEadi
         I4ZJvss+NMW9r2Tp3r17lk6RoXBeo6dA/zcXSL3qyGEfzRDD6F/xUfn7zmYoNLHFv+0F
         D1ZFxvU3E62+cAleVRJ/ZhJhKRi3GTUlH8P58M9GUwU9apVhS2soKP335BgzHyB97ApV
         bMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648579; x=1796253379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
        b=CNPWI8Og83bRQ7oZKNSd7W42UCEthPs2vL5V/uO+otqojKHTe2bZfScHQTlEBjVvfF
         NpfcY0OVSV13RyqQnSKNlmD9KLkVateSTCEGRe9FhHK0S5in6oQmP8h1KmRmgcgiPVDr
         AbPaHedyYM+jpLZJL0Cp3iKX01wuqfFzxH11MfBnZHyp2KhvDOCHI9Eb9w35VigAtyLY
         qB99vp02g6gFspulvVmsuAoBIMPrMMFdLgBNUWmEdWs7YjEv9INU0xm/8t9jDCmQAzck
         gmKA+5Jk20DlNBUIceUWDEwKBeoSPFaOsIgrFXHOqIcvRRvHeZ3NuZWOj43jV6Sa+Eg5
         sJCA==
X-Forwarded-Encrypted: i=1; AL+hErHPCmj35MGYB1LrrcVKH70uT8+7aet4oX5whNw/B3vF/nl+aAIbaFVNlOFJEPA9Jt/z8MeCTb1fDWnTgtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bO/lUCHaUmikUnlHb5PJ//cgFtRw4Ef2occCekMDC0o7TDZdE
	9GfNDae2VOiTV8gY2nK0FdGw60zv9h7oHuyEiGezfwa0EapFnWuZVmM3
X-Gm-Gg: AZFdTZddDoMDaUf5qw7B+5afvkL20DS0wHljON7FgXQV1m6SspIeDe5P9/PwN4vUWof
	861k7enqkXwg2PUgmkoj2gAGw7wWeAIcQvk5aRYaqXq0X5GXJcJ8MzJBlsVLO2N2mzGKQeP2W24
	2Bj9BUw4K36BITLQFS7O3QU8RZOsCxlUBqo+EL0b1WjvC8PYlQN3bF4AEQL5gWK4Mblr/+Br4xN
	ry1J3e+Hkdh+D77vma2sLzEcjbbxERUs7gctGIkIXZ+922CCZQtKFcfj6wgadcX5YVFwkFyB14x
	q1ILnL+jG0mJDVqE0M24yHHzOch39Otixa7fyVhb0MOTaF7ygwy4GGRqHBhi95MTTCZbpZzDbiy
	Yn78iiOe6BEAGIN+gCIZfkburgSt1CbBXVsA0KhykuoVrzfGR+PgWYMBS3Xef73ly2t8LtO9Hnl
	N4jcXdVBYSG9UI9L9Z0ozTVm8PDjexrrfasE2I02Wg05YGisnUuxv2oGxpG7b70I1cjoKUbVoTt
	vJQTltpLfR1q7rZyjjMcATo4VAgReJos340Sgi+fQ065BBTHObyB7O0d2GmcZP5SUEwGXSB0fnZ
	3In2hSPoVAkY4QjfMF9dKBRGPQM=
X-Received: by 2002:a17:90b:2e49:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b41cb212bfmr17680989a91.55.1795648579180;
        Wed, 25 Nov 2026 15:16:19 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm29282158a91.0.2026.11.25.15.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:16:18 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5F6F6420A76D; Thu, 26 Nov 2026 06:16:14 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:16:14 +0700
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
Subject: Re: [PATCH v2 06/14] docs: security-bugs: do not send archives or
 binary attachments
Message-ID: <awdsPgHF6Y0xuSQI@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-7-w@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="Yd+Dybq0Bn8RY/CL"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-7-w@1wt.eu>

--Yd+Dybq0Bn8RY/CL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:06PM +0100, Willy Tarreau wrote:
>  Please send **plain text** emails without attachments where possible.
>  It is much harder to have a context-quoted discussion about a complex
> -issue if all the details are hidden away in attachments.  Think of it li=
ke a
> +issue if all the details are hidden away in attachments. Archives (zip, =
tar,
> +etc.), binary files and documents (PDF, etc.) are never acceptable: when=
 a
> +reproducer is too large to be placed in the message, attach its source f=
iles
> +as plain text, and provide scripts that generate the required files (e.g=
=2E file
> +system images) instead of the files themselves. Think of it like a
>  :doc:`regular patch submission <../process/submitting-patches>`
>  (even if you don't have a patch yet): describe the problem and impact, a=
nd
>  list reproduction steps, all in plain text, then provide a proposed fix =
as

What if the issue can only be reproduced with specific binary files? Should=
 I
send it as e.g. ASCII-armored, OpenPGP-encrypted attachment or should I put
it somewhere else on the Internet (as privately-accessed file) and share its
link instead?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--Yd+Dybq0Bn8RY/CL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdsPgAKCRD2uYlJVVFO
o5lbAQCf+HFr4dpqHo/NjE5YZQjZhBumSvZxjxGVy4Bc+rJ6OwD/dQ9wDciflsw8
W5Gcx2EYKEBwUYE42WbwBHghakXKQQc=
=0aJI
-----END PGP SIGNATURE-----

--Yd+Dybq0Bn8RY/CL--
