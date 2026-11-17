Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943922;
	b=qXKFehhnZQKjDeQtFlA6UJp3HLNrPx2XHj1+TRgMzrWN3psoa6cA/SZjBHsoOf24jKw9
	 5cG/NTKw3wPkDuRjwpgiXYo9Bm+VipFRn0PN4uifqX9GmBJdh8v6BmZg7igbRIJ2kIR86
	 bRD9bZQTx1IQ72GfnwX2p9aZl8SrLtEuxy19ygyVmIwTL/e/wIEP1Ik9f0m91E9U+0WON
	 fD95zjWg5LQmRY5H/QhLxYdFemgSaY6WKXV7/Z8ZwUJa4VkjZcZWeZWcH5qw1I7krqSNJ
	 6UwqXcJnSXdX6q1hbQeA3RwMk01eZ+FrVU/BDgvFf7a3fLXA0JuFLcp7VD/mzQNUVhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943922;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=q2L8DXdCwld9OCOazUytyYg/1wnMDhs89QIOzCqPxzI=;
	b=jj1bkGrNqcnouVyimqzDxHCZhGejuq/fo+7RXljlGuK0R0CLr/THJ8Y9tVr20K1ScglT
	 ez6oBwKVl5GSjQkqAFYibWPd2dxVJM/HZfM2h1nrNJpFsMsQePv5T1MF1DAzrdePbi0l/
	 DNcdnAOoLv8t3c8OMN+5BfjcMb3ea2YiiT4GIJZD5Par0jx0R/0D9NIDMsyD5A4qwf0z9
	 WJzl81MqMm4sJ5Knj1BcCyp064sF6x7FYkTq/891S/L89Feoyz8JE+uH5XFr7+dqhcQ2g
	 uwsQWThQcHGvQqPSXSLxp6vi/1K1JqpTWdZ3ly3OodYn8h6zgkXt3bDHzMefrByleKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CA8606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CA8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so39499a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943921; x=1795548721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q2L8DXdCwld9OCOazUytyYg/1wnMDhs89QIOzCqPxzI=;
        b=1ZWnWfzhBVRXVYVOUV/0B10g4UERVTKzgqk/Ka7SoLWKI6+3JoaV8GLC3iFOXG6pzt
         0OBXMwK4fdCD/efZbzPRDDH7TZ5/yB5FzW+uEAfmQ5kgOBXQnUQrXnpKLtaaig4yFhgQ
         DnEUQHPlEAOTnCqZPfj8zEOHiFpC/N+eBZn2/l0inFqgjtQ2tBNMwzKX4es+ifsCO89h
         e/ePwYv72PCYzquX/ksyoIFl9HL5YNA8GwxM490ffm8pykvSLhtgr2wiNMkLLQ+SxXQP
         fL7q2WQDWNsgFKoC9GjHjiMNWv183VPwXCtEha5dQS6ztDtLUTMWGWvNWvcjZ4s3r8my
         TRtA==
X-Forwarded-Encrypted: i=1; AL+hErE4rnX60y+CDoXCVmKFffzChPwe2GITtgdEh3PWPxPm+xp/qEf0nlJt229Iysy29G/jzaAuRcBCbztCtDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z92bJPIy4ectG3Iu92wGVKJrIfEmUHa4LKhEKOErELBohFHBDE2
	wRmqjEJxQLNGaVqDLBzh1nl+VyQcoA3z8rGK//+zczwb3tzcdzcWPxgqWQ5xcdYX
X-Gm-Gg: AZFdTZf0kobo9ZjzCvX/s8VygTRAjebOOUJHYmcHUqr7Cbws9HXEJvd2l/5Rqr3mS2P
	PpCn6+50EKSKkRyNWHm1cr1vb4aikA8FyUZ4spJKyrJYYLuRncCmGHktvoeaCap9lcMEIIHfKoB
	93fgnjEtGPP7kMDneiM1Xl2tczVZQuJY0xW3Qv4N4vNO4dg16D9YgBX6aorOhJenwh6hMjsPQ+L
	zSlSUSO78NMtWafag+uE+GaAhCRzjosQmH81HI8FXpaU0Pvo8uJaTpsvUSNEBFkZ53qqnMJwSxI
	X+EYbL5uGVR2ykEOEuObptu6gc4U0qTHujHhZo7uebsMRFKLxsEcS71nJwtvXAVYdDB+ncGcu8A
	c5eNcGVs51Pk6vrXPVhyVlnT/0WF0cWZAFv723D2Bfdom4/BBgy97GJI7l9hQBeJKOjsfj2tI5K
	HPVWSUnREwr1GtD9EuOqY3GvPXbfJJnaHF6lQqqSF38H+b8vmTWdh91S1eFKnAvweegaWi8ljhE
	fgpQkjg5NhBLc5Sl7zFA1CPZgTdoC4KZej3zRrUC9v7VanQ8SDBh5Eg1jwkGHZQvPMGR8ZpIV30
	xy86qgug8e0gcVl1gv9+/McBKeyu5zecVnJ3/Zd1F4BoTenXqbZ9aUaKmSBh3C/dlBO/vCsYVWt
	0NB52DdA0RUHbeKz1yX/BXMPRxuO+obZi3laNDkzViGqs
X-Received: by 2002:a17:90b:17d1:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3b3d0689853mr407792a91.4.1794943921103;
        Tue, 17 Nov 2026 11:32:01 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm378539a91.8.2026.11.17.11.32.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:32:00 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38133db970bso640536eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGt4C2xWfTRYx3Rxh/2uwy3QiPWP8JT9XpjV49mU33iKCMq7ggA8Hqi0/y9ce7qwbT6ExFs10nmVTjCBFI=@vger.kernel.org
X-Received: by 2002:a05:7300:c382:b0:35d:4185:5395 with SMTP id
 5a478bee46e88-38280c3453amr432872eec.16.1794943919489; Tue, 17 Nov 2026
 11:31:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
 <20261116-iio-ad5246-v1-5-ef6b7c06d4b0@telaak.dev> <avwP2P1zTgFteODM@ashevche-desk.local>
In-Reply-To: <avwP2P1zTgFteODM@ashevche-desk.local>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 14:31:48 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4zHV-wCszetvFnVNA=v5O_rhY1YAeMNhS8r3nWC5wJCw@mail.gmail.com>
X-Gm-Features: Aa3M54rCns0V1-iSP2as8kRCd3gnBbNDEFw_nlMpPdbVKkD4iVYzP69Wrp7Z5RM
Message-ID: <CAPY4CJ4zHV-wCszetvFnVNA=v5O_rhY1YAeMNhS8r3nWC5wJCw@mail.gmail.com>
Subject: Re: [PATCH 5/5] iio: potentiometer: mcp4018: Add Analog Devices AD5246
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026, Andy Shevchenko wrote:
> Make it shorter and more generic, in this way you spread the same text to the
> top comment in the file
> ...
> and to MODULE_DESCRIPTION().

Will do in v2, with your wording.

> And here make it list that is scalable to expand

Will do.

> Keep it sorted.

Will do, for the DEVID comment, the enum and the cfg table.

> Why signed? Can the HW return something negative?

No, I'll make it unsigned int in v2.

> Strictly speaking this patch can be split to two:
> - adding 'div' member and providing it for the existing chips
> - adding new chip support

Will split it in v2.
