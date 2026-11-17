Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944123;
	b=ySuPQQIt6751KgU/L10a/2JZAkiYClZ5dGb6y3uMPphKDutyThtvGZvTTo3fFWJGLYgy
	 plZX63Y7HL7XHjRshqOpK1sfjlAqj876j1rgjuBI/nJ8OiMpXt7JjKrvJytQ7Q4zH06lr
	 mXgRmZq9txqYtZg1VUYm84KG0REkTwqQwbW9BTN1b6ZwzY1Ae3d620qeoCG859r+mPPGm
	 eTB2RCASoWPnQhvWnyGNSv7kg+tkfqL8j0wBhhIypBUr2ZxJOWPYsSyDSK+TCvm3Jvhgc
	 Eg1bFFMQWMxmFGwyWwBIfSZ22DsN3FHEC/vVVcgiVtKG9IxnuhmKTFhT+OSPRYTC5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944123;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zZ7VovX7jN4uYMkhQWyK3ov4JdFyFshspRex+aWFMm0=;
	b=1iyfcxNISQzwqreH5h2hDN1yMXP8PJbc26CaKDSBj4DLnfzzYUUHhtKD+7UtiYd7Km6c
	 nv3Led1QY7cI5YO6mTK47Jx4wL0qupjqQ5f5ccOo63GMoQWX5WC4lTlf036cLm5mibJFv
	 7XJYip9QHMKRD1wGAVSWtzyxEMaxHaUBTy4H3Uhq58hp5bczTOPpGSuEOxLqywBDk1PEa
	 84Swog1DWZmLoz6AH1kG0UCxZeIf5RMd0JcIfubLAp5/gLatg9dPavct5HmjaL7zCl9rC
	 BU4UqCvevuZsMH9YvtTbK4JF2ldsvgA0FMvJGpl7Nrz/zaL6wkd6AawMuZukfISjCaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70621606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70621606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so105123b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944123; x=1795548923;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zZ7VovX7jN4uYMkhQWyK3ov4JdFyFshspRex+aWFMm0=;
        b=r8LDVpPZL8NmmxjQC030sWtCXljBReq5+cebyqzMI06mT+e3PWBY6pZk0AaPockZ6M
         KddZqUczlx88ACSby6wp//xAgkMgbciZEtFNj6zjxSxUQ5eH7pl7VxgVcFWxrPYB1hfn
         8fkgZKXAi6zmf8takhhTtsA79KuuvbeEqzQrJ9auNQOnsSdmPS+Ym1lnrMZJiwRpr4nl
         vKO+NJXnObJzFJZPEWmKuZlfminGyHMs7/vgIX0qhy/jYqCi+4mXyiYN9l8XsQJZZXbV
         by18dPvA6EHu/3FL2E1VXryT5OrTCjkx5EyNeP+B3OUmVJefSrMtK9LtP2MHOWa6+TGV
         RHKA==
X-Forwarded-Encrypted: i=1; AL+hErE3GlrfFAiDxvBP0BF2Ombbi9FdKuRkEIZant53wAg26hOyGiUegjRnRYK0Te02I/HfVqrikFz6meImp+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l6r/vYdRkSwcQrcHdTtrk4K9QbOvvp/uD0zJTKKKyEVjr4M1M
	9a7OaZwTcf41Bg8eePknqKekpNDwIoVPtoMNNS/Co+hTqjd1aYgMXeFX800hLK99
X-Gm-Gg: AYBFou0bgOgK1ZuHdqiT/71f4d4P6Xr8u9rA19DipKfj4Lk127cJd5QJ0I7A0pbv1co
	ioXle1BxCTRyXw+MryYEgEnQx2050+mkzqIrSAfrO9aIv8NNdK/MVOrdKh/69hubDUGWwcPvn0c
	FHV+3OdCkIk0mj/MbSYg6ItJPThLhtFQqFm+v3QGDD6+8X9dZqljhdDqAB5bqRkB/Zn6JYpzPxQ
	LuSweFTu2xDHfECysqpiqALOc0Y4kJQ2wYhlkucqh5gn8aXKKkv4/NpxpGHAEax1T2mdKABMjgR
	xloBB4k9qJLCftmJYqA9H4jyXh+vbjTpLVl9nSvjJXGZvV+VcQRRI1c5TUP4JY2PHfBuQHpbQlb
	xyytMK7H1QRr0q4DoPDAG6BY+fACY/FDbdUpjCE9MZ269OZroqKd/JeUHweaSbcdaEoPl2e3Bf/
	RhPFJ2dC6gUQvpfWsfQyxAy7iLn7CbCZ1AT+UBjXu0a3FuvIJp5dL6ntO+hJCIbs0q0OFmTH3vV
	L56B4bqr/ucAA3yYB0jYCOCaOo+/1F3LpIHLCNV0833mLbJ+zdQbnGqIGyioJtVqlXU2aQQ3wd+
	zSA1xqsl7hzAr+qRxfUInQoAYHVNNHGKWnWPRdzwNjyA7XI3oqZeCbcRbO7xWCO5kJ5+/X5fJwu
	a0/ku6ZRwA/nlTrXhIziWkkqFDkqw/aZKLwPs/QwI6VDpC6OKCFYgcF9GjkLYkw==
X-Received: by 2002:a05:6a21:7794:b0:3e2:3392:541e with SMTP id adf61e73a8af0-3fe970fb304mr282751637.22.1794944122789;
        Tue, 17 Nov 2026 11:35:22 -0800 (PST)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com. [74.125.82.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8ffe6sm80487b3a.23.2026.11.17.11.35.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:35:21 -0800 (PST)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3acec6677so327090c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:35:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGan4gyozmZAUAeNftPd2EeadVYJQ2WaMqBrfgDLjP51RTB0VICyoq0GL+cLFSAgWFkvXfad87TGcnuNDs=@vger.kernel.org
X-Received: by 2002:a05:693c:42c9:b0:381:4b4b:f96c with SMTP id
 5a478bee46e88-382827a7dfcmr296117eec.34.1794944120695; Tue, 17 Nov 2026
 11:35:20 -0800 (PST)
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
 <20261116-iio-ad5246-v1-2-ef6b7c06d4b0@telaak.dev> <avwMpV3sCvMQNA0b@ashevche-desk.local>
In-Reply-To: <avwMpV3sCvMQNA0b@ashevche-desk.local>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 14:35:09 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7d4uZepoBqEJVcSb466fP=ZuRs=zREAcb3DzjvDA8Bjw@mail.gmail.com>
X-Gm-Features: Aa3M54pMmKLdjA0jFJLnsDDkzCIUJ6YpdPFI8j8vMI3OjOODp7f3IahMKvJGlo8
Message-ID: <CAPY4CJ7d4uZepoBqEJVcSb466fP=ZuRs=zREAcb3DzjvDA8Bjw@mail.gmail.com>
Subject: Re: [PATCH 2/5] iio: potentiometer: mcp4018: Report the available
 wiper positions
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026, Andy Shevchenko wrote:
> Take a chance to add missing headers at the same time, id est
> + array_size.h // ARRAY_SIZE()
> + bits.h // BIT()

Will do in v2.
