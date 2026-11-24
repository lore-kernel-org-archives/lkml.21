Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558413;
	b=0u5TZ0nziX0Oc2k3oCEFOYi0mSd1ruxQyosXGZQ3Fu/rIjNU7PYZqRHzMNKWEMCKsJxu
	 7us+kZ2oyJrGeXfhboM9+lbvwoOPA2hqNyHHPt3kV7SaF/gQFrIYA36wE3J2s9TVNtQCh
	 NJ9h8JC4/n+YAKUuEUbLHSKambnoAX+hPPxBSvEbBoeKO1yK9ao4jwYyG0Tq8dcqzi240
	 G+QyW8ZxUESBISe6TekL3f39P0JpG9mE2llNm6BngIO8snMbEXWQrDsSXhLXdzOik/Sh3
	 QftOzzKh8do/An7g1n9PaK2xgbuT8UY24QpL+HPVJ/2C+4xjyBaDutpmdb3By/3cC+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=jFcGsqmfmZRkt05qBK9du4hRMwTvxalV5t9KfsrqdEM=;
	b=Kj9i3fc+8Knkov/ZBKWThqH59asbhMDdHt8CwuMeJy5wnOeNqARMLU4gLtqFDnZwYx0x
	 TdNlbqc1w+trQnzow8F4UocRHgIgfiPHhsjWwQAF6vgwYEWkcmzGseZF1xMZoQFEeFHpB
	 Fgac6yGaeBZQPofB+QoRWnuIrUgc1rgialnu9CfYfqTb+S32Tozy75HISENQ16hAETFSU
	 v9TZsom0jWeXODoDoLlsNKbcPGyR+fxt9X/j9nlUAN9A4sAU0mCZQLtDsl6l8xWmk0Aas
	 /yn8u1S4RnBBZhw+M7/wS7/o8iRa6GBNenc6z8uCyl9EwGxUVtmE0ANmIO0oIffJV1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gB9K22sH;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E814C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gB9K22sH
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67da69e7c31so5461762d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795558412; x=1796163212; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jFcGsqmfmZRkt05qBK9du4hRMwTvxalV5t9KfsrqdEM=;
        b=gB9K22sH3Jxyk8oxd2+t7FhrKi+TwrUhuySrypm+PkQ4ciNYXwN7rVyLAcQDPpqnIk
         Tc0i5ULrnsXVpaFb0hGc+bEksT30tYdmMaoo2VWLTxqnh80LZR9jnyl3rzBNb4d9eCwe
         9aTRyakPTBumqQ2yxUz58T/5bhHPv+UKJoYLOiepaw7R045IE6n3slT5vuKm4LzztWZM
         aTGZ0jVcl5WFw8I3WuM7bx2HZ/QMvSTvpbwXxpKnEaYqJBQs8Zw0GOO3eDs4dJ7XDe6L
         DwaqVmlJW54K1TAeyEeVXTcikuvMJyI8tICxEDnlwrKzPqWmcUvkXzWa9xs+Fh8lcwlH
         aauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558412; x=1796163212;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFcGsqmfmZRkt05qBK9du4hRMwTvxalV5t9KfsrqdEM=;
        b=qnQslxnOr+vUjoQaZRVaoXax4Bklo2glJxT02dlPbfpcap1gxwVa5i205n9L7XJT1M
         vIzwBPnJWPrv25C9NjGgWd2b0HUdxhzjsG4JL7raKW1jfH/LhOVDf1Uj8NqstVQs3pLM
         wjlsI5xim6pCWsWPo+19LuDgIXkvrWeYURwMU7q2zAR0hqI+icRGFFdyAYwWZmOYw3k0
         /5AXkDmhgq8XNIeM8MJ0XYUmRclMULjrWP0vyK2leluZvzS30/nzUOuilRm18W2bf24u
         LyZw/DkQqrswoyocQoRUSyH6GCGbCe4n7/NSLQSe4Q9dktV1midUbQlljm0Q0u7wkSgH
         T5MA==
X-Forwarded-Encrypted: i=1; AL+hErEE3nOoQunQ/uYz5Gg4dZWNen2LsH1HOChCXc5Lxb8HSJ0YYefERXW8pp6mTNTyod/Y5Mly18aXUgpyPQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y17qEXBuNCdKIkhYEAfBMjLYifmFRT5tv0P7xG+5BQG2X5Sti
	1ttX7+yqGEYATvozR/B4eRp19Y2+az0bxn+iLw/cWn9Jzx8ZQyhUovrr
X-Gm-Gg: AZFdTZeKqK6YPliaOdldI2jk5EJ2lHYu1PsUff+w7k/CJVXf94hajjSt9jw3t81PmQR
	kooC0LphxBGYHTKvmFQJCDW1A8sviOYHzdJ91eetEHnJyFHkFjUuYwWcGnoFKtetd0W01rm3KSv
	wGW8swEO4NBiSjuWpXgZK3Rd6j5lTjpQHvithF5RBqmXt+Z8v/zwAPPuHY5Pa7dOofwoeHVICl8
	CjkXpMWBYVI2sHQZqmUaxhLJfAuBYe9VENLynqQ1M9NmksQa5LmpG/xfRMbI0dP1ZR0x2YHmcYH
	ONl356cPR7kb9O+Xh+9+Mrd5qmvX6IEUWmAlDGklv6Eieo6yhp9oMo8QUHoNJmZt9K0ds8CJSQY
	uloTvO4yAIifJFPUImibRNQKmwthQouLYRnFo3kTacSSp2G+gAOAD4IyP8nRjULyagPHYWXS0kn
	Q2U9vhUqTLHP0cOOKP0RMy9uKs+WA0dor0r7KbIZAxLARNuk/rCZdHPSJuxHSHyQDYIBtHCWgfI
	YYiIKuTz1oGAjSRcN9YbvM66Da0YxiHZmQ3bErH7IaJa48Wdpo1yV+ZGC6A9VFqT1BKGe/Gv/50
	l/vA4X5mDTNMgkCsemjBqbqg/MgMTqnU1g==
X-Received: by 2002:a53:ac90:0:b0:67d:c14c:9f8e with SMTP id 956f58d0204a3-67df4410ca0mr6821449d50.32.1795558411857;
        Tue, 24 Nov 2026 14:13:31 -0800 (PST)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df30e4407sm7857086d50.0.2026.11.24.14.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 14:13:30 -0800 (PST)
Message-ID: <834c266a-eb07-4427-b1fa-5c6508a5ce32@gmail.com>
Date: Tue, 24 Nov 2026 17:13:15 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/4] arm64: defconfig: update the Qualcomm Crypto
 Engine entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Eneas U de Queiroz <cotequeiroz@gmail.com>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, brgl@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
 <20261120-qce-fix-self-tests-v12-3-b5a2a44bc5ae@oss.qualcomm.com>
 <9faa6fce-594f-4556-b5ab-6aa73330da8d@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <9faa6fce-594f-4556-b5ab-6aa73330da8d@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HRJ667nozFI7pDuLiKLXtKsh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HRJ667nozFI7pDuLiKLXtKsh
Content-Type: multipart/mixed; boundary="------------lc9NsThzkDEG0rUbHzJI36Wt";
 protected-headers="v1"; hp="clear"
Message-ID: <834c266a-eb07-4427-b1fa-5c6508a5ce32@gmail.com>
Date: Tue, 24 Nov 2026 17:13:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/4] arm64: defconfig: update the Qualcomm Crypto
 Engine entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Eneas U de Queiroz <cotequeiroz@gmail.com>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, brgl@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
 <20261120-qce-fix-self-tests-v12-3-b5a2a44bc5ae@oss.qualcomm.com>
 <9faa6fce-594f-4556-b5ab-6aa73330da8d@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <9faa6fce-594f-4556-b5ab-6aa73330da8d@kernel.org>

--------------lc9NsThzkDEG0rUbHzJI36Wt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/21/26 7:22 AM, Krzysztof Kozlowski wrote:
> On 20/11/2026 20:34, Bartosz Golaszewski wrote:
>> Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driv=
er
>> for this IP is being split into a smaller core stub that doesn't regis=
ter
>> the crypto algorithms on its own AND an auxiliary driver than handles
>=20
> This part is fine...
>=20
>> the crypto part. Update the arm64 defconfig to only build the core par=
t
>> by default and leave the choice of building the crypto part to the use=
r.
>=20
> but here you miss answer why. We do want the proper driver, not only th=
e
> stub, no?
>=20
> Best regards,
> Krzysztof

Most users don't want to use the Qualcomm Crypto Engine.  It is
significantly slower than the CPU, its driver has a history of bugs,
and operations that don't meet certain fairly arbitrary constraints
fall back to software anyway.  However, most users _do_ want to allow
the interconnect to power down, which is what the stub driver does.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------lc9NsThzkDEG0rUbHzJI36Wt--

--------------HRJ667nozFI7pDuLiKLXtKsh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmsGDAYACgkQszaHOrMp
8lNsng/+NMmecEwic70Ntrxi+PaLjYhERE/2Y0pncM9FfvCEV88uvNtEmnzf5s03
qwbguuFGvVa3220G3VvmAWRtz5ai/nL4yZzT28GuBmD5WyMgrbpHJ+/ovO6Mzrc7
y3uA/joBKmD3/Mornqp6id/EN15XlHnRZTO7cYZBELp+VJhdMGnQ3pu1Iiq4GhBx
bdcLrTAJvkUG2DPvozkBz+xOmsnTsGmljviZD37JimbQ9NRh/pxHO+5HzJNEqNen
3ee/o1i7BN9ThwxKyOSUWVrVdxhep0StfCc83+ickZIVtC3cR54zy7FToQlsKIRJ
VioxblgFtBTI7i0JgGo2VaCWSR2sy6w0twJSeb+6fyQYOPcjRyoOvqEBzOeysvPc
LD+pqC94Tvbka4UPtBZXMuX574qkrfy4ELlGcqtdGF3rGqvTMlZSuR9Z3Wr4607v
j1yibCVtrkWhl1QWHh7PhITv73Lxy3ZHOj084OL5CQhREGE+xlqSGqnzs9nKlhoM
sZ3f4IbI9yu05BdRt7+k+k6XjuiAd6LosIIzgSFqROoi1M8SlGtuhCWCF6j4i7vc
tQUP1SMlNvblhXonfqD3OH9fuR2epqGn6QgpRmvgB81utzhjwt6U+rzi3+iX/HO+
siMLhb/S1P7Qrd1Me4R0a79ixD2BUt2uTtlO/jqMw9N9q8wc2bY=
=O1EQ
-----END PGP SIGNATURE-----

--------------HRJ667nozFI7pDuLiKLXtKsh--
