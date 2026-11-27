Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798776;
	b=UCe+4XsdPBP5f+nZb95QRfT5DFNMxl8kTfqScJ+4klckn+S9e2WUiLn8mP+H3NMTHIPI
	 l3nE97VZ7wOf7GF/+QJLu6IRojI/rZY/SD0oY2xg5vQhtoJ/IkW/tXtcz/XSbfWn32fro
	 JA/ZPI4C9OP6Q/8oCkRjfSuc4xRZI6mk9EKz2NYicSMf8zq2CD9uJ5uDXfy7R44agcZMs
	 7ZH6bF5OZe07YiWxcfeaYIv6NIZ4IsNlHElWsFzKG68aFy39pi3Qhev/uBBage0ZThkj4
	 BvA7OaAxUrjYH3umFAkqwbwDDE9GpGf52A9eGZn2OVuefF+JrbONlaslq21VlALLJrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dBzotrpNO+SYAnhXJRs2E85Wf07NFcieAoMwmsZqh20=;
	b=KUtgqCDfaqzRlAZKBJujHXlzZRX3F7CH1IQ/25bVZMlqmJUn4G527rvP8f4qe3wefrtI
	 0KCsfwV4TVQgpq8Zw15kAS3CD6YzyJFhPBpsFaa+ws8gNSMXiaebN8Wrrd8r1AQg90DdQ
	 qf5doaIL5toQWKqtWJcoT2z90biMa/Fmek39xCHRuyBa6wO4j6J4JitNgf1cj4X/HL8zG
	 HMwUm+qs9dvGPLjTYbVO6o6drvUUz5RNuPCMgUhZt0ZhUlSxnoB9M/1GG9V2M3mFz/Wrj
	 GlOUsR6cftnWsnu6c7GpdeTfMKOvFtU9/w3GbtWvthqgWHF+WTIBI3qsYeBx1jagg1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+tmm3x0;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84542606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84542606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+tmm3x0
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so7530325f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798775; x=1796403575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBzotrpNO+SYAnhXJRs2E85Wf07NFcieAoMwmsZqh20=;
        b=j+tmm3x0J5zDd20coTtDnXxikqMbce6ZTTrnYypc02NbTcuv+CL9V6+Zl1SJO3HKVM
         Lz6QACvCZp2E2ntheSnsEtApXPWxiQH/9/PdkNRnWK8o559hKpjDJGP+CZf9b7aB3VwJ
         NwBk31zq3OPDYUO4IAq+KwH57WktxbwqLQIXIeJmrEIa5BxObSISR7eril5rtyMGetyp
         0mgVg4QFLt2TlokKxfvLUxgLB3DGZECV2cKqNV/NKcmXN1IUALHLyBcK4UCd5hVuqViP
         7RUrG487WFUtMzHDnxEBKbGLpPmpPgAUmTDh9Bj4QVFtXqY5rvzOfaRLlJYFHC8d7aZ7
         Zl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798775; x=1796403575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBzotrpNO+SYAnhXJRs2E85Wf07NFcieAoMwmsZqh20=;
        b=08Qzzpl0UIS81KqcFMQkLNRDMLe2wN1G5PrlWhijkRGunHmLYwwbzgwcjBXUyyDQ1a
         NbsL0n+mv+KCMCxs8lrv1/tOIsBWCic73CtCZZ3NXxtpUgbVzIChtZQizwECAKSqqlmW
         EouXAY2+YiFX+yjr4fbcNBs1HALAcaDYh7RNu7C2xduwxUYBxZsGSiWduFykBaLF2jHe
         Et+VkKqTekH6hv3UYuX6KdLcfnjOdQpa1egq0rYf1X72lkl4p2p+fh8lpSHex6EG+g7a
         fIUW0ySDAJ9u1kT4deJJovQWojE9FNfgD2SXZZELWTpzzAsbkKu81djwPyDle/toNysi
         Hf7w==
X-Forwarded-Encrypted: i=1; AL+hErFUl9sH4ZhQyhXUN7Oe9CGuTesGu+T9b+MwQQVLrEghJDGOvA9RqB2y59UZwMwXGAd5i83Wlm5DMBC3Sew=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sZBdi7cTtDU5a8VVqe0f+wdAoOfPTJCzmVAJhRb38WxRfeWvx
	cjbFxxIslz4Y9dJCWy9PSNQ/uhFmIjSAxULsmeqobdGnnIoynuyL1Fh3
X-Gm-Gg: AZFdTZczBln2DXyq1onEUjnbDKYPSkoEeiE1KgwqtO0bIK5Wgx5L8YOgneAFROkHRfv
	Z/3zcGKS2cqMQv4aIpN92IwOdw8tvimJ8hYRMO2cPUJ7m554qYnqcdrMuKeuyhqE/IPYxFWArcq
	bpv+ABI2/xxI4Up76M7nFSr/oJZrkVo9Ukn1t4/P+qfXXg/VM7tyKoqfk9tQW4drKKYB3dApcw9
	WaJ4QQcaBPKYwS90oTetHqx8HNXcX2vR25ifW5CcqjMb1lmjBohlUXKfQv3Nk0TQccHxhRstW16
	yoOY4EfJlCzqchGdJAuFfE207HJoLWVVDtDFqs/j9p3SM858UC3QNpMxcG7riXACwgRqrmL9YTp
	4zRJ+T4mq6+KnYZbnTlrU5vYWT9DAU5hXzDCAwxI8hzE1uL9eOZBQY5RyJTKHq6I36JKdSZDfc9
	tAJt3Xq1HYndfK77A/TO/pcyFElS/vjOOX68YEFCPpQPOU65cqVaXOu2MalIKkXobAAp6duG+d1
	rVf3lG8RackaQQwFzvBmtSLEI9n5EzksFe3OqIPMEdBPUIS9ZUGNASaS1EwzRsk/tlkenn0l+bl
	2BqMa3uO4lkcAtdhXAJa9NNj2pZ3vpDOj+yp9r0Pi8EIPp9lrXsvmiRrHXHPqiZDCPOpS+Gtses
	O28029i0xC7nDleE0uJII929m/4mui1lQf9LOyIZo2S1QG/RirBAK
X-Received: by 2002:a05:6000:2f84:b0:4a6:4f35:31fa with SMTP id ffacd0b85a97d-4abad5ac888mr52334037f8f.3.1795798774903;
        Fri, 27 Nov 2026 08:59:34 -0800 (PST)
Received: from othello.home (103.153.90.146.dyn.plus.net. [146.90.153.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm50234106f8f.11.2026.11.27.08.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:59:34 -0800 (PST)
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
Subject: Re: [PATCH v2 3/4] rtc: lib: Implement time64_to_tm() in terms of time64_to_tm()
Date: Fri, 27 Nov 2026 16:59:46 +0000
Message-ID: <20261127165946.40949-1-cassio.neri@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903-time-time64-to-tm-v1-3-660be972adfc@linutronix.de>
References: <20260903-time-time64-to-tm-v1-3-660be972adfc@linutronix.de>
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

These changes look excellent to me.

When I implemented rtc_time64_to_tm and time64_to_tm, the duplication was already there. I wished to remove it, but I was afraid to do so.
