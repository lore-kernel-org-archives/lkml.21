Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444116;
	b=FhCflpwTGCuvjRXURy91Ld7oo3JFlHAyRfhuiIcPRT03YmtpNF3OCKIaHJcYb4FPIzqK
	 m7WWa2Z8Uh4ldNf0VA/lGsRaE/qf4AY+YO2F1aYIWp8o5HYN+NKadNDc5R8nOm3RwLelH
	 xJ1sVl4FliawI1A293nofXHTNpxm/mYmJyvRn62/lSoygbJM/CDQRu0dNSyip1cqlNAIX
	 4w5kHx+VL9NLnyu7CASneXXT6Sd1Ugbd+l2rWeY43K/eIgIOO3UyyGilpp7PSpMPijoyO
	 H8H7vkiOOk1dr3vaiqsnMLUYhtmxDXUFbGlZY/DlBq7Km2Z3OaLo3zKA6toNvUppWRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i+HRgjfbHqWxOklnWxJGQb2C0xrnW6LaMXMeG0b6UMY=;
	b=HICbX5OXAugqRtWqbWBY16jXhSW75ZkPf9hlgrfkU196MyUSjM4nly0GHUSgqu0QV6pQ
	 NtoYF5iOn2BaDC2+R2+gpblhGdzi4z7TjBkGHjt9OHz4bVYn4LuTYaaAUfHirkcNtZKTX
	 LwzgUbERiV8MZt/BxAqKrJnF61LmC67SngIMlOR4/qv4PtdvCHUiboMhc87/QnKigq+xA
	 9anVjhhc7PCm4bnDNs25lOzk7KBSDUOxZJYO1Ca2XGyU8iXcsb0iDD92U2CHCcnw2g9VG
	 Xv6nRcRpZLn+fq8jGZrWnLQfV1H07vyF+C30FkxfVUJISnfbjPFYxI6rNZwAhhfbPcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+5g91EH;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632AB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632AB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+5g91EH
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4195599c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795444115; x=1796048915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+HRgjfbHqWxOklnWxJGQb2C0xrnW6LaMXMeG0b6UMY=;
        b=Q+5g91EHgP5jN3hRU83SGtVM/mehEbjlOslcXA0EY9AvstRpqOnccc6nOfINmc0yGp
         kiFlTy1irqqjr9NeokBILYSk1nGcBsZkFUz9t9camIWb2Cm+CjSqNhyzXGuWXJ/e9WsZ
         y0BVtDIZ5H4LQliNor2JDt6fzNE0tKMdraD5w/+YunpEV0I+R8zXjo4EGeHJJJ4Ucg7D
         D7ZG3gkCrqGAHMb+X5ZN0nE8JSG85oHdL5tnSnLvEuEOPmfXj4TkpwpT5u9EmwgSN55q
         6EzHCWy9AhICjLUmEy4JLezMIHlnXPX95Uolp6P165eM76SVcHFUSEgM/856UySvStpx
         LMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444115; x=1796048915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i+HRgjfbHqWxOklnWxJGQb2C0xrnW6LaMXMeG0b6UMY=;
        b=xuF+u8fG7jxRrZoOlCfwRM3ry5cyxR+nzMi3/XktlrJN/qGtI5/pm0m7QVk7KPHy4Q
         Dx8gt1RfBFnp7Wg2d9WO7qRjmEhXEYlZmpdplMBBgM9qxygkzbrBf9j0cnWSTWVWQtaP
         sF4K9qGkY//tt4hUZ6QkrHWFZ2D1Gav8w6GKqkKipiiWt2KHkaO8VknhzxHbbyStGZ/e
         tOKOu+/KBZ+b4WAkUrjzCYQjJA9RepQc9az9kIqfwY4Ea4tkGMODG1Jn5IQxcREHmgoD
         Gkb0ntRW9dudD2Vv/nJv1GT3Fts6sTmTkCHAW4cmUBg/WxLlDOPGMfZDerDUT7Y7dmBD
         q9Mg==
X-Forwarded-Encrypted: i=1; AL+hErEACSejK6gS1MA3tnjY8sgT4Iz2oaepe1wH1XeMwKPcyVjXt4ZzsaktwazRZkodQiaOU8z/6siaA8uzP/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E3r/y6euld9IR5mpP+Y5y5ZHkjucOwgAcXmU3TjJTYI4WsMk+
	xjS6Km5CvUOON9GnQ9ZsR8srLTEjeEH6/eoDy7DOWPkU2cgjPXyWjXvu
X-Gm-Gg: AZFdTZddZfZdGNHxDUXB3Uy5mWnVPAndsfowrD5XWUZTKLlwBjuTCdvf+uYwaW16GRe
	9HWOYck5KlunomLqTYLg0F6TReZrXBqdkhzIXu2erLLg7NimUnt5LgAZJgKzN6NGdl/Cc0fFEAI
	ZEcp0Agjm+6AmL8b5k+LNhnxV7AaCqQwxNZFHe2ZD7Z0bivPOmgi63yohWxWe9CdnG2AHqF6cbg
	oGe0yGXUKYZ3rUixVe65jTc+HQrV/jNh0a6lmiueo8sCSKpYJKzQt1Invx07Lq8WkgjeFxgDrh9
	5R9h2eKUecD518dO+Y7nv0XQM+7+Jsvl6xgZ4IJxVSzTo37Le/5Xw4U6LrffLfpPvTtdGfMqDMA
	3sYlV9JmY7IulmEYxVHTNWfzylGk5xy48eVIQ6uojOhNFuGEGSqx8ToTaZXc9NZizngZEqxRlkD
	VfdfG81P+xDesdToJV7DbpldmDFl54TMc0qgqBvqfQBxRYP+8IQ4i8OGQzBGZ8pKjEwUL60I5no
	n9Nr1/1LJdc3BQVWQGq2kdTnRtBqyUoQWxN+n/UXBm6pffABqjQeMGl0X9p+ngRaRlzoCg8lXZE
	2ztt1ybK75j1s3Q0HwWKRRr6vP92KT1jEJMpPccSV7HbsmKnidqVWoATT+wqmAmYTZ3QK5+DDYp
	sp26RHQBHJEvrsyyhzvKhmtEEMliCecB97eI0dg61vnk=
X-Received: by 2002:a05:701b:2810:b0:143:5cb4:30 with SMTP id a92af1059eb24-1b5567b3391mr10290148c88.3.1795444115370;
        Mon, 23 Nov 2026 06:28:35 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm28671326c88.10.2026.11.23.06.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:28:34 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] ARM: bcm: support more than two CPUs on BCMBCA
Date: Mon, 23 Nov 2026 22:28:25 +0800
Message-ID: <20261123142203.3860616-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series extends BCMBCA SMP bring-up to SoCs with more than two
cores, such as:
- triple-core BCM63178/BCM6855
- quad-core BCM47622/BCM6755

Tested on BCM6755, a quad-core Cortex-A7 BCMBCA SoC.

Ho Jie Feng (2):
  dt-bindings: arm: cpus: Require cpu-release-addr on bca-smp
    secondaries
  ARM: bcm: support more than two CPUs on BCMBCA

 .../devicetree/bindings/arm/cpus.yaml         |  6 +--
 arch/arm/mach-bcm/Makefile                    |  1 +
 arch/arm/mach-bcm/bcmbca_headsmp.S            | 26 +++++++++++
 arch/arm/mach-bcm/bcmbca_smp.h                |  9 ++++
 arch/arm/mach-bcm/board_bcmbca.c              | 46 +++++++++++++++----
 5 files changed, 76 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm/mach-bcm/bcmbca_headsmp.S
 create mode 100644 arch/arm/mach-bcm/bcmbca_smp.h


base-commit: 21f8531821461fa0c05e4605c01d8d56d28b514e
-- 
2.53.0

