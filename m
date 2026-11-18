Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004678;
	b=AsbRP5TaKEUNKyekfpyAi+GYN1Mgo7fcjKSZasvV22Lxrv/jLadDu3iVManBf7ARDHhb
	 G+RJbvUD1e7cYcO9es2iu2n5yTwZlxZlRM3j94lxWYUS4NUWkFjFOMfBgKD15taJ/vydM
	 xvGKrlpEaUE86hNl0JIRn112gyGqwR23jAlK2HYVnPpP1ac7OJ9+W4yJ0QydjcwKAGeuv
	 o6xun/DzPB6J7tvGbJ3Ft9DuRvfLSl3wRslnS1xTQ5k6s1LGkPF/kcTyvuaVXOLUr79yw
	 wchXbkbNG/yUz5W61f+fD0OI7Hg8Dt2DjQoXniUNObuInjbbV61DUwtqLizn1GlNylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=sxAPhPpblMYuGiIE5HmExOQjkl33NWQhdKGLsuMd3Yc=;
	b=M9AlEXCrAUmCCe7gGW8jgLXVZCvfLsy9xbRd6iN6BMRNdgwUUWyi11BiC5iU2zSjcZob
	 k5whf+N3ZT2RwNuFPA89RYjUiqlBooXQegwCkYOFmtL5wI/IHKpPqsysrGNLtV6wn0EoY
	 xVqKmZTympRxKrhgUSeuVcPzMb5DirfGBRv9ba044HRbtsbc9nDnDlnVjHCnwzsxFiyEU
	 q6h2LwZPLdTNXNmVvV+Q5P2CX8Kn5pMTyqKOr/CMIijF0Gp/FHrUNxk+RKRN+x35xOZe/
	 oPnDso9RKyVVNILsvl7DKE9V3EglKyAVLUCujqPB6pwQMAARkqdcC12ERRswNn50mQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JquEAd8E;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69145606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69145606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JquEAd8E
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso197122466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795004676; x=1795609476; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sxAPhPpblMYuGiIE5HmExOQjkl33NWQhdKGLsuMd3Yc=;
        b=JquEAd8EBG5lbV7O+y+9MRlsQQWgGZrGx0013GzuMWlysAPW/IUeoP3yTatR1ugyZB
         igfd8lXaEoNcOd0vsKEc5bvoCnekewP+m8xcba3oyZU/r9O/3Fa6PbMWFQGiyC7nde3w
         kipr+48x+3c5BpyCXFfEuzxVlwSQ0QPCMqprqsk3Lma1MlHTykvtYWI5kYmXdgt2ZjZt
         P/NaO+ZxOKaJdpuSzLfTRiuxAmYyOAUF5xLU6Fik09GGSEL0KMW6dh7jBDim1+NP7JFU
         x35g3I5gX2b6VC3YgYSiFlEn99uvgdstQFbhKPvPK8Ii4UM4lf0qoqPqCNS+upACZ/EI
         3JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004676; x=1795609476;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxAPhPpblMYuGiIE5HmExOQjkl33NWQhdKGLsuMd3Yc=;
        b=UiA+/eaaYEOTL6AGQV+yEMXXp2r/ffTM2zCyNB4X0z+ey7Gj+XO/crD5HzhZ4vxY9F
         D+p8y0vLwC5bodRc2tBYi3m+vwRELnSCPdgSFevbRLPMQbpiKA3NU0vRHfGBySQI/8Br
         CHiQHhhDUmJKltthWQAW2kaXF9NZ2Ag7DaRlvoh2Do7utJOi2RQ6pmQbnIGNADjyKERj
         yyLEq9Ca3n/JSUDRg1YNM4bQGw3i0v9qqrJRd2YzOaIBHfhVBT0Lc+FSTyPNFxFP4bau
         HH1jyCSL8JStjPXsQ9eYtZDtkTJDVAMZJK6QOdiVFwNsERuUtX3Z/UFOs3VDlaSwBwVE
         oulA==
X-Forwarded-Encrypted: i=1; AL+hErFWoeRdrn8nrKiopbCLAQHQdWqlyHc+TnH4GPcffEe26ELA5sjPBpYqEinVDhA3Sh6SoeZcoQO45fyhkNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gMo3iU8wqNhWwiCOQwmpFZu7YaaK0MyzY13IQrlxXI7yFNMOO
	yaTUuqniTlvESvMNHA1B968kfyE+upx4j6FU8/Gqv4nGeZQVjNSHYDozNBv59TsbFn4=
X-Gm-Gg: AYBFou2WvuJDj/GNmMiTKQDXABXYJd/wXL9lBr81PMQC2t6KxgC7OHhUmUjzSEyxHcV
	543yOFD4tTsh7w+sm/75XsLx1Bv21Cj9HXn+hQhSrANXwVMpxxSdzssbPlKQ+zmYYLSVTPAWPah
	5IvFFUIt2tYzi/1aXLfRLKuomLdctzw67iHOKQPvCkzaj9Hssrhi7owDITcZW2/WZ9XSHBMdczN
	M4cB8jvYhMTNdMUfH3yiOql8VlAymkcUTisvocNdh+2/hhTG72uUSpSOXF1bqUO/xwiEswCqi3h
	FsoZ2Oi0SYQzE5fKJ21hM0s9N9YLxQZ6sP2DwcUghP+f/mZdM+JLx7LgQL3YH7KfifHsHtcWYvm
	OU76v3GCqYbkzbEQBNFMRxjPgrQ2NYOHaWOuwSAYCmRvOwJ6xAxi8U2be5vndr3kY/BGFej3LtV
	w6WqQOYj3qNpolcMauXOOqHoZoHgZcS8Cod0P4kNDM4j6XeG/mq8BqPGIiI18d7v4D44ny0NIfB
	CnfrACnJiV8/u+vw5w2ypbNjiqseULh/24UY6c5DoIUdAM1PMVhWdYRexWDbaF6SY/dEoPPVwwe
	wF8o7MlyLO73UeKcQ8NlG6GsbFbPa/W5n4+ZRlsyocUA4heMSD1MBdvCjmqTMudRX9g+7oAm0X9
	PUszMAeqdEC231pWV+ct5WqgKKGFxpXLcdGuNI/snnaGBTtZgsB0=
X-Received: by 2002:a17:907:3d0e:b0:c46:7de7:e41d with SMTP id a640c23a62f3a-c50f36fbc1dmr497045766b.18.1795004675682;
        Wed, 18 Nov 2026 04:24:35 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca631d5sm88726366b.39.2026.11.18.04.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:24:35 -0800 (PST)
Message-ID: <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com>
Date: Wed, 18 Nov 2026 13:24:34 +0100
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
Subject: Re: [PATCH] xen/swiotlb: Check the segment boundary in
 range_straddles_page_boundary()
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Lin Liu
 <lin.liu01@citrix.com>, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
 <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com>
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
In-Reply-To: <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mFBiewhFkmSoI2gAAM0qpuu3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mFBiewhFkmSoI2gAAM0qpuu3
Content-Type: multipart/mixed; boundary="------------ElzD91B9Cefb9wGUNnQcsAy1";
 protected-headers="v1"; hp="clear"
Message-ID: <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com>
Date: Wed, 18 Nov 2026 13:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/swiotlb: Check the segment boundary in
 range_straddles_page_boundary()
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Lin Liu
 <lin.liu01@citrix.com>, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
 <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com>
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
In-Reply-To: <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com>

--------------ElzD91B9Cefb9wGUNnQcsAy1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMTEuMjYgMTI6MjUsIFJvc3MgTGFnZXJ3YWxsIHdyb3RlOg0KPiBPbiAxMS8xMy8y
NiAxMjo0NyBQTSwgTGluIExpdSB3cm90ZToNCj4+IFRoZSBibG9jayBsYXllciBhcHBsaWVz
IGEgZGV2aWNlJ3MgRE1BIHNlZ21lbnQgYm91bmRhcnkgdG8NCj4+IHBzZXVkby1waHlzaWNh
bCBhZGRyZXNzZXMsIGJ1dCBpbiBhIFhlbiBQViBkb21haW4gdGhlIGJ1cyBhZGRyZXNzIGlz
IHRoZQ0KPj4gbWFjaGluZSBhZGRyZXNzLsKgIEEgcmFuZ2UgdGhhdCBpcyBjb250aWd1b3Vz
IGluIGJvdGggc3BhY2VzIGNhbiBzdGlsbA0KPj4gY3Jvc3MgdGhlIGJvdW5kYXJ5IGluIG1h
Y2hpbmUgc3BhY2UgYW5kIHJlYWNoIHRoZSBkZXZpY2UuwqAgQUhDSSBkZWNsYXJlcw0KPj4g
YSA0IEdpQiBib3VuZGFyeSwgYW5kIGNvbnRyb2xsZXJzIHRoYXQgZG8gbm90IGNhcnJ5IGFj
cm9zcyBpdCAoZS5nLg0KPj4gTWFydmVsbCA4OFNFOTIzMCkgdGhlbiBETUEgdGhlIHRhaWwg
b2YgdGhlIHRyYW5zZmVyIDQgR2lCIHRvbyBsb3cuDQo+Pg0KPj4gTWFrZSByYW5nZV9zdHJh
ZGRsZXNfcGFnZV9ib3VuZGFyeSgpIGFsc28gcmVqZWN0IGEgY29udGlndW91cyByYW5nZSB0
aGF0DQo+PiBjcm9zc2VzIHRoZSBkZXZpY2UncyBzZWdtZW50IGJvdW5kYXJ5IGluIGJ1cyBz
cGFjZSwgc28gYWxsIGl0cyBjYWxsZXJzDQo+PiBjb3ZlciBpdC7CoCBTdHJlYW1pbmcgbWFw
cGluZ3MgYXJlIGJvdW5jZWQ7IGNvaGVyZW50IGFsbG9jYXRpb25zIGFyZQ0KPj4gYWxyZWFk
eSBuYXR1cmFsbHkgYWxpZ25lZCB2aWEgcmFuZ2VfcmVxdWlyZXNfYWxpZ25tZW50KCkuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGluIExpdSA8bGluLmxpdTAxQGNpdHJpeC5jb20+DQo+
PiAtLS0NCj4+IMKgIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCAxNiArKysrKysrKysr
Ky0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4u
YyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMNCj4+IGluZGV4IGUyNTM4ODI0ZS4uMTgx
ZjhjZWYyIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYw0KPj4g
KysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYw0KPj4gQEAgLTgyLDEwICs4MiwxMyBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgcmFuZ2VfcmVxdWlyZXNfYWxpZ25tZW50KHBoeXNfYWRk
cl90IHAsIA0KPj4gc2l6ZV90IHNpemUpDQo+PiDCoMKgwqDCoMKgIHJldHVybiBJU19BTElH
TkVEKHAsIGFsZ24pICYmICFJU19BTElHTkVEKGJ1c19hZGRyLCBhbGduKTsNCj4+IMKgIH0N
Cj4+IC1zdGF0aWMgaW5saW5lIGludCByYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShw
aHlzX2FkZHJfdCBwLCBzaXplX3Qgc2l6ZSkNCj4+ICtzdGF0aWMgaW5saW5lIGludCByYW5n
ZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaHlzX2FkZHJf
dCBwLCBzaXplX3Qgc2l6ZSkNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9u
ZyBuZXh0X2JmbiwgeGVuX3BmbiA9IFhFTl9QRk5fRE9XTihwKTsNCj4+IMKgwqDCoMKgwqAg
dW5zaWduZWQgaW50IGksIG5yX3BhZ2VzID0gWEVOX1BGTl9VUCh4ZW5fb2Zmc2V0X2luX3Bh
Z2UocCkgKyBzaXplKTsNCj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBtYXNrOw0KPj4gK8Kg
wqDCoCBkbWFfYWRkcl90IGRtYTsNCj4+IMKgwqDCoMKgwqAgbmV4dF9iZm4gPSBwZm5fdG9f
YmZuKHhlbl9wZm4pOw0KPj4gQEAgLTkzLDcgKzk2LDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50
IHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXNfYWRkcl90IA0KPj4gcCwgc2l6
ZV90IHNpemUpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHBmbl90b19iZm4oKyt4ZW5f
cGZuKSAhPSArK25leHRfYmZuKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDE7DQo+PiAtwqDCoMKgIHJldHVybiAwOw0KPj4gK8KgwqDCoCAvKiBDb250aWd1b3Vz
LCBidXQgbWF5IGNyb3NzIHRoZSBzZWdtZW50IGJvdW5kYXJ5IGluIGJ1cyBzcGFjZSAqLw0K
Pj4gK8KgwqDCoCBtYXNrID0gZG1hX2dldF9zZWdfYm91bmRhcnkoZGV2KTsNCj4+ICvCoMKg
wqAgZG1hID0geGVuX3BoeXNfdG9fZG1hKGRldiwgcCk7DQo+PiArwqDCoMKgIHJldHVybiBz
aXplIC0gMSA8PSBtYXNrICYmICgoZG1hIF4gKGRtYSArIHNpemUgLSAxKSkgJiB+bWFzayk7
DQo+PiDCoCB9DQo+PiDCoCBzdGF0aWMgc3RydWN0IGlvX3RsYl9wb29sICp4ZW5fc3dpb3Rs
Yl9maW5kX3Bvb2woc3RydWN0IGRldmljZSAqZGV2LA0KPj4gQEAgLTE1OCw3ICsxNjQsNyBA
QCB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVf
dCBzaXplLA0KPj4gwqDCoMKgwqDCoCAqZG1hX2hhbmRsZSA9IHhlbl9waHlzX3RvX2RtYShk
ZXYsIHBoeXMpOw0KPj4gwqDCoMKgwqDCoCBpZiAoKmRtYV9oYW5kbGUgKyBzaXplIC0gMSA+
IGRtYV9tYXNrIHx8DQo+PiAtwqDCoMKgwqDCoMKgwqAgcmFuZ2Vfc3RyYWRkbGVzX3BhZ2Vf
Ym91bmRhcnkocGh5cywgc2l6ZSkgfHwNCj4+ICvCoMKgwqDCoMKgwqDCoCByYW5nZV9zdHJh
ZGRsZXNfcGFnZV9ib3VuZGFyeShkZXYsIHBoeXMsIHNpemUpIHx8DQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgcmFuZ2VfcmVxdWlyZXNfYWxpZ25tZW50KHBoeXMsIHNpemUpKSB7DQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24ocGh5
cywgb3JkZXIsIGZsczY0KGRtYV9tYXNrKSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZG1hX2hhbmRsZSkgIT0gMCkNCj4gDQo+IElzIHRoZSBjaGFuZ2UgYWN0
dWFsbHkgbmVlZGVkIGZvciBhbGxvY19jb2hlcmVudCAvIGZyZWVfY29oZXJlbnQ/DQo+IFRo
ZSBhbGxvY2F0aW9uIGZyb20gX19nZXRfZnJlZV9wYWdlcygpIGlzIG5hdHVyYWxseSBhbGln
bmVkIGFuZA0KPiByYW5nZV9yZXF1aXJlc19hbGlnbm1lbnQoKSByZXF1aXJlcyBpdCBoYXMg
dGhlIHNhbWUgYWxpZ25tZW50IHNvIGl0IGlzDQo+IG5hdHVyYWxseSBhbGlnbmVkIGluIGJ1
cyBzcGFjZS4gSSBkb24ndCB0aGluayB0aGF0IGl0IGNhbiBjcm9zcyBhDQo+IHNlZ21lbnQg
Ym91bmRhcnkgdGhlbi4NCkhtbSwgYWdyZWVkLg0KDQoNCkp1ZXJnZW4NCg==

--------------ElzD91B9Cefb9wGUNnQcsAy1--

--------------mFBiewhFkmSoI2gAAM0qpuu3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr9mQIFAwAAAAAACgkQsN6d1ii/Ey8B
4Af9FK3RYkOO68kG4fOP5gKfIDvMD+bgZygGlFFECSs6KwOMCBfjMeA0VeVoQhF9TYgvPniNQ6S8
UM3VIdMqY4H8F1SxEgX/m+uWWbi7G/YUSo+VXfbk+pN2mhVyChLivuAdSJjChgEU31d1j/69Mpjj
Gc0EyKD+9ZpmehZV8hJT/RAlmMVGrO6QJEIOyAosWrHJNHFP//PFlYXYcQS+UI727plLx/M3tQx8
jvLbuFidC0OCOALAFXTWdNEaUd4PHD32wfJJ1vv3i/SrpYBWUu9WZ3Kwy4YdhIvYGlduTUrZMnsq
W2K9Zy6yjJPkQi2wEzTdSsLUCYUtY5omj7GrQgmMFA==
=6/Cq
-----END PGP SIGNATURE-----

--------------mFBiewhFkmSoI2gAAM0qpuu3--
