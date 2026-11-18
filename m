Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000502;
	b=I4z0N075cwNGG2ba5d3l+BXJIKOMcoalD6B6untu4yze9/qXgrWyohRDj/eA1nPmPjmO
	 VzZDa1tbrYJJhRZqn3exiEEYgeBByFtKWGWEnc5/HDiYxADo7V1LJygXXHZU0y2xo4Ver
	 aLn/6wAQLbJjTw5EtclHekld5j16wR6ylYiKwkPMFstb3IZi6LX6pDFR97sFz86/wQETW
	 61loi6VYRcVpo1hiGEI9a6nNj1bbr+j/JU1UFYgouxdhIOYdOBVLDwDR3dJX862vDukpT
	 oUuJ2GTtrhiI36LyR2RWnb3Yx4t9vC1BqE8rv/kngZ7wFwtE5OP7hM0+6FsQ8VhdC8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=6DH0KVmtxdJ4mUifFz/9FMzYO3ur54bwKg2YAmdDwWE=;
	b=U8rGbzpgc5P4IBPDMp2qgs5w0HI77Z6+q3hfEZ2xuN6pjyO165VZSBwinuKctg1OkN3F
	 IPmPgHxS2j68CNwnrbUeqz2hIxl3IsZUncmsjwEyQUAAj+ZKRfsAb1L/FBQYrL9gbYnvQ
	 BP6x+fgr7rL+dIQY6AvrekHvBLb3ycdJTNyCPnjq/+a6q/QSMcDxQSAyW7x0PwclpU1os
	 EPuqdX/O321n95bTAzKTOoV3YyNLZA7Hvt834lpTs9YSvMZvn37c4/acamnG91P6ko3qD
	 ZPtsBg+zPO62K7rHytwKPUT3WNeJs5IxLLjcX485h6kT/K81Pq8O1xwMTRIROMphRwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEg+AYQh;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEg+AYQh
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a357b1c649so453418f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000501; x=1795605301; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6DH0KVmtxdJ4mUifFz/9FMzYO3ur54bwKg2YAmdDwWE=;
        b=oEg+AYQhdqA61jWzO6wBSI87USRl4RigOLJYa5Z2CXgXY+u9E3Amkb07J1lFkPvlky
         bNH6BsquAoRqmThBRO3drjEcbnUXl6evUpX3DftN7oeQkT9SXawubzf8rppVNTYsfSmY
         lpbkIBpjI5bU4JIgJC2b2mq3wtY6IHZIFdCem+IotNNxN56bfi9pwk4oQRuAokzlmYTJ
         bJiggy6hA6ghD8W0xKP8gtDYI5EZ44nFHYOc+Zx65fL7kp02cnQoBZiwYr4XA1Z0Pcb5
         TT/d7ast9meiEo+fLvPM8BHOXK8zW3BP14tsb+aLM/D3Mqaef2OVawu5TSaQi5MIoTJh
         bM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000501; x=1795605301;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DH0KVmtxdJ4mUifFz/9FMzYO3ur54bwKg2YAmdDwWE=;
        b=HZj27EBdNMIvn5GnV1wPmILq9Pm5yL3YpBKvmNhdp8sKWC4rhDy7cm5vSuBVE94KlN
         z5DN6RY1DDM5fnbGeW1NELCott8GpH/Xhpy+KpOurgZ3KdRmom2ye7Jcrw4IC+CcP2Vi
         83bsrx5UO6p9wIPvhvUefk80pgQtyzNqXoMFPimucxeh6uOAndf3SxDGM20XEYOdLwBg
         0H4ezBgw+k0rt5qAw/yJCr0Rk1YPWrhtRUEwYssQthvYhCcU0Uy/kvi/D8jSY51tbtYK
         1cWzRyE3xS5Bp5Afge5dta3bJL22j24P2rttH2VWHuSsHj/cWQArDoMmHRJU0nY/OP3k
         zPnA==
X-Forwarded-Encrypted: i=1; AL+hErHjHzBPlrJFUEn7e55oj8sq+744hEdPSRl2G3/b7vmmOMORmWKyXm+H5T1As0boEVUWmaq556+TpuZwgRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9loxzOF+qOMnpgVyveOlZLCqoRu9uIImRpFU3zwasSNdMnKikr
	YqCyqCWG0XHiWJKRGVSj2+fHp4HbTh1uLEXC5GvgrozyRugYBI3HlNK9
X-Gm-Gg: AZFdTZc5LGFC795iICRyvdBsTVlDRcFR96S8xbyIouHyuJffjJWsrqd6a3r/2JD2KHh
	KuicwmNHgJLekAkc7nwekT+vZzTNtLbJ0DsHgZc8+NRdAbUeaxdFntSWHJ/sQWWMdF7VzbvxQlP
	EKvVfT+vieK0eZasG55KrG5w27PjTmq53q3uX3suO/KMzGllQ0L2/os8LLPoGBINTo5TfwS7lKd
	uBRQ7j2q/3MpwJhNzvvMFPA8ulq6KNadoWysTF/W6d5a5iLA24w9Wj2AVI6dOhNQDzBVF36eiRM
	Br8NNzLee1zExTEVtuhjByYMT2UYQXb6VDCgmct0mJ4YC6Ln6i0kZ/XkQOeDTjTu79Yk4N/q0HZ
	TbvkhxozGvDW+JYcjoQJcVRqXoOcRDUapaJ1C6Mc78BGVGr5JG9yJ4SrFo5zk4ffMcN1Pwmvxro
	CGdy388nPrRzIEzQEBdIFvpClqGbkKkomqRAuP6yNA5B9Wkb8xxFEF7rIOVGKhPf1GNSoak88Qf
	mL90DDmS4tJHYTV6V0YxselhSMQaPdPrqymO1tC2r+eh3U3pThflDx7r8ofKRNZwtCI8odDZXKq
	VY0zK5UNsk9RgrwZxYVujmDI7rx3KN/mz0CYfE3BdZsqfWR8Ocdfp6G+r40g3rQr/ni66H6Jyc2
	hiqGeTYTSabEqtvi+K+z/hFpKO8MguyjpbbYCWw4=
X-Received: by 2002:a05:6000:4b1e:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4a63984a9dcmr4820215f8f.10.1795000500756;
        Wed, 18 Nov 2026 03:15:00 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f21sm3965668f8f.38.2026.11.18.03.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:15:00 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f430727b-0ae4-4210-80d2-cef29109a863@gmail.com>
Date: Wed, 18 Nov 2026 11:14:59 +0000
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
Subject: Re: [PATCH v8] scripts/config: honor $KBUILD_OUTPUT by default
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Voytik <voytikd@gmail.com>, Nicolas Schier <nsc@kernel.org>,
 Nicolas Schier <n.schier@fritz.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20261117132513.52725-1-voytikd@gmail.com>
 <26f53b63-2f75-4fa4-bf6f-d3495e4e5cb0@gmail.com>
 <20261118081025.GA671584@ax162>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261118081025.GA671584@ax162>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DEjnDSqXCUaZM19f19vV5pT6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DEjnDSqXCUaZM19f19vV5pT6
Content-Type: multipart/mixed; boundary="------------4WhGp4f0ehBKXWddaVMCg5Iu";
 protected-headers="v1"; hp="clear"
Message-ID: <f430727b-0ae4-4210-80d2-cef29109a863@gmail.com>
Date: Wed, 18 Nov 2026 11:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] scripts/config: honor $KBUILD_OUTPUT by default
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Voytik <voytikd@gmail.com>, Nicolas Schier <nsc@kernel.org>,
 Nicolas Schier <n.schier@fritz.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20261117132513.52725-1-voytikd@gmail.com>
 <26f53b63-2f75-4fa4-bf6f-d3495e4e5cb0@gmail.com>
 <20261118081025.GA671584@ax162>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261118081025.GA671584@ax162>

--------------4WhGp4f0ehBKXWddaVMCg5Iu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/18/26 08:10, Nathan Chancellor wrote:
> On Tue, Nov 17, 2026 at 07:25:17PM +0000, Julian Braha wrote:
>> On 11/17/26 13:25, Dmitry Voytik wrote:
>>> +# If no '--file' was specified, use KBUILD_OUTPUT as the base if it =
exists
>>> +if [[ "$FN" =3D ".config" && -n "$KBUILD_OUTPUT" ]]; then
>> Right so this will give different results with:
>>     '--file .config'
>> and:
>>     '--file ./.config'
>>
>> but maybe that was intentional -- i.e. we're assuming a user passing
>> '.config' intends it to be '$KBUILD_OUTPUT/.config' while a user passi=
ng
>> './.config' would intend CWD/.config?
> It was intentional since I had figured they were passing the default
> value so they should get the default behavior. Maybe it would be better=

> to only do this when no '--file' value was provided period though to
> avoid some unexpected behavior?

All good, I think it's reasonable. Just wanted to confirm the intention

- Julian Braha

--------------4WhGp4f0ehBKXWddaVMCg5Iu--

--------------DEjnDSqXCUaZM19f19vV5pT6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCav2IswUDAAAAAAAKCRDElYPCBXNxIF2q
AP0ZpWOny+OS5jO4uJKuuNIxj7yHNBH5kNRGvz6S460DfAEA8aYa4Ojn8ELvoK+uj62fPziyGEse
NHrN4e0bq2AyzgA=
=6xHD
-----END PGP SIGNATURE-----

--------------DEjnDSqXCUaZM19f19vV5pT6--
