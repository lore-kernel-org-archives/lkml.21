Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443003;
	b=jFnXMBiwxVnOXxS9brcrAPjxzIapbvlNr/EBsnjD9ILoLLHA5DAJY2YrbExQs/W9CTvO
	 jYR5MNzt9kaNXBAFhk8hCdpGvdTXi/YZe0bGbB9u1/QGzNGI9bnyhk+uOP1eQqlv9vH7/
	 R+mtzbw2PY3RwCi+4WdJeszP/2j7bclXCSg0G8/Gwp5Q4D4NQCubXJ15iLc6cYGwi+n4f
	 9w+Jz5BmfhLTgf4KeZbNgXc6hEDPP7tWh/TIEzoU4c86wsQZ9JBWgZfSb9K9Q3SHbjMwf
	 6gdWu1Edx0cZDn3HxUwJqEBNXrn85Wydlm7EG+VGM2NSFHWn2iUPAvbcnCdFiCjCxLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QgZcTbM3Kqv6H+uxjoWsyk/LUvsEFgztRPahYNF7SRI=;
	b=Ad3cM3t7bB8xRXrR0UurqoG/jrIOv49NVP9QpM/zMBAVg3XCcwUdDaAFhaQ/Rd3Gcdto
	 eT6xY48awkUWhDAFWPh5ZkBgyweIgaTmgnkdTYHU6JFXLJ1TDDqkmDWZkP9JdiWvBoR9+
	 9r09BObrKlJcy9PXWG0X9or3Dlf/Tsr3X9pia8PowV8IKrw25Ysk/r7kzBzZGgtSlm7HQ
	 5X+Q/B6snvg1VFLv35sAMxq3R/Vus4SFDvw7fLyo1Po9J/ilLnnrPqyCe+xbD3zL+adP7
	 xPZBblFF+OOP1IrwrpbI65aWqTCOOjE6PyAu6im4/6/R5Xy2cjRAjsjs0kKWBFGIz/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Paa77cZC;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F6606A68F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8F6606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Paa77cZC
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so3754928a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795443000; x=1796047800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QgZcTbM3Kqv6H+uxjoWsyk/LUvsEFgztRPahYNF7SRI=;
        b=Paa77cZChyyChxxqH0++ZoHrNdr+ZwfEV5r3GB0JbKAt390gQbZVBTLUQK/SdI9upz
         xGXlAKnQc/LOSJ125nn0daxggCAOvLBF68qypSE/tHYltYiQq8Ftq7d7gBBmmiTAM3A9
         iSdT2mbU+8CzXHhDDd6dqQc3SRWZNKOyny4bRIuFL7Gbac1DRYadRvefq4UjuhQ6IJOc
         NYBjw8WW4q549KfSprr7Q2nsQsODiY+WQPIb9Zc7n5aYf5+nZPXZifAFkI7OPkOSaeot
         m9b6+PCrJwa55p6340Xphnr9GVkalxKvS5OaP2qnFVst3wc999+6WwFX15JlNcWfWtKh
         5Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443000; x=1796047800;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgZcTbM3Kqv6H+uxjoWsyk/LUvsEFgztRPahYNF7SRI=;
        b=YgQtzwKp7duqi6Vqmx63tkJahOqgS9eOpyMcAE2Gq9JHkHCPg0FSa7s6Q3aI3EgE9E
         uxpoObUnYVP3rrQuSVeaJex64pCzeMdSfqvofkgpbyUBdj4dL38nBcxdHzMtDomDaJ5K
         c4QN7SnRiuNEbiltN0BY43shk5SROgIX6I2NM62bL9/RAZ8aFKCXzoyFop/v7bEANjvg
         T0hncqRGIi/9jEtIjMxGvMEKFfEixOgiz26x5MJVCI+s/nIPYVxDa87XcrbqzRWsw2Bc
         Ur47e0w9tNtJOMvX4PccpGZB6Sl5KnEsKSybP7TpN9xrlu8Ts1UIUbXScmpttAfNGpQf
         gXaw==
X-Forwarded-Encrypted: i=1; AL+hErFMcVIe5xYv6bZpXZlHLEDPPyTIPozi8f5ro0RfcW4FGoigPvwDYKI+xy2d9QrdxAhMHNCjfrICbQH319A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zyq/xWxuSzvU/NY594GMwwjmCzGX8TTDbEbUKcWy+qY55M0hT
	3mEqKmzx3Hmve4mmmXzObGx/KoY2CuFPRKrP3q2kmJ67AkEUFu/p0k1qTf+t1edV7rQ=
X-Gm-Gg: AZFdTZfqUfl+bhk2oo/7Yo5yutsLmYYy4Yw7cA+Wl4rAq7gXeLdcV7RUse+e3IV8gQm
	UesWx+JaS73fwWRlOcUdIGyfFfR1qlR4x/hc0UbJZzXMUNOWp5V551ksUgUOHb1jVGxRPd4a3ss
	6O+VvgecEzef42Ddo74dOps7MDTUV/OsatAn8/B/ri9XpXugdkr/ane3hPj3B/yVyXYbA9irGer
	o1K7/mheJ7D4QEl5M7ZVAkJvBH+qrgllmJWzyDoulz2BwWDBpols4vCtTTKDX/Z6HwwfhLsgekI
	JmTPIFRMCDPecRESfsyJW9h3mYehuQ9PMo3KeguGuOXTafKA+VHeMye5QDOfQxWj0YCrT55TKkf
	TgvBn4+xoYvHpM+G4IzX9CTEPSs5Q0sYsOpfBog7SUl53TgShcFvvPJkI6WOs8lzsvmRE8oSZx5
	QUd0ogwFq5ZP+TxnawcD1JEFf4lSVH85EsegiJ02V3Tr4C/WLCigy1RjCJ2QWpdgDbWCCMtZXnC
	tfjIJKYLRq1RVjI7Fl11onUkHKoV0JOP+VIV+rfubS9SJ+S6XxXKUwmnp0uDDxqkfqO/ywVLZX1
	uKuiK1yp5d2gmdpz75uTFiQ7ZnD535A/R7lepWDK4zYgwa4=
X-Received: by 2002:a05:6402:1953:b0:6ba:ad05:3fec with SMTP id 4fb4d7f45d1cf-6baad054b87mr2592953a12.29.1795442999662;
        Mon, 23 Nov 2026 06:09:59 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5388027a12.23.2026.11.23.06.09.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:09:59 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: hangbin.liu@linux.dev,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Mon, 23 Nov 2026 14:09:47 +0000
Message-ID: <20261123140946.13992-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121182217.4609-4-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com> <20261121182217.4609-4-emmaonana18@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Omokefe,

On Sat, 21 Nov 2026 19:22:17 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Three more checks in veth.sh print "fail - set operation successful
> ?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
> "bad setting: reducing RX nr below peer TX with XDP set", and "bad
> setting: increasing peer TX nr above RX with XDP set". A kernel that
> wrongly accepts any of these invalid operations would be reported yet
> the script would still exit 0. Wrap each fail branch so it sets ret=1.

If you squash this patch with patch 2, feel free to keep my tag on
the result.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
