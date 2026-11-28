Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795856807;
	b=PcRLS61/3tTerpqIjqOnz+3HHZ7/3l73vX5tfpf+qSJ7ViiR7MU6guNIM1uNv1vmFUjb
	 361uhEjimrfqKyzHFbxFrqqEDLb3k9Cawkr43t3wzrXoYgZ2ySh0RAVAP5JijVUghSVSw
	 8ycKXLQq2ZNZ2ZbYbhqAp8qszZJnhteNozMJdNefvkNTN79SxEgvVSXFYCfubb0aOjwt9
	 YQPUOzYewBKoJ+A2waHykW635THCig1aLeLYW85g7SQlX5y9NLpiu+pb7qZZGrLDoh8A8
	 9GhHYMwkn5zN5OPys9Twin6uuotcM8OF3zptijIHwzMEJcgJJZPzoXa/nUGVeZM2rfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=WeNW7HHZDMNZjp9xO0wJKcxcyNfK2ZxIx4hcZ1YxgZE=;
	b=YUXZAYptIOe++Iyhk1bz3y3RoH/YEPcT7dTb7w1NrSco8NCIgQ0cjWN6oH9hcGAeLBsu
	 yhniKWiI46AjK6/Psz5OD1MQf1HurK4Hw9J2/DPu3OeWkv2C53f91Bv7zV7mO8yMV5XoT
	 3B1YHcsHsR0KZFfjmN46Qa8/4FiiKsh+i2k4j+gouIShHzuvLVCTHhI2/54EpPq4DOZlo
	 l+My4rd9A5JsnBHe1cof4ZC2T/3THSxuNUdwqJjuuvGMIYzjl422XmexyLrG+/T+79DSv
	 o/P6VErAMcadL7LdiDZ6tgWVOR75ik7QIZt/ZAaYl8xx3yo53L1w7YC9GbuhcVsXW2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PPlTpPaP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6660C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PPlTpPaP
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-55650fe1f0dso4913160b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795856806; cv=none;
        d=google.com; s=arc-20260327;
        b=HNu/RCRMLyX6KG/hPWyu1TuGX4YiuHmLg23e/R+aZtfhWnhMPiiXezDzo0eR0zTPg3
         JNRIEO1IexIe593i8fmOU5p9Y+2J59RsLsYk2FlJAwKBZMHcFvpQbqyE6inLuCMSo5Bk
         GfDwdy2RULFGfAaHxKuT+6khf5fmvU0g46wNktJ3DjaUdoQjzgKeNXt/uGv2Qk6gMoL2
         qlXyyrn3R7GYkRCP9LbSOkHDGT03hf3te/s21+pKSwby1J9IBFXvzeDpvt7h3xnI/HfK
         4n76o1Zio6gRnnxqItGG1Jd15ezl+6uc3EdffgrkF6steCUDbwxyskGNCjyaV26nfZSU
         bBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WeNW7HHZDMNZjp9xO0wJKcxcyNfK2ZxIx4hcZ1YxgZE=;
        fh=n4+np+iqeuVAOCG9XCd9W3F4forFCz8161dfJt0pOkY=;
        b=H+CCtXW7TyNH9+IWcjASP9qRsK7rjeccwFuVqZThaGU03tv5xn3l2gVET/yY606Bf2
         2uAiJgfM+8JMFg1+ncL1ZdCZXmZKRwlbY/pzeuRmaOsFdEUwSKZGVQoXZA4gqTgS9qYf
         yqXeQklPgB6J558EWJllCrza2YBOFIkt/w1IA0awO6hzk8aic8yJk+80DblO6aHIqTgA
         rjveu1gxEDVfVuV0XWM5+wBqpFqITQZf3pq/aQoq+M9lxoCcJIPnJPeMVRmCpvLqTbVa
         3+2t1k1QyDfsXSStwbXIJn/5UTFw4y1WdEqYm9aUu308XmxxBEIGMRnZnJ5+5tpzP/C4
         ZL0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856806; x=1796461606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WeNW7HHZDMNZjp9xO0wJKcxcyNfK2ZxIx4hcZ1YxgZE=;
        b=PPlTpPaPIWQu4tt1WtQw8yZH4PClFRL6Q0EIXxBXP/PoEA1bNulENZbewQmvvowmZu
         FCNMQ/Ykof91GkF6tPUVXAFZktN0evjnRGI+D8l2wS2t3Y1k9CZ1twtQUvoz6pgfsfFv
         0e7IaVT6Whoy1YrWxpcJ3t7C/sLYhF4yiyb1Ob0CGwJy5Ak3ekZirOPp97R2kfC7a3/0
         C0FNe0ILdtHQWA0tqc/2yPbDoyRGjuTGThUD8vI3DVEgw9OO2pOoOjsUBOg9xDPgC0mo
         56NkGa7nFdYF/lN5+BfvDfgwlm3hUrVSAeW+jBSMXKHjxrc8MB2Gajt2iN+1qze6NjmP
         KuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856806; x=1796461606;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WeNW7HHZDMNZjp9xO0wJKcxcyNfK2ZxIx4hcZ1YxgZE=;
        b=H3kI+Gkw8mfYG4FBa3sbo2519Rc5+Hs+wVm++D2wrUkxxtrd9nZFcN5Ns+rHrnOTEP
         4uJSHoGj+qkGJ4B/6WjHVG8oNMSK31xOA5baZi5rN1VgcE0ugzRs/Dx/8xq4vkIIRFOf
         9pI+Wx5NQVbP5r1F3IPBBaDLXgUApEtNF+ng+7VnichkV36ph2SRD8dETuOyVW+Yor3N
         ANoC+kQjxy5mHeQB5y76SrBmW7jef9iQCH7aaStm3VlwXJsCEOGBp3epDR2erCFsn3OO
         F3derlVA92uZ6h1jTaTxTrVD6syOmrE+B6Fl0yd0F73VTMmD/ml10ohpDdUWUjX4gyf7
         Ww0A==
X-Forwarded-Encrypted: i=1; AL+hErEwADXqf2DOvSFf6Ot1qIkZLfJbAhhfl3LR1hB8SLHn5pCCY2MDYuuF37EJXy4EUSB3plWUTZNWgMzgsxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N7K30bzpOmxe4TcBLLi/JYfjN53uxA2L//8FITqIphov6wfUq
	wpCrpU1XOKDpT5hyiG+VgJoj09IHerKRLvThgClcEpZSOvkaEMm/9gxGhsxcxoH6eWTt2c+Oa8H
	mdZKiW/Mx9Hy1a39HtmDDAfh95kak7eU=
X-Gm-Gg: AZFdTZdkB5NA3lYq81PGqbQvsPbSgmiE1uQjgHJEcV5C1+DrZv8BwCUoCt4KGGfGbD+
	IhAB3HTWTduAMvb/hr8tUg2Tud4R8tRAka46EKJO2dNqSYMKPhlnn4C8U+qKsZmFrj7A8PYEZwj
	6WG/xjutnrkLLcqQ6xAvThMucoOmtnSBxxqyi2oUPSPPaWQUYj3QNzzrSY/C4W7E6QvlMcbsfgT
	KsjoRjU5KsOsRZZUFBBScfcZWWq5tVt3HYj6JgjJcIurzzGgyE9LcZgdQ8PXH+hOKp6xb5EOQvJ
	/MAQGaxFlCvM8xtmNShpvDabuF3U+2g+CgBRx3XrwJ1Qxwgq4R7o7m9K7BGqkkihMnipq2MVDyC
	TiOQ/CFwE96F2oX9i3UlcilHC3oWmTjNnjE6rrnjsk83z8CMnlHMtn2Hgbqcmqo06f54=
X-Received: by 2002:a05:6809:2c1:20b0:57e:99f8:c5b with SMTP id
 5614622812f47-57e99f80ec2mr2430299b6e.56.1795856806161; Sat, 28 Nov 2026
 01:06:46 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 28 Nov 2026 04:06:44 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: YoungJoon Lee <getfeus@gmail.com>
Date: Sat, 28 Nov 2026 04:06:44 -0500
X-Gm-Features: Aa3M54oGKOOmytkNW16rQjprz1_eWE6_MIuouxfbjdbj4pE_sQlnY9HzJlzXKtY
Message-ID: <CA+m4KrDv0-69kXyM-q3kK1O3dnbadWwDH=s+yH_7uEvVJsj2ow@mail.gmail.com>
Subject: [PATCH v2 0/2] platform: arm64: huawei-gaokun-ec: Fix short transfers
 and PAN ACK masks
To: mitltlatltl@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

These two fixes address short I2C transfers and PAN ACK mask
construction in the Huawei MateBook E Go EC driver.

Changes in v2:
- Patch 1 is unchanged.
- Patch 2 validates against the two physical connectors, as suggested
  by Pengyu Luo. The no-port-update sentinel still sends a zero mask.

An I2C stub and UBSan verified the empty ACK, both valid masks,
rejection of invalid indices without an I2C transfer, and short
transfer handling. The series builds as an arm64 Image and EC module.

OpenAI Codex assisted with source inspection, regression testing and
drafting.

Lee Youngjoon (2):
  platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
  platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index

 drivers/platform/arm64/huawei-gaokun-ec.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)


base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
-- 
2.53.0
