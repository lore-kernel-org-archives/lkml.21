Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347789;
	b=T52yg7lsmsYWbkdjCfBEgheePV/IR91TnIW3x7FuPnLebtDeWrZugRzeGJEvuJoKqBv3
	 t5fGVcXY0seOe3hQ/ppqQnKsEbWoJPTXa4ovAT92yWnSPl9g4rEHxSRQrikKVAnskndno
	 x/7N5yLaQpBlpUOJgxNyRgpul0vKcVufv6Y62i+Es4noE3+jArHOQTyTjtBamFJPzcvbM
	 DZ4/CPQKRW+cTZT3ZkP+WWbAtc2FFLohormGVLc7LMySp6zWJK/UrNPe/Cv63lRJwhSWN
	 Msp2zakZja3kSk4EU6muqYJ0Y1rBZ5L/oXJKvKzWPJvEo02YmcGz7YweYqQu9icn4Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=eAkdlqrrBcgjipYbe+TRNQgwtyUpzgLAi8GUr+uDAGc=;
	b=bk97jzR7ktgMz2HttJVbeV1QVJa37V6GbPtxNCHsNplOJ1QMQ0/A34gGpyBvlB/dYEzH
	 1nLHu/07jyprapeuivHv9wG3b/eIyFD6jov3c/Cp1ILqqtFuQxuVuO43zX+aT0n5JiW7X
	 ObhExs63XiPx08x95FGF1HTR2pYa9B+vYgZGtpCIxe+Np9r92PnB5h5nSf9CPfq6btFlf
	 x2xSEhHGS9ps52KbWLoiuMwBbFO2vpqOfPOPY25NMf8a+3rwjqTTSk7BBBM3FRYe7Z5I0
	 +fg4+s/NIePzq92xi9shN0e2XZCs5d02yLHkJM5UoWy+g7sDhZ/Fl7owsEiX0b0hd/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gt0aD17q;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7244606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7244606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gt0aD17q
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2537057a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795347787; x=1795952587; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eAkdlqrrBcgjipYbe+TRNQgwtyUpzgLAi8GUr+uDAGc=;
        b=gt0aD17qRa1MhmE14RkMQ7wPsSD06YVs87CkLeBPty7m/yM9klgLpkqFPkLxD8Sie8
         e9rr4IHe+LHXbCs5qsX7euRYSrbHDLXEJJb/VlrS2c04oJ7Mllmybn0gHHXoekM46t/X
         k40PWh/Q8CjIAnChcMp9lHvVoBYdTfse30LkDLnYSzrbaQWMYRmoeSZXHuU/P1T/dcXr
         pcSUqwB1elHwFPfyUB5CE/EpJXOTJ7E4GNH8LAST+vR7G9CC6EyXlBPfsleHnvEhKhSW
         pL6RntVIli0TCUap+1iCwR10T0hc82p1X3Uhw0UraD63Yrp8rVZQ5Xc1WmOrBacYZPWq
         UNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347787; x=1795952587;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAkdlqrrBcgjipYbe+TRNQgwtyUpzgLAi8GUr+uDAGc=;
        b=hvASXg+JBu5Y1SjeayYkfSc2A/0beo+n9jJ/awe9gogancGdaUhh5qmcHt2G2rXIfR
         P86cBhkxKkBa6kLiQhexTsgph6ROwHlnDYur1ht4e+VnmqbpWSxMaafnOv84Pv7NP32D
         3J6cqRSeHg/6G/xmn74q/PcT3UCGCCt0K6GQCI0UNgtmGnHrTzyvP/wvdGJg8RYZ1Cz8
         kJH/cjAyWBdqJ2REjXr7dJj7gFcP3qPr1J73xwOqst25q7ygrFimXVJ8hpc4cYQqlcA3
         GtpCAOYeBxHmBGlflKqukusXUidP3xkzspT6nUf02cE2FIswh06a73dygHVQb/6WP7+Y
         fxIg==
X-Gm-Message-State: APuU4Z9sgimKGVlR5r79NLb+qVEsA8wmB0osEbvSAsRQlP5hnwLiCIVr
	FnEqjBMTg3CzzjPZ2cLfDeppW/e+JQgeNmF3HRTaBxxjkI+QO+tdaO2DjdhgMXvvzGo=
X-Gm-Gg: AZFdTZd7/iTGUs5NzxOP0g+nP69mdgHM57sF1S3DGPUEXUmfu51Qlms4xScflyvnCV7
	1ytX3eq8JQaUDDrjDXMgRi7H9aaTM+PIySUyz7oIPAijb6Sscw6+L/yo2mjW8fBILn3KGTX4SlZ
	u6iIHrnTCq0fu1zt/Xjkj1zZZn+sUSbdO2g6rDiOaoxaXjVzLSorUSjryOXAZ8kS9/7LvL0l2VS
	VVtn5DwL/yNWrc+Q0pflA4SpMbbZeK0Z3gLNvRWIpJEKyDrVSj+y01rXnHQi14O5Jm82cYquro+
	b/Rpvy8cdVLXE+wphSAlmwlTNJ5DVcbrHo/MGul0FycuvGeYFmjIrm/bVeRy9SVJvBTZyAY560B
	U2xsOC5UTDECcHDZx/NFWXcgpr1hEoQxzm0ckAD46hPxasUGhxS98PO53sDbzWSxr+j17wOEPFG
	KABKcFJLdJHfEgrBSoBEQCi36DfeXIwlV8majWcXwXKOfoaAgWnutKPnno4jtrnOHzWYVirZKw/
	3HvUFmHJNMJZ8DGX4gjBdm3+dXauOKKfyQxkh5kgcXrQW7HTF+KLpllVq+ijHy7j+d2TdG6HFOO
	jfEJDklw2qHB7z7FUdA0MifBeXQ/9c4IACY6aiwbnlDUPVoTMTZNbljGJejUuMrD0KEFBSulCvW
	A+/FIp8WhUv7u9xeqjdC7TAP+kplV5eVNJYIPD0yc+1fWD7Q/rdA=
X-Received: by 2002:a05:6402:46d1:b0:6b6:efc4:9ebf with SMTP id 4fb4d7f45d1cf-6ba37ac75b5mr5225605a12.0.1795347787156;
        Sun, 22 Nov 2026 03:43:07 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm2326254a12.37.2026.11.22.03.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 03:43:06 -0800 (PST)
Message-ID: <b462728c-fdc5-4691-b1f9-ebb49a8fd63f@suse.com>
Date: Sun, 22 Nov 2026 12:43:06 +0100
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
Subject: Re: [PATCH v4 0/5] x86/msr: Drop 32-bit interfaces of native MSR
 functions
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Ben Horgan
 <ben.horgan@arm.com>, Dave Martin <Dave.Martin@arm.com>,
 James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
 Drew Fustini <fustini@kernel.org>
References: <20261116160259.1579333-1-jgross@suse.com>
 <awLOxw4B1fgdwsTN@gmail.com>
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
In-Reply-To: <awLOxw4B1fgdwsTN@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WNruTCErgDYeds9Q7ehE1epi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WNruTCErgDYeds9Q7ehE1epi
Content-Type: multipart/mixed; boundary="------------OFguAJS6VS18DL0y01COZE6G";
 protected-headers="v1"; hp="clear"
Message-ID: <b462728c-fdc5-4691-b1f9-ebb49a8fd63f@suse.com>
Date: Sun, 22 Nov 2026 12:43:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] x86/msr: Drop 32-bit interfaces of native MSR
 functions
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Ben Horgan
 <ben.horgan@arm.com>, Dave Martin <Dave.Martin@arm.com>,
 James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
 Drew Fustini <fustini@kernel.org>
References: <20261116160259.1579333-1-jgross@suse.com>
 <awLOxw4B1fgdwsTN@gmail.com>
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
In-Reply-To: <awLOxw4B1fgdwsTN@gmail.com>

--------------OFguAJS6VS18DL0y01COZE6G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMTEuMjYgMTI6MTUsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IFN3aXRjaCBhbGwgdXNl
cnMgb2YgdGhlIDMyLWJpdCBuYXRpdmVfKigpIE1TUiBhY2Nlc3MgZnVuY3Rpb25zIHRvIHRo
ZQ0KPj4gNjQtYml0IG9uZXMgYW5kIGRyb3AgdGhlIDMyLWJpdCBpbnRlcmZhY2VzLg0KPiAN
Cj4+ICAgNyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMo
LSkNCj4gDQo+IEFwcGxpZWQgdG8gdGlwOng4Ni9tc3IsIHRoYW5rIHlvdSBKdWVyZ2VuIQ0K
VGhhbmtzIQ0KDQoNCkp1ZXJnZW4NCg==

--------------OFguAJS6VS18DL0y01COZE6G--

--------------WNruTCErgDYeds9Q7ehE1epi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsC1UoFAwAAAAAACgkQsN6d1ii/Ey9c
Kgf/SW/JuJa49YJjngkcq1rGtyzm+/JutjA6e6V8vZqDNk0EPOBnESlkfjZkpJpQt7h7M9e2PXxG
Q4GtrN+zKB2x9Gyj7U1dfGGxnttTu5THVgsRgOxA1Vy763u8nNdV/PnpEge9QpNLpSyU/LixFd9Z
Mh2bTG0aEFHrJjrmsiBJ99B1Jbs8pATTHgM/49tnDHA6q5qmIvHGodUG+apkCldIUP2VbNAfy9KF
wZ/jnS3nzeKj7SzNfZTTnVTHakuoDoPsv7czqe6MwrKVxFvgfb5QKsLxxFbSlipPFJnKw0Jommdr
lSUy1tpAXkVvd6Q/6F1HdxfYpuzd3RzX8nB7y77mrw==
=+5Ve
-----END PGP SIGNATURE-----

--------------WNruTCErgDYeds9Q7ehE1epi--
