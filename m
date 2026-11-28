Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866555;
	b=HD3NCvESkMiRid1HN+deOr5kafq2LuqIKLKRvMq04A9tG6Z4/VDvQQC14v21ND9yXSsv
	 fIt4CjbxaOhgRVOFHUBp4hEeMvHKZCxH65frFIbaiKAUkEbpv8alX9AdarnzmuZvhJguX
	 oHFUlPWA8XeBY/bHIxJXRkJHmJIWqWPxogqpx0fUFeft2cKw4rDLXH5LWSO8tewq+BpzN
	 N3SXQnNCyJU3NQ0kcpVkezb0+6umN8eL5AflovpTapxMDGWKFS88xuzgY3zuNcRUOcSA9
	 VBQreo4pQlaWOhn3p4fJJCOGZIRF1DNXu7e4yVOoCNvDg6iL/VWj6RRt3NLZfRecERQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sz7duWS2xaM7GzKqf18DzuNc7DZR5td8vc9u4f7nkuA=;
	b=4thg5q7UY+z1R9TwCsOlrY0AmM16zDbGPre3/rIWrfmUVOkmgqdj9+7pkosPdcw9oHMH
	 oJMJ7Bt6oqW/S2GA1dqrshzj6veHVI+K0bfYs3hIfWh9RREJkUliCrhrPjNA7icgv7euI
	 qqxrojQg/sqtkDG/QAzy/tOYw+NZfSnqjvAo6S7N+8lhsNhz+2YgypTaN04hxU9KS+71y
	 //F/11keoyVNt5KgLD3F1FSgRsxXdIW77OnTpZEvIn5M321OmKehkZLFSERB6plud45Ax
	 WNfOQNFgSP9WgLMCKRB1q6Qz2vVVaN64nIfmZ2rlvfJCqJSRwfb+r8gOMThUp0sQz8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFh2mwtp;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB67E606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB67E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFh2mwtp
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so76637311fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866553; x=1796471353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz7duWS2xaM7GzKqf18DzuNc7DZR5td8vc9u4f7nkuA=;
        b=aFh2mwtpLHrjgKdOdhYb592xOXx5WWMDM54foyMSTkNLn+Okk0D/uX2SIuHhOlIhjo
         vRqDBJwDEmPYNGU614TkVy8RCXyEqpjirmxrH6y2xvfq89U+WbiSw3Sdkg0KNiwYZtCB
         J21SVhCiodpqVxKvHtuXuxrAskcyz6ON87/IqK/C8SNFH3eFKzHWs4n53XgESRLLPxlO
         K0zRJ4d2p/qngCfifN2/5Nf4v65YnLbuB006MZH4eOB//5+MTCHwwBuhdOOZg8SMBM/j
         SEtXaIsGa8FEVKJ3v8kpQfjqYn7qxvcBs+6nIuUODqd3HQeZWAx88I9bB6ivtL31Uysd
         lqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866553; x=1796471353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sz7duWS2xaM7GzKqf18DzuNc7DZR5td8vc9u4f7nkuA=;
        b=yOoeykiZblz3gt8ZWy7i/y1etDKk8m0NMwtH9e8Y6dX3VrvRTUxfZr1LLc35sHPSLN
         EGiwQHhCppuYZTn0GiUzvO7SCoTglgtaGg4trcQtxaZtqOSkZTt1s2rsIZdCYiTK1mq9
         FX3+GhhdLDaOkR7WgxfgCRhxqs0cih58K7NzZfX60tN+ZImCeb/9UuonDms1EL8bNPC4
         4y3QpWsl8ndvvPZe/I6KW4qb3xxItA/B0CuVpEtiDh4DES8kPvrRnbFBfgeziK0N/jic
         3AftUzZnpSF3TGYD6VkKV92PU7RhSQuDLQG/dvoF5G9jRSC4UboV19cMdzzjhRRi/KYc
         1x2Q==
X-Forwarded-Encrypted: i=1; AL+hErGObfairuoHBdtQ84I2ZUIR93wMQXjkPrw2HAqDgzgzdwABG4VJe/p496KT2FVso2nIryVf4H5JotcleHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z83EKHZ/lN4dXb4eSWxk3u2oSF23qVsrP3wYVdKmcZa63vT0Jjl
	UQcNKZgPFnee88Il0d43LNFprd8rlo62D3yTtjOR2Gpx3Af0TPiJfZBn
X-Gm-Gg: AZFdTZd7vnyP/g7PzUCHGgUS+w2XRviOFYU94UlIRB2+vTMj0crXsBDAZTDEP6MwCtK
	XvWplOzXQpqNYKmvbI1L5zJ1Q5HXivYxLqdLolMc3KoEqY7VHWM5rc30ScGpi2PYl8KpsJMw6nV
	VlEeRqEFvFm9cxgeYvSmx/B2DeGMUsW47W0Tz1qV7wx47luk4Zofs+Z9aH37l7CCHkdSGgdVapB
	Ar6sEGHiZUOKMnchjgVo0Z1HI7sEfSZUUUz6BCpD1VFqDNAaSxalqZdaFcjAJQ5iwTDu0kl4o/A
	sR3meZW8e024yWFRTC/v6DMGsc5HEF+xPM6uCxuOzpu7jLa1WJukA2WvJeQl1HpFpWTfkZDsR2v
	zxYmJip/qFR8gqW2G24q9UYelP+G4bp26pkzQW4cUkkpGiZchYawcHTX8Rj1OcL5tpullTyjsqF
	ejTsOXPyMj/mEolVEyCuTcRYVukRjy9HdscbCTxATFn/51cISMeSL+kKPMJ6RlVGV4VOnNY+Jgg
	2qXtc4IUVP6meeW/0f0hUCJyiemr4KmR7SlzmDkli2I3jCotU8m2J3nG+WsIqftIQOxAjwzRtjV
	+iokOFRppfLOLuthLm3+d6OnU6OUge0hO3J6AocPfOKe
X-Received: by 2002:a05:6512:12cd:b0:5c1:522e:3d44 with SMTP id 2adb3069b0e04-5c1bc7c22fbmr9479195e87.23.1795866552941;
        Sat, 28 Nov 2026 03:49:12 -0800 (PST)
Received: from thinkpad ([92.36.65.198])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050ff30sm67319321fa.18.2026.11.28.03.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:49:11 -0800 (PST)
From: Andrey Zakharov <dedemorow@gmail.com>
To: david@davidgow.net
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Andrey Zakharov <dedemorow@gmail.com>
Subject: Re: [PATCH] x86/e820: Add KUnit tests for table sanitizing and range update
Date: Sat, 28 Nov 2026 14:48:50 +0300
Message-ID: <20261128114850.1683690-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179576714578.1671685.15482503905360730523.b4-review@b4>
References: <179576714578.1671685.15482503905360730523.b4-review@b4>
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

Hi David,

Thank you for the review and for running the tests.

> I do think there'd be some benefit going forward to extending this to
> cover other parts of the e820 handling code [...]

If you have not started polishing your sketch yet, I would be happy to
try turning it into a proper follow-up patch on top of this one. I would
mention you with a Suggested-by tag, or however you prefer, since the
idea and the stub approach are yours. Would that be OK with you?

Thanks again,
Andrey
