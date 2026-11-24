Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509716;
	b=MaEkqB/QigMeQtgSFK7NV6xr6DTQIPZ4AY9SeqTzPTAw/AjzWgy5PVQdoImqk2lcxLcE
	 +6hvNSG10Pui4vM0TDpu22y81uPOPEpTJ2KRkA2jY/VTUL79jkefoiTuPUWaYXWQ0svp5
	 I6mcTUkiDrVqLpO4S2PT4icty5QMWTRUOwUMdC207G4hHqQaM/0FfJ6cY2FVqPboyTbMX
	 jLr3TBtUdVGGgqP/j27HGnVZqVF2ZJ/Sen/vdCKhlqx1Mgc7grGcmaxP+E8Ol9WVkcopK
	 +egOCj9uVlN78YHxge6+W7oTjnGavAlTGsEi7eblKTjGHqJTDBLgrlzqunjOkH9CuMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=miq8lHAk9j+ldEOiiht4iRcOG6aLFpZt8I9oVYIzhag=;
	b=Y/1WC1uOV5wERqWxJHy8xNE/gEPEKJNgm15MZDLNa8wPafQuGxZFgLzYAeVNQv36KKjg
	 C5OkVfZdHc1UmtaKbcvoyxg3V1VntW9nCesD/8SS9reZ938tOE6bKJKC3lLJM3xPuLmIq
	 +PNrZCe1qRrTqvS8ZKPsBcnDa/xkXhigQwZ4NoQwLq/RY2AZdVoxhN+bOkgC2aX+Ky2dH
	 I80J4wzgMYmklqwi0cZTWvxPzb0FSLngj4/8bPbUtiUaiT4lZH+vYsZ0S0IRpVDODi+md
	 Lnx9tcqxNrT0HutA45S5axPghBakvqmPGH1nh0kzq5iuG4/h8ZO6/c0xO3LhbwoLBiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EpuxjjND;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BDC606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EpuxjjND
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b40470fdd8so2065266a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509715; x=1796114515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miq8lHAk9j+ldEOiiht4iRcOG6aLFpZt8I9oVYIzhag=;
        b=EpuxjjNDpv8P/TaKIGvDrghu6h29YD9v/Ow2khz3TFEhVVUlhELGmYhcihYvRqSTOB
         ucOI6LuN+ktO6hQJa82SHMUX9PK3Rw97/65XpXoHq615v6hnbDp3EHh4difyb5PpWlMZ
         sc5dH/3DeTkKDzXWTfEp156NQwATS3O5P2lchbyPU7ZO4wMLz+1X4Ky/QnfGpNdiCdrh
         Ui9OR+4YellgZy878gCtG+p2x7RyZwrBbQgrbLoX5EgzNJoAuVvSOTqDSXObriVLf5dB
         lS1RUgpH273WxkYJ9LOxbmhzL8BPmYapKqA6W8kd5Y8JsBoGfAHq4cIZyQ8ru04hgMQ4
         BYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509715; x=1796114515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miq8lHAk9j+ldEOiiht4iRcOG6aLFpZt8I9oVYIzhag=;
        b=pcdQD1TJHoN4JkjZmUZhqlbtTUJgXk125mNjJqLwXcbxfF3d0W3O4TcmEZGDPINFh4
         btbgpgtrSwIP0e68VDyz6iZ79Xt7qFWcribOikNm5WB9LqFfaAAWfe1W9/9girFiSvA8
         N6lFFuYE4z6tS4NWkJx7k5j2xcFpfR/kvT/8oYEWlU6SRckgr2PbFpWZRbk8mxPZlKx/
         MC+zVbKDaRFhixsJY8r7TtrwbhhnxS1lolZ/wxw8qrO+X+Q2xo9kkaG1VNCioxUcMZnX
         6ZlXAubkBEQ2PQHIBIFHa6w7GH2dHPNg2UiGh8UjJjAgzhsf3PaqCeev8VSKKcqEiPjN
         hpcQ==
X-Forwarded-Encrypted: i=1; AL+hErF4dN3btzkq6nbftlOUvvMz8Hbx52Uy45j1bafsxMYexIcUnma/ZJzl8qWZbsf4ZymtL1cKUmD3utc/vnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WJpGpPmJIbCZSvZ9woU8ZOj//B78Sh8MlOoVba41O0Ak9kdk2
	HoDOZR3nh4R89hsMpCbd27QBSVnEWeF86v/Sglo1tVJQkbRwvzaawLDL
X-Gm-Gg: AZFdTZdgMhEh0DiOnb3oyQi7WERa3BTFDLD8Ky3MTGj1IbCXJjH9H32b9TQyxT/u1w7
	f7IKYMRmJMUnFN8G601xmcNtyoWbk3c4HNFDRC1oGrwMI8FbcYCZ3dOLq5kwpyW4394oB1Ep9xT
	2fa6wU6FVFeByTyLli9ha8Up29C8bZbOOHhKeSTRZ/q7RhzVVR7QvFZph+9YQW4cxGX+OF+n65t
	PZm6on71D+b3UlJ18EtVnsni9RBk+G/ns34LHYOfhyqXv9AkhqutSROeLY/c0Ko/rFD+CLqT52K
	yZRZWxAqi9Dy3TF+yNrHj7IodkACcUAvnYTOMxfC2lCYOcLbED2ePNnLWNyZjP1KMHnPA3H+vue
	2kCBqNOy8IF0sLSCWebkvMwe0H5bc7fSFaXeDg/TRec8qIJ6YRqCw04WmHUe809Y/AMt7MdRnd3
	gQbWGzQFWolD7b64WKY/wBkNaWPmJnh+uEV5D/dzU9UpL9JWVaDLpc/anGaZwZRTtDdQPsRH8Al
	ma1ISZ24zRGZj80yswqRqjITBi4tcXpYNyChcxcJE7lVqlXRlJdYpIxjELbRV+hSKoHkXQJBoW/
	8on4Mr3azgbuK46B6ttu7MMLGKwQ+BJANA5Tv28QE0yEXb+kRmOkQ9Sh54Gd9R1c53W3B50BokN
	JoeoUYA==
X-Received: by 2002:a17:90b:1644:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b41caef685mr10503851a91.45.1795509715146;
        Tue, 24 Nov 2026 00:41:55 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm24432973a91.4.2026.11.24.00.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:41:54 -0800 (PST)
Message-ID: <c88fd429-025a-406d-ad80-ec464db7d1cd@gmail.com>
Date: Tue, 24 Nov 2026 16:41:51 +0800
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
Subject: Re: [PATCH v5 3/3] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 chernyakin.victor.j@outlook.com, cwweng@nuvoton.com
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
 <20261117082832.1551574-4-cwweng.linux@gmail.com>
 <20261122030647.70b41b61@jic23-hlaptop>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261122030647.70b41b61@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Sun, Nov 22, 2026 at 03:06:47AM +0000, Jonathan Cameron wrote:
 > > +	/*
 > > +	 * pollfunc->irq is not initialized until the pollfunc is first
 > > +	 * attached to a trigger, so only suspend and resume triggering
 > > +	 * while the buffer is enabled.
 > > +	 */
 >
 > True enough but isn't it also guarded by if indio_dev->pollfunc
 > inside the iio_device_suspend_triggering()?
 >
 > I think in the case you are avoiding it is a noop anyway.
 >
 > disable_irq() nests fine so it shouldn't even matter if anyone turned
 > it on yet.

I checked this again on v7.4-rc4 (b6a9fa34ce41).

iio_alloc_pollfunc() uses kmalloc_obj() without initializing pf->irq, 
while iio_triggered_buffer_setup_ext() allocates the pollfunc before the 
buffer is enabled.

The PM helpers check whether pollfunc is non-NULL and pf->irq > 0. If 
the uninitialized IRQ value happens to be positive, disable_irq() could 
be called with an invalid or unrelated IRQ number.

This is why I added the iio_buffer_enabled() check for the 
inactive-buffer case.

 > > +	if (!iio_buffer_enabled(indio_dev))
 > > +		return 0;
 >
 > As above, I'm missing why we need to protect the call
 > to resume_triggering. The pollfunc can't change between
 > suspend and resume so there is either one there or not
 > in both cases and the guards inside that call should take care
 > of the rest. If I'm missing something we should look to
 > fix it in those calls!

Agreed. The same uninitialized IRQ concern applies to the resume helper.

I also noticed that iio_trigger_attach_poll_func() does not clear 
pf->irq on its error paths. If request_threaded_irq() or 
set_trigger_state() fails, pf->irq can retain a stale positive IRQ 
number after the resources have been released. The normal detach path 
explicitly resets it to 0.

The error propagation from iio_trigger_get_irq() was fixed by 
dff701806ab6, but these two IRQ state issues remain in v7.4-rc4.

Would it make sense to initialize pf->irq to 0 in iio_alloc_pollfunc() 
and clear it on the attach error paths?

I agree that fixing this in the IIO core would be preferable to relying 
on driver-specific checks. I haven't reproduced an IRQ failure at 
runtime; these findings are based on source inspection.

Thanks,
Chi-Wen
