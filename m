Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039669;
	b=bt6d6j938LCTWTxwNmeLJAVHm86mN04QYcDiL+XPxDvN3RBRK0v626zA+IB2Me1HI5VJ
	 TWMJkZAUCeyelnWxI8Y0ExZxnyAWSpA+zqTP3tGwahQyftagofMxsoCkecH7W6L4wvtXs
	 5yBjPbM2/aORTYmo2l8m7X3BtT+Eb2rYwhmNVYdlYhAlqFscBYmZYoIPqzrGPRO/Vc3Zd
	 LIhBeKfCnPcCpTo/94LphI+0DY2Rj1xdd31Fnea69SMwvkrZr6hqrMk8HoI34z4DYyA8B
	 NicNzuZ6bDydQVFwyHC6TFLzR3Q3H1iADDohvArbbqfYNPPVBhy+ijKxBuZT8udTUWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
	b=kEANc1k3I7U9ORhxvkUAKPPXHvLY5g/MNZQwjk4FGeFf/MIzdyq71KQEwsOKG0CYgFaQ
	 sgqemei16QuppdTFO8+5adoQp5aPxH/VZKLhDaUIJl+uStWPPmR4cSUKmFpqexJXZZi5S
	 pisM0fGZoUNiwi1Fcwg5VIwLnnCrJqv3ilhk6VpJbF2hQ+NJ1mJZAhxSEqluwdbS47hna
	 s2jWigivcRkvQrNEFZbsXVgcJ8ME2i3IPEXF2Lvw4VRIEXes8QTCR6xLvnc58msc/ykPF
	 IDjP0VQWKbuP/UHeVrGxgD+Nu4ycH1o2Dco+ca5z4IRJWSo53LmECE6+ctTvv9UMGkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8L9PHOr;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C6606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 256C6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8L9PHOr
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-862990b7bbbso487105a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039668; x=1795644468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
        b=v8L9PHOrcf6EifRvOUzF1B/yU+AHRT/pt16rArYrVplOhD1uNp54Hi2sayarkYNx4y
         SGKwZwsGeY3hymNTokhMwV0Is8nFmSWK/C/srm39x4AXDlVBGrEtzfqhphZpiqG4cyNh
         OPhlfAsx3SNGvrgsWDjYaXdgOd1mdB/TkK5PrT6ZktQ446jnF/xC/82kilWjejCQ5emf
         LzJa/Exf7jivcmHArr7VqwzQdV1ODOubkngAVZlJCsPV29HLCt0BcCH7Hj97N6+6YhWx
         vx6vhtZhkipbMCTd9j0Bu/Kr6GW85nw+GLNcCm2oxh/y8+g+KEfcdwvHewCfCCfkTQ+G
         uB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039668; x=1795644468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
        b=txg2Cy8BGtioYxZNJZECiooYejX8zZYqLoWFlL+qvsUj+3kLi671VauONYQO9xLnrH
         xTfoacLcce2JvQt9ypqELA8OEEx81LlHNBIcKtGz6VdSv50R5hlvyCsF7YRoJssdPRu5
         44euCGZg9Of2TTSmNxjcPvru+MhQOCJHTuSyQDVZNbPqL3VCsO6Yy5a1Xv1jpvEec01o
         xFOXiPGDNISYGxh7KHxXCfJlU8QHhqW1JNJULO37sUb3pfZtBJclysLL0oMA44JRE5gy
         KOM615nMghvtnOZKNG4L4i6frv7ww3bxbd8cy/44GyfsRe05wztsJzu6uL+WXH2pQprh
         07cA==
X-Forwarded-Encrypted: i=1; AL+hErFo1WdxTzzfleHzoRtYJKRqr4u9bWO2bZEL3HLXqOXBbRGlV6MbUAlpfdgP4zg3ry+Ed7wlbicja6JTFbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lDdbqLlLxF4Z4Z6NXfKkgIg2Wfq6IBZQ4oFl+igV/1top5pc1
	kvgDwI9jiXs9rvYlCK3TWmv4hshvMJrKjDYcJ5OG9vYuctrVlHln8ZUezdqDUqhU97Durw==
X-Gm-Gg: AYBFou2UKWHiWa+dX2DqkyHzFlZjmyyCM+honNq1T7zwK2ZrNLlhtFzu4yNDoiXTX5I
	X6FBT+J4Ra3dshnb8J+KptEsZqsCd/Xmhy58fI28TSKEjIY1T5lLN9caJjiEUGZEms294ZvRPOL
	nWLFSwWcqfu4UEZ0gvVFd8jt9sbLa1UFOXOP4JmWl1JgcTg3HH+pHYq7KE9Sk+W06y4pGH5jZCN
	yXjspvi8v/DA8e6yHLXD86aEhu3CWnBbKJTC1jKj1TaUC6wGqCLhLgxePxCaVOr3ll7DlRkwTG8
	OD9I9sTFtkcH/KJGSDZF0FV66rAUgnjFiIPcoPN77IoWWTuk9HADCRG3pamIp+vhyHYwNFAKVsn
	1mfmsDF5PBs2N7XLagIglCabys/f14LzuldTCtfIpj9oWbEYAqEX6tyB7hex/9myDAocNAijHtr
	e/4EL2XPZrWP1pndAd4WPVL/JMNZ5w3Ipw3pFL+w8RLjK76i+dxaBe71ok79mjiyraY68n3vJn+
	4ZKKsxAkcMsb/e/8O5WOQMOB2LCBmc5T7srrGivc1iHQagsTDIBYAOPgWN8/gDXaXTefWrdyMJM
	5uGob9D7J5kSPBFYKLHZQgXNkX6UC4ymyLQyb8ozuIwCaiDqxWUuQtSGSjE4Py+/h3IlJwbioE8
	hl625wATUp7lfNl7eUBiynvGDBF0H3yLpxHxbotm5ag==
X-Received: by 2002:a05:6830:3495:b0:829:9992:20f0 with SMTP id 46e09a7af769-862f08c9ce4mr4131980a34.28.1795039667975;
        Wed, 18 Nov 2026 14:07:47 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021aae9sm3024029a34.18.2026.11.18.14.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:07:47 -0800 (PST)
Message-ID: <2fb4e011-8ee8-408b-8684-f3bb8e1ac624@gmail.com>
Date: Wed, 18 Nov 2026 16:07:45 -0600
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
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
To: Jonathan Cameron <jic23@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
 <89c8cadb-0ccb-4aac-9b95-89f355beb24a@collabora.com>
 <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
 <4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
 <20261118215144.301c2467@jic23-hlaptop>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261118215144.301c2467@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 3:51 PM, Jonathan Cameron wrote:
> That's indeed a common solution to cases where a binding header
> is involved. So I'd do this - then chase with a patch next cycle
> to use the define.
>
> J

I jumped the gun a bit and sent out v3 of the suez dts earlier today 
with the proposed change [1]. Should be all ready for AngeloGioacchino.

[1] 
https://lore.kernel.org/all/20261118-rbrue-suez-upstreaming-amazon-suez-dts-v3-1-c1a8b0febf35@gmail.com/

Thanks,
Ryan Brue
