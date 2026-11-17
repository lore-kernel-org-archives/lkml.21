Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948622;
	b=YYKXGpzrzgtPtwYH9k7FOgZr6YQltw5ZGU4EBTsWdWs0hhpeugL/uXklDg5mvipH3p7c
	 TwqLRGJKwsBQSi2LfJeIXljMoy2EjTbOUl2NcCC9IZX/HmqiCwaJV1olYHh6Z9XntxJ3Z
	 zgfD21LObK9ZbD04V09IlvRogq4F5cfAARMZ4MWNQdFhs8X8v5tjXdoXvFNpzaS8pxicV
	 D3lHO8eonjiPtUw5hCxUTOuE9/ztTsWsmNG9/Vq8rAhsGphlIA2Mm+62PHETgCM0HnU58
	 kYiRrGVGJlrcrm5NT9eyohMyY94tRFyfPCLBCoRj1b3Fvk/0HNiNlxuGwu2CrQpTZtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=eqEvkYAf+3/SDuIOJA/YLmcUVK0qDgSVb8pZnDMbB64=;
	b=mgWKTPLT/S5G69MOqDmMik3ZUYZ1GtB1PIkbn14N+JyDy0CPSdzj0VXrGfQDJRwzeEr8
	 Luw3pmGjM8uIMRNUHa8WON9QoA2tavvBzJh+YUTwxmfgWsS7066zqqqtlXp4RHoCgqld9
	 zMOkTWjTUk+vzF025QbFCqHcx3j/qETX7eSnT4yc8lLpItapK3lNUg39kW0IUUDhGlxCl
	 RgptnuJRxr+yhMbQxQQUIpyqq0KvCv48Di/fV+ab+z6ognlwan5lC+WZlSeOMXOhdQeHX
	 KxZ/gzi7CfzV+DxFY27Q4SfKhjyGP6eFL1WqqrR5S4fWte6cG8JhsJvJnjiJircK8Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XN+M6Xec;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0ED606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F0ED606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XN+M6Xec
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67c24619b19so118562d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794948620; x=1795553420; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqEvkYAf+3/SDuIOJA/YLmcUVK0qDgSVb8pZnDMbB64=;
        b=XN+M6Xecf0iZC4KhQDbZuYjNWR15VAfv7sfZYhLw/+wdj/32l66/TJOOyxnYEa10EN
         PQ+6KsmHSxeBZ2vqTy7f8FNWuoiMYust8HcLIkcFdA3/VWZQLwKOaOuxxVW0eKM3qJwr
         TeAmCJHXVzpDL4V6Li25QFVdUkBhkbuclOxae8oCwUr/W6mPVmJ65lbgj8opMcuawoVf
         2+Mp6eM/97Ct316BCtX9WUczgPePAxz46/1ZgJhonCKOBmC6PXCmCkqyVXx9sgnpAcVu
         uApGuDXYC3so9S/hB08oMeKxqirrP/ERm4nm2NL1k8jCpBTRrlZoe3/aaDOUzBb2pEgm
         LnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948620; x=1795553420;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eqEvkYAf+3/SDuIOJA/YLmcUVK0qDgSVb8pZnDMbB64=;
        b=D7dLianoGISixxMGWw7cXue1xoCms8y/6OCfLyqQV1osrQR94mpq93Cl0BmkEOWufc
         HOw9SI+sjBGH+IXei9wIJOg2q/r02N/pBji+OjmZaqV/R568/UwcpSeGEDheLSnE3dV4
         4RqjS8HLFTVJ0yV4Ca5L9nwDRSBZtfjtXVLWh3NZCTzXyBNDsuUT4M2Ly11xRODw9KWl
         6vGN5gBmgG2ynQbXbvDQQUhNCn1R9seSXY+FkMb6KRm3NhFlADvra/BTcAuHMUhHGLh9
         Kv7ObuUl6TVFbw4C7ziqWKg2FrS1jszL30aCbl+VcnKUCLGDj42nVXCPcf5zN+KeXsYs
         /3Kg==
X-Forwarded-Encrypted: i=1; AL+hErEyate+QAgcIxTeMRUPSTMZNb22VnPoXXtnB6U05s/YsSsgyIx0kMf3srv4RjUlzxG5FlFiTe/h1Ux/pNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LKts/FeFfJAe2u4EVDKWbQvjpBW8AJ6AYX1ngNwBxXazZxwBW
	PPsTWj7S1+BJASfo2pu4vnR+btYNuNYlHedrsJkKZJXKuexPLSUbaRDGvPsxsHITVJY=
X-Gm-Gg: AZFdTZc2azjdR5sMNRHbJBuzUdNWicfzTIp5MCP/S5pC87iXLpWEftL+X+03TXTDTfD
	fLkVKE5CgQkg94+HYKQEt+WRAf/LLG/IGeplrZIpZfCLMvCNwQHGcdZBQaCbknqXUfL5lcKqJsz
	dixecGM8tLiVy7Vk0NfU0AqUu515ZWzBUJof0O2tB/ftRiIbkaOTnUyXA9T7qb6jlMF6IBooPQI
	4e3d+pPVeG8VIISvNaWaPwIc+pNZ1BTWSg8B8tj1eTUpI4g6lSpL60Q6lOwVhgFHFSYUeZGIXBd
	r4hvNjHmAL0uI6g4jSx8EHk0k7PE52bLJ1Aj3LrhK9vqxrTE0r1+rrQzdZJXftuhcJaFO9iSo+Q
	AF9067BmNPvnhIcMq7v/6tQIgVgy4/ZAApX1wvo1m9ky1IRSoZrBaiKKpopRpvHERvtTRz/n2eW
	fYlZXzrjBQurJJHVG4zYnUVWz9hDZW2q9qANir2dd7sVwxZVeWFYB+ITtldsM2hpm+ffqVZCugQ
	uqegOqOOt+w8t/H3/kmBIMIZRUtIy5A/D7s+4wwH6yebtbfD4sJGdh0sJzzAdq222VNJUFO1ENE
	ilqmW6VRNshxE47f0sA4SN0f69dCPzZg8/UePX0AyC7T5rK8rozL0OHpvapdezwHUyyLOMjnz0L
	bPJiuoMdp7fqNds8giGHXPyKuXfe7lj0DA5GfnjspQGrWPbusC0iW4ct6kP/m9lmam8rjGcNtxK
	0Vjv581n74IeJezi0uOkM=
X-Received: by 2002:a05:690c:6ac1:b0:8b4:fd7b:be17 with SMTP id 00721157ae682-8b4fed36c83mr2087757b3.27.1794948620112;
        Tue, 17 Nov 2026 12:50:20 -0800 (PST)
Received: from ?IPv6:2600:1700:6476:1430:d1c7:8722:e551:bec4? ([2600:1700:6476:1430:d1c7:8722:e551:bec4])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe03091esm6151537b3.12.2026.11.17.12.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:50:17 -0800 (PST)
Message-ID: <da5996e93eb644e6226158639b6abc05d720b8a8.camel@dubeyko.com>
Subject: Re: [BUG] WARNING: possible recursive locking in hfsplus_get_block
 (fs/hfsplus/extents.c:264, v7.4-rc3)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Zheng Zheng <fengaojigui88@gmail.com>
Cc: glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Date: Tue, 17 Nov 2026 12:50:16 -0800
In-Reply-To: <CAO-4RZ1a46EoJY7x6euiS+7aTOb-T9X62E9nGyToRcyvKU+eHg@mail.gmail.com>
References: 
	<CAO-4RZ1a46EoJY7x6euiS+7aTOb-T9X62E9nGyToRcyvKU+eHg@mail.gmail.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=mQINBGgaTLYBEADaJc/WqWTeunGetXyyGJ5Za7b23M/ozuDCWCp+yWUa2GqQKH40dxRIR
 zshgOmAue7t9RQJU9lxZ4ZHWbi1Hzz85+0omefEdAKFmxTO6+CYV0g/sapU0wPJws3sC2Pbda9/eJ
 ZcvScAX2n/PlhpTnzJKf3JkHh3nM1ACO3jzSe2/muSQJvqMLG2D71ccekr1RyUh8V+OZdrPtfkDam
 V6GOT6IvyE+d+55fzmo20nJKecvbyvdikWwZvjjCENsG9qOf3TcCJ9DDYwjyYe1To8b+mQM9nHcxp
 jUsUuH074BhISFwt99/htZdSgp4csiGeXr8f9BEotRB6+kjMBHaiJ6B7BIlDmlffyR4f3oR/5hxgy
 dvIxMocqyc03xVyM6tA4ZrshKkwDgZIFEKkx37ec22ZJczNwGywKQW2TGXUTZVbdooiG4tXbRBLxe
 ga/NTZ52ZdEkSxAUGw/l0y0InTtdDIWvfUT+WXtQcEPRBE6HHhoeFehLzWL/o7w5Hog+0hXhNjqte
 fzKpI2fWmYzoIb6ueNmE/8sP9fWXo6Av9m8B5hRvF/hVWfEysr/2LSqN+xjt9NEbg8WNRMLy/Y0MS
 p5fgf9pmGF78waFiBvgZIQNuQnHrM+0BmYOhR0JKoHjt7r5wLyNiKFc8b7xXndyCDYfniO3ljbr0j
 tXWRGxx4to6FwARAQABtCpWaWFjaGVzbGF2IER1YmV5a28gPFNsYXZhLkR1YmV5a29AaWJtLmNvbT
 6JAlQEEwEKAD4WIQRVwwtrZ87KC0La2wQ5XNnC34RAdQUCaBpd7AIbAQUJA8JnAAULCQgHAgYVCgk
 ICwIEFgIDAQIeAQIXgAAKCRA5XNnC34RAdYjFEACiWBEybMt1xjRbEgaZ3UP5i2bSwayDwYDvgWW5
 EbRP7JcqOcZ2vkJwrK3gsqC3FKpjOPh7ecE0I4vrabH1Qobe2N8B2Y396z24mGnkTBbb16Uz3PC93
 nFN1BA0wuOjlr1/oOTy5gBY563vybhnXPfSEUcXRd28jI7z8tRyzXh2tL8ZLdv1u4vQ8E0O7lVJ55
 p9yGxbwgb5vXU4T2irqRKLxRvU80rZIXoEM7zLf5r7RaRxgwjTKdu6rYMUOfoyEQQZTD4Xg9YE/X8
 pZzcbYFs4IlscyK6cXU0pjwr2ssjearOLLDJ7ygvfOiOuCZL+6zHRunLwq2JH/RmwuLVmWWSbgosZ
 D6c5+wu6DxV15y7zZaR3NFPOR5ErpCFUorKzBO1nA4dwOAbNym9OGkhRgLAyxwpea0V0ZlStfp0kf
 VaSZYo7PXd8Bbtyjali0niBjPpEVZdgtVUpBlPr97jBYZ+L5GF3hd6WJFbEYgj+5Af7CUjbX9DHwe
 GQ/tdXWRnJHRzorxzjOS3003ddRnPtQDDN3Z/XzdAZwQAs0RqqXrTeeJrLppFUbAP+HZTyOLVJcAA
 lVQROoq8PbM3ZKIaOygjj6Yw0emJi1D9OsN2UKjoe4W185vamFWX4Ba41jmCPrYJWAWHfAMjjkInI
 Pg7RLGs8FiwxfcpkILP0YbVWHiNAabQmVmlhY2hlc2xhdiBEdWJleWtvIDxzbGF2YUBkdWJleWtvL
 mNvbT6JAlcEEwEKAEECGwEFCQPCZwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQRVwwtrZ87KC0
 La2wQ5XNnC34RAdQUCaBpeTwIZAQAKCRA5XNnC34RAdew7D/48vw8dfTLcVjp4j6qUH9rOuXp5A2b
 jCEPeI0oOwRdqkyiGzUfUprHM48owvvye5u1mUZnKp8BWDDsjX4ddmhdloY0+6ecRAG73xlWMFKVK
 4P5XGnHU9A2JOtRhnOWQfPTgFhy69BSYyOeG3e5J+xPyUUBeHajbMVPKnD10NMCx8Ux1D2bv8OWbv
 3DvpUNx9D46UhBmkwIfrQWBkr0OGD2AXFfPqo08c3jcJMOAEc2vBI08Fij9o1gHwP2suFaG0X6jUN
 sy6KPOKg7TVMXtMzxNsKGyFxC1pG7lv+oaEBT6TJSVs/pm71ZrOezQANRzvBeXNUixWienTdAEG8a
 x4uOf3EF5WvYUhDiY8XBJyRv2ZnKJmBxZ3jPStadSuh3Bmo4mNgRVpFXrfb7h8oJC1l1WGdJa9aWi
 xUedku0/nH+nZMTqrtWYkXoLxaMswVM5S4f3pYKd7VlHxtlZiQ95RqQd5uWYcEN6xaSvAO3Cs4Co8
 D6etTHtKPcx1+d0x6BvkBvqNJ5yCiuzPPnKE6E0ss52KKvQt3injPyfe8ffofbW4s2nlEL1s0DoBv
 JslCebuQ6+Orb/Sl6zictIsv3XMq3jGFeZcDg2hXzngOC255+b0Z/To7jINTxYQot8jCOJQOLplxc
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Zheng,

Thanks for the report. Let me take a look into it.

Thanks,
Slava.

On Tue, 2026-11-17 at 11:01 +0800, Zheng Zheng wrote:
> Hi Viacheslav,
>=20
> We found a reproducible lockdep recursive-locking warning in hfsplus
> on
> v7.4-rc3 with syzkaller. The same signature is present on v7.4-rc2.
>=20
> The following is the key excerpt from the rc3 external verification
> log
> (`rc3/logs/external-verification/run1-singleproc-serial.log`, hit at
> 114.00 s):
>=20
> =C2=A0 [=C2=A0 114.001303][T10445] WARNING: possible recursive locking de=
tected
> =C2=A0 [=C2=A0 114.003629][T10445] 7.4.0-rc3-kernsight-kasan #1 Tainted:
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 E
> =C2=A0 [=C2=A0 114.005869][T10445] --------------------------------------=
------
> =C2=A0 [=C2=A0 114.008132][T10445] syz-executor/10445 is trying to acquir=
e
> lock:
> =C2=A0 [=C2=A0 114.010406][T10445] ff1100017d7545c0
> (&HFSPLUS_I(inode)->extents_lock){+.+.}-{4:4},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 at: hfsplus_get_block+0x282/0xab0
> =C2=A0 [=C2=A0 114.021835][T10445] but task is already holding lock:
> =C2=A0 [=C2=A0 114.024125][T10445] ff1100017d753300
> (&HFSPLUS_I(inode)->extents_lock){+.+.}-{4:4},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 at: hfsplus_file_truncate+0x20d/0xd70
> =C2=A0 [=C2=A0 114.044862][T10445]=C2=A0=C2=A0 lock(&HFSPLUS_I(inode)->ex=
tents_lock);
> =C2=A0 [=C2=A0 114.058492][T10445]=C2=A0=C2=A0 lock(&HFSPLUS_I(inode)->ex=
tents_lock);
> =C2=A0 [=C2=A0 114.058944][T10445]=C2=A0 *** DEADLOCK ***
> =C2=A0 [=C2=A0 114.058944][T10445]=C2=A0 May be due to missing lock nesti=
ng notation
> =C2=A0 [=C2=A0 114.060170][T10445] locks held by syz-executor/10445: 6, o=
n
> CPU#3:
> =C2=A0 [=C2=A0 114.063858][T10445]=C2=A0 #4: ff1100017d753300
> (&HFSPLUS_I(inode)->extents_lock){+.+.}-{4:4},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 at: hfsplus_file_truncate+0x20d/0xd70
> =C2=A0 [=C2=A0 114.064748][T10445]=C2=A0 #5: ff1100017d26e8f0 (&sbi-
> >alloc_mutex){+.+.}-{4:4},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 at: hfsplus_block_free+0xf3/0x690
> =C2=A0 [=C2=A0 114.068038][T10445] Call Trace:
> =C2=A0 [=C2=A0 114.068542][T10445]=C2=A0 dump_stack_lvl+0x116/0x1b0
> =C2=A0 [=C2=A0 114.068921][T10445]=C2=A0 print_deadlock_bug+0x293/0x3d0
> =C2=A0 [=C2=A0 114.069329][T10445]=C2=A0 __lock_acquire+0x153c/0x2110
> =C2=A0 [=C2=A0 114.070151][T10445]=C2=A0 lock_acquire+0x1bf/0x370
> =C2=A0 [=C2=A0 114.071749][T10445]=C2=A0 __mutex_lock+0x178/0x1dd0
> =C2=A0 [=C2=A0 114.075318][T10445]=C2=A0 hfsplus_get_block+0x282/0xab0
> =C2=A0 [=C2=A0 114.075713][T10445]=C2=A0 block_read_full_folio+0x305/0x85=
0
> =C2=A0 [=C2=A0 114.076997][T10445]=C2=A0 filemap_read_folio+0xc4/0x2a0
> =C2=A0 [=C2=A0 114.077824][T10445]=C2=A0 do_read_cache_folio+0x255/0x5a0
> =C2=A0 [=C2=A0 114.078746][T10445]=C2=A0 read_cache_page+0x62/0x150
> =C2=A0 [=C2=A0 114.079124][T10445]=C2=A0 hfsplus_block_free+0x156/0x690
> =C2=A0 [=C2=A0 114.079520][T10445]=C2=A0 hfsplus_free_extents+0x345/0x4a0
> =C2=A0 [=C2=A0 114.079928][T10445]=C2=A0 hfsplus_file_truncate+0x59b/0xd7=
0
> =C2=A0 [=C2=A0 114.159730][T10445]=C2=A0 hfsplus_delete_inode+0x196/0x230
> =C2=A0 [=C2=A0 114.160139][T10445]=C2=A0 hfsplus_unlink+0x7b5/0x980
> =C2=A0 [=C2=A0 114.162948][T10445]=C2=A0 vfs_unlink+0x30d/0xc90
> =C2=A0 [=C2=A0 114.169449][T10445]=C2=A0 filename_unlinkat+0x3ee/0x680
> =C2=A0 [=C2=A0 114.171418][T10445]=C2=A0 __x64_sys_unlink+0x4c/0xa0
> =C2=A0 [=C2=A0 114.171796][T10445]=C2=A0 do_syscall_64+0x132/0x7c0
> =C2=A0 [=C2=A0 114.172170][T10445]=C2=A0 entry_SYSCALL_64_after_hwframe+0=
x77/0x7f
>=20
> What seems to happen:
>=20
> 1. hfsplus_file_truncate() on the unlinked file holds that file
> inode's
> =C2=A0=C2=A0 extents_lock (extents.c:579).
> 2. hfsplus_free_extents() -> hfsplus_block_free() reads the
> allocation
> =C2=A0=C2=A0 bitmap through sbi->alloc_file->i_mapping while the file ino=
de's
> =C2=A0=C2=A0 extents_lock is still held (bitmap.c:183-185).
> 3. The bitmap read enters hfsplus_get_block() for the allocation-file
> inode
> =C2=A0=C2=A0 and takes its own extents_lock (extents.c:264).
>=20
> The two mutexes are different instances (the external-log addresses
> differ:
> ff1100017d7545c0 vs ff1100017d753300) but share the same lockdep
> class,
> because extents_lock is initialized in a common inode-initialization
> path.
> lockdep therefore reports recursive locking.
>=20
> Is this a lockdep false positive caused by the shared class, or is
> there a
> real lock-ordering issue? If it is a false positive, should the
> allocation-file inode use a separate lockdep class (or a nested
> annotation)
> for extents_lock? Alternatively, should hfsplus_block_free() run
> outside the
> file inode's extents_lock?
>=20
> Reproduction:
>=20
> =C2=A0 kernel: v7.4-rc3, CONFIG_KASAN=3Dy, CONFIG_PROVE_LOCKING=3Dy,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_HFSPLUS_FS=
=3Dy, booted with oops=3Dpanic panic_on_warn=3D1
> =C2=A0 guest:=C2=A0 Debian trixie x86_64, 6 GiB RAM, 4 vCPU, KVM
> =C2=A0 syzkaller: 853b104bb454141a5b0fc0e4218ec78e9f34ffb1
>=20
> =C2=A0 in the guest, as root:
> =C2=A0 syz-execprog -procs=3D1 -threaded -repeat=3D1 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -executor ./syz-executor repro.kernsight.p=
rog
>=20
> The reproducer is a 56-entry state-reconstruction recipe. The main
> fuzzing
> pipeline verified it 2/2 on freshly replayed VMs; the crash was
> reproduced
> during crash-log replay at entry 55/55. An external fresh-VM run also
> reproduced it 2/2 with -procs=3D1 -repeat=3D1 (114.00 s and 110.75 s).
> Note that
> the recipe needs strict single-process ordering; 8 parallel workers
> did not
> reproduce it.
>=20
> How to reproduce reliably on mainline (v7.4-rc3)
> ------------------------------------------------
> We reproduced this on mainline v7.4-rc3 with the following recipe. No
> local HFS+ patches are applied; the source tree is vanilla v7.4-rc3.
>=20
> 1. Build the mainline v7.4-rc3 kernel with the configuration in
> =C2=A0=C2=A0 rc3/kernel.config. The essential options are CONFIG_KASAN=3D=
y,
> =C2=A0=C2=A0 CONFIG_PROVE_LOCKING=3Dy, CONFIG_HFSPLUS_FS=3Dy and
> CONFIG_DEBUG_INFO=3Dy.
> =C2=A0=C2=A0 The bzImage used here has sha256
> =C2=A0=C2=A0 0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a=
1882.
>=20
> 2. Boot a Debian trixie x86_64 guest (6 GiB RAM, 4 vCPU, KVM) with
> the QEMU
> =C2=A0=C2=A0 command line in rc3/environment.txt. Keep the serial console=
; the
> lockdep
> =C2=A0=C2=A0 report appears there (and in dmesg). panic_on_warn=3D1 is no=
t
> required to
> =C2=A0=C2=A0 observe this lockdep report.
>=20
> 3. Copy syz-execprog and syz-executor built from syzkaller commit
> =C2=A0=C2=A0 853b104bb454141a5b0fc0e4218ec78e9f34ffb1, plus
> =C2=A0=C2=A0 rc3/reproducer/repro.kernsight.prog, into the guest.
>=20
> 4. In the guest, as root, run:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 syz-execprog -procs=3D1 -threaded -repeat=3D1 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -executor ./syz-executor=
 repro.kernsight.prog
>=20
> 5. Expect "WARNING: possible recursive locking detected" after
> roughly
> =C2=A0=C2=A0 110-115 seconds, with:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 hfsplus_get_block+0x282/0xab0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hfsplus_file_truncate+0x20d/0xd70
>=20
> =C2=A0=C2=A0 We observed this 2/2 on fresh VMs at 114.00 s and 110.75 s.
>=20
> Important details for stable reproduction:
>=20
> - Use -procs=3D1. With -procs=3D8 (or -repeat=3D0) the 56-program state
> recipe is
> =C2=A0 interleaved and did not reproduce in a 20-minute run.
> - Use the full repro.kernsight.prog recipe. The minimal repro.prog
> alone is
> =C2=A0 state-dependent and does not reproduce by itself.
> - The report is a lockdep recursive-locking warning, so serial/dmesg
> is the
> =C2=A0 reliable success signal; it is not a KASAN panic.
>=20
> A repository with the syzkaller programs, kernel configs and full
> logs is
> available at:
>=20
> =C2=A0 https://github.com/Zheng-zheng-codes/hfsplus-extents-lock-deadlock
>=20
> The repository keeps the v7.4-rc2 and v7.4-rc3 results in separate
> `rc2/`
> and `rc3/` directories so the two kernels are not mixed.
>=20
> Repository layout:
>=20
> - `README.md` at the repository root
> =C2=A0 Overview of the report and an explicit rc2/rc3 split.
>=20
> - `rc2/` -- original v7.4-rc2 results
> =C2=A0 - `README.md`: v7.4-rc2 report and reproduction notes.
> =C2=A0 - `environment.txt`: rc2 kernel image/hash, QEMU command line and
> =C2=A0=C2=A0=C2=A0 syzkaller revision.
> =C2=A0 - `kernel.config`: v7.4-rc2 kernel configuration.
> =C2=A0 - `reproducer/repro.kernsight.prog`: rc2 pipeline-verified state
> recipe.
> =C2=A0 - `reproducer/repro.priming.prog`: rc2 priming portion.
> =C2=A0 - `reproducer/repro.prog`: rc2 triggering testcase.
> =C2=A0 - `logs/log0..log3`, `logs/report0..report3`: original rc2
> syzkaller
> =C2=A0=C2=A0=C2=A0 execution logs and crash reports.
> =C2=A0 - `logs/machineInfo0..machineInfo3`, `logs/title-stat.json`: guest
> =C2=A0=C2=A0=C2=A0 environment and title statistics.
> =C2=A0 - `logs/crash-excerpt.txt`: rc2 crash excerpt.
>=20
> - `rc3/` -- new v7.4-rc3 results (the results in this report)
> =C2=A0 - `README.md`: v7.4-rc3 report, locking analysis and reproduction
> notes.
> =C2=A0 - `environment.txt`: rc3 kernel image/hash, guest image/hash, QEMU
> command
> =C2=A0=C2=A0=C2=A0 line and syzkaller revision.
> =C2=A0 - `kernel.config`: v7.4-rc3 kernel configuration.
> =C2=A0 - `reproducer/repro.kernsight.prog`: rc3 56-entry state recipe.
> =C2=A0 - `reproducer/repro.priming.prog`: rc3 priming portion.
> =C2=A0 - `reproducer/repro.prog`: rc3 triggering testcase.
> =C2=A0 - `reproducer/repro.report`, `repro.stats`, `repro.outcomes.jsonl`=
,
> =C2=A0=C2=A0=C2=A0 `repro.context.json`: pipeline verification evidence, =
including
> the
> =C2=A0=C2=A0=C2=A0 2/2 fresh-VM result.
> =C2=A0 - `logs/log-0.txt`, `logs/report-0.txt`: original rc3 syzkaller lo=
g
> and
> =C2=A0=C2=A0=C2=A0 crash report.
> =C2=A0 - `logs/machineInfo-0.txt`, `logs/title-stat.json`: rc3 guest
> environment
> =C2=A0=C2=A0=C2=A0 and title statistics.
> =C2=A0 - `logs/external-verification/run1-singleproc-serial.log` and
> =C2=A0=C2=A0=C2=A0 `run2-singleproc-serial.log`: full serial consoles of =
the two
> =C2=A0=C2=A0=C2=A0 independent rc3 fresh-VM reproductions (114.00 s and 1=
10.75 s).
> =C2=A0 - `logs/external-verification/*-run.log` and `*-execprog-out.log`:
> the
> =C2=A0=C2=A0=C2=A0 corresponding run records and syz-execprog output.
> =C2=A0 - `SHA256SUMS`: checksums for the rc3 inputs and logs.
>=20
> When reproducing, note the difference:
> - rc2 reproduces from its own recipe in `rc2/reproducer/` (see
> =C2=A0 `rc2/README.md` for the exact command used in that testing round).
> - rc3 must be run with strict single-process ordering:
> =C2=A0=C2=A0=C2=A0 syz-execprog -procs=3D1 -threaded -repeat=3D1 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -executor ./syz-executor repro=
.kernsight.prog
>=20
> Best regards,
> Zheng Zheng
