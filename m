Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998988;
	b=J7eL4dkoeUNfMeTXXLDi/QEQuze/sjFdo6YSd7jUJQRpchJJFLOiyf9NMH3hHM5iLVq4
	 uYFwKfhaIcpHDIb77PUEnh1soufdluv8c+tnK5RlVWF3n/TndMKWOl5OVc1NLhfPbGc7S
	 hodpkSgiyLw6L+HvQMVxTVNhEUCwH2N4FNnu8krv4EnI+3PlR5bKiXURtxMgwa/dYGzcs
	 4+J6o99uXsLx/Ejyxz3fyzZev4ffXa9IPpWQwr2XDMpuleuWHtmZOCCd2YJg4c7eb3NMx
	 GYStlGexl69dhQiIzB/gP2v0zRJ/tavZSswxjdYUN44Ajbamc71tTFFdPo/mM1gHJHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LIcWmceFZYgQietyQnWOcEmUtfnOG0g7rm/baVCxi6w=;
	b=Usr3iH2k89kmnYbZJLn0RmjvbE6PRf47AZ2hdwdre1GoPVus8Qn0S3B+PWFgY3WDhaDz
	 I0Fj0A4/05Ht6Tp6h1PErAFhzWcgL4a3gCHE7oWv4gLNMqoCwmpqdD6b2GJoQY6CUYDro
	 PjpK9DhPZDo7ATciAmoryWhH4pN02IQ4Rn4CcrdfJlI5CI/d0tpggbe5uAjPUQ3Q/2nEP
	 yjpI6p8nY4ve8Wt6ZjLEoWKZf5paecCN18eaqcy7jHRHvY4J2S7UmffG+LhX4684BGBv9
	 qtJpDyPl7RrWO+e0ae/x+s1dSU3SVXKhD2T3zrHQ6l2y75bZGZdEB5KoRA9rYKh8fIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxdHWTwH;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208A606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A208A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxdHWTwH
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-381f65e4e4bso1386012eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998987; x=1795603787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIcWmceFZYgQietyQnWOcEmUtfnOG0g7rm/baVCxi6w=;
        b=HxdHWTwHorAG2PIpdZLKc3N7ObMPHGYzpHCyX9EECRrJOGiaxqPRBf/D59uI26fi3M
         H7le+B+pvLdnU5bvJjbeYl6czjcErebJQPVTucJBkhLL/8MhXuYY+GCumBRXrEuZNmzj
         eK9zqoo8ciY0gymBrAEMJajGYsx0SHidLXDkEPBn+tu0GHkMypA02nIjmgdpJ9gMpU0/
         wbqh3Fms4eOTjOtK6G9s2nYky9I42q1yjWFwpLgFvEo/MGQr2dQS5sipAdL+S9vcFrbl
         UY4bGPqVpkzkuFY5Ao4Ie9RApz928FndTReiBwIYhk4Myv2oMB5qQ2s4R0IDqWB0yajr
         rDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998987; x=1795603787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIcWmceFZYgQietyQnWOcEmUtfnOG0g7rm/baVCxi6w=;
        b=RpCVLoqPgzI9VXjtfW9kDJTYv3e67dlhvlu3Mcm/6WvcqU3zSIM4Dyu4Z+Nu2/6+LE
         WIAtUSF2TJMJEPBikWmu21Om1FD5vCxS8Sv90g+omOc8ilnO7E3kELTYYhnTkXWEj3Hu
         GawdRvG2fNIPDW7EOLVzYJ8lm821pshdI1osSe0Zjv3G+zBikmdMZVuJu/caBEZjJwhx
         kZYLkYA0963maZa1HXCggakMMZnuqN3mLpZKa7AlJ1thQVWYaQw4w++cMJLgvD4i/POo
         l85iDG+by460HPcZ5ET7JCHfxPgEu/6LbnujctDtO50WaBn8+Z3T2FIO+qb3LNjawOIN
         qV+w==
X-Forwarded-Encrypted: i=1; AL+hErFq4/BWoOk4oP0cAKlJNKsZoplZMrywdkaJbeImJmEcTjxeHy0cW6q7V2DtZwVJbyEmV5D2cIEwLJ5Z4kM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e8G4PJPlGkZyfFaA/dxZZRoRfx1Sh51Q4fff4kTiWJsF2G0mt
	jOZ3BaT1/g9scMtaGM2xNV1i63LTqbD30ljmjkOJgMxQmKnPrOuO35UI
X-Gm-Gg: AZFdTZfBnckszb8uL847fErTkJVS2kXjvI8oNJLJ8dXSCzumeuM8MHhwDupyRjf24Rd
	/vn1sc/Hjyb6E3GsW7V3CG4OS2+jsYMRZSxYYTXr+gXbNO+l1SYRcrxrRLtLvtxXeesfG54ldQ6
	FQqN8QrZpPAEZxs1OPrLL1L0tyGIkOg0wlWJdRX/eZtE43LCePNEMTcghLd/nnLdhRpcuohMpJP
	AZCpUUPStC6fnJMiM0rNarvD9QE5o0KkROj+k0MMfxihpJ+sg+ic6c07sdCKSblzWJ3nbDfmLnp
	jI8y8BVyn9qgwAAgGTCGYFLTNgTrwHv8kICu+aKmXiZnpsz7RRJ6jUMj6YJoLT9EyQhn4dgUvyc
	DSgBVjvPawEqif/I931JB6RYFV6W7z6ghOpmimVu5n2kw1xAarrdua9au0HD6QwE6zSh1YU2MgZ
	EW7Nngk8nKiCCUujPr4h1LSONyJ+zEfSo8vBRmJ4KoEOLCwN5YNOjg1JWjNRVfxDVZUgJa4N1HZ
	O5kRuuHRzUkzzCII9z34FlKHt39CY58At72iKV9w2zeOW5XUW5W/WvHAlxP9qxWU4wbdIOUMymU
	Z9PZhBoy217Gyyi2hr0Iztsc0UuqSL8M
X-Received: by 2002:a05:7301:fc13:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-38280377e84mr2164257eec.16.1794998986480;
        Wed, 18 Nov 2026 02:49:46 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11729913eec.3.2026.11.18.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:49:45 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v2 1/3] i2c: spacemit: Avoid sleeping during bus reset in atomic context
Date: Wed, 18 Nov 2026 16:19:13 +0530
Message-ID: <20261118104935.1716-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
to wait after triggering a bus reset request. However, this function can
be invoked during atomic I2C transfers (such as power-off or restart
handlers running in atomic notifier chains), where sleeping is illegal.

Replace the sleep operation with the driver's internal helper,
spacemit_i2c_delay(), which conditionally uses udelay() when running in
an atomic context, avoiding "scheduling while atomic" bugs.

Fixes: 5dd75dac1b35 ("i2c: spacemit: introduce pio for k1")
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: https://lore.kernel.org/all/20261110061429.2036-1-linux.amoon@gmail.com/
	collected all te reviewed-by
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index ff32876e24d3..f4b21d7efaaf 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -332,7 +332,7 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
 		       i2c->base + SPACEMIT_IRCR);
 		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
-		usleep_range(20, 30);
+		spacemit_i2c_delay(i2c, 20);
 	}
 
 	/* check sda again here */

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.56.0

