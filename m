Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496483;
	b=4vgUQl2dcbdfaORaChb3WhVf81JXbCoEpbjfhUKoUKoL/PG/j+ZC1gW4wZ8/RuymHgrC
	 0jTbXS2z1X4m8E2jettILZzGtVueB9oxruApOg63VJepFqwu7tPqdBfRjFxJ3YhXnieY4
	 6KYQd/TPAyPoB9F0DjXVu61KSZwwXdtmcRIc8Z+fbxzJBEmKzTcSD/NztRu7dhw5z1bZ1
	 zyKUvvS6jwotrO4K1hAVjqYw2mNwIEGOeXex02B+IqfTMnQN8wD7HgkiXxgXkr2AvhcqE
	 VWoE/y+AcgwCntCwOioizeai548yJkW8p60cPY4KbfkF/q/lDXhRiZ5bZ9AQrwRYhRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sITgWxD5iXuRoxacaW1y/ZEl91KWtEOEir54BjnX2Ms=;
	b=X+qkYmZtVp/TjS99yTMMt2ZbzL4wOqyDmRByrac1lpEVJeDkyNSGtG3prFDCuaYgJhdT
	 FrBDEjTXOxIv1cWcsQKwz/SiMGsJ1I+CS88bSxA5gu19fufvMCV80akX5tsQjktZwNxCu
	 pGkSx++inaIeHaTCGFHctN6dbZU8kFYtsIPIpyNpB4p3UskBNBbwKSssS7Eg5O/XTSHjO
	 godHh8vn+H5PveGzZkRGcszyK9glPeVSkir0pQ30tspiS2f0C4Y3VuNJr41xFNS1Hy53A
	 6lbfPqrkg3R1+gvw2iqyD6/kf/U+ZE4pHRcDqVa8IT+TSjvhBIFBH9LTtbhtZynhyMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5UXp9OA;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5647A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5647A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5UXp9OA
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so38918305e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496481; x=1796101281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sITgWxD5iXuRoxacaW1y/ZEl91KWtEOEir54BjnX2Ms=;
        b=u5UXp9OAtY9R3Tu6ra8aHem5hACKbhfVHyr+QcpVIcfTulfIjIIzKI3QaoiClWmPoW
         FpG0syLG8TjSSP7rM5t8vrccjmWkOr9w9vjDC0O5356VGLiKFPUt9I5egRVsA44W7gqo
         pJxJpgFTfESSsUyh7bXZP8MKapKCgG0PjUJ6LnrURI6wGJw5VccVeqEGSgh6Y+0GWpdM
         s6nvWH6C1uicnnNJQRwQAxjmsKiPLQZqR1s1Toyrh4dYWmkb9NwrUu+NkhSxPlLz57U8
         w4PeWxBiDapMjnc8GtiFvYsCthY6rjoI77d4v9/JVDqOrub8uZ/8vl26E8NXSZztiAR/
         3WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496481; x=1796101281;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sITgWxD5iXuRoxacaW1y/ZEl91KWtEOEir54BjnX2Ms=;
        b=1QpBCsjP0VdeKfu/ZG4PMQJDvsqYluGFhcTdJ+Zdm/ompCnC+bA1kT/3CsmfW9F9au
         LrmTfVpteLtvkwkMWP+OhtkMZtSAGGR4hqw44kjODMM7+b4pAsnKoq4GGY2AtxafTfxY
         KWdZHb8i1a0i66cfw8xnOZGauz13IF2rLn7ADD4O5XBrik6nkbSv3QAQ1HRplTFJodWs
         +s61jO95yS8PE71iXmvV93AtdSjBbHu8VXxBBIXn+RkS84p38YLOtVwlSIn3w41JFX9u
         xFAo+jDgVSp1TM7KAfo2FNFy3Ymbt2Z+JakOotO58Dg3jNMt1g+04n/y6bWFy7qSTo/9
         DpOQ==
X-Forwarded-Encrypted: i=1; AL+hErEVg1fb6vBZltTGhcEWhEDGBo60c6B8J9yOyuSHzZlTNauN7q/gN1Qgrb8eFfk6UuQR/MEa3KUHbOdO8Ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yEyqgY4LMcGnGhOdxvXdWMO1B7PR6qH60R53cLY61EeqX8U8c
	AyrRwnX74S9pAwD0LeEUhlNmvch7Ma1NOCjignInC97VgHQti87melcz
X-Gm-Gg: AZFdTZcpFquMAm2XVW4yaQltibliJMq8Lv4aW0lOphuylsYDmd5P7FJDtaHk3W2KngZ
	2l43ueDQyMk86ANRit6B2AjHukyPgpu7wxwwfssU/j0fZVnjshTEndsB0EpyJ+tVXDrYjY2tveI
	B8r8R1SegezQqHxTyj/b0ScpI+XUo4VwMdIp1YvfWQrqrR9agPUv9cak2Rop8AHrMr2bW/rD3Ys
	F7GIjW/yWBOibDhF1WNitKrQPJnF0SNLuczahF/18xmDL8PYihloU0QsgC7j/waGLBRE7R1tMNy
	haAVou4WvoWUev/+7x6Q1bKzgl3q6tDwhqjwcSvihlKobHLozsaEb7Jgs9RW3N1UvgrccPBI6B+
	zHdjQBPiLxLrD1yj96b0hDjpg8eRp7Ly6RsX6eiE0AqDQuM1OWbcy/9UY6wbGt6w+kdnwKNjTHM
	LZ/pEzHo+wdNj1WMMFArd878HE9xPNXav7hdUBOt1sB3o37CmoBMTafXdoVVAgHVZ0beSDP8/Jp
	wI92DKzIG+r/47m+j4Vgy1pyd30hl7LhlnrFS+iwgsLF6jx08MfGIDysIJu80u1W9/WroU8FXXI
	/UAWGnM7R0/Bx1bZve5J44y9yJQyVU9tIQ2n3NyMP5OZ+9rLDRq0mrU0Z+DSymUuSjJTdPtrMIW
	1qDBDNuG+MggHEQd3BoUAUYpR8xjj41bWlEZvG4rUtIw/XbgG3G9uiIxeCXpVkv+pgXfRwtVD9X
	Kdux4+0HoZYWiqCVQUst65Q5bybeZ0GUTZcCq9xCEiQyeTsUWdABjH/uqWhpirFSbke1fOtFSZ8
	Q==
X-Received: by 2002:a05:600c:3113:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb88816b2bmr291844445e9.27.1795496480513;
        Mon, 23 Nov 2026 21:01:20 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f512-85ee-fdbe-0621.ipv6.o2.cz. [2a00:1028:8388:a84e:f512:85ee:fdbe:621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm353489155e9.1.2026.11.23.21.01.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:01:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] watchdog: max63xx_wdt: Support a WDI pin connected to a GPIO
Date: Tue, 24 Nov 2026 06:01:15 +0100
Message-ID: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

This series picks up Pali's patches [1], which stopped at v3 in July
2022. Pali is on Cc.

The MAX6370 on CZ.NIC Turris 1.x routers has its SET pins connected
through a CPLD, but its WDI pin is connected to a SoC GPIO. The driver
currently cannot use this GPIO, despite turris1x.dts already describing
it.

This series adds GPIO support to the driver and binding, and updates
turris1x.dts to use the new wdi-gpios property.

Changes in v4:

- Address review feedback from Rob, Tzung-Bi and Guenter.
- Fix GPIO direction handling and remove unnecessary locking.
- Rename the property in turris1x.dts.

Tested on a Turris 1.1 running the Turris OS build of Linux 6.6.142
with patches 2 and 3 backported. The watchdog works with periodic GPIO
pings and resets the board after the pings stop. On v7.4-rc3, also
tested the binding with dt_binding_check and dtbs_check, and built the
driver for powerpc, and for arm64 with and without GPIOLIB. GPIO
behaviour was additionally tested under QEMU.

Patch 3 can go through the powerpc tree once the binding is in.

[1] https://lore.kernel.org/r/20220705001023.14660-1-pali@kernel.org/

Josef Schlehofer (1):
  powerpc: dts: turris1x.dts: Use wdi-gpios for the watchdog

Pali Rohár (2):
  dt-bindings: watchdog: maxim,max63xx: Add wdi-gpios
  watchdog: max63xx_wdt: Add support for specifying WDI logic via GPIO

 .../bindings/watchdog/maxim,max63xx.yaml      |  6 +++++
 arch/powerpc/boot/dts/turris1x.dts            |  2 +-
 drivers/watchdog/max63xx_wdt.c                | 24 +++++++++++++++++--
 3 files changed, 29 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.54.0 (Apple Git-157)

