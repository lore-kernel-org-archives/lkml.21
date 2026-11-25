Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605283;
	b=CKeVheKMGrp6PFNRFoX4qxDtoVDeUDM1hlga+hRaM8TBPdocZyJurOriRoGth+/zp/sD
	 EbFZxkC2uAz6p+k5N1HTG++E8Z5ArKGzLzZfNdaDD2SjtvEMicvBS0f18b8F0Q1j/QFGJ
	 mBNyogmlMXuRwPvk8LonSYOFTHxaWgHzmPrFTCqCz/pqrzU1YQ7IXTZfL4Y6JE540EMWq
	 DTThZo24PjQvElmJALBWic00bKIA5P+qdZJ7uxblCZSaLnj7t9zXfP+7GT7pt48zfReQR
	 JsMF3bMFszDRnFo3f6YLS7E0kCecvuaPQYGvy7bjURhFIcrAYXR9D2rkSaZs8IMETbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=2yhJqGJwsokUrMpl5I41eEFgDlckzi/juni7CRCekDw=;
	b=kM30PSMqAy2RgUbMY42tqhYbzjcJSKKOomGqy8ai6FIkpjih5TX1Moczr6cKdSjwCeGp
	 H8byNnxPvSdRWAK5R1xEvYF8lqdY+IRtl52iuUlb7OxrDd61VTGbLBR5sZSC7EMXr9E6F
	 MZdA5Von0KwKM/eNUGBDLtYpTKERYNFePpyZhJUwwPL/kOFriaD1Y7FfjuBGW+OTsLIA5
	 kpeiJG0+Kv3eZIXCI4L5XGA/4KomaQ0Jkz7LDsswScZveI/m+M5cuYjeIfPKQMDwUkJaU
	 Y+reXLMizZZ2xdFpfBYVWvEa1v4ASqYzAG5rwYu/VFscvVKHj1w148KjwO06GwofypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIAJO7o3;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614E0606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 614E0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIAJO7o3
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d581da0aaso783558866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605282; x=1796210082; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2yhJqGJwsokUrMpl5I41eEFgDlckzi/juni7CRCekDw=;
        b=lIAJO7o3wJbLhm/w72Q8DztSLynxpak7pj+8/V4bXpgg8ofj4SIw5jR/Yp7gSvkrE1
         h6ftOmUwk2EqE1eiwW8Jk3AymfhZHJehtJSIo/8BXHf5zTpSz5yobRhESj+Xxk4vYPzr
         e7ZdYnD5pb1HhyXgQd7pYNMIq8eJAv/Vw8uSCvGguU98Urnx9Ob3KWVsQyIEkH18lsNs
         PiJ5wQWO2GINSQF6y5KWewYIgYpHZTlNFMeU6HBkulCPFrp0qmnBFs2pdXmt4gBWFxem
         cED6bBqyYk9JWcJcYsl+D3IfZLFe4RBsW5iVqLQD5WAGZxQnsmYva3PHOxb5HS1pBqO3
         7zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605282; x=1796210082;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2yhJqGJwsokUrMpl5I41eEFgDlckzi/juni7CRCekDw=;
        b=erliWudPqDUEvj7NaaX3gCfbB1jgwI/N5otzsYLvkPcUVeFR+6kAkjXCTmOVK1EIon
         G6S6KC9gXY6h1GbkNR8XBNgtMZjHp5xEVGlyawOiCsJd+6at6d1Ez+NiEDlkD3d2fzex
         l6mTtW7WMxW1G2iKtbYKsJq1zzArTIdJ6Y4eZmwM/aIzVrLCz1aEdvVBl0+0cxavCyQr
         YXr6fKbol+cuU9CCYypu85pAnQAGEe9d1cVUVV38MWM6AtSqPcvI2f55dh/7GmZqnsZh
         JOLf3No5PQ/c5OpNmSNv1ckFIkWcYjFqoJH44bwboLELN5OsPQbUzQD02PJ+K0z5Fytu
         xdOA==
X-Forwarded-Encrypted: i=1; AL+hErHPTQsg9F0jXsLvutMl2DeWOybctKi2YcABqptr7b7uJ4SmYGvRzVMZwGAyyTkXmnKJTjnV4TjU7c1LFZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RKkaRA/6yoVYlS+K5L1BZtaggX5hM6ePQY5E87TgOHDrKs14W
	T1rwHrH6SiNgNcyktr/ocmrHgF7PMX6fmQj3SFg1dYXBnPr4fxyg0CoDrW+KWrwq
X-Gm-Gg: AZFdTZfWojMI4D3yjA6MlD5JTDuTLEvWaA1cbAKPB8SYrgArEEw+i8x6JAUoO3hub5i
	g3jqfPzt/NFCtxZbhMhe/ts61FdtaXc8vSP0rIJGnCIp7Yi09DeG6PAHAFnmjoo5kS0H/G7eGrn
	QRzvB2B+KF3jPQKjTuxavEgQRv4Ar45OWLx++GUlFCZkzgIwo7llrkBgnVcd0WJ2q0w7aFBh2dJ
	jFtYrSSqfueM11o9drL2jXhtqzA3HNuEZl6Q/lDWI/GJ4SklBKPi9Bd79NgHSzbhr0+hH90T6ln
	vvjZ4+gaDcUJ1tSL5twDhUusiWUQLp4DB2/pE/fzyCpP0POlGXyVl86YVoXHRrK0BsIYZqnGJ0A
	S48UoD7dNqS3kZ4KvFsC4mM6/FyYnK6AkLxN8b0Jg3i4ip7vJ+z0/9DZRGePy+DleO1fHObXMDp
	7JlW2nAkOzsrgLGU8AQM/bLU7uq2tbr1tRQpfPgr6vCgp/bZTQV0zeSWeEiQryQpeHHT2VyzlPR
	eeSsBI8jzn5RDIr+LQ8YRPsFUXjseyJHxWDnjgRCJDjSxg0NtR9+mfBMp5KbPSKKkRF+ffJAXhZ
	vN1obHiAgjtXvXdVH0VbnmNNeHXG1YZ28dn85j9dG9yNZVelitb0FuWpWyrjMWYKX/SRMPVvs0Q
	5GekvGAygBA==
X-Received: by 2002:a17:906:17db:b0:c46:9ca9:f524 with SMTP id a640c23a62f3a-c513ab404cemr1092017666b.32.1795605281488;
        Wed, 25 Nov 2026 03:14:41 -0800 (PST)
Received: from ?IPV6:2001:818:dc1d:c500:21cd:8ec9:48da:59ee? ([2001:818:dc1d:c500:21cd:8ec9:48da:59ee])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c513afec08asm623083566b.73.2026.11.25.03.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:14:40 -0800 (PST)
Message-ID: <174deb71-d920-4355-827c-73237678b82c@gmail.com>
Date: Wed, 25 Nov 2026 11:14:38 +0000
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
Subject: Re: [PATCH] PCI: Disable async suspend for AMD rev 0x62 ACP and HD
 Audio
To: David Glushkov <david.glushkov@sntiq.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Mario Limonciello <superm1@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5cdc7ef0-e18f-4afc-96b2-ee4e92bc29ee@gmail.com>
 <20261110125025.2753861-1-david.glushkov@sntiq.com>
Content-Language: en-US
From: Diogo Sousa <diogogsousa@gmail.com>
Autocrypt: addr=diogogsousa@gmail.com; keydata=
 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
 hq9XZVX1eRVA
In-Reply-To: <20261110125025.2753861-1-david.glushkov@sntiq.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BUIOuQif0viBBgLE7Wgu5beq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BUIOuQif0viBBgLE7Wgu5beq
Content-Type: multipart/mixed; boundary="------------Kr0y0KJY202boYqvCARElWSq";
 protected-headers="v1"; hp="clear"
Message-ID: <174deb71-d920-4355-827c-73237678b82c@gmail.com>
Date: Wed, 25 Nov 2026 11:14:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: Disable async suspend for AMD rev 0x62 ACP and HD
 Audio
To: David Glushkov <david.glushkov@sntiq.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Mario Limonciello <superm1@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5cdc7ef0-e18f-4afc-96b2-ee4e92bc29ee@gmail.com>
 <20261110125025.2753861-1-david.glushkov@sntiq.com>
Content-Language: en-US
From: Diogo Sousa <diogogsousa@gmail.com>
Autocrypt: addr=diogogsousa@gmail.com; keydata=
 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
 hq9XZVX1eRVA
In-Reply-To: <20261110125025.2753861-1-david.glushkov@sntiq.com>

--------------Kr0y0KJY202boYqvCARElWSq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gTWFyaW8sIFZpamVuZGFyLCBCam9ybiwNCg0KZnJpZW5kbHkgcGluZy4gTWFyaW8g
YW5kIFZpamVuZGFyLCBpcyBhbWQgb2sgd2l0aCB3b3JraW5nIGFyb3VuZCB0aGlzDQp3aXRo
IGEgcGNpIHF1aXJrPyBPciB3b3VsZCB5b3UgcmF0aGVyIGZpeCBpdCBpbiB0aGUgYWNwIGRy
aXZlciBvcg0KZmlybXdhcmU/IFRoZSBsYXRlc3QgYXN1cyBhbmQgbXNpIEJJT1MgYXJlIGJv
dGggYWZmZWN0ZWQuIFZpamVuZGFyLCB0aGlzDQpsb29rcyBsaWtlIHRoZSBhY3AvaGQgYXVk
aW8gcG93ZXIgZGVwZW5kZW5jeSB5b3UgZGVzY3JpYmVkIGluDQpkcm0vYW1kIzU1MjkuDQoN
CkJqb3JuLCBpcyB0aGVyZSBhbnl0aGluZyBlbHNlIHlvdSBuZWVkIGZyb20gbWUgZm9yIHRo
aXMgcGF0Y2g/IEl0DQpzdGlsbCBhcHBsaWVzIGNsZWFubHkgdG8gcGNpL25leHQuDQoNClRo
YW5rcywNCkRpb2dvDQoNCg==

--------------Kr0y0KJY202boYqvCARElWSq--

--------------BUIOuQif0viBBgLE7Wgu5beq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE85oHCWXU2i7ehQp93pPwU2yxodUFAmsGwx4FAwAAAAAACgkQ3pPwU2yxodWb
DQ/+IkbkSqeeE8Rp9F+xNfCNMwltb7s+YLccrNd67o32nfPps5MzcrQuqBN18i7Bpg9Nzhnw/5Hc
hXUK3ErBSVtReVTu2EAoc2t9R0kjlWklO/iUhrg8fcELfxlwReljwrRRneBet7XJZOuTsur90Nuc
rljJ4JTDzZENzgk2zntkxxf8p9sXePvJ0VyOdarg1TFSbTYJPsOb242ZrF/g2McQLI8eQD120s70
28t4SDh05y7MpFWoa6cf0oFEQ1MMGnM5u9Gd0weJt5xdGpNAk4ua5thU5WWgfaWCaHAoOz7F+kyx
cOG0mENn4/NQwlNB3neDrJdStTuQiXBNBwMUk78AIO+KlrzivHGwLoE7xF8yCjVIQ/9BiUPAycxi
UJhJxlLEF2YmkAwhxJAjPe+7Bpo9dPTTqzsAGeKOm6u1V1kdHppEgCF2VQfKwNj9/F+fXn+01gvf
TDUZ3jsz/ktRlzrnK2cVNDoDv4HSDCaFMwNeGkKrs3uUgJwbM0s8T3pRaxQOrQqJJD1j0QmY6FeL
js4v3n1cv300iRMo1ciKVaQBGaod3mXUffdNnsIdx3TR5qZxu4pJSK5ewNHnDL0O8+cabyJNg9Xw
zOPla4Y5FDcWohsU7NZOxNr+CQ1Ap1gfppyG9YsLiRN4YsxPCOO7tJBaRl0Ck/IxFl9YPUr5O14T
wJ0=
=haqq
-----END PGP SIGNATURE-----

--------------BUIOuQif0viBBgLE7Wgu5beq--
