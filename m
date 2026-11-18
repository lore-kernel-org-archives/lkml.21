Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039658;
	b=zqcNRpvYZHG0okhHyf42bcXM9NX0xr9JTlwVBeF4qH2sjfGMpc280JLqfxh9jPbozLBf
	 aQYGqPfaBkfjGiqNhq8sPRcJ6ts2jaHEdryPmrShmn6OSw2g4On8E/6k2OH+5474N/UOc
	 n+FtT1cWCD2Rra/i9Fdb/xlE6DmyNV4VeX7gPSSHalXSuAEt0JgNZ2JsE+I99j/sBG8r+
	 5QHhPJM+enQB6+0IQm162GkvhtqyK/9dhYKXa7gPgqO6n77u9Z0JE+FaD/tXB09dncUHV
	 5rQFSRGT75bMdLS/O68Wsr/2l1ouFszr3BWDhNWkCRx2gK/tNzZkm1dwbNWH9zH5YLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o4fK+VM5phdV1u9FOggH5ztTAb+xziqUnUhmbDWQpUA=;
	b=5K0XwpI6Ik4oLuE8YHzFIuI80ZJmW4ahyW4cmAdXx1IP5u2VUr+5ZWXQdawbW6r38SCJ
	 kZPg46NKUGTzN7xd4OVmAbKdOtGt31JPVEotrmCx6mVkjukLNm3SczM+/g4l2AStvwa+E
	 XZ05V9uPPSQLBffSLtRib64wqOP14+Rvz98yooOskm8XP8zunExkU151pOcSxGwfhqzHY
	 36IRY47NxXM+C8JT3lkQlz8VqOjt44AqmEmsBF2Lbh+KhH5zcrikE7KRszOgggLSS04Gt
	 o7kEP1WclTuZ/TVYSoEhvtsp3osw82wlGXXT2rjBtVd5aDRw1WjiCdqbDRy8XzkOxZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EN2z6pVs;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7393E606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7393E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EN2z6pVs
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so982017f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039657; x=1795644457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4fK+VM5phdV1u9FOggH5ztTAb+xziqUnUhmbDWQpUA=;
        b=EN2z6pVssjLKuSvcSTfVUU2XsYZU8LdNBguLgEeRD9j2a/aINlZmtHfbXWvgT7lg+7
         MoE1yp0uo5BhaRDqcggD7DQ45VdGcyHYkPQXMCOuJ+w/wH2qElDnns9ZiS38mya3qofe
         b8tlJx4gzWkOoIqTRq7QiWClHh/wXl9Tztjo9X7lnJY2/S7FJ9CyhrspAEHT9JShB41u
         eWHc7bCsBVbIE2blmjonPlFHR879iOblH6DtCVnPugGoygrPGc0D2CzOWtDHtHRzG/cC
         is0nSXm+P82RkleF5GY3Lp5qCaUKcp/NEzwYN6d71/64ZsVzY25LCHe60XqZHC4GVXrI
         mLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039657; x=1795644457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4fK+VM5phdV1u9FOggH5ztTAb+xziqUnUhmbDWQpUA=;
        b=1dPBhmCMhFqYpifSXqExpmFLPtBjinZgwZbVcAw0F0KjM/FFxQV4/WAUJK+ZwcU8ie
         GIWpmL3f/aVbMBwt1xl6m+NbdV0w46fcXkAajjzUN1RL8oFcw6riSZqRW4MGlXbFUWak
         oEY4OV1rOweKVjVK//AFkU2AbMILn9tbcmnhjNw2KmfPO8idrSsTutS9y17KEgF0WKVH
         Tb3Gvm4t9T+gNb1pawNTyliS615zOHTWuA1XRWnrmNhkP/YIwQf1bKm7djIrCs4nVcWw
         YmNQfzPE9gwOZKWVtz+zxE6SBvrZ9sUK+oSJIlUp+Lyiy5r20uQENR8p0cqEt5waGQnA
         CxaQ==
X-Forwarded-Encrypted: i=1; AL+hErEvTpsyLFhaZDuvUjW6FQakkO9U2NudqVbsyXGR4Df8FyZNHfFX/LHzHOB352kTJyZPcyVNxFO+/DWFAgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9/rZWqCcLKjZrtrYg9oekU6xj25rXOxelobPJ07Iw+iWWsLM7
	MgDiZbnmxyhOZtqDwBnfhe9K4FiPOqCxuC55OxBKfQIlbSor+ikVMadn
X-Gm-Gg: AZFdTZctfJpERWr0crqa6Nn9oKtqOJZOna21pq3WjyOcKYcnnC1KyMdm6x0HLijPZah
	Gc7nrhGAI79KTGET27d286qJkY4sbn3iJBxPkVcnIo7t9lDA98or2gesXsLtZHWo+Q8UK9NEaNX
	prv1BRlJ94PAQpETfUknJVm2dXGliYM3haLtyyZJHyqm7zNLFYC6btoG0PNFpcCiEnzDTlU3yIB
	xwxPLgSSuRFhs03UO5K8WPLxYlJksR0i1y+BtrgLShVDv4PBMLE0Bu7CKjpQcYtZZBsXtpJ8TUe
	E2OoN4GUkCxq8mGShihyWKdkUfmo1Dhcoc6/JSM6WHq8OZWolo2ifiWv+r7aoIDD5119Ch+Bb96
	LkwFt7oAdyAEzgayCVpW1UlvGPwy+CoSN9R15Zyo09IYcDnmYIlIbHlGYJdGV6qhtTWf4AtuOAK
	v0l7Q1+yXovljrTtPn0W7xzyoDPLjfDNtarZXYgi3LRyvQxInBpPrFSWi6C/wWHdmJ76K7lU3W0
	zc+7dfQXyhPXBmEYdlfVg88RyIXUoXxSRbql7m+zEet56CRzvr8D+puvkEIITq6ZpxWWGeS67TM
	m+7BNqi+VLB7zFliCPIQignLKkFuoU+BbfZaR2hGxE96bhoNQyH+zaQPw9U+K82EAkmjbnZb
X-Received: by 2002:a05:6000:4703:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4a64f353379mr7122654f8f.5.1795039656687;
        Wed, 18 Nov 2026 14:07:36 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm7541073f8f.24.2026.11.18.14.07.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 14:07:36 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>
Subject: [PATCH 0/3] media: cxd2880: three small fixes
Date: Wed, 18 Nov 2026 22:07:29 +0000
Message-ID: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
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
Content-Transfer-Encoding: 8bit

Three independent fixes for the CXD2880 driver, found while running
Raspberry Pi TV HATs (one and two tuners per Pi) with an out-of-tree
build of the driver. Each patch stands on its own and can be applied
separately.

1/3 removes a function-local static in cxd2880_attach() that is shared
    by all CXD2880 devices in the system.
2/3 keeps the TS reader thread alive until kthread_stop(), avoiding a
    use-after-free when an SPI command fails. Cc: stable.
3/3 lowers the per-tune and pre-lock DVB-T2 messages from info to debug.

They are independent of the carrier offset fix sent earlier:
https://lore.kernel.org/linux-media/20261118195135.92439-1-enricolorenzoni59@gmail.com/

The patches and changelogs were prepared with the help of an AI coding
assistant (Anthropic Claude); I have reviewed them. What was tested and
what could not be is described in each patch.

Enrico Lorenzoni (3):
  media: cxd2880: do not keep the attach state in a static variable
  media: cxd2880-spi: keep the TS thread alive until kthread_stop()
  media: cxd2880: lower routine tune and L1 messages to debug level

 .../media/dvb-frontends/cxd2880/cxd2880_top.c  | 18 +++++++++---------
 drivers/media/spi/cxd2880-spi.c                |  9 ++++-----
 2 files changed, 13 insertions(+), 14 deletions(-)


base-commit: aa0f4c41d4870a18e65772a1817af16427200371
-- 
2.47.3

