Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729478;
	b=CNkoOzLw02x0rIh0avtTXgg3igfPZ92ZKooLh492vpVcJpOQk4FWOZgSVA2rmXO/jSZf
	 AZGWGaP2Jw4K4jGckf4ylYatGYF3+o0JsnQhxQRCg7/RIeljLBe3UStaHFeweL+oHqIUd
	 FssOvtBm4vKlnCeDRlknsrpoak+7JFl6HOlk3fKZtGvDKjFV1tybFAWXAeCLEzV5e9y6m
	 31+mZsA+J02XT0PWSvlx7tW4NtYiP77FXPxNIZvej1pTIRW55K5ppZDgS9Iwx4AB/bPwC
	 s0D24o6XTsD4gV9o0WMvvnR1WJLAkaEbojQf7leIOstbbCBuzTHF8j/xRSC0/vWEIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qsM5RJY4ssSc6XEZK9/kRUVmdgCpjgjWKidI/l+cEZA=;
	b=MyAuHwYHsWsN52Ks+DcGPu1U1ToVWE+/onIrzc2V+8KW3+yBv4YHDLICxCUdbTq5koL2
	 sRG7LpsG0zqXiMTfWZAGTSigEUZNRrd6/pbOehLM8acLdn54mEhs4ztBCNAOCyBLU24Vi
	 lMHZ1T/ll6UXA7HekPFUvy/BtTCx8h7BfOQ0MJZ3iW0zbtFPBWxflGj1zfw5OvjreMpxN
	 rGo0/RpwkgFn7R6/Mv8KUXABLiYF5c9/kpq0Mz/eYXIkBJAlXp/Ji7hz2d8Qt2uogLjzJ
	 Mi2IHeXQrGFdwy8xFDtPLuuAJjI2VBUO2+TL11cnL8uqUSNoD4+k4gvGsfvyxPz31Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+89tWrj;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DB2606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14DB2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+89tWrj
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso3043317a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729477; x=1796334277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsM5RJY4ssSc6XEZK9/kRUVmdgCpjgjWKidI/l+cEZA=;
        b=L+89tWrjVUOYzEBM2CqDkJbR5+pFAJamBwDNctm7dEk42pNZiH8VAzRW4iyCSIGUuU
         lQWdTCzMAWO3o4eqQkY4Itu9kHrX9un0aj6zfVpaDNbCsfBvil+62Jsl+CUn4ZrVwn5f
         Sa9NW8Y5s6ym8AOtAgPCztni1jJ6VhZN8D+SX7+U+QusGeBpiez0C/3aOMgylc6kMOwt
         Sg1jZ1K4tmWh1DMNJX+cDsTkz01dkDirZNlquuHaPvv6Z3i30Go4ATqjxekm8p2O2LaO
         +75dRYD+rHcXWLj1jlbwwao8FwAeQP02m2AvsiX0Cwz6upAIiFpfVYAD/a3dsuBdUf6A
         4VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729477; x=1796334277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsM5RJY4ssSc6XEZK9/kRUVmdgCpjgjWKidI/l+cEZA=;
        b=WMMEQyFCWjGKN60d+4kQX04WKimh0eZ1ciJAZgsYm++ADNeag5dtkcH7sRVU+1bfZP
         PMBOFjmdW/YIIEXnql1qxmcQj8AeTFLBSDULK7Z0ZICTd9wLjBfM+GZmLRJ7VmuBM3Kx
         oFwF4AUSocEyRXB9CdcLLsF6gPtbI3fNLn8keHWdV0LLBnEGutMX2+6iHuHcxzrkyYT0
         Pqiy3drWP6kmr21x37ccJLDl1bdR9KN61TC5ZCO0qT8MqzYUnPF3MulrxXz/1Djc85yL
         HQTUQUVaeSBfEq9Vw2yZwrrwyzPTnVHLkxXxTRyjc5+v4JtkSbr+cXUtGw96yYD+AIYP
         vetw==
X-Forwarded-Encrypted: i=1; AL+hErET/+urQLs5KANZ+MVfChfah/z1wQXLHL5Q84yPvkXua9Z+LsHngqclc3ErxGwGL2obo8Fno2ZIERTJsxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DS7F/tHX4OtYYU0HgkDwAtZulY51YiK7GZ1odEfvalZhnACtn
	I2JgLdCcTa34ooWdTeG7WQnxt1K1AvUp53qulIO3tt/oHBSL+GbKP0Ed
X-Gm-Gg: AZFdTZfR0QUHKH2rpFjwoUFhUwZiuCy6WHt7TugYRr+kiAxns10t0eWjnPfNdmHTz3g
	I0jDInKz5wTYTBbgHZVC/CHSlDlfV0qHx9z7CSLpxl6IS6J6wzkiPcCib7xL41kJqIJs99DU6h+
	jEQw8upmzjUqU/rNrd+3GiZTwf2T0KyujzgZJW4SGWzZ4Ka6Yr5OKsrO7uBxyJ9kLzTTAMNS64E
	qqIOep0mwiWz89TY4w+6aYKlcZAE+Ubi7u5kYj3ewJ0SJw6XluRMWiUyYjCZ3TsxtYkdDuXpdcD
	hlsglQ354SSS0FHdFU2CIGZRGeYj3Tw6umhcy47GxwtSyuWm/eb+CC0lQY76I0RhAuthl/3D48u
	Ly/jy+EYClj5hNC09WxR7hCP0YA/HpxyYgmcs7KTwF8RwjmSw7j68VUwqCHksEsLFeycAzuzFr9
	S2xXBs3uXa9BGL3wTWfDFAYZ/UkqngptvdWoFfCy8biPAEPNEekvtU+KGilkDZLCJCtLDkgaSjN
	7y7hJ5JlJGhSSXKMvCBcSN5B1pihVnQQLacBIRLYpZWMQNhnozTQnqbXES8RaxltqFwcCAw4i4w
	I+HSQ6PnxVs7aWWH8+NhOIn4Db87OJES7A3zeAtar7SSdNpM6A==
X-Received: by 2002:a17:90b:2e47:b0:3b4:eb3:a34e with SMTP id 98e67ed59e1d1-3b41c8fe15emr19804307a91.21.1795729477360;
        Thu, 26 Nov 2026 13:44:37 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm36176538a91.3.2026.11.26.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:37 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 1/4] ata: pata_arasan_cf: add missing newline to warning
Date: Thu, 26 Nov 2026 15:44:30 -0600
Message-ID: <20261126214433.38317-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.38317-1-artem122novak@gmail.com>
References: <20261126214433.38317-1-artem122novak@gmail.com>
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

Terminate the clock-rate failure warning with a newline so that
subsequent kernel messages are properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/ata/pata_arasan_cf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 12f1324461d1..0b3e4e63b66d 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -318,7 +318,7 @@ static int cf_init(struct arasan_cf_dev *acdev)
 
 	ret = clk_set_rate(acdev->clk, 166000000);
 	if (ret) {
-		dev_warn(acdev->host->dev, "clock set rate failed");
+		dev_warn(acdev->host->dev, "clock set rate failed\n");
 		clk_disable_unprepare(acdev->clk);
 		return ret;
 	}
-- 
2.56.1

