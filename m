Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757324;
	b=d468Eu8R49tWPbwMToQdh8G1Y1ilS1LMIIFTwJYlShVuK3Srrjzo8PsrIyiBTJGMv7Uc
	 lPhf15gOhPjTr9TeBzaCKd792gLlI8v7BsZzYH9FYEdfT7IXi9YW4/qkGWPLN3uWB7L7Y
	 qBBv6QxVwUnf0R//DEiu3hqCs4PDDH0lgvQoC8ySohAhG3t0auAi62u0yrC5y/NkbnEq5
	 uALOKy4xZ5Slx8pq5Koc5pw0+cwxeZCplsnbFhD6no7t6tDBa1/gHhHo/oPgbNpT4O/s4
	 9B8lTYPZu4JbcHQ5XPiE/d6rnu6I287pCOvYowTeD80Xj3NowedolKI/YRf70wp/QGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TdUf6KB/FNH3fbgr4TqtEM818JFeVephPzr1hPpbgiI=;
	b=lT1tOzHsFt1taH5oZYSUTuRWyG2z5SYbRbl3kq41kn/1F4YxNCkDAekfrOnw89XIdBba
	 gWepun3k3oYWPI6eFRgb/HhvZfdhyvpT+skTe3Y6l5JMvwbLISoMKoyoch+Q0i4qyI/V0
	 hWecDZ1pVqB+SZycKW3D0J3cSw67umwXNhfeNvwP+caPc3qWnDW1/dTUAr9r2Qgo3zkbQ
	 W4GN258jzYOkYl2gc06StsY4GFzqtpLE5rC/YiLhjP7jrONyIJNod61qrJvbZE7+q/NlJ
	 e0JmiKDtcK2iOo0umAWX5dZX7wNeWKpI767fKcGWUw4iEQBbuH5XRzMQ5005hzFt4PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kerzcc1K;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729D9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kerzcc1K
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso70684655e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757323; x=1796362123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdUf6KB/FNH3fbgr4TqtEM818JFeVephPzr1hPpbgiI=;
        b=kerzcc1KWJx3QCpqFrSzrkKSQ1PEd8pOxqmjIKOYubp2vQeMdUDjf57BUSZTPM6X26
         V/imo/dK2gBiABO5wyqyOuTcWe9vE9PA5N02RWajkORsUw3Xdj7/gdpXEB0b4lR8cuaO
         fUj8TjPSLxXJeozkdlIB9+rTvRgBAPsKdASyWY/D9zts84/0VotIOMAbOpbpykACIQBg
         Jje82t03YeLXFJmS629YmtHxN0ylRXBSB6rO8YLUGlNCCzaEDbmyBoDV6SQQB1RkMAZZ
         q6j0nEDcy2sgQC+MmfsO2Kmh9jp8eUcVGUB0VcVmpJAMnOvqRWX1l2nuYIs4tNFt7Nr7
         ZmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757323; x=1796362123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdUf6KB/FNH3fbgr4TqtEM818JFeVephPzr1hPpbgiI=;
        b=ppM5rjh41hZnJE1KehR/e5P4EoXK6smgw8NnA3Lz75ABkej+1hBX2FhYeIJuFrRX8m
         McGGvUlycdq4iO8LU9HyZlGcHEPJJAWoSRz6UYAlFFHY9oxcyn4OsHYyKQFansMXBlS/
         38EgBtfhC9VDhrgNQN9TMI+lZEKNOZ9cE56tQTMb77OE7GlE2dqN8BlpVMyjWy4mdyHq
         qB7V1fByvtHeDktMyEyqHp5vAwBu+2bEV/AjH8wwaAUC0Xdfvm/KFkuLu1b6IuTmpanN
         9W2PPL930r4Ci2iVG0D8OElGvBIQIGKoOdYjDyWcD0aN4pgT3ik5Tj1Nq8xAWIokHtsq
         5Jiw==
X-Forwarded-Encrypted: i=1; AL+hErEwJdYr5j/m/rW1dWI/Kvy5cV8XVe4RyPOviAYXNJogolMP7sf6jmDngw76JSED9+Zae8P86hXMmbRpWB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zp+fvWnXFlAaFpEeohwwiYxR7Grj0votG6thzt6MTkzlVmsSp
	Nix5r/ZmOgdiCOxP4TdYqQ3YfYSWFeIrII78yYj0KCuMkRPLFGWnWq+c
X-Gm-Gg: AZFdTZdim2nOqJZxRTGznOaoNk3+Dl+Rl/Appvw5ISJCIAFLQerHJVTGbyzipe1MVoB
	uovqYEGYbVzgqPnADarLrjFDvOIRGDbNmFK1bzYhyyZFxCMguFEebiEtTyqAU8z6DDNjBn+G121
	JGHSqbThg3qRav7MH3KMLzHUYmuD3JBQwfHAQ+Jjt3SqggMmizK60GheYN6KTVBsVSndvo7fWNU
	JYCxIcbIMGvMtt7IdbdvXCpr9iv6kwCJ3H1rKFwXiIlgqeZX5SxXmXhMMgc9yyJ9FY0HkKTjjog
	c/Kt70xrlCczFvrexsbhVfDeElmM8SMSPaxKdwG3RinjOsb5secP1Hs5ZCRM9aKG5yWtg87mcqv
	NL/Q+Sh2YWrpHdI4hLvb4AUEkAjjUVZMSsy5ZzLkRvqV9XctPUi13rRfVjnxzqn5dozXqT7+Rfl
	Wh1WxhcrCZjCd/mKpS/ZiWk8abJQeFzSATKg7DGdWbYPkLX1WwQ6VM3PPKNy8Ri2x55b4Ir/c3u
	CsTClUjccEHLQyeVT950kD7OaFW9ckEW4tE5DnulCpKZBgPrZf9ORPnQIB2lNYQg59fdCK1J6mu
	O95Y99dnh07sJDTDDRMbB5L++dTNZd5r4URHUNx840TDeyR7FOYMFcVuGsB7FRt1ac+qosF9kdF
	IRMY0nwnoyqRn4p/bfLHuD67ZP9u/85O6AQVLWHNpYNgJ2l57bvB277RHxWEJuL/zrmJsne1VPa
	WGo0NvqX5aQqk5XeoyXgq9QLC72wvmCTfSaD25yYzqnh3MYUVwBSj+l6Xm/zQEB85B
X-Received: by 2002:a05:600c:3511:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb88828304mr482429785e9.34.1795757322788;
        Thu, 26 Nov 2026 21:28:42 -0800 (PST)
Received: from sergio-82n7.homenet.telecomitalia.it ([95.236.10.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm649073745e9.1.2026.11.26.21.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:28:42 -0800 (PST)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (yogafan) Support >2 fans and add additional Lenovo laptops
Date: Fri, 27 Nov 2026 06:28:39 +0100
Message-ID: <20261127052841.492895-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi Guenter, all,

Apologies for being away over the last few months due to a family
illness, and thank you for taking care of the Yoga Pro 7 14IAH10
(83KF) fix in the meantime. I am back actively maintaining yogafan and
have audited the pending user-reported DSDT dumps.

This 2-patch series is based on hwmon-next (12c53b6b6):

- Patch 1/2 expands struct yogafan_config.paths from 2 to MAX_FANS (8)
  and adds the 3rd tachometer field (FASF) for the Legion Pro 7
  16AFR10H (83RU).
- Patch 2/2 adds DMI quirks and documentation for 9 user-reported
  Lenovo laptops (reusing existing yogafan_config structs wherever
  identical).

To avoid merge conflicts and duplication, this series intentionally
does not touch Yoga Pro 7 14IAH10 (83KF, already queued on hwmon fixes)
or Yoga 9 2-in-1 14ILL10 (83LC, submitted separately on the list).

Build-tested with W=1, checked with checkpatch.pl --strict --codespell
(0 errors, 0 warnings), and documentation verified with
SPHINXDIRS=hwmon make htmldocs.

Best regards,
Sergio

Sergio Melas (2):
  hwmon: (yogafan) Support more than two fans and add 3rd fan for Legion
    Pro 7 16AFR10H
  hwmon: (yogafan) Add support for additional Lenovo laptops

 Documentation/hwmon/yogafan.rst |  21 ++++++
 drivers/hwmon/yogafan.c         | 112 +++++++++++++++++++++++++++++++-
 2 files changed, 131 insertions(+), 2 deletions(-)

-- 
2.55.0

