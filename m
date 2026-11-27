Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798570;
	b=XvlkA/de3VmrQkN2Fzn815voi+3gzbSw5p+rlvEeBlKOr+fFZUY6iW1VMd0VGvI4atfs
	 aj2GqII1IiSuavmHCMiYR6052T0uKGbhSZSqzxPTEbqYZXhwFAhXuoY9R1Q6m8vumPYxn
	 RJNiHTQAIXiMj6Z4TCWomB3HpYR4LyZ4q+lN2/N1hPq3QR6JMiMF9rL4Awil6jgSli2Bh
	 ep+i8yOBUYRTClZmjua8hokzefwxA7UNTbCUQP567LGAQnRlq+pP0w6+O72QgGH4GmTaa
	 ZWFa6/Zuut7xpMG7AjjilwH0gOuiL0eO9uKUSmNbwBZY929g0NcE1ZjR6t43npffWNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=quHNvbQRn8H67Iq0kxiILrUyTDkIf1n5cs4RNseeoRo=;
	b=1jjq/xMDk9SV63rRDakfDrelgRmlQCqFTH1iC1h63GdIz9jHXXGb7XYYARmY5J8lGX75
	 9oMVo34zP2mufQqY7+bbaSgt4KUVlqOVX94ZBz/xwS2k4g9YR3znvAMHOX5ur43iUemzx
	 qahEW8cxN3ciFGLHXyp6ekrh9qkOIqwRmxRJgENcBwkr91s0q1mXEImEjWPS3F2fuIAgV
	 DgkMgyXCHbwgHA7MRJ4BnfioZVeCjUEyyPc0wZah0tV8r0hHGOk//zP2t5fRnI8jVTVlt
	 3no+Yj0BK72G7/uQPljM8S0X91lQ7tpLUNgjKgAP8aGFxHziL8XNOoimT76H7tTtwEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slFQninl;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60E9606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slFQninl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso5666697f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798568; x=1796403368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quHNvbQRn8H67Iq0kxiILrUyTDkIf1n5cs4RNseeoRo=;
        b=slFQninlxmbGqzusDFzKTSdSae0xCitAw0Inxz2dycLHH2As7Sm/l7iooX9Hm3Tq8Z
         bzViPFyQR+tpbRX/8ClszfCr0MBMfYFUBIEi/xTOfw1rpzVYmc2ZOiGlpqE/LNNUh20F
         9pAUaRI6to5l9Il+y9wLkxzmF7jmQ/+BxZ0KQUQEcTEiyriEvPx4CL0ULqXoeTqpQjkr
         yHNuG2fffgLge2SgbANo6vpwMV1KFb0h+QERfmfglck7DJDFE5wGJxwMSK4pWxzTjy7O
         fwh+RqhlwkFkOsXHpFm1wc8YlUmeL4n+VTogBbI4OtB19fJVtfkctfE924xBnrmk78ph
         F2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798568; x=1796403368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quHNvbQRn8H67Iq0kxiILrUyTDkIf1n5cs4RNseeoRo=;
        b=poIm7oHeBAh0MRrXaWPJa5garI06fMfncaDKMETx3ykQD3snBFnLgeKZsQKtB2RlJm
         eu7pSqJHEGbVA+E4f40AOpemYXZRhe3H7B6UQB3ypjpz+Gasl9COpnSxdJkPP+EU9eBc
         pg7cXAOtuHYS/IwzAhhgEC2P0c2W3IYS1jjLy4AOWlrcUWj1/OC9S+3Ki35OIzM5iZWX
         DEl5SSp27pt82IwkBcwqhnCy5QY65fRGpdz1PFFsX/L9Q6PhxzvnIyH42pcgqTTYcJ+b
         lVBx7xgb0HmDHBzDIxqtbUQb6VMITYURl1odLjnuXScqmLOYAk2gxT9w6yPTICs/sg4l
         O59g==
X-Forwarded-Encrypted: i=1; AL+hErHyCuK4OfbjKFmm949giPAC8ffU6ofv6upUa2ACl/PRwZAlrebO4Ca6mw2pV7FTCXO0R53xaMfwRi/K4gU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pE2RfSnVUQDaZqRL/tKleSJCrB2W748ak7z7l6Y+Peo3k0GMx
	i0QXP22LP+pqMDL/b6qzCKmENLrzWSoW9sV+aRDrKdSA1tkrQIMHTl0H
X-Gm-Gg: AZFdTZcSrqlPyA7fOzNfKge1pVaECWuhaL2sAf2fkUc42YGAhGCQqgA0CGF+dqkrk1X
	aSyjon1DjWKMjd4fVBxuIeRGrBh+zrY8o5ng9kYJwvyymJw+8qH2ZzAJ75mkAxL1+0dp0+If9iQ
	hgq0zYDJr4thcf6HJq1SMAi3wGxaqks7pX/lPXqU/JR7PrTkO5b3uOVah+L5mTSCSZoeLw681/3
	wjp7BpvizFjqMzI+6SWKAssQOkWmutLw0FbGyEcrNZUzK2pyPdsE237I9A1l+KQH7kq+bnekgyi
	Xw5rh3SJWEPXteGi30NBB8eAfjttZ/coq3K+676/OezF+KoD3vOWMKaFCzE3P8ElLBGEsOJUxic
	h66oJtAV922ikHtobphEMs7aedQCWRIafePNhPG2p60PKvKz2nDKEwPVplgnJlOp97NxIlcn8wF
	/u0EAV6vJQcAzZQuwSSpz2C0uxDWyJHpQWNSC8npEBVRCg7vnhoou09g4qGHXxW4CJdxoZW6pBd
	s3APPDiLSidYXrCkfvIwU/oc8DW9biFrEEDyKDksNPz6Ly5pDFYUbSWvpGY3GbXst/TG0tFEHW1
	Hl8Fwimp4X4goqC1kZuJBYpkL7wlPwwqAFFeL5MLucZvG03KxmZ0eHYHOzYbU0dFTV/y19jgiAq
	z/VL8tIX+3Or6MNy+8c09CteK0cKCY3O73mlaxO/JsylDRtZftet+
X-Received: by 2002:a05:6000:1acc:b0:4a7:a8f:5297 with SMTP id ffacd0b85a97d-4aa57b91bbcmr55960348f8f.19.1795798568084;
        Fri, 27 Nov 2026 08:56:08 -0800 (PST)
Received: from othello.home (103.153.90.146.dyn.plus.net. [146.90.153.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm40575449f8f.46.2026.11.27.08.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:56:07 -0800 (PST)
From: Cassio Neri <cassio.neri@gmail.com>
To: thomas.weissschuh@linutronix.de
Cc: jstultz@google.com,
	tglx@kernel.org,
	sboyd@kernel.org,
	mlichvar@redhat.com,
	alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	cassio.neri@gmail.com
Subject: Re: [PATCH v2 2/4] time: test: Avoid unnecessary divisions in time64_to_tm() test
Date: Fri, 27 Nov 2026 16:56:19 +0000
Message-ID: <20261127165619.40736-1-cassio.neri@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903-time-time64-to-tm-v1-2-660be972adfc@linutronix.de>
References: <20260903-time-time64-to-tm-v1-2-660be972adfc@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I agree this is a good change.

Moreover, this test is overkill (my bad!): it loops through every single date in the range of [1,970-80,000, 1,970+80,000] years, i.e. a total of 160,000 years. I pragmatically suggest reducing the range to something more realistic. (Unfortunately, I don't have bandwidth to do it myself.)
