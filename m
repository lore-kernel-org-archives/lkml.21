Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218162;
	b=1whozm/o3CYUXx8ZZqqzl3uMiiCnv6yMZjamkQmvZgNuKSQ7Bh659E0lVO5YiDEy3h8F
	 XxYYd/WeZLomaBo1rsrWFkBuHI/aVU/6Sg11xFnWkMcGadRaEOQaZp+MCj+ln+HskULkd
	 CaTWzaj6L0tukvzrf7wjAVcQvFDvTcXBLrVsioBlOw7/2GgvOiinaGSs79cbNAe7jHzW3
	 dOeE5VzUP9pNypFV9AXJkqLmYqbhM6Wzoumy+PHUiCzS0N63/ePyaDNPKpxmQU/xZRRns
	 AVMypZ+uAhFTVQvobVQQ8k9O6EFIDyRFnYRNPWJotMjmNne08Ej1k15/fev6mJDNTmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=CHNi8PfbA+uOsMz2/6jzQg2uGNvZO/KERXXeClKLeFo=;
	b=mG6u0qehZDT4cEW0RBeREjw04zuU+eh34bH30t2OsQHPj9I7OyY92l9wuFc/d79izmQ4
	 DbgIv3fogChJ4weeusmYLN56xJSK1pt8dGQajzGd8n+M4JciOFyYEdYb4bgDpacP44Qy1
	 t7T3EDBqkQyK158LjTl0v1Bqq3RS8676o1MOcqMjAvvhyEdRA0C2QiKRAhAk9+afsC0ok
	 qTZ1gTDBlAUl8DTADNXCVUKYTY0LWcp4C18U9bc+5gcAx7p1Kvp5GOY8HESUWSKLx12Cp
	 5AQnZrDJNNKMTgMV7EQk/iZquV+gIsUmQg7Cz2pLbwsRovJ38QNpFjX/8JziTGVav2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L6o/XPXR";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E9606A69A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F40E9606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6o/XPXR
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1119362f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218158; x=1795822958; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CHNi8PfbA+uOsMz2/6jzQg2uGNvZO/KERXXeClKLeFo=;
        b=L6o/XPXRpwlF0lVbXMVFN/CMR1bYzFujbMLcLRROJRJ40QxMdGvF8BmFFGUUpYDeuy
         LssS4i2Sh+eWsku2MqOg42yXuI//AKQXjf3Zaq4VFloHrSdG6gXwdJtVOypQ25SPvLQZ
         OZVRsFHpU1+QjiLRZVK3cho+SVW38s8lWzRRA1ydwscuBVbiHlyvAEFU2sBdiG8u4S7a
         19YsMNiTv4vP7Ppu4Lkp3fD6lFoGZaQRuOGkqq6uRj8+26vVRS2LcOeRmaJ25U6+GoiT
         qswulCKx9UcFci3AG511+tEPagr8pW2nCjYy9GOh1AI/Ua6OjvhsTadCHLRH5y+o50IL
         zVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218158; x=1795822958;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CHNi8PfbA+uOsMz2/6jzQg2uGNvZO/KERXXeClKLeFo=;
        b=WqsofvGf7VM4yh/EMWSU2Apol2QRFMLpixtWC38EVT1yTTRea0wxIprt+GzSrAp7Wv
         L2TdZoNJ0tUZcD/oO9aRR0YlL5tVfS00PEsM3UkZsKcoAUzkKChPMnK6OE4bHK3Ztomp
         myWqV6W5jGs2EUeCcqPKnlyC7KtoPhT7yj7cTqSl5FuG5CNO4sBhl3wdACNAfSeVWdg+
         a34460H6LCydVF9Isai1Dt9PXjauUk9QwyL+O8LBdq/mpbeJCgrUZiFbDtBnjLLmfFhm
         t05TRWVCklZPRmiKFDy5DXY2VGzbKDVSx5TLjxfr1UIbuky6mG0w1OTa4/+7FRdLdUF1
         6lxQ==
X-Forwarded-Encrypted: i=1; AL+hErG29RmEATqEwz2WQcZ95OMxBqWWlApVLsjyYNkDJgIWYeDWB9U8HlBOj0ATSDNW4h0Yxc/jHfBoAVmf80A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8taQ9VEXyVUVs//vOVqDNq6/55TcKtFwcTp0txPawKWCpe9h4m
	7wMyhgWdHALdoiRz0xXU41Z5asIeynAQWRQKWmDetBOhgwQ+bMbLVZi2
X-Gm-Gg: AYBFou3TKp6N31cTtH8f61wtLRNw1YTHL3VUMFFN9MJAWCo0LWUuusuqsLzV5YoG0Xt
	BqD32rwT5xwpxkpyHyYIfq/0zxm9mBcobtVeyLZ7r1PmlDshbs4YYzihk0w8IytJb2x1/GxIMvO
	N2BH7+qhAWrc/902CFI9HI+Gr1grIM+hRNTO45F92oQD2ff1A1Tb9IsBc2Ac2sOiyGB7mI3ZJvq
	Of6RP9UCLYVsakG5qe3xORNXkp3BUD9HmiVfDj5FqtjhXqkiLpyrBrtkifzsHNd/OOQAfMu0nH1
	s89BSakM1AmijtJht46oSVICki3ee7gVhm1sKAUsV3beXl6TbOLMt5d5kVb4HV/5lNBQYcjtmHg
	gtSuX9INQhTKMk1VXleftg3jpZUw67D8HNRvD9DniGSTa81UcQOUOZ6vETKdg7yUou1IgUmFYlB
	C+EU4wTTy9lfayk4LlTDwEHhUAQ9m7wrn4OVycyzN9GMinLaZvnZpIptaC7suwOqoR2vJM7B618
	JqOPhpw8MQwR9baZBC3+HzMLpUNGy6W+fdxHvIXQ9rYUOKGrTaEeqyiyVYbbeVv0q92xBOoZVED
	0ELtl79adJdNkMJ8a+CwUGsBE68=
X-Received: by 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb88812200mr113160135e9.17.1795218158161;
        Fri, 20 Nov 2026 15:42:38 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm8085462f8f.7.2026.11.20.15.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:42:37 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v2 0/2] platform/asus: asus-wmi: fix and unify keyboard
 brightness key handling
Date: Sat, 21 Nov 2026 02:42:26 +0300
Message-Id: <20261121-b4-asus-kbd-fixes-v2-0-52cda07d233f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX4Xs2TWlAhVPvofh0J8FqgKmC0RDe
 HcL3j1+mflmFmAKnhguyQKBZs9+6CPIQwK21X1D6F1kkEIWqZA5mgw1T4wP47D2b2IsrKKTOou
 8VAai9wq0B1G7VT/mydzJjtvQ1mg9j0P47KdzuvX+7c8pCqx15mytnNRFeW067Z9HO3RQrev6B
 SYuDeTEAAAA
X-Change-ID: 20261025-b4-asus-kbd-fixes-6c7e3780597b
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Antheas Kapenekakis <lkml@antheas.dev>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Alex Bogusta <alex@bogusta.com>, 
 Denis Benato <benato.denis96@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartu Alev <bartualev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The WMI hotkey path and the HID event path in asus-wmi step the
keyboard backlight with two separate copies of the same arithmetic, and
the two copies disagree. The WMI copy computes the step in the unsigned
enum led_brightness and stores the new level without clamping it, so
holding brightness-down at zero drives the cached level negative, the
"value >= 0" apply check then drops every following transition, and the
hardware-changed notification hands the wrapped negative to userspace as
4294967294+ (or -ENODATA for -1). Pressing brightness-up at maximum
reports 4, above max_brightness.

The first patch fixes the signedness, bounds clamping, and notification
snapshot on its own so -stable trees can pick it up without the rest of
the series. The second patch removes the duplication: both paths now
step through one shared helper that reads, computes, and writes the
level inside a single hold of asus_ref.lock.

With the series applied, the level stays within
[0, ASUS_EV_MAX_BRIGHTNESS] on every transition and userspace sees no
wrapped or out-of-range values.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
Changes in v2:
- Rebase onto review-ilpo-next, where the driver moved to
  drivers/platform/asus/asus-wmi.c, and update subject prefixes to
  'platform/asus:'.
- Patch 1: Fix Fixes: tag to fac55d29581f ("platform/x86: asus-wmi:
  Add support for multiple kbd led handlers") and reference Alex
  Bogusta's earlier patch [1].
- Patch 1: Step in signed int instead of unsigned enum led_brightness
  and add an explanatory comment; prevents 0 - 1 from wrapping and
  clamping to max brightness (3) if patch 1 is applied standalone on
  -stable.
- Patch 1: Clear kbd_led_notify atomically when snapshotting it at the
  top of kbd_led_update_all() instead of after do_kbd_led_set().
- Patch 2: Drop inline from asus_kbd_led_calc_next(), drop the
  unreachable default case (all enum values are covered), drop the
  redundant NULL check in void asus_kbd_led_step(), and normalize an
  unknown (-1) starting level to 0 before stepping.
- Link to v1: https://patch.msgid.link/20261025-b4-asus-kbd-fixes-v1-0-fa4dcf7d2a69@gmail.com

[1] https://lore.kernel.org/r/20261016015117.32174-1-alex@bogusta.com/

---
Bartu Alev (2):
      platform/asus: asus-wmi: clamp keyboard brightness hotkey updates
      platform/asus: asus-wmi: unify WMI and HID keyboard brightness stepping

 drivers/platform/asus/asus-wmi.c | 77 +++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 41 deletions(-)
---
base-commit: 2268d837dea13a78639fa3dad60472bb67478709
change-id: 20261025-b4-asus-kbd-fixes-6c7e3780597b

Best regards,
--  
Bartu Alev <bartualev@gmail.com>

