Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323308;
	b=VrDnsgvfWRoetGa6g9hl10gk9UVy2+5/0UT/1pjeE4aSEL9juTtju/md4NXnWW6DMogp
	 cEY9Edi7dXqQz2vFRulelGA8TkYQ7rn2BBRPWuMVhMS9N4+mW/kWTqMripSJp7Hp4pnr0
	 qPJBlj+wohjMziJrLH7xvMAxWOlDEgc2XJgyqC6KjMlQ9RcfTWK8+YOtfmBotwdJZ9OAV
	 u5iQWbn+6PBXCArszf1HkFM2Ppq43sDvXPJcCHNd20h2zpgoNJfyW3aCX2uo23yP72Sni
	 u8y0kyOPPZk77hijphi3uE/GqqgYm3saFS3OBNWHpN7Yq2bFv1AjVQ8Bfth+d9Z9tjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=zo5hV3nq2vAzOrfwjLwLFQ7iNUuGgnQAdTEhOY7Nk04=;
	b=flakbcLizISIH6wEFclW85HTTeSRF7DLj7juHetedw84w7raWy1EinSVPu78OtoqnyHN
	 Y/I2/ayxyLVGnXH/5JCar5W8iPwWGwg/D17xaTzJ3nAapClYWtlj9UPaGmiiOP5odqOgn
	 NC2MoQj38a1UaARNtvo2EX76R1m4ZiS4/Oezrvth29LQ00v2eePkLP7/d29DlIiPlcqO8
	 a5sZLdYg6KYCuurKDii6UhOcRfg8036Oo4Rb50aXvAcbnv86qE2S5rwDPcDJvsdeX2usV
	 fsi/0/dl8vtp5x2Su9YHYr/Dllimf3T6DQ0nTpiXmfupDvYguCuyRvxir8WWtRMDqEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTGCWyKF;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347E5606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347E5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTGCWyKF
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so6623531eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795323307; x=1795928107; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zo5hV3nq2vAzOrfwjLwLFQ7iNUuGgnQAdTEhOY7Nk04=;
        b=OTGCWyKFZuWdrwICzH5qhVzKeOyJZX3Tp/aufBzZVXieQiqgUo5wteOFtFPdjtlKok
         WtDXfQ0iE+Qn9vpdtYbTMD4dgNj21yFzDR/XE/Qz8ECFPcEDtZIQBClS4VIw5O7kIxMq
         Fnk1zdSl3DtWUqMLXE0RhM3+OCObFnUUWdAtwOEsFK1vVZn8Niho68PM2rBjXId+Mx05
         RkdBhm+QMYkUNzC+dUElcjwUtvb9BNAE+QSNkWBbO4Pe5f76LBoSj9rztyGFHKQjT7EP
         mYR7TrfjKAosJwhZGqn4k8JwtrqibMZJuSrLILemOh0b+LCjInJC/lWJ7Mh7Xjc0BJaJ
         M17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323307; x=1795928107;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo5hV3nq2vAzOrfwjLwLFQ7iNUuGgnQAdTEhOY7Nk04=;
        b=NF0SdLicpeKT6m07eknZRKbTpviqvS1lmQ2IQdQIGN/cKWq4VQowRwdPQFMyleI+4l
         TGx00JXKodl4Xd1l4izDV5+pCYOVq6VsFNRYuf4KM6IOQLLS0OrjkasmSzVby/HtQC+5
         hxJKfH7HyzwRJTy3t7NRO1Wsz5OoioTPNbPZKjWulk6aeTEPyIOA75jKMVCQlAURvK0h
         304kX+KVE5egmZnKRhbqsAAWK4XZaeU1h0//Hmq/oVDjIiFaSPjBrCUrL4+fbILknZjn
         Ms2eTbLgHsUjT0VBpunAalSHdF1nSCPCZ6MhrnS25Y9/9NA8Qytj4qhAehilaNh/AMDR
         ooug==
X-Forwarded-Encrypted: i=1; AL+hErESK4JIeFuCmw/RYlNLzdpGZuNmgbJrvKVkXcBKssoBQOppopJl6XEQ5cBXvcgKSrE8tDeHSL+u50MmXPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z87ZGrOhXab/VjGDXKjcYOXQg8GKlmjQ6Z6UBzKeyzW5/lOEChx
	WWWdk7yFoWsL5Q3MnjNvLamOAC5Ewxp9pzNSORCDSr2cUhxkIo5kbXRY
X-Gm-Gg: AZFdTZc3GYOfS/IbkF/FIugOrmAfXnPsO9NyDXF85NXB+0baNY0GGt4kOKEW4Li/Ddc
	PeDNIrCmxFr5XBXvwgULdmaruCtmzIGaiCl5HDAyxxreFWf21OXRV3qrhUM8r7DI0jsyjYEZwz4
	bdoHTYtomUmy1kMIQ3dUY3wn/iiF69vxgomqzYXbvxDEcb576tB9YsxlJWfDtBvEa84xIP7kt5u
	OLQCC4AaAdQLJ7W6MttL4QxzBNQjan66fAfUDRcJQ2TJh7h+2U90rf4QH6fPMOn35Gv9nX54pz5
	9TPDxl1JpQJ0WKnDDSibE0p1czPtEEgUYPIldziBQnyLrpDHnLeEpjyS7cflTkz1mKXPePRLoMq
	pw3KPT0mgtnMYLpYNAxksXPZxP4KPmZHg5MPTGNHJktjFTactvOddcPZrHy+vZViM1ZfCa9InEC
	nyiNnuO1+LxrBmcLlqriM2Cnsn8OsueRCzWUGiqvTGJG+Yd2rmei40wNmQkd0wdW8/e7wt47S6x
	gCy2eT5o2q4bky46pArgQCg7eWFcRWlpZpYFpmbsvHRqNEIagJWsZjpG56vfrTACJjRoLH1sJfd
	NpR1hfMk6EJF8NhixQ0WTtx9l0fFtZpKPN3yJ2S2SwaLNyXV8y16gkAdaGGhcpg5EYwGCeM=
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr5813273eec.2.1795323307243;
        Sat, 21 Nov 2026 20:55:07 -0800 (PST)
Received: from localhost (61-245-143-184.3df58f.per.nbn.aussiebb.net. [61.245.143.184])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm15989477eec.19.2026.11.21.20.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 20:55:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 12:54:55 +0800
Message-Id: <DN1GZS7LQ7BN.34S0SPYOQLG1M@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v28 0/4] rust: leds: Add led classdev abstractions
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Markus Probst" <markus.probst@posteo.de>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dave Ertman" <david.m.ertman@intel.com>,
 "Leon Romanovsky" <leon@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Ira Weiny" <iweiny@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113-rust_leds-v28-0-b8cf2f74fa57@posteo.de>
In-Reply-To: <20261113-rust_leds-v28-0-b8cf2f74fa57@posteo.de>

Hi Markus,

Thanks for these abstrations - I'm using `led::Normal` / `LedOps` in a
new Rust platform driver (`clevo-laptop`) for Clevo laptop keyboard
backlight, just submitted here:

https://lore.kernel.org/all/20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.c=
om/

Verified on a Clevo/Metabox NL57AU laptop.

Tested-by: Nick Dowsett <nick42d@gmail.com>

Kind regards,
Nick
