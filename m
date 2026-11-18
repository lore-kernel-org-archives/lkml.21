Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035612;
	b=tMnv1zLl3khD7B+ja874xFauEG16laX//Cw2eP/npJDyiZk5363Z8DXaAV6C6YHvxbkC
	 yIUr0VP27U1AwRwANEqLaFyAQWKRZwWvx8N3SP0Na3eYTiHHVRnzV6OU/pLKVUM6RUEkH
	 dAF/dsvRlY6zUUkyz9eMFj7rfFvSV0tnMRXJIJO4AUJeARpG8kVHlceccCCE+Vk5HOPE+
	 6nWzHezV49KB/Mc+PnaM4W2+SmBHzJ4/fw7R1KXUqFLs3ggxFIv+6tMYScrO+gLX55zWC
	 HEsUkCcxaxvpVkqbffBOOREuAngsZs8zDM6Ol1aNEkjQXmmBvyacXk86aSfuk5wpEeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bXN0J+AK1P53RMwKn3F1Co6ZRwoaPYRSkShLnpvY7YU=;
	b=fCjZgFFeDp3LXxslEN1NhzBrV6S+nUG5aOOKlRM3wSSjrNscI7S8BlLvSROIVp5rWw4p
	 2Q1mhtVrT/8QStVKEAdk/Z3UwoEVhiBHLcQ4j1kogfDZEAdAXb4hGQOovggwFRqIDUnn3
	 z1fg6nKm633TI4nBMH0j6jcQD0zVYtwAJQOF/DcU9tWmsjSC0GOyGkhleIlM+cQVFYuwJ
	 PMbQY4AE7LUggSA7zWUUWNId2G1nIqSgrAQG+afkS2iIycUkwYXQLUC+OJA+5XdZ/clCR
	 7hzM/BGib2d49THCF9rYeUVU5UetzYQXY6uiYgUqP64rKRPblpD0HNmPbCyHERMXjCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zo5HzLWh;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC65606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC65606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zo5HzLWh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so951816f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035611; x=1795640411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXN0J+AK1P53RMwKn3F1Co6ZRwoaPYRSkShLnpvY7YU=;
        b=Zo5HzLWha3XgxMouP/7BmNuV9p3xxUNcclQQKU3bhM4D8iQq912gq7GvvExaFr/hmt
         d+jgw7m6wi/uXFiTAzVEGT0mS6RGaAoKSysxGw3pQeEFaMa/6hctulLzuUMxW3EVgA4B
         7Fo8vxifmzAUscHF8CR9ar3VpOWsT+MbZQjC98XWiJifrrXiX6DqvEAmQblP6byPujLi
         +ldthzD7OOOLRAMCSUtXzrIi8PhkuRu+ghT7Q2yxmYd+Yr8F0E/u0udJSXllawn/I0hu
         pp9ZfDN9JZgmbH6BxIN6xpIGds5UbDaVhn+F9mDK1d7zdU9tOIs2bSpoPm4SFKgrB2vk
         bv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035611; x=1795640411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bXN0J+AK1P53RMwKn3F1Co6ZRwoaPYRSkShLnpvY7YU=;
        b=COAFT+kaBhOACEnMtj1C6UaIf1H9Obo5RlLO8LibxmbHEB5+pNM1rdr3fCbsnpkn9e
         +rBj5J4GwNYVD9HATuvSwhbbZB1FnCwK2xjA4a4GRn49DLQxdFZE6fHJuk4+BV/Jq5WE
         nLunctz3pn7XjcSypJ8d6wi8wJTlThrtlhBtztSLQloPXT5eMcm2fPIU5FLucfpXDYT5
         kTn/bfGbEkdcDjFKwnjo5TYKqqFGym6aZ6ifMg7zvwWf8THu9t4xgmFKUlJlEYGWDQCh
         mN8FtsavSrKaO2oaMLmXMpSqc+w7Pr7w1K951jgza6gyvfLwL4eDbqmvHLcqOEuKjWbQ
         +XWA==
X-Forwarded-Encrypted: i=1; AL+hErH8wDvDxMIQnfBKb6Kbb0ptK6y0MN1OzMB0/HE81aHdNn9F8+/r+awPo3CP4f65xEAJq/t/g/C1sgIttwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b6/42YVu/gW82HixpqjrqQJ14kNx2WthZvdfx98ZhpgzIz3Of
	mwN0JWZiAK6v+8X/tdCX6pz+LUWgm5B7kyQvYvISbna5vA44AqAOCO/9
X-Gm-Gg: AZFdTZd7aUPHyXla29oSMkIV97xk88aY+zwKFQlZ54EpkJ1xbWJUDfEMKzCjOmS0UsA
	IQtY1PnEJt1JH4N5AZk2nz7fjqHDjEYpbFzZkkOjgkGVP084ar5sYEiZT7Ncy1gqabUQHjuNUCQ
	BUcUasXWFkkRBTT6k1n6/m/zrVzEsdIQeCYELyp5lwpZBGdYEQe1cOBpCZbRvrm6EolIp0UedqW
	LFygmdmkMYZGOHnigVaclzjXZ58FES2mqgMSwsgYlmaBMbLDj5g4FxGdMApcBJ0/YHttg0WJRzb
	0ur3vOyHfFbmGrmBQfNADo2cOymz5dLdT2fekY1R3B3JhmNsweH34XyhZIwUnrZ2fubTANH0iZ/
	66v0EJY3oqKO0ZIhaDEaff4m+1vzE388fB8V/y2Y62rQjP784P71yJI7N9QEh3VKso97pAF13Xm
	MgSkGsxku4xaWInJ1NZN6N++l7dcbFBc7DuppEYiHtw4w70w6NjZSk0nuqHmzVDDK2L+N+6MR3g
	sxpIHo1JP2XXdbKhWMPrtwUrhjYvS4GwyELzsoI54MJXWsLdGDUArnDt77tDSLlvOo654HfLmv8
	Kzk8oQXk6yHcJDT94pKtjDeKt8SlTL7eb9G11vwBEMi1zAoIh2oHXHhUhdYUK2vM4ZDuyYI1mWk
	CafxUioM=
X-Received: by 2002:a5d:64cf:0:b0:4a6:4862:28f5 with SMTP id ffacd0b85a97d-4a6486229b8mr8177844f8f.3.1795035610516;
        Wed, 18 Nov 2026 13:00:10 -0800 (PST)
Received: from beelink0 (host86-181-68-246.range86-181.btcentralplus.com. [86.181.68.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm5332421f8f.15.2026.11.18.13.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:00:09 -0800 (PST)
From: Graeme Harker <graeme.harker@gmail.com>
To: fthain@linux-m68k.org
Cc: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: delay: Fix rounding of short udelay() and ndelay()
Date: Wed, 18 Nov 2026 21:00:08 +0000
Message-ID: <20261118210008.927764-1-graeme.harker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ae768ed3-a517-3223-5c86-a1599ff6c8e5@linux-m68k.org>
References: <ae768ed3-a517-3223-5c86-a1599ff6c8e5@linux-m68k.org>
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

Hi Finn,

Thanks for testing it on real hardware, and with a better method than
mine.

> Which clocksource driver are you using for jiffies?

The jiffies clocksource itself; the board has no sub-tick clocksource
yet. The tick is a periodic clock_event_device on the DUART's
counter/timer (GENERIC_CLOCKEVENTS, not LEGACY_TIMER_TICK), and my
figures were 1 s of each call timed by jiffies with interrupts on, so
they include the tick's own cost. Yours are the better numbers.

> ndelay(400) 536E-09 -> 239E-09 seconds

I think the patched ndelay() count has wrapped your 16-bit timer. The
patched ndelay(400) asks __delay() for at least 466 ns of calibrated
loops whatever loops_per_jiffy is (8000 * loops_per_jiffy * 25 / 2^32
loops, plus the one __delay() adds), and it now does a mulu.l on every
call, which the old code did not (its arithmetic is plain C, so GCC can
hoist it out of your unrolled loop). If a call takes about 1.08 us,
100000 calls take 107.6 ms, more than the 83.7 ms that T2 can count at
783360 Hz, and what is left after one wrap is 23.9 ms, or 239 ns a
call.

Could you try ndelay(400) with 40000 invocations instead of 100000? If
I'm right it should come out at about 1.08 us. That would mean it is
longer than before, not shorter. As the commit message says, ndelay()
now pays for the 64-bit multiply, so very short ndelay()s cost more.
If that cost matters on the 040, I could keep the old ndelay() and
only fix udelay().

Your udelay(1000) at 978 us is still 2 % short with interrupts off. I
believe that is calibrate_delay() running with the tick enabled, so the
tick's time is counted as loop time. That is separate from this patch,
and I have left it alone.

Graeme
