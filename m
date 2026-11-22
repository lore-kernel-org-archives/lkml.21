Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347862;
	b=Y1RduPWC9jDh8EdHczBLDh9+zp5vSEI2kJGI+AWc2IF3qW260wOkPYJA58+ZXn/wUVHO
	 6Qr+sw5ogy2NoP2OIflwUDocdpJeqiJFhrrevYgci44HnZLE48xLbB4bfpjP/RiSGvFYT
	 R9Xqh15RvJmO2YlqWF4W9xqmy/K/6CFu1S2guZDJfREqJTgKdSIrTsy0o8BfTERPDl2ZW
	 WuzaOLnFQ0QPIeQv8TZmPtu4d7nURvCHNVgXjXfSVTIZ0e3cJ7NZmTLT0hogoCLMxodHi
	 vCT7PjwSyPzLdd3WlhWmnWnJ+xN7f8yMVJPA8agK+q0rjm0yHDosRDQiSlI9edNZfEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=mQojN/7bt9QymOFRQB3HdvvKBXR3fZUr/nS9E5JcK9E=;
	b=cQL7EpIrXDDDn1mO0baMCf6vz4CCnSAUo7LGNFl0uOAanzdLllQQmStcOJhKKPVNXzNh
	 oYA5LCVzcVfnM4UDJMxQnwve5vo+jF4QLjyZcSrzIrT3tM4M9n+lOMflSld6zkMf8qsjP
	 2PI2nQ3fYZ+iRR84U5BhYnW2mLatR78mTyFza2K0eSZAeLB1Rvn114WFCc2zRR47etfXv
	 UCBKUPP/Gb742MPJ6FtvvSXxC7A0p3PWLjwstjb2be0PmSHbTbvx+Tm8iuqQ8ENNU8vpS
	 8P8wNTc7IS/gfkQmvs6MCPqHKY07zzkbasW0LOVYyYmus6b+RL4zHnBWiceRQSbObxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I1IZee77;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31783606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31783606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I1IZee77
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so442766966b.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795347860; x=1795952660; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mQojN/7bt9QymOFRQB3HdvvKBXR3fZUr/nS9E5JcK9E=;
        b=I1IZee77LxDmrNyasi3atXcE2qebkvU7FtjY8rrf6OiAF9uV0R+PNR90lcjRPwO001
         C2QLtxhDYxJKDgOHxIq4u5jl/k0TD5/YwPqDyurFM9a67nkmUMhYA5Apgst60ty/6TyW
         4MqC88wqzAvN4z5O0+hKD1ZjuD4qRcY1REoSfRsPrQZwa4mCDdGXT7Ev09LGT0PFetu5
         Cm/yjEe9Q0Hr8r1iEdmLBDi4T6HibpIj+oa0FKfSwNw7dKWeYDIweB7KkSxWwZrRfmm4
         tETWeeWbRxk+b374PGBcuESqwzmTLlaJRDa/u+zYVgkxtyh2FrxuGKhOH1dYp64b62cW
         VFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347860; x=1795952660;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQojN/7bt9QymOFRQB3HdvvKBXR3fZUr/nS9E5JcK9E=;
        b=q8LIqu5R15Uk/EC+rZfPROl9jgKYxtq4A2otlaBMu9wSzDoz+gw6BaJ9yAAS07XR+I
         XJo05aPduDFWwsiw+rc37+5XiJUFvqAK56XfmdvWYG8bRgT/LaCH7693FxZp27MLmIIT
         G+8ML4B2h05GWMfdp7hDmUf8uviEhU+rrx3dUhoQFglUimoj1Tb9ec91XkRWZnB3v3jU
         fuDKY3Qe4Vo5r/0ovO1Xrp3bz4G36/x6iyCz9+RjOHWirQ3KtypA4DLKeDgFZWkFiSUc
         HedyiGy76eAtcauKPCRZg/BNj0eFSpSRevKUFKIbr1s8v7Ag+eqH8QN1coe+5BBtpWfl
         EPtQ==
X-Gm-Message-State: APuU4Z9T0RWlZyZx5cKPurRcOBtzk3ndqQsMQZYPa8f1Y3KBCeqBb034
	jtdK1RrStj4F2lNgvQHY8/7qAHSFHyo7hvX9i8vrLzZUdsNrgddskmTBVRrxubU9MXw=
X-Gm-Gg: AZFdTZeyBVr7yg2/9JBmdZc0Yf0ddHa2rASt00/4Tcqp08V22QYthPvI2uS5E2OokqV
	hItfKvEay4yWX1Ndfx+UCla8On6a9kqnUjCjoQOTPvJtpbMQLJrF07nb7yJ7xS81huAO9CJOc45
	3MS0latdhUaO/SyMUuT7J/j9XZCBmU225Kq5jEnOtznWDkpfGPo88hJxFfhjyclKFb1gh+cdH/7
	PZtdeTV1erzr1AbKvHY+3iBJvWBBwOlr25pGkVbgpzGjisMZagn/4FPujZihLXLvfUi23gmT6xW
	ddI6u3VBpe7/TeMTPpwN4+YLKZIKPr+ne2gQRzoTUHKty8QTfBq4Adbyi/TIUUhlKHFgGUWqTUL
	KMZay0DStgM31MacBmXDPhplSn92/gDgm1bureKlB+lWPzWH/9YxlYVk38xi6uQBw9xKdHZNEow
	lXBM046sbUdR6/uAK/kQ4YHF+bKfF1nf7xFmbh+o20aG/PFNrSMGWEk3FCKwcfUAbodEH2wlBZ5
	jWpvx1gqnP4A1oJReImYLHiPMvSLFWcT9ybzQjiTUsQYFONs5QofGWPgRZPBZn+rCrYigCGrJG1
	Fo6siHrwioZsYeU0jjjYXLGs5Ed0AQ4XaATNOR6NVfRX/SDqPWOUDiU5APWD1I4zNNtEm+Scjk5
	0w5GhLOGqtnbi2USIcsRsljLGkJwxWlL6OZtG7QztMvwlFySQZI3sXA2zjk7L3mJzdYD4vN93
X-Received: by 2002:a17:907:80c:b0:c31:7495:e57 with SMTP id a640c23a62f3a-c513acc24abmr724797766b.44.1795347860601;
        Sun, 22 Nov 2026 03:44:20 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae661b3sm303834666b.16.2026.11.22.03.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 03:44:20 -0800 (PST)
Message-ID: <f9887bf3-6dad-4b21-ae7e-84c1cac1a821@suse.com>
Date: Sun, 22 Nov 2026 12:44:19 +0100
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
Subject: Re: [PATCH v6 10/12] x86/msr: Remove rdmsr()
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
References: <20261116150208.1572254-1-jgross@suse.com>
 <20261116150208.1572254-11-jgross@suse.com> <awLTXAT-amcgoRT7@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <awLTXAT-amcgoRT7@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pFP0w09H0SwzyOKQiBZSWQVy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pFP0w09H0SwzyOKQiBZSWQVy
Content-Type: multipart/mixed; boundary="------------yQxnsU2t5ucXlaPv2BAfgj0W";
 protected-headers="v1"; hp="clear"
Message-ID: <f9887bf3-6dad-4b21-ae7e-84c1cac1a821@suse.com>
Date: Sun, 22 Nov 2026 12:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/12] x86/msr: Remove rdmsr()
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
References: <20261116150208.1572254-1-jgross@suse.com>
 <20261116150208.1572254-11-jgross@suse.com> <awLTXAT-amcgoRT7@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <awLTXAT-amcgoRT7@gmail.com>

--------------yQxnsU2t5ucXlaPv2BAfgj0W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMTEuMjYgMTI6MzQsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IHJkbXNyKCkgaGFzIG5v
IHVzZXJzIGxlZnQuIERlbGV0ZSBpdC4NCj4gDQo+IEhlcmUgdG9vIHdlIGhhdmUgYSBmZXcg
dXNlcyBsZWZ0IGluIGNvbW1lbnRzOg0KPiANCj4gICAgIyByZG1zcjoNCj4gICAgYXJjaC94
ODYvZXZlbnRzL2ludGVsL2xici5jOiAqIHZhbHVlIGZyb20gcmRtc3IoKSBtdXN0IGJlIGNv
bnZlcnRlZCB0byBoYXZlIGEgNjEgYml0cyBzaWduIGV4dGVuc2lvbiwNCj4gICAgYXJjaC94
ODYvaW5jbHVkZS9hc20vc2hhcmVkL21zci5oOiAqIFRoZSBrZXJuZWwgcHJvcGVyIGFscmVh
ZHkgZGVmaW5lcyByZG1zcigpL3dybXNyKCksIGJ1dCB0aGV5IGFyZSBub3QgZm9yIHRoZQ0K
PiAgICBhcmNoL3g4Ni9rZXJuZWwvY3B1L2ZlYXRfY3RsLmM6CSAqIFVzZSByYXcgcmRtc3Io
KSBmb3IgcHJpbWFyeSBwcm9jZXNzb3IgY29udHJvbHMgYW5kIHBpbiBjb250cm9scyBNU1Jz
DQo+IA0KPiBXaGljaCBjYW4gYmUgYWRkcmVzc2VkIGluIGEgZm9sbG93dXAgcGF0Y2guDQpJ
J2xsIHdyaXRlIGEgZm9sbG93dXAgcGF0Y2ggcmVwbGFjaW5nIHdybXNyKCkgYW5kIHJkbXNy
KCkgaW4gY29tbWVudHMgd2l0aA0KdGhlICpxKCkgb25lcy4NCg0KDQpKdWVyZ2VuDQo=

--------------yQxnsU2t5ucXlaPv2BAfgj0W--

--------------pFP0w09H0SwzyOKQiBZSWQVy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsC1ZQFAwAAAAAACgkQsN6d1ii/Ey/B
PQgAoAC09b+7Cf2e+6oFqas7qN6U4Qi4/PmmYHsKQ+mjaJNHDTaoCgvsQOh1FlNHFlOkl+bS7H2t
JXe8C4tYQQXdV9ihMlMawaflcJf1M0MiI3HxEIpBjn0sYylLSchWpC+3UY3amHnKeukkG0yJCzHQ
8JdoMbpRebpe4So3Mj0JNXErpwEE0RGQVHq3r5qX2hjAv1RHczARDxHsSLtOVSt7Ej4lobhJVQs+
NT+i2o20kbJUyqxpfZFfAmRKjG+Drc3KNQpTapk6BjzIwNjLnNhj5sYbyzHGwGp1iCcXI2gTA3P1
4qZ4UPOw/LZ49YOZoPgB6+7r1Kbb0hJC71N4D/Bmeg==
=2EkH
-----END PGP SIGNATURE-----

--------------pFP0w09H0SwzyOKQiBZSWQVy--
