Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432572;
	b=PqNAdoCrIyvok8lz2n3bi88qaPqcEf0fsjtOXB92NCGfYiZGKTn/Puhcwe8dpBvJWEeN
	 aNjh8HtHjF/FtgH4AMMzQxPdetHdkDxV4LoM84HDw4YkAdcF6HEnsvZWpAX2a8ZiGcus4
	 hVfZwODTf/PFfkWOduX6zg567Dw7kGKnSyKKOwL7aXAV5rUlfGbDbXVF4C7L7ILfEzcZL
	 7fAFqcsTi3Z1dERlsshMvP1RxGU1Rse2CKR20kskGkNA/DPQ6TqJg1j16o4QZz9hUn/L3
	 uo1P402AlWASG9eOCDjfYv4xCJa3wO4rbNTDNeZn8GjlazGhyIMYerfNJIyVPcFxlwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
	b=lwDBoTJPUy8AjTl3uhwKC3xPb5YPGi6ulLBo8J37qVCKPGdQZtG72MoS0M0+YyJWPoXu
	 RtKdGH/POmAdbpUkqQC5aOr6VeMWnlNxaJGoZwJJmdFvOmwrgfDulyQQ8Cs9+Uay8KgkH
	 mstVgld1AAHXMI6+lkXWtLladfK5xbG+YxJqHuidb2bZO6nSi4JP5ZnTZoT1ftPfsxM9h
	 SkgJ1G6Ltu0JBhDytOMlrGEW3yhULXaMBtSSu3ACcnoJRVgBkjqleOG5ZQ1zEGuGdwvMN
	 jYuvEyMsavC51zsEszCY04+TYOYiQK1DNWKhVhyVffrg7bI9Jvkz1lDzCDjs73vbZwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yf+SMwhU;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392E4606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392E4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yf+SMwhU
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ee3e658c70so887916e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432571; x=1796037371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
        b=yf+SMwhUXQdwf3ksRdD6AYU7wddNetPL90dWfhTdFfBWhXvVQozMsBVTaTSZc+L0c8
         NDSI07AXbfg3Vp5k8VGZAnvjjQdyrxTW8uRi6CqVVqTbUB8cLwoe0xaWE8VrL78zWhkc
         ctqvkUTzYgiZmUWGyPamz6TKiDufOYD5oL8FHQue4dzDTqqEUg0rBXPjinREr2EVH0yy
         RhtxzvPl8WcrWkhK6wz5Jiu+Eg7oJGpi2qAwWQ0PvQSudcVUrItq+VFg2YrxfqvkQxLt
         aFefnQpcTCsefUzY7LNI34SUnsnPbuJWJOe+OWyjpcpS9dWSwiWuOmeZrD+LLI6DYTa1
         Ydeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432571; x=1796037371;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
        b=EfsuiTNozWfc9JKwoMh81A+oLDA0qqm03EGrxGZB4chfpMFEwy23KL+PSqlIHtFY0P
         858TOenIV/WCGNbm5a2lFr2p0dPiPG95lv2zWTuuLtDWmYqcDMbI4KdybcuXlS/uxVLe
         cjETFf37cOzNUner4X7tW4bR8l9TF6OMqppo45/bYvHorxUUOlQIiYxoOrZrxA8z6aIx
         PGFgTnbA9qAYhCyDK6LZWOL2q+/CypnLpP14eUOCYZPf0JO9h/s5DRePGM4K3+IgzeKe
         iNBKMe5+0PfAJF4Jc8kBamj73vHGLPXtnkKlM3t5utKSq07tlCJOVGgJAFNsLEz86/Mt
         OXgQ==
X-Forwarded-Encrypted: i=1; AL+hErEF2g8uP1cTvh9CBuIyjV48stYjadOkH9/I+nvPnrP1QekOkimU7Oz7ctTj3k0IZ/NIriUCg2xCfOVw0hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e0uBldp54ZCWXSEGMzpxSBmj0Tn5b6tUlxh6PNQSrpz1lzT64
	domuukdSw+1oEXMgwKaYSk2M/03VyMj5BnwtuMvFNisV2kNiV2HcObBV
X-Gm-Gg: AZFdTZfAgBcBQqV4BsUBUvw3R5CYzeHStF3d4yEk99PyVaez8cb22WPB/4nngtd/P3b
	hJG/Zbv4KU9cAcGODr70vgSDa/0dgMaWIqSnwMO4epD4Wv4Xt32yKeyWxJPQMhWXpsdkrQlk437
	KhBPUSw4TKAQOJu0GFNfdMpUak6w9XXEgaJrzkhBab3Wl4Jq5cKRzyiRt8Kf+LF/mh1DorihB1h
	zE1rblleW472m6feGH7sDtjDvZQ6Vy6AUGrfGxdXNBZYjAxr055qQVRtSF0Zqv5hrFIZN6zNphx
	e0eeJVSFcbLtnV15IC73JruMH8ZRyZT8Ohu/mf60/u1z7OFNTMwDRXjZrqikr/WhkKlmLevkYhp
	cKgaHiF5BefX+0MEllI09Wkf0HmqNnLzEZpRt4NNaM1RUNBjcyHA2kRTvQxVlAaAMEsFWrKmSj0
	1ROEEt3HYY4kWzPedDnuJ78LigrN0c6dRIc7ACX0lEeSBGgTbhMZEmNC981/HPBA9M8HW6RxECJ
	K8NSUcmz+bJdb813A/sw9JhgGNm5To4uflCPHhhbq0E569QPS3jN7ODPMJXiSbyz9wcFZt5Sd1K
	8FZb/Xtj8aHnnknkUMERoq17JUoY5rvhEP2C8DRV7ftgInREy7YbNu7l+AkcjpMPaIkYfaTGN8o
	vdxwn1BKg6opzbbZ4X8dIsYJqPVBjAUGBz7Ek+iWoi/xnGlYq1tuKh1LiLxE=
X-Received: by 2002:a05:6122:288a:b0:5c9:c60e:3a40 with SMTP id 71dfb90a1353d-5ee8af56a83mr5616946e0c.18.1795432570921;
        Mon, 23 Nov 2026 03:16:10 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa42:30d0:88c6:e1ab:a806:9c3d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b4335e1sm10485066e0c.1.2026.11.23.03.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:16:10 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Mon, 23 Nov 2026 08:15:47 -0300
Message-ID: <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com> <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Nov 21, 2026 at 12:14 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> There seem to be 3 revisions of A7Z. Which one are you targeting? Or are
> there no differences as far as the OS is concerned?

I'm targeting V1.11, which is the board I have and tested.

I compared the published schematics. V1.10 differs from V1.11 in two
places relevant to this DT:

On V1.10, BLDOIN comes from SWOUT2 and CLDOIN from PS. V1.11 uses a
separate SY8089 step-down regulator at 2.4 V for both.

V1.11 adds a 10k external pull-up (R59) to the microSD card-detect line,
which V1.10 doesn't have.

So the power supplies and card-detect configuration would need changes
for V1.10.

From the V2.00 schematic, the parts covered by this DT (PMIC, microSD,
LED and UART) appear unchanged from V1.11. V2.00 adds MIPI DSI, a second
CSI connector and a backlight driver, none of which are described here.

Would you prefer keeping this DT for V1.11 (and V2.00), with a separate
DT for V1.10 if needed, or splitting the revision-specific parts now?

I also saw Andre's review of Enzo's v4 [1]. I'll apply the relevant
changes to this DT, including removing the MMC alias and revisiting the
regulator descriptions and constraints. I'll wait for Enzo's v5, test on
my V1.11 board and send a v2 with those changes and the LED patch
squashed into the board DT, as Krzysztof requested.

[1] https://lore.kernel.org/all/20261122003932.568c099c@ryzen.lan/

Thanks,
Vinicius
