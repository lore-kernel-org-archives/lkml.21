Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471264;
	b=HK4faVPVU3FoakGCS9T9SW0Dk5pBlfpjGrMxp8AyWlaVEAMyIFyIOy5k/ayKVWjNvDuR
	 twspAjcPWqlRoL8Ah/Dya9DjN9bhU9sZztBCGHwLg+dOTElA+0ydn+jiqnUP+AwK8HI0R
	 +mZ7E0ZJHWFWqrs26KylAikApVlufT3K+6XThnaFgFDJlBGMmQN5zoiHfTu3A+Liv0dql
	 DDs7yvnc9IY2o1oF+F6roLiDAaVnvKq2pEmBOInh0STLlhFgg6sT1WsJhc0qJTK+ouij6
	 3OikVXt9TvvIL1i9Mw/qptA+Rx44dufhV2r7f0Z/RFrE01oClxZdM9ZA3TGI51jPaag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=xhzf2GAdeOLD6c0v2imXIzwLHmXmZhjtZ0JwUowL8Qw=;
	b=V4LOpObg40C3ux8FKZArWKGpcubI98q6t9wiekFsvCWaqZk4qFr0+Kf6lAzGpvw7RVer
	 IXi5NSAry3+LeDjG1HlNqljT2vDIxRBeZY0UgcV9DT5IEjCbEUQPBxvj/vhZq3sLnu3Yu
	 Vtyuqn0i6rBs1ShjbgIpGVnLZ+crZTJf0LE4HvcWCs9K4oHDGMNjJJHJNnugaAfoiToqe
	 QRTKY1EX+dgP/h6o29v/z4wTUJdRR6s+B8uB6p8/SxJAI1V93iq/O2pBXKtpHQ+UeLWQ/
	 PDbYCBxg5DfSi8zDNcFcNoLbwfIdpeNRDJLsgiv2QCh2MgG+878RHsLyPhQthPAlnew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UIoZ4/lH";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A39606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A39606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UIoZ4/lH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so32790295e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471263; x=1796076063; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xhzf2GAdeOLD6c0v2imXIzwLHmXmZhjtZ0JwUowL8Qw=;
        b=UIoZ4/lHvTVxtimwt0Xz7waHMYTyE06yZOAZu9jyPKlAbl9WKxPJy9S5PhRsFU/bgY
         HUUzexKAtSFnEBTU/UIlxzb9AyZq68R7egGteyDpJthY8yLIwdKmkFzVnSdr7+dgClWc
         UloOzdtLM6pr8k/g3+AdtJt2sWi8yQ+lP69K+sgwalHUl8ZDBjNiVEOC+Te/bdMTVEpA
         hN/qONV4hJoQcDpZg+W8/PfTb8ScloP6eDIS5qwv8wW7XWygW2bvEel5XCmCtA5oCxto
         8tYWlI+6RJXAyhMUJMbBMKcC7zZ2RIsbuQu2gQJEhIyClLkvHrlep7WHWAQ2k9A3qzVI
         3q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471263; x=1796076063;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhzf2GAdeOLD6c0v2imXIzwLHmXmZhjtZ0JwUowL8Qw=;
        b=dTUo6ahRgiZJpqr31RZS/Tr+DTQv0aIn8dZfp93WyvnoGT5n+E3G18IyuTLQwLbHCW
         01kBfl0tJS5DNa16oR1GTU5m5hU2v6Hg2zRAoNJOxiFgAPqb0S5RLXTqUb0h3hNB5bjI
         IM9neEsrNK4RJlv2l5HpET7CipZS1qMxhWRG6Pv8Xz9rLwpNtB7vOHm+87YJQvqbmR5Y
         3n/ovwxpjXYZwdvedRKlVIizXKm4a25OsVDjkb2IPKO35tvR8WnaCtGYoWPqGiRiMVRi
         cof71F03NZmqI1W49vJ/T3UGH2lv1gWIfjZlDTzV0IqIq6Mpc36lHpMrSNOo86rpoVBT
         /kqQ==
X-Forwarded-Encrypted: i=1; AL+hErE8uXwhbznSwcyFi/y5xuzISvz1V6fMi3Q3K5iFV8vrwnP/UG1+ZSqoj2M8CcNzOK6rTFZhcsAKua6Jha0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oNiwLwMACo2uKeJqMEGHBX65bVXuNMY+zheJwi31Lo3tvq7XM
	Zl0JJPBMS6boN6+dtp6/gakukbKR4yWhQR0t6cA78z4D1A/mV9jd5tvp
X-Gm-Gg: AZFdTZe7lp5yufNlSGqBA3h90ycn9PHp0Xvp2xy5bYrcV1u+bhoUkxZCdHr+rmTvhCu
	aJwhhjNYI7aiCjyNhRxJPlnhsqLU/kJP8h8+mIGag05E80+oSRwysCzEsc2+uY9rpmmF71OjeBi
	6haJlkK8uWt9PSaQ1y4gGO2t2nxCk9MCkkaNjHZeyJj3faW+SZoANBNhMK83Fln66XOgHljni7k
	y7OcfWzHdbiK0mvJHtEdJqYAKlwTFHWbeFLAEG+L46lECd3ulhpBr9DE3Eh4UL2D5/ESrWcTdvP
	y7XxkmCdwNv8Y+JBKCLrTaPnrSYXDQyKwJ7e7TgGilBZQuvrPijGoE7Hbx5yYDSzKwnJX1YAW4k
	HvnsrXzN+VPnc80F48YYRQdRuqL6BPtMbhCh8xShKEJXrwVY7NZ7W6pND5EY6af/LKLxR59E1mo
	y8dZT70LccsRSXQve2C3V5ME2X9H7yonAHZFKfjsXBs7B7PTMbugrN9dXIv9df1B0QfREt3qVtS
	srk131AKkJY9KQOp5MWOq9KF5LXKAHcVZychBvqZDa/Y7+hm9GZJC09boJBDmiSr7Wwy9f5DhZ6
	bf5H8vFZUQ3W2+/ubef1ivpzPmeAmF4js49ucNd49AMZCSyrWsvUhT4=
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr270320725e9.15.1795471262627;
        Mon, 23 Nov 2026 14:01:02 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm434896805e9.7.2026.11.23.14.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:01:01 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rtc: Add Cortina Systems CS7542 RTC driver
Date: Tue, 24 Nov 2026 01:00:59 +0300
Message-ID: <179547125963.75567.6386430167092445665@gmail.com>
In-Reply-To: <202611232056209fabb078@mail.local>
References: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
 <20261123-b4-cs7542-rtc-v2-2-31ab43f2cc8e@gmail.com>
 <202611232056209fabb078@mail.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks for the review. I have sent v3:

https://lore.kernel.org/all/20261124-b4-cs7542-rtc-v3-0-53902bfbe0ae@gmail.co=
m/

Probe now leaves the enable/reset state alone. read_time returns EINVAL
when RTCEN is clear or CLKRST is set, and only set_time enables the clock
and clears its reset state after programming a known time. I removed
the redundant rtc_valid_tm call, the two probe messages and the ALARM
feature clearing.

I also checked the year field and the calendar on Almond+. The vendor
register definition gives BCDYEAR bits 15:0 to year data, with bits 31:16
reserved. Using a separate RAM-only range fixture, the hardware passed
2099 to 2100, February 28 to March 1 in both 2100 and 2200, and February
28 to February 29 in 2400. Century carries into 2200 and 2400 passed too.
The 1970 and 2038 first-second/boundary checks, year 2000 leap day, and
9999-12-31 23:59:58 to 23:59:59 also passed. I therefore changed the
advertised range to 1970-9999. These are specific boundary tests, not a
hardware sweep of every year.

An exact-driver RAM run separately checked reprobe with RTCEN disabled
and CLKRST set: probe preserved control, reads returned EINVAL, and
setting current UTC enabled the RTC and resumed counting. Each run
restored current UTC before returning to installed OpenWrt, then I
verified restoration again from fresh host UTC. Firmware was not flashed.
Full independent ARM built-in/module builds and source tests passed.

Thanks,
Fil
