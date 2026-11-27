Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815323;
	b=pERI3wZd3jxQkZ6W6Rvr+/f8CWfh5AqX86gARaraF0/FEMOiIreB26tMzm9I9ZedWf4I
	 ENoutFN4I71DSXN0OVgpQXW/vVmmPInBA+3/aWZALsvLEG6pFnfYmRyeWX1Puog7N4wl6
	 Ms8OQlc1Ahz0vDIeEBOKSBnE/sIXYmpY6yhV8CpYq+OFL8mdwVu6belK2rGDRGxqJXdIK
	 OaBFhgFkApE8d/IjVzAnMUIQYShKAfiE/3932vhJoMbcjWmRebKJUfGD4eZzV3scHE1ia
	 mn/yKl0SPtrlVAnj9btbvPTMK+zQ9aw9nmRsbqVdKpEJJdy3wFItnHbXFw8EOx/tVzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=EQrz89klcZs/Qlp8lS07CFDPryf2anjS7GMBb/fd0mM=;
	b=34BLrputxP6UtmWc1pVPQj66jkCtV5M66rqnuzFmLcQkbRjYqYagRwP8RD06WStdhvvW
	 ICBKeA2emaIl6rW2L1E3vlN2lH+Lap9gtU1BcaZuSCdi4zcW33LdU6dvFgYJJUJuQWl3f
	 w9FrGU4Aubv5bhv+uzaEgKLWIQO/EttD6/5AyNlai+cTZQ5EnhKYz49wjMQKayxopzB/0
	 YTh/GxGeTVeaAefi6dbvj6MdOug2xCrUbMNClzlSUn+rrMY0emLG0V1PfN/xZ2MOqzl9l
	 OBN3cCQXzsGNRMZ4apmQyKfiOEhmDmuO8dWAe7qtEvhfB8MziCjxzkAPt+keXlepSxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gJmt1T6L;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B42C606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B42C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gJmt1T6L
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b32daac9d7so47063927b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795815322; x=1796420122; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EQrz89klcZs/Qlp8lS07CFDPryf2anjS7GMBb/fd0mM=;
        b=gJmt1T6LVHWivgVkfjKL96ESjtD4uzqN2mIySSbeGeETVuTDTa+krMQWo2MSLHyU4B
         C8lrDd7YCFBkEJS10Yd86FqpM2zkzwQEI0WW7936umLjkl4I8K8siCcJZLy4kX24+dZb
         lWOrBZekr+010DWeZXfVeBkFd5ayWxSayBphR4ZEG0Tmg/xWh1fS7yvMtWFrANDcGSn+
         sR0JCoRbzWmTwV9H/r43hO9bsAwLi/hUbNgAMHtCk3yzflL5maA1RZ6B8Xmg5VLQoVNp
         xaQLxVd3U0brwMiqHFQ/bvCMEU2WDvB2i8RtLiz+sE39r3oYtyk8rr00UwLMVcxmRBrU
         qsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795815322; x=1796420122;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQrz89klcZs/Qlp8lS07CFDPryf2anjS7GMBb/fd0mM=;
        b=GpZBcuNlP02qx71SPMMNk5KZlp9sqmBAUu5SSF3eR2fyTYZ0SZjepn6N1A2Ggq2gOV
         7Ob+eAkkXJ4r0heTcrxosNEzVX/eBPXhUCnMmol5ZyVi6DNZ5xUq4pIBuZQRsTfn60IU
         V24rlb07U1OVxYlNmN2J+N1n7V+rhy1ezur4qO64As6sj7Ad6p2kH1RbmxMEhc3ljv/F
         jrxFKFruKbstav5HmCJf7ma/CqJmQmYQYGhd1quZceE9dkyJvXVYhQXj+pnz8S8NiUYH
         Gh4FBWfQptJp2CFcscBDLzC4j48k5uOSKvRlWiIWQBabbcH5e9GMe+4HI0/ZvdWZgTmx
         Iq5w==
X-Forwarded-Encrypted: i=1; AL+hErFHYSgCbUrplVJo7j7NLsRsO6MUHHGvHKr9B+tzxmyJwstug5xzKONQaoaasYgtBtOKcMxgIRRanTL8U/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+txSt1nniXlWGRbPMrl9xCUwy2WVyJ/VJkv8hR8nqbL0d0G61e
	6FpragFhFThRTBUS0hQcGMlymEtJyRiL5SpMVDNr/+s3oY+Vi8kc4ciK
X-Gm-Gg: AZFdTZdRCmO5nw2yyOy2hdpDrNaylzOWaKP7VY8BFpVz/BqwJ87IR3uCFdnlS4iRmaZ
	wZCaIg+L5UmewyAL/5f7C0oUFOOObWRE09JhpyMui5SNdmEFKt1czKzHRcVS0J8ALtrB7aDVKMI
	3bB2Q60ijrG2necOOtNPnWyO6pzFtHxA6HlrGhMdVKbfU3vYrU3qyoJboZKe/MA10kIpg8Ei7rP
	hagDr9rMoZVBhdtGn3NyPK1YolNk26YGjCD3A8rbK/0J2iNLqVwFdTulm0YmcM1by+F/VTkLrAl
	Nm7N/S9i894C4+xIirjlixUE7KYrJix+uhOygFHGMh6OddbY/qdk40VYVB1I8So2KxefvIOKEZx
	ElXwejC9oKFRP1alco1lupNalysFLW2m54oXPGSyZTE/dLhob7eL142zuOPdxfYPzIP+lUoR/Sq
	monrL5j1ehMbo1xtjuzAjbjSXJVg7+OxXg6fvvOEMnR5oGZtpYUa8xBadjozVCWYAS8AvVqMDHe
	vEKpEut2syuTMt5s+b4cUUYTdJYkijpWOUgpoiRsesEtxB2ETXqqHxI6UJDplHvkl/eWwUWI+M+
	Nwpi70swJVW2dlcXlwu9wb4vC30r0eHOrQ==
X-Received: by 2002:a05:690c:618a:b0:873:5c6b:a321 with SMTP id 00721157ae682-8b5204e6f36mr98786027b3.27.1795815321952;
        Fri, 27 Nov 2026 13:35:21 -0800 (PST)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b59a06f3e9sm5227397b3.25.2026.11.27.13.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 13:35:19 -0800 (PST)
Message-ID: <648c686f-c20a-418d-9314-4b269321406a@gmail.com>
Date: Fri, 27 Nov 2026 16:35:02 -0500
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
Subject: Re: [PATCH v13] crypto: qce - split the crypto driver into core and
 crypto parts
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
References: <20261127-qce-fix-self-tests-v13-1-80b601792901@oss.qualcomm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261127-qce-fix-self-tests-v13-1-80b601792901@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7UCWzSlEgqpg8FMa7inF0hPF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7UCWzSlEgqpg8FMa7inF0hPF
Content-Type: multipart/mixed; boundary="------------tOssjR4UVAwtbChK5nkfVU7f";
 protected-headers="v1"; hp="clear"
Message-ID: <648c686f-c20a-418d-9314-4b269321406a@gmail.com>
Date: Fri, 27 Nov 2026 16:35:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13] crypto: qce - split the crypto driver into core and
 crypto parts
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
References: <20261127-qce-fix-self-tests-v13-1-80b601792901@oss.qualcomm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261127-qce-fix-self-tests-v13-1-80b601792901@oss.qualcomm.com>

--------------tOssjR4UVAwtbChK5nkfVU7f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/27/26 12:38 PM, Bartosz Golaszewski wrote:
> Most users don't want to enable the crypto features of the Qualcomm
> Crypto Engine driver. However, they still want it to scale down the
> interconnect votes to 0 when unused. Additionally, more features for
> this IP will be supported in the future (for instance: for secure media=

> playback use-cases) but this functionality will most likely require a
> new in-kernel API.

Nit: Can we use "restricted" instead of "secure"?  From the user's
perspective, the media isn't any more secure than any other.  It's just
inaccessible as cleartext.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------tOssjR4UVAwtbChK5nkfVU7f--

--------------7UCWzSlEgqpg8FMa7inF0hPF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmsJ95EACgkQszaHOrMp
8lPc4RAAkjo4oj5lZM2B0agq3ylWBi3FLO62xloO/K6JPntFoksgw+zCLsWzWfwk
VNPnbsI7WU6k3sl5bMnRAYTmCXTkmKA1CTfcfjBremHY4z09iOfYVPKzqmWWDb0J
cgMkygPL9s8W6hOfQhyjjhvK8kKnd+/EIxMx5R/NArH2XvqTUH8uc1FfJ+EP6t2V
Z02IW1SMnDiXEgGhBpH2r2tI5dkzBon9f8sWyLNdu4IQryMsgUTE2/cyQH5WEHoK
xfFgI9KXv/aJUI//Qsfq5XS0Da5oq0Ccfl+ZSecVqx0Z6HnUhunDmq9f8bkp0eIP
ecWll3MSSEHlpwlqHzeuCWJ0BzJ1a6FQmc+dRrbL40+ItWFu6wht+x6GoDaNlzeE
tje7VqRFnE5ovwNAg9tigucUM3WKEEN5PCJfHsnx4Z88r0FK7vr5MMHmuMqwSIlT
CvrREmoQTLmR1EKGD0KqjaEl5ObT3y9y+uifFMQ/tNf+hzhjE+tn3gfM2x/9/Ojd
v+AFz24yxAM306lpUBtKCTJSwTUeTKsqe0WeDoPQDFZiUFzvzjArvpX0aH0BnJmA
tOWtjCRbFnZFoU2im5JVYSeQxZ4+w6xXNfYf6O8D4/tpiFbXUMfg1udWpkzlDtea
dAzpjn59+9ybBZgzXs4M/Cgw5BpaeOuBvKQupr5cSKk4zXGoOfk=
=SDP1
-----END PGP SIGNATURE-----

--------------7UCWzSlEgqpg8FMa7inF0hPF--
