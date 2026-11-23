Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442560;
	b=VjrD4BzQC1GI19m26ajqEMOKQJ1pq8/DKJIT5AziGQTVALtAIzk68ByANtMjEUQONSuG
	 3DfNlApcrr83L1lQm8z4JshxmW8xpC00QwD3eDl1kVaOE04Qe8jLXMAdbysCxFh/4iR+H
	 VXsa0zR5/GUn0VyKtGvzqViE1SLWbfs8tgO8k6QVayI4Hqgpss7PE0t84K4j2xU1YDnbD
	 HgxShly7TCHyg8YqIPK/9DsbxrqyPxLh22DoQ2UQsUroEpPKhavXWmby10GrzG1XkxivV
	 5tI0AKTs2fcRT+w/vDYzc/sVQ3fa1Kp2JLZBE49GFZBcGgxEkXvef91hqf8RsTNm9SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=3/3NnMftymq31jTNwytygShkMtc6etp5T9SffMvYwsc=;
	b=NGuUfyB9r5T1vgypmudMQ/qj/EEwKRwM/OBBbJyh5tc742vsYZ98Z3tvkNCp4uj7J/bn
	 d9q7Qp6DuaKEpNRrfUp0UK+rcLcZ/yNqVqSnXo1FRZXjydnkZ9AA/BhaztAvjJOD3DfHF
	 wUvfOVriYKwKJIJkY8lJ86d+czA+1MrqPrgjL6FH/wmvHN0g13twzipbUN4ugCYhbCylu
	 tRMvD5090yMqltxFEk5P1rKdRxDRA5KDSY3Mged9VviBb2NyYp2eZxvEkiiUoMq9HPk5z
	 uovBraZn9nB2/cv95Xh5VfbiHx35GDtE/bNfNoTZBfoA6IAiVUHeLtVBbHeV3PCJeeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fhAj3P3Z;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF43606A6A8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF43606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fhAj3P3Z
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cdc606b47so562572166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795442558; x=1796047358; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3/3NnMftymq31jTNwytygShkMtc6etp5T9SffMvYwsc=;
        b=fhAj3P3Z8br2eyC8mzuf/0H9cWjIIu3LrYWWLhw0ewWbWbBHK+SHhmfMegmuizuaub
         GdJhaP41zEbEGijwMseRHoCEM3c9r5OxhNCNHPD3wk5zCieaO0J+eLwWuNTnimS0tFGM
         Qmo1kQ67VR53GZLUKdUP0qi7GMEGOaL/r3/BNvT046cjUVvDZp9uinRAOvLsf/PN1Xtv
         eiMaOvHD8BUfPskHcXK0i42FWdmEmfALU/NLY4Ck+0rYKj9e4Z//Xl4FIhSE7WmXGjbD
         ISD3EgdiRhNdBdkGkH7G7Z47vcfL+s7uxzqLgp3tWxr1TcfKkxqA66naGryNLKvJAx51
         qVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442558; x=1796047358;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/3NnMftymq31jTNwytygShkMtc6etp5T9SffMvYwsc=;
        b=F4dkJoWhzYU+iIyuqXpm1ohj1Wy5E3QSj3agjItd8F+iKuyfdWTOqbihVSVyB5y0Gc
         ZTm8UBQBNd27e64dRS7PQOcfz1J8mkflI1QErrDnqnuDkq/SUdA46Mi9b7mCco71Bmsk
         KPA6H0EKosB5uV2UA8POkEM7dlTPt1HEznree/j6SPzcX+wKm6NE2RzAegRbUeellZNC
         U8fhywVmuIbiOwPykNkhLFtF3gXSPaQ/cLpn1NL04CYU7UiecdT20bG8r1qJvtFZQFt1
         od36esoD4i8yizz3wWm75biNU6a1hH9rEVYuZmbjBDIySUzaDru247R9DeK0uf0PNJDC
         EHoA==
X-Forwarded-Encrypted: i=1; AL+hErEhBPNIKOquXoLYk7hj0Jcekxhl5dCyGFs1nmZDl1/bxmPjvyewq7iY9Rc5MXpkoJNcRqN59eobr/MC1qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MkEP9bmP/GgXDS3+32D4Tifcar7xvuzB5/FuMYrfXHafb0sPE
	BTO9XZUp4VSG6VH5QzFwclksh30ZB30gt5U8+8e6KF1IeabKDyRXa6Afhcy0UuoDjCg=
X-Gm-Gg: AZFdTZdO7wBhzMd6nDQenfCstoywdmqMSJunOb8AQyPgMWADT021URG2w6AfkIPY9lP
	mEeqUC+D42oH8PvvLQjr+6TlX+eWCBvwVr8dpEp8Hsj5USxjx3l/McPlDC7uA/TUwTtiAUWtBqc
	PpCqCrqun2BOxD0ZSk5AWaq9afIVXOaxeT4t58yXQ2UgeIzSPNTECcCgxRep1EJtsn6OlVeQgd8
	c3Asip2kcxRG+o+UAszJmA1oIIprcPJfFQSmTbFa4q9ut9FHsv559JA4mzMcrQPtYlwnWA1JaDQ
	lJz8WIGFnhy2sLGwJCDJAStU0Lk1pSna61Dv2/fjp0m2iAOdNHoJqEjwJhIcqeipw6UvW0nRhye
	Wcj3WlRecfXLhW86qW7TgdrE0hE6KLVHgvqYSbBjQo+mkUEZlcNjSjMaT4pKRddrMK5o6epOqFD
	F4u7lYavMuXetAK+7ryEOy1IbOhPMU04vYaM1WTA37G7gH5CmSv2GusdWE4XOnKmWlO1AWuQGwT
	jKmgECuj161k5qcKzPRYrBuULG3v7xlzRT/iyW29aNNiY1ku2c0iKA4IC6InEP5rS35WOr6GTrm
	RjRQi6bgISmzEf9YKGqw6tLhFVBWk2CZ/tn/MXbOG2NPQcL1fRFgD3evA+fYKdWNgAGNUnlD0X8
	1zoxu4moSteZdmVwCxV7irxRyFSpscQwK45gIxO9NsIGkfjqb1AI=
X-Received: by 2002:a17:907:3cb:b0:c51:40e:847c with SMTP id a640c23a62f3a-c513a84ab4emr576437666b.23.1795442557948;
        Mon, 23 Nov 2026 06:02:37 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm420786766b.2.2026.11.23.06.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:02:37 -0800 (PST)
Message-ID: <dfe51a0b-e5b6-4887-b5d8-195d8ef0ca93@suse.com>
Date: Mon, 23 Nov 2026 15:02:36 +0100
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
Subject: Re: [PATCH] msr: replace rdmsr()/wrmsr() in comments
To: =?UTF-8?Q?Asaf_Nuri_Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux@roeck-us.net, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
 tony.luck@intel.com, ashok.raj.linux@gmail.com, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
References: <20261123080822.3426355-1-jgross@suse.com>
 <20261123133338.39023-1-asafbertizlioglu@gmail.com>
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
In-Reply-To: <20261123133338.39023-1-asafbertizlioglu@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zH1KUH40miOPx8xJHy05aI0t"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zH1KUH40miOPx8xJHy05aI0t
Content-Type: multipart/mixed; boundary="------------PY1alFJmAlhg5Ibj03MF0bME";
 protected-headers="v1"; hp="clear"
Message-ID: <dfe51a0b-e5b6-4887-b5d8-195d8ef0ca93@suse.com>
Date: Mon, 23 Nov 2026 15:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] msr: replace rdmsr()/wrmsr() in comments
To: =?UTF-8?Q?Asaf_Nuri_Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux@roeck-us.net, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
 tony.luck@intel.com, ashok.raj.linux@gmail.com, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
References: <20261123080822.3426355-1-jgross@suse.com>
 <20261123133338.39023-1-asafbertizlioglu@gmail.com>
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
In-Reply-To: <20261123133338.39023-1-asafbertizlioglu@gmail.com>

--------------PY1alFJmAlhg5Ibj03MF0bME
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMTEuMjYgMTQ6MzMsIEFzYWYgTnVyaSBCZXJ0aXpsaW/En2x1IHdyb3RlOg0KPiBP
biBNb24sIE5vdiAyMywgMjAyNiBhdCAwOTowODoyMkFNICswMTAwLCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vY29yZXRlbXAuYyBiL2Ry
aXZlcnMvaHdtb24vY29yZXRlbXAuYw0KPj4gLS0tIGEvZHJpdmVycy9od21vbi9jb3JldGVt
cC5jDQo+PiArKysgYi9kcml2ZXJzL2h3bW9uL2NvcmV0ZW1wLmMNCj4+IEBAIC02Nyw3ICs2
Nyw3IEBAIGVudW0gY29yZXRlbXBfYXR0cl9pbmRleCB7DQo+PiAgICAqIEBjcHVfY29yZV9p
ZDogVGhlIENQVSBDb3JlIGZyb20gd2hpY2ggdGVtcGVyYXR1cmUgdmFsdWVzIHNob3VsZCBi
ZSByZWFkDQo+PiAtICoJCVRoaXMgdmFsdWUgaXMgcGFzc2VkIGFzICJpZCIgZmllbGQgdG8g
cmRtc3Ivd3Jtc3IgZnVuY3Rpb25zLg0KPj4gKyAqCQlUaGlzIHZhbHVlIGlzIHBhc3NlZCBh
cyAiaWQiIGZpZWxkIHRvIHJkbXNycS93cm1zcnEgZnVuY3Rpb25zLg0KPiANCj4gVGhpcyBz
ZW50ZW5jZSBoYXMgYmVlbiBpbmFjY3VyYXRlIHNpbmNlIGl0IHdhcyBhZGRlZCBpbiB2My4w
Og0KPiBjcHVfY29yZV9pZCBpcyBuZXZlciBwYXNzZWQgdG8gYW4gTVNSIGFjY2Vzc29yLiBj
b3JldGVtcCByZWFkcyB0aGUNCj4gTVNScyB3aXRoIHJkbXNycV9vbl9jcHUoKS9yZG1zcnFf
c2FmZV9vbl9jcHUoKSBvbiB0aGUgbG9naWNhbCBDUFUNCj4gKHRkYXRhLT5jcHUpLCBhbmQg
Y3B1X2NvcmVfaWQgaXMgb25seSB1c2VkIGZvciB0aGUgIkNvcmUgTiIgbGFiZWwsDQo+IHRo
ZSBzeXNmcyBhdHRyaWJ1dGUgaW5kZXggYW5kIHNpYmxpbmcgbWF0Y2hpbmcuIFRoZSBjdXJy
ZW50IGRyaXZlcg0KPiBhbHNvIGRvZXMgbm90IHdyaXRlIGFueSBNU1IuDQo+IA0KPiBJIHRo
aW5rIHRoZSBzZW50ZW5jZSBzaG91bGQgYmUgZHJvcHBlZCByYXRoZXIgdGhhbiByZW5hbWVk
LiBJZiB5b3UNCj4gcHJlZmVyIHRvIGtlZXAgdGhpcyBwYXRjaCBtZWNoYW5pY2FsLCBJIGNh
biBzZW5kIGEgc2VwYXJhdGUgY29yZXRlbXANCj4gcGF0Y2ggZm9yIGl0Lg0KSSdtIGhhcHB5
IHRvIHNlbmQgYSBWMiB3aXRoIHRoZSBzZW50ZW5jZSBkcm9wcGVkLg0KDQoNCkp1ZXJnZW4N
Cg==

--------------PY1alFJmAlhg5Ibj03MF0bME--

--------------zH1KUH40miOPx8xJHy05aI0t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsER3wFAwAAAAAACgkQsN6d1ii/Ey8/
CAgAgt4TOdkpIzszPfXgnswTL7+egIO6JxCHi3n8zPafAnVpX+jSXV5DTq73HrDyLGSdZmwb0H+q
g/szYBHqy9PI4izvWLRbOANf13fv39U302/tewlzKbB+gylkqCOmrecPeYZJ8l4juFG7z1WXg8PP
sMe0T50VTgT5f4DAwH+Jg7EmYJgF6k1Nabp3TYKjG6AXMErFKSk29HebGI8juU/4BizcUtkiqIfF
9V4Oi8H8ITAm3HcDF7+B8XhmTu3icGnIfVQ+hJIaTMw3D6STxTNXiynep+zztOOtfH8qtS8qsmke
dGG6Y4kHOdCaQqX+y2CvD2YStrRwHkB3ax5fhB0eFQ==
=xaim
-----END PGP SIGNATURE-----

--------------zH1KUH40miOPx8xJHy05aI0t--
