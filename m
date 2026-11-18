Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018064;
	b=f91HHf794WXjE2zR88hwrBM14q1ZnsiDQJwn94GbWcweNIikmLW00fnIE0jAay6ZYh9V
	 26JCcv771czFxpmFIJVzY4yxnJfJggU//ByJ558nBBOrSQUEghI3w4KQ3Q8rOs6tlfT6p
	 mL4x+Ha+ZVYvledKsk7eZ65IFt9rOlkrERpV/GDX6Pc3weZfVRsNCymZ9ZD7N6EYYcH0S
	 VjDMCPgPGp3aB8XlrUBMBjkf1ig1Osq7Izrf95D0WTwbpGWUjC/viqe0grhr1xgIvdd12
	 1Uo/Y+1KLtQ5uxfXHAkzFGBjyQj5gFTw8BzZGH15+SACo6I4vpZpg2VLzNGu15Vbw/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Daq83ZrmsgMu0hFMnqIG7pmefbD4GjLgNHcMc6rgY7Q=;
	b=ZgeVajqkPNowtYrqYmecHYuNDrtHEVelD9tYM6NvnoHyqzZzaSEQsu6nXXv0/b5CLA9r
	 9PVLu6JE6XS9BDdjZf4K0hjs1E2f6uUmN0Aggq83GjD00yj0YsJXdq3IDVbMSlgUXgb5i
	 QkMGD4a04V8g3tj7EELDv29j6JpFYNiK7ZKUOIVm0obCI+bLrzqUlHw+Jr9nx2N31N2Zv
	 +MAUhl0CFU3I8R4ZZq48NRHuAhTvR0Ua8dpLrIwwlntoW0lwU1qarTcQhq9syor8G1TpE
	 XhE2lgVeZR069hCKzeOvTuGjRncIzu4S/lcchWYW/xqFTj73t7+Ghf6E0RVg37qS6UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=D2PdDMAP;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F108460A2630
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F108460A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=D2PdDMAP
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-490d838b425so614639fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018063; x=1795622863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Daq83ZrmsgMu0hFMnqIG7pmefbD4GjLgNHcMc6rgY7Q=;
        b=D2PdDMAPMDy8UNJuMaPlzqLIFFNb7Ja/2WtNZH2stvVdL0+MsOYWG33s8IMzKVzdXL
         iq6Gb2+/achS+nqScVdDn+xTrPTybI97E+ZAI16eoLeS8xXrIAZLAYgpvaBpgOpQ9e4c
         AlwqlaJKHuj62lF6haPfdjua6nI3KGr7pCUsDM/bNYNuw/Fobp8O/tVyL8zjHzU3RiPR
         0ur2t+i2Gla48dnssTsOWpMjQPw49CCymhgj0GdtsvXFEyFdk5TdUllnhHD8Q+y9qsb0
         vdP4ffyyAjJRh2zfAyX070/Pa2PMxMHH3LePxvykBYHTzs73zIEr3rP5hMUnFxvw4z0s
         oU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018063; x=1795622863;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Daq83ZrmsgMu0hFMnqIG7pmefbD4GjLgNHcMc6rgY7Q=;
        b=y56z9dzlqp4dALkuU54APOgCkSYiV3nFSi/VpbQ9BgkuOxJ4k9deYQEIL3uWFgSP3V
         CUvfU+gZvp1u+7IyITJLChbBScHVR7P6JEBfTwII+BLM+1ko6gwiRRXGIZFkhW2lnOXB
         eB38fuXvgh5Bz05CJTNh6pXQiI6Q4sGpFc7wyrLNIBryUyyyZZFumNRObKIDfE+gPHQU
         NDUhFSL8btZOkHaRQ9WoAgBkIpzIBD0jUggTVO9+EkCv/TzmblTClve4hf8Br5zVQiL0
         Ic9vh3fSQ3R60jlroqUfBRO/CwWr6p3v0kNMNy6GmqP3Md7Za4MB4Q9652KI/FAWFEXR
         dReQ==
X-Gm-Message-State: APuU4Z/eLhkt1GrWjfRVjOtgXyHXy4s5ilMBkhmssROXX5qC0jB0IHC+
	+OZhenaDfvfgYBjcK62uJR18zI2pbGz1cV1pkSjyQBYHtYhAJTGXve35bXIoRKXuTG2TZbfjfxI
	mA3VGIWo=
X-Gm-Gg: AYBFou2YDuE1M3Y5EyIgm+LpK56COJ126/TZNck5MiqlWkS3z+2RVxo5j+sA6zq61EA
	wmWm93oxw0sf2Q9LT3/4SMffhQ2HeFbamgftyOY/JHxHXNxHsyjNSCje6CqVF6pZh7SmHvbx91N
	0mENiz/EFVkxA3anbZYMvMnxwXc4xPr7pRZbknB+ObU7AQxikHMT9XXjAc5uoIWhA6ux3rGIuwM
	Fq5STl5K6aABUKZ/WJnD1BiQg4t5O0KRXw/Tyy7JrnZzELA1U6yacC+YeN8aRZftO+3ZefLSUPx
	TaT5px0F8HZeI5sE0/y4hLQ2Rk5XeCXuHWeZ9gYR3VhMfI3gau8pw/r5+/ymrwSchjJ6m23XHHc
	HR0iUnpkhOZqSjbf1mjxBsALlRphB1bp3dOyE3Zb7lJm5fd90sYGi5lst7qXZYf6GK2s2EMa/SV
	39i8FpRi8Byp1gu/l/cO6ONLD5TIhEQFwToWrP/O6vDjmEgqFsWqvwR0mHZM7hvuVQToUg+N7YY
	3/U5eJeGhXWKbcTCvA9hAVvr6H7QMH7P9F9Yk8//P2CoPZFgIFHL8BTIOydXOEI0N/jB6yamOGg
	duBVr59J8u4kuOA10gj3M5hrso3URec2joWilS+MLOhQvrDGLPTlAZqvRkOSgwpDUaW8bpqH2uC
	g8KzG5deLw2OnMt8BMsQIhVbKn5mpktLI4lhnquivlC/NKcoJHqw=
X-Received: by 2002:a05:6870:aa89:b0:4b5:65d9:5bbf with SMTP id 586e51a60fabf-4b75fd1764fmr2554172fac.29.1795018062902;
        Wed, 18 Nov 2026 08:07:42 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:42 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, shao.mingyin@zte.com.cn
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261115003347468yvY7EkDVXpRQABqNYceKf@zte.com.cn>
References: <20261115003347468yvY7EkDVXpRQABqNYceKf@zte.com.cn>
Subject: Re: [PATCH] partitions: sun: calculate partition starts in
 sector_t
Message-Id: <179501806201.17649.16236946055978931642.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:42 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 15 Nov 2026 00:33:47 +0800, shao.mingyin@zte.com.cn wrote:
> The Sun label parser calculates sectors per cylinder and partition
> starts in unsigned long. On 32-bit systems a start above UINT_MAX
> sectors wraps before put_partition() receives it, potentially exposing
> a partition at the wrong location. The same label is parsed differently
> on a 64-bit system.
> 
> Keep both values in sector_t and promote the first geometry operand
> before multiplication. This also prevents the two 16-bit geometry
> fields from being multiplied as signed int when their product exceeds
> INT_MAX.
> 
> [...]

Applied, thanks!

[1/1] partitions: sun: calculate partition starts in sector_t
      commit: a5be44a8243fd7f7875f54ce1c5df3df713257a9

Best regards,
-- 
Jens Axboe



