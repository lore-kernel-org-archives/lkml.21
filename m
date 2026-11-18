Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018059;
	b=MXiXXMeMim7IEgujSwtpIRcn4dEn4UaASgXfz2zpl0ysUZ4Q1N+UFe6B/LrdHAdh4um2
	 PjrxlEo903r1SpXaGByI2yqA8Em4zKjPqddPRqvKtlYcMTZiyY8qj7sxj1h3plaJa/OgA
	 shxJWLX4mPwn90v8x3JqjCiJSxQn7vEHzTaZz/LMgTQuiRjjJevk6O8BiGVNTkt8M6cYz
	 y8wI6rdbE0tW78Xr1tqmxNr7eQlZkLW8xMJurzRKFhUvB7TQDMZ9eySbABtbCywOTlQka
	 3Desqm41LCaNouDMzO5CubTQCa5dnn6bjk7HOM6Au/mMNuUdbAfZrixmAd2Gvmh1AHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=CV7oamrSYXfpp3NnleoEpP5E6f5lbD9kU3nbbqKEnc8=;
	b=f+hBooPJJJD83lUvmqQyK4TPJSptPUjPMGS6ZRRjpl4NFSwCWR9t93rBEOWzEqAkW7eL
	 urkBo7kBgT1ycSxftQY8SOJBKEZMjd4o/aHaf1FRiZlZ2MF32eHTJiOARyy/CSw7iBayo
	 C/Kvp677bl/yBYEIofYzG9Nc/++ZOyRl3DsRncvW9ntJxGWYzOONY4lQF+zav+1F4qXK1
	 VdYa3drOzXBINanDwJePVomS/bI5bKGQjMQhXnxoAlpHCzM9pDmu0X6Cfk1mrij2d6wTV
	 HGLTs/tLV+OsNBB+bQ1v+zR/yjaF+2RzWjSuInWaHJ8fuHtOk6+kY0/OvhzmfIMobKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a5rhgeb3;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BE7606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BE7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a5rhgeb3
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-48ed0b68895so779926fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018057; x=1795622857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV7oamrSYXfpp3NnleoEpP5E6f5lbD9kU3nbbqKEnc8=;
        b=a5rhgeb35b8T5xllNNAeAnECO5OGWZ6FRR7g3JBTBjO3p29UNlMA5n5uAkVzlQrWDb
         9X9tktBgkFW+N1AWN82LjGdQogSQ4C20Uq3ZqEfNc6b6QQnInosH7yAuraUEAckqLXRN
         H8QXC6YWgM0rKmm4+aQArZeRlYHi5A9ujcVq17/4jz1Po88aC8PZnbgZwqfdfkRwCDwC
         qIHH+l6buu7Fbly+5y4La0q2XL0yaSHrAlzPVTYXoW28SKbupT9CWG8AVuN6tBNNGPlM
         8hw0B9CbHIRCEOd4dlJM8dAk2Ph1GA2THTGe5CsJF+6hPmUpcm7u9I0yji42m2YfX3bz
         V/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018057; x=1795622857;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV7oamrSYXfpp3NnleoEpP5E6f5lbD9kU3nbbqKEnc8=;
        b=HCmSsokCRQboCWnhRwHB601LfLMjQpXbqJ+0wg0HOtE4JofcbuiyAi2aXYhPs6CMqD
         3XkU68wcDNeW4X+/XfxcyVA5pwl1bK7Rczz06p1FdrpoKiHdHUsOfCRCloZhITRep933
         rAquM++F03HKrcaRd3ckzHfmu+H36uoh5OVG+PIivAjHJuZG5kxPdUsvkeu8gaXqHuUn
         aO5cw4LEqgT5wqWCk5dVh0v1v6/OgvOn9k7Tr/a84mNfT/9T8QduKO8RmUdih0WBdg+B
         Zzv3Mlij3jU/72yiyrufuku7qUDJE9I7XI3hl1fY4TFv3/ehWfUJqmzb+RR2OFPJj+O2
         Ep1Q==
X-Forwarded-Encrypted: i=1; AL+hErE4gBdybUanmD1zK59dvtXvKamb/QKkSMpcEMgI8f57VThmcfIlq7vk/fxBCi9Kg72Bq2LUDOEe46BqTAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7XE8J5BCtJXAfJekf+phE5EUeg4My8ret7ZRGGUsZsyrdYP0e
	Qu68krE7HPeJ0wtCT1yN2ZAK1deDejAuMgAqR2I0bmZDce3boCg+Q05Uj3tWXn56Go4=
X-Gm-Gg: AYBFou1LHJWcZHK4MEiaG9zHLlWzVSTamkmtbgyjVsfmqtqPilPpxKXuRN/78Ig7yte
	zOr0RZXnwDHBEiusM42aMHC9ZtxlViztX4YO67WauCRiiBj24M/fxomASnsOuh4zCORbV7DCrvU
	A3B/ymdKtHvkAy1jwGmSOmw3+5qNeFIfqe94vOWc4jYdlpZSY1Y2L/wrcoNQWgdZ+6wWoTpw5qT
	0Xsh+puBiuas4vN8+Mte2Oycr+ADSkkjEQhYCcaV1jV16kgwpCDCauz5RA9cTq5QaNZ6dvCEUMG
	lcsQ1Jp4mrkempUJeqSexpy8khdxYGjyZ0Jggkfgtos244nDjeGXgcPBR/2rtWAQUtFgWHPaE/J
	VTV382LDsoiyA7EHQ9FEpVvw0oUK5HotFy/NQVJBJY9PlhQDpXj8uI9tDhnC4PepYxNCpx/DIYD
	vLhumT8NlwCRGUCIkBCy5a71+sSF0eaertH0PphKhBCA9SNDdfyE1hyPNTfSPJOlitf8IoVQIxk
	Cvy7k6t2vBXaZ1iPcdChEKTVdW8al2E6XZdpkJviYRQTwZiXdIiptO4Itc1FLetpOHZwFL6E4yA
	+MOKyYgcGlM+xBN87q48stgnx0+NpfCXuyxkZG9uO6Kyo72HmNFNA+dF3t7TdVhBBu5GgJ5D+94
	wiz+oX4W3GZ66OKbwh52BquUHfSrRBOypo4mXUtXs0JFRFfVFEhQ=
X-Received: by 2002:a05:6870:d285:b0:4ad:5a7a:f7e9 with SMTP id 586e51a60fabf-4b7613c52femr2613744fac.34.1795018057354;
        Wed, 18 Nov 2026 08:07:37 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:36 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
In-Reply-To: <20261115-blk-throttle-wunsequenced-v2-1-1d297c891b82@kernel.org>
References: <20261115-blk-throttle-wunsequenced-v2-1-1d297c891b82@kernel.org>
Subject: Re: [PATCH v2] blk-throttle: Avoid unsequenced accesses to jiffies
 in throtl_schedule_pending_timer()
Message-Id: <179501805630.17649.245726738544852847.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:36 -0700
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


On Sun, 15 Nov 2026 20:37:57 -0700, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], two instances appear in
> throtl_schedule_pending_timer(), which can break the build with
> CONFIG_WERROR=y / W=e:
> 
>   block/blk-throttle.c:469:25: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>     469 |                    expires - jiffies, jiffies);
>         |                              ~~~~~~~  ^
>   block/blk-throttle.c:469:25: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>     469 |                    expires - jiffies, jiffies);
>         |                              ~~~~~~~  ^
> 
> [...]

Applied, thanks!

[1/1] blk-throttle: Avoid unsequenced accesses to jiffies in throtl_schedule_pending_timer()
      commit: ae1171f38098098e88c13c38e462d27babb50038

Best regards,
-- 
Jens Axboe



