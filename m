Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942965;
	b=ncfioi7u8r3vz/D7oAo0F0WO3amzjkIrD2lDbA8QJ5UL2IdCAkWGb2HCAvmqwQQHrRp1
	 mzc4bgu0JWbqYZZJBA743rP9aoB1Kp0TZ0DYyCIUPNWmZXX8Jl3JRF1QWjF6RvKcrPkbK
	 ftuTm8fgnhN/mBS+xleXpm46I1hi1mRP5eIxxCkBGMJwUs6XTcB91++vXGct4HbZFYR1O
	 YfriqwOWL+zUNl/2hlqCFVlGEzqpQP1pVlRNrMYMSYbYOuFLNqkUAF5HBjjhLFRV1xTWS
	 3J5bNw2qU0VClRQTKxV7GGd1UTYc/q1MNaveSjM+Tk+2S7cnvBa5e+A5C1D3mGpjJIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A5aBRlJ93oeuYRowBY8GTJ4iLcl9lwiHlzGZwaE2h2I=;
	b=d8LyVv6NdTvqjiqVgFUH2YhRrdVDqrfhj7eeZddR9Awmg8f3BglajOCut+oKtQi325lC
	 Jq2dGvTnq9uRL6k6lxNrFUccStJP2YBNbF3pEVuCnR4sPnGnDJaVhSe6xdP35dd4sSqeD
	 S96eQojZjBoX3Nq2M4UY3/pKur2ZV1AR4rfBH843PzN5AUrMY3OAqT/9rooKBDYodcgHa
	 Gr7Rjdrl+g5F0MgSuXdM8NRpjyBsjxcOUEnfvSEIWwkpWvpLjQ9ylAJ4mbiK9Ddsvtusp
	 /NV5ccx7appFdJEUZfjEfW0Q14jyTObcQqvXjk6kyzn9tL2w7j9LiCNgmTGb//nTVQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ns0CJBEq;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ns0CJBEq
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so331347eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942964; x=1795547764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5aBRlJ93oeuYRowBY8GTJ4iLcl9lwiHlzGZwaE2h2I=;
        b=ns0CJBEq7gPtyVx9ag1GU8YhnxjZRzm8TjF8YEtSbH++B1cLOdeCnpdEgyu/bHnvHS
         8HVE8U/657mc5jGn600jhcGr2ccqxQxLv+grCzxmPXat8eE4WarVWUhgmUEGCcYkOGCC
         j2hTJ2J0jddIBqMgmTCPUeg4WlmkBZan3gj1kTRznI0jfMsUcZuG5ow616I15juRI0LI
         3MmU26eMd7rbTKcbBlmV08x1bWJMkB4YXwgUBF0Ku9u1XcCSm8/+GNNSRsX2FxSPUXAr
         2PGo7SGxR3V8I1XysH3tebIUBDCAPd4iAZ444wE2nTdu25dTUuowgYeYTFkzG+xbD4o1
         hpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942964; x=1795547764;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5aBRlJ93oeuYRowBY8GTJ4iLcl9lwiHlzGZwaE2h2I=;
        b=yjAvM7dTAdskmcxDRaWs+YlIT8CwvAFCja3l42CRTym/qC9/6LlSE3xrFbcqUMzWhj
         uCsw1hE1NPQviSOAgHl2dFZJ3K0gX8IWwC3wV2iXy80SI6+G09K0nqIgO5HgiSgGNZ3G
         DLZQXlgIioDamU4B8Vi/CAaXEP/xiuYOziCuvOzMLagy/EEUiFnJlDhQtDxMDGu8zYec
         L6hrKDWTZej42Wpd0PbjE4ietzLARajVkSzvuGD/AdBWv8d0blRH94GG2Y0nnd7kqh2V
         JepND20pTygSLEE1Xgp/YGGPc3XOE9hAVP/fLeBTAaVyEJ8CAGJPqvv6AwXwCYM35vlp
         Jkvw==
X-Forwarded-Encrypted: i=1; AL+hErEIGS5CZIt3mnRz8flkF7HPvrimbWF+dadxFQfL7+gkqTTwiW4BkIr4HE/x/TYuN02ucxFUx+i4lHs2luc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bk5bnlmeoaeC0m4t/uwYh1soenxj+JHJOtq/ERisgux74s4/c
	U5XxkgB0qJ0kEtxNOSnd8qwjB8eDGQeK89HK3IEg97U6n8e7PACMwnHBd67tiGtVVqg=
X-Gm-Gg: AYBFou3Kuo5+8a/hEVZhYJByzqrZPeCAz5Mlel5tbLO2DftPf+OynFKVO2HCRININnz
	l7SaAWbVj9GpoUebtSce6j4cTAt547i6teGA35G4kuE5pVWKMqr1/nU9vYdkIwziWFGHYbQ+V++
	BzzH4ccqTTXOuujDdCQbs6nu+CG64VQoWe7408/02xUEsD/v+n4QwUUdaZjDMIWiBfvkDGMdVeI
	p2rGp4bGYtv6I97cmCU5IIll6muj7hqxHEu26ZHNce+noTRp9zvgtazFeTK2XVcAeh07bmvRsTL
	g+x3W0cz8iUEAh7uweC0EMBBEApRGYxrFUVrH2hbIrlwtEoKbmvFO+TYYD5UliN8uwDRcxDwp0j
	M1apXnIp30rOQ2IyVKIo+OCkWUpZ3CSFNCIltsBG7dmhGPmP5+gu1/zm4nQ302b+muv5tWDqaMa
	lCvMnZMFDsj3LuQQ81414ZiZFDJCVRPAe36VfAau/Ju2uaPiP6u2R5m+7LTq47jrvOG6dzCLAJE
	NMnU54qERENm2OLD90Cf1LvUk/8CAkzF/vkUEGY9mDbzYlcXKBbc1PjhziuCiB5ZGrbjh5y1TIu
	c6YH/vywtFjDng9oGmVMkxIM7hIy/uo/7MH9yW6ZSphEQayXWo9byKCFDjAmkBPPF5wNNkY6YS/
	FzTs1+IhOATILatYNB71l6o2iUc9KN0bLb5Lr3qggKNK6EltFiuec64C0aMChtkXQMDm49N1NSn
	XMXh52xDCPg1algbIzBZN57uHSu9TwvWT0KJN+gqu7Fw==
X-Received: by 2002:a05:7300:e910:b0:380:f112:3cc9 with SMTP id 5a478bee46e88-382829b7e9amr331367eec.38.1794942964083;
        Tue, 17 Nov 2026 11:16:04 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm10019eec.8.2026.11.17.11.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:03 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] iio: proximity: sx9324: reject negative hysteresis values
Date: Wed, 18 Nov 2026 00:45:57 +0530
Message-ID: <20261117191557.85244-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avymdpJluGiOnZEC@ashevche-desk.local>
References: <20261116205320.26070-1-kapoorarnav43@gmail.com> <20261116205320.26070-4-kapoorarnav43@gmail.com> <avymdpJluGiOnZEC@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 09:09:42PM +0200, Andy Shevchenko wrote:
> As noticed earlier not all cases might have this issue, please elaborate if
> this is for 32- and 64-bit cases or only for the former.

Both. val is an unsigned int and pthresh an int, so in
"val >= pthresh >> 2" the right side is converted to unsigned int and
the comparison is done in 32 bits; long doesn't come into it. A
negative _val such as -1 becomes 0xffffffff, which is >= any threshold,
so it sets the largest hysteresis on 32-bit and 64-bit alike. I'll
spell that out in the v2 commit message.

> >  	unsigned int hyst, val = _val;
> >  	int ret, pthresh;
> >  
> > +	if (_val < 0)
> > +		return -EINVAL;
>
> Same (semantic) issue, you are checking variable after its use.

Agreed. In v2 the check comes first and val is assigned after it, here
and in 6/6. Your comments on 5/6 will get the same changes as 2/6.

Thanks,
Arnav
