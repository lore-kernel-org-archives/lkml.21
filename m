Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070697;
	b=cQT9hKuqX7T0tVv3BuEYrxeonZbtbW+IowCecfLuIrHX9cNF0vkQVVRkO8EaS0nJ9x/p
	 +geue40EPq2Bb0XYtvHMB3sUuIE0GezJVRuYAMYzZpKyD4kTv4b0zHiKhZS63MlHQ+ahV
	 UCuZrdB+c7vuLxXnCJGgHlOHN4tmfFwURoVJQMQZrYoCJNtzK0UsUWHb60UOtxlyLwA8f
	 9VLmuF4Z+K1+I8zawSwAUv7R3jy/DWKuO6b4PxQ/ViD98RoWkJT5ozSsZJODNK+UIc6UP
	 FsCjuHpM36BM/fne+L0ifgkpeyH3cnyg8wwdiEanB90gpNkW3zBkrpRSlZaAF4OE2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=gx3IKd3H/J7FeV0UbqNeO9FYoO/jP2uhAsiBT/hJXZs=;
	b=p512HWQi+s+H+uFRUz+xKGLa29Ky4FJTtCWXuxEG3q9+Aqe25g4RWNVdn/unDRTZoNsQ
	 34vMSuzh5gCFzSBhDL2KEy/OXA8DNlbDeFKEiiG7rYRqJCvtGVY4GScFFAPOSdNcT8oCB
	 fioHNrUzOKqRki64uXhxGETF6k9B0mU952/kxCDxAuLUGkOM3flm13D52dtQ+Xr2Jjqeu
	 k3kTFgPbUjsHHwAfhAI1XZcyoM2KJgQ+tt7JQo52MwJxqmA7LTs8O//BPZvV+sgYqP+zH
	 6NXdd4nfhy+/BQ0BL7lRF2Td4zSik/LNOT531BCUr51tkRaM0OLuGlGTmckTvDSqraA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=APohbNvx;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9577606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9577606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=APohbNvx
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491846221ffso1481335f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795070695; x=1795675495; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gx3IKd3H/J7FeV0UbqNeO9FYoO/jP2uhAsiBT/hJXZs=;
        b=APohbNvxkAo6cTnwPqPwz5C10yWXSHFAKYuVO+bnoLPkG0Ht6L8SU1HC7AdtfTkmPG
         Ogpxq16+gmx7VBJn2vYZz9Hl7/KyOqDZyRbV90aVIFdIcAKy/+AP8IgaPEVC3/u99mhU
         NJRXN5Bz+zRNy7tRJDU1q4GZEMyIDpMJ3usDgiiQZPiSzBVOoRWV1i9qdelZEhoA715U
         wcTs8ujsJo7mSWb8lTvpZPag+xVg7raHKNqEZJ3mqaAM1VQ3qIG5JTuHLvAkA5nRaXJJ
         HNXuqv1g7C+QtIQggKRslPfgvHGlI6YPfG9ixnzAyD7aeh808OKE3yYcIUgvnKnHUeQg
         eWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795070695; x=1795675495;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx3IKd3H/J7FeV0UbqNeO9FYoO/jP2uhAsiBT/hJXZs=;
        b=LqV23Fg2SszD8c1VhNhc8PFhSjKNkTyQ7D2S+eG7Qk78TLQQA9fNhicpYuQKMBIUdC
         A4uGRdWDypuYjy/heLTTUmdZoyIkNc3aPX70ypJwzuRNl3bG85ccYJ8KG85ruEKLTisV
         pT2xYaar6nKVFMW80h6+caLfAYhS/nRAh24D3+gHbNA82nyZZsA/yXbylQ98ijse14mP
         Tj+PdSLA3hy9YETp0jKMQEIveLuoYRFiVX4CuPuUioCkefH31St2TSPZwzFeOHmFxdzl
         OD4bHYnU5UmGYhiTf8DQDGurZTQ3VuxuQmW3ZJe0TEhPwH9KxT3JRKSo3OR0A/ZFVqOE
         cBKw==
X-Forwarded-Encrypted: i=1; AL+hErGfwNZBAZ9Plq/cqktJEmSxYiVdjjlx4TqWGGpxgOB97ZvJxv7UiXhs3ygY6CLtKhAQSaEOf09vpF96hPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z95TYc6GcDEuo9k90WvPl4r3094ZCJoeAfvYY8EdFAEkPPd+6OI
	ccL3xQkK4PAeNBLLeRXj+IxPxyZhrpj4GZCgvZRUwuOykEKUJmitgJD/brTD6nzE97Y=
X-Gm-Gg: AZFdTZc7E7bUakAfAB4HGal1OiiCeJN9qF2zwyA0cAPN+sy5DqiHiIRy88c19J4XiKW
	RB33oPj/ie/QJUli1N1yraLReRECWHXJ1MBmTzaiMJ3JBxwcNHU4lsJi+NHg/Bnx06Ajowo5vv/
	peN6dVGnrXOmYijJVPMSWgxHIclWJ6Ym4ewTP6dzjjGFCol6hOyuVfBFBMP0NeydrO8D9XsH1Lv
	GP50hZvCi8TN/HowI0xRgeaTgHe9AyfIc/JhvZe3R7hNFnEQCqmMXraRLSb5utF8tYEqkr4aN0u
	jcyuyxI2VXp5rB/Pbkl0rfbSlxEHSjP9585ZLM1lIXZXuKR25aeOlx/3yYh449lurI3JKkeQ2MN
	PauGYvmRyQh3zNMyK+MA+MC/LWkxCkYyKknjPpxKNYQrH/7/nNTN3n0jt3ck/oRFwTRnHQf29AN
	E8MnyqjqrZVE0L/6O16kdgxHoHicIEgNeSSLD7ypwqyp5Th6QSDzimpSf3gnkEP0CGKEnZx7FNZ
	oB4+TqT/mqFbj9s6LXmvYrdMMv/IjX/G1dyNevXarsx/MFucfGYTLpVTrkRM0uE/m0NqnAZPX1l
	yg0CpBYTTtSDa+Z4+nEUww/plDCKkNYgsaNz7RL2bJlnmMG0Gv5REZDQhXYlN9+2yom2B8XcsGj
	B6qKRN8HkouvkbYOK6zRqOq3Vz8TJa+9kzdCdsspQDM/Wu+naXb90
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4a63d6a459fmr9772581f8f.53.1795070695314;
        Wed, 18 Nov 2026 22:44:55 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11f1csm9437350f8f.53.2026.11.18.22.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 22:44:55 -0800 (PST)
Message-ID: <c906fcbd-8671-4257-8250-9c09d38f6b53@suse.com>
Date: Thu, 19 Nov 2026 07:44:54 +0100
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
Subject: Re: [PATCH v2] xen/swiotlb: Bounce mappings that cross the segment
 boundary
To: Lin Liu <lin.liu01@citrix.com>, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, andrew.cooper3@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
 <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>
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
In-Reply-To: <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LIGiRNSFugMGqSq0b2MFddW7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LIGiRNSFugMGqSq0b2MFddW7
Content-Type: multipart/mixed; boundary="------------Xemoc0Pv264QPqL109RvJbGz";
 protected-headers="v1"; hp="clear"
Message-ID: <c906fcbd-8671-4257-8250-9c09d38f6b53@suse.com>
Date: Thu, 19 Nov 2026 07:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/swiotlb: Bounce mappings that cross the segment
 boundary
To: Lin Liu <lin.liu01@citrix.com>, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, andrew.cooper3@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
 <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>
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
In-Reply-To: <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>

--------------Xemoc0Pv264QPqL109RvJbGz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjYgMDc6MzgsIExpbiBMaXUgd3JvdGU6DQo+IFRoZSBibG9jayBsYXllciBh
cHBsaWVzIGEgZGV2aWNlJ3MgRE1BIHNlZ21lbnQgYm91bmRhcnkgdG8NCj4gcHNldWRvLXBo
eXNpY2FsIGFkZHJlc3NlcywgYnV0IGluIGEgWGVuIFBWIGRvbWFpbiB0aGUgYnVzIGFkZHJl
c3MgaXMgdGhlDQo+IG1hY2hpbmUgYWRkcmVzcy4gIEEgc2VnbWVudCB0aGF0IGlzIGNvbnRp
Z3VvdXMgaW4gYm90aCBzcGFjZXMgY2FuIHN0aWxsDQo+IGNyb3NzIHRoZSBib3VuZGFyeSBp
biBtYWNoaW5lIHNwYWNlIGFuZCByZWFjaCB0aGUgZGV2aWNlLiAgQUhDSSBkZWNsYXJlcw0K
PiBhIDQgR2lCIGJvdW5kYXJ5LCBhbmQgY29udHJvbGxlcnMgdGhhdCBkbyBub3QgY2Fycnkg
YWNyb3NzIGl0IChlLmcuDQo+IE1hcnZlbGwgODhTRTkyMzApIHRoZW4gRE1BIHRoZSB0YWls
IG9mIHRoZSB0cmFuc2ZlciA0IEdpQiB0b28gbG93Lg0KPiANCj4gQm91bmNlIHN1Y2ggc3Ry
ZWFtaW5nIG1hcHBpbmdzLiAgQ29oZXJlbnQgYWxsb2NhdGlvbnMgbmVlZCBubyBjaGVjazoN
Cj4gdGhleSBhcmUgbmF0dXJhbGx5IGFsaWduZWQgaW4gYnVzIHNwYWNlIChyYW5nZV9yZXF1
aXJlc19hbGlnbm1lbnQoKSksIHNvDQo+IHRoZXkgY2Fubm90IGNyb3NzIGEgYm91bmRhcnkg
dGhleSBmaXQgaW4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaW4gTGl1IDxsaW4ubGl1MDFA
Y2l0cml4LmNvbT4NClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQoNCg0KSnVlcmdlbg0K

--------------Xemoc0Pv264QPqL109RvJbGz--

--------------LIGiRNSFugMGqSq0b2MFddW7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr+muYFAwAAAAAACgkQsN6d1ii/Ey9L
HAf/X0Pm4J7+wBBKEjrIufQWB6suG5g7l9JkTCLi7GWNeLxMhwGj/TklDgnzrB+Ob2euHI5rLASO
g//lwldmRx37r1spQYDFdcgdYmWwvCmEbiBCFaffMZln2/u1G0rkEX/aNTagnomlkblqnQRYZADJ
9UwPjzh+DvvOEP6epdxoUK9n9YHQEMeRO67SBL8bhStv1HTfzdknZGC87RVxxcPkt2maPCi+oDcB
fsRMJaTF0SR+Ng71IdBN5Emke0k39vp7R+W2Na8bDmLnY642R5OCVvZ7cw1JT/JL+l2F1WG/dIUd
ncfCfbUfFbuxu9W69Rn945V8vvcVVj2UOWNqa8WyHQ==
=+1hD
-----END PGP SIGNATURE-----

--------------LIGiRNSFugMGqSq0b2MFddW7--
