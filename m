Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455308;
	b=NSdZwAWxtXK4izXBgsaa76a+UEemsNEK7pEnlLywT4VWhg15XBrQmg8EFVjCOUmaKk60
	 D/6YOD6uopOltQCe0L/P73yAcbwKtFRwCagxvPoYYOY9+tBrxvkc14w4QP/4ulDKyBcgj
	 ocO7siMR6wzYri2lNsaQsL4fPE9x31BZypt+ErlQ0dB3Pk6gaw6xPeXu1lWNTC+evU5md
	 /UsEdz0ksmdsifKH3ANN5adhPTe20unrXHZiAQT2ib/ji5eJbitkfdgTpmP95cu327lk1
	 bS2kYthFp+yTM/+kTkXuDgaureKJUvzg302vMPMpbGfl64tG242Popm09OzMxq06XHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
	b=TV5twwQ4WXy6VyBXsbmbl5VySfUEmRyzptONE671O69ruQHGKZ2Sstmw9/+IamtDpR9X
	 2/G9fgdQL7L2O6s4YeBdTizD1oQc3B5ONK/kpPMVgMixADF8BJV/rNL69RLZvsNsT9AHE
	 dyBpgA/sUUrzCgurXs0ysqQBDRa7hFt2AXj1y24qTeCrc3zDCdXaN20RNnmKMWYMo9i6Q
	 6IUQWlQq9ZGtQXJT3XtZ6JGfS6tF73xY6adou6CU8De1zAoGaQ4YyKw5YRFa3/Do4zAeb
	 68eoiCDUmsTmf2ftRf4+ReVGOjzCQmjqpXIIATDh4TUMOc+vPada8POwj/oZ6DckCNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fH6SuyH+;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28812606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28812606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fH6SuyH+
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so37807555e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795455306; x=1796060106; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
        b=fH6SuyH+GAwKxjbaDzVOjRZqrGQU9AGITxGNf7rkedt03na7jbquWkibUTZecf8WT4
         iFKaebptewviIItuq+30wSBqYaSc3NDBD2/nBrJ5bYIWO1KTBgtyYFZBK833MFEI6vER
         pchYm3ZY11joBAOjjZNLD0+KFUYKgvN4MkRgnDA5iN/usm4fcFLLissoQpPs9Vy0PQD/
         yh9Jo1rHlbH0iLAzc/aaIk7GP02n7g8+izEw0TwI35iMm/wNLOweqqhgUHt0xD/LvMlo
         Nz2l2a/telv3TzE+NOO/6DmZMgH9qKJL5gLsslQIFFrVpdobd/KYe0LyZWGGgGw5CXry
         Qk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455306; x=1796060106;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
        b=TXdW6eddTo+kpn5GoNwHKpxJ8vZwAUdRHIDjYQp0pQ7S3FZcXcazngGbNPaL4gbHsB
         Ny42KhtT0AHv7abuWx4uAily6+8AErHfjMMODMtAqvThwQX2fk7ZgNQFQfVlYJiRJBT5
         +W0dQvGRAc979fIZXoLOqVupDn55KlM8MT7Y08TkWax6ieLV+20iEckquVaS4YiaKjLZ
         n8/2d3Lu+OE8bj95nL2/UV8wRrKnMg6BbBeZkVuWA+2K7CSTqzYU5BnDeJPSYq1pq+4J
         SnqYc2KWBSM4rJwtyowmKkWgty3rOb4B9wylZaR7nop4VZbNi4oeH35uE39lsNi05yFD
         xHhw==
X-Forwarded-Encrypted: i=1; AL+hErFJsy4dGlvGmWALSBoq2XOl/x/NEliD1BmkMx5AhuLikXnRZ4Q+pKcNzqp+c8z032N7J/X79z1RE/ph4gs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p5jDGRJeilEnY6hkC/M633hzMFaDDV//utc1PdcSPaIqHxpQZ
	OMi/Oo+vSBOt2LhXfc8kRC9BNsKMdv4DJCQkLZLJ91V9tXH9Zq5vUBMcgAgu2iRNASE=
X-Gm-Gg: AZFdTZcjaOXlpnfLcTIwvDJoBY/FRmZ+b8WCNu+9szDgnVXiLPP5ql5U953FZQKHyLv
	I8T5YCCVTa+KcsiShk+7OUA6jGn4HqKLphXpwFZMnShy1gqUHYbix/FIHC/5mgu37pYoR69ymec
	1/MdAtLHjNQaIY2k0g5Ead0UDC/HWgDuUcJQPWMP7G2plpT8Kk9687P9yXDXp2lkgSr0OoCiPVb
	PZePZk19pxqxpR5tvWCB+12ee8bTEhg/OY2TlLCzvosXclMmhs6zCVR8/EJNaNXX5c8yjyhDenF
	JE9HieKrDBRTJMqthJtN8r7S4p0ACCXMFvLAqoI/8rmL6863s0U5hNQx0hV8N4LLclJrsNCZ4T/
	ZB+6mQ+Nib+bBENFiZQEBKayB5ozEuO/nGNpgTpu+jCLTZ0oNKDnAdlC4cjVZuU0/wqihZ0E1W0
	2FR/vVm2wCDonlE8Jjs1WD63WMXsinberxob/bxH6evLNv5h3+y9PTYDGMUqDrqJ761sioNPuGg
	OfYSgQz/G5WfsFq90ThK2lfrQlR92A4zs1qne5WLPNDchXqTFeTCq5dPGAQzLo0eYJKzD2KNsZ0
	2KDpEdR3PyUPK9u63wwWOoNktQZItbmuVut8lfTSlruCwkVKoqXfu4o2A5HKYjUuLxw8mJd4ArW
	3r+UbbYYDTnPGBy9sIys=
X-Received: by 2002:a05:600c:820c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb887876c0mr279140365e9.0.1795455306378;
        Mon, 23 Nov 2026 09:35:06 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:aee4:8c07:a9a3:c706])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm291142275e9.0.2026.11.23.09.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:35:05 -0800 (PST)
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
Date: Mon, 23 Nov 2026 17:35:04 +0000
Message-Id: <DN2RSBZYE9CU.1T1IA1OH8S0UC@linaro.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>, "Jonathan Cameron"
 <jic23@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] iio: adc: exynos_adc: add Exynos850 support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
 <20261001-exynos850_adc-v1-2-791b3516bb9d@linaro.org>
 <ar9elr1_tuFhJi1r@ashevche-desk.local>
In-Reply-To: <ar9elr1_tuFhJi1r@ashevche-desk.local>

On Fri Oct 2, 2026 at 8:34 AM BST, Andy Shevchenko wrote:
> On Thu, Oct 01, 2026 at 04:09:13AM +0100, Alexey Klimov wrote:
>> Abstract the read_value() operation in driver data exynos_adc_data to
>> support SoC-dependent data register read callbacks.
>> Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
>> It also requires its own hardware initialization and exit routines.
>> Add them as well.
>
> Split this to at least two patches:
> - add .read_value() callback and switch existing users
> - add new user

Thanks! Sure, will do.

Best regards,
Alexey

