Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704509;
	b=u2XGFRR8h5sRm/+Cghx/e/oy1lBWOycBEN2sWyGv1VJpRJiJWxc+cinPYNmQWu3XAY9P
	 /kw6Akmq+xKnHrg1JdAhfE3ILPmQPSyxF+bWgxeK405yjOOr8HHv0YRhAAv7k8JS2CSb/
	 WEPlM+EN9+A0NYvNxCQuBwuBmz7PdiFva2//B+ZUG6ZjgxoO3xmY3ndR44uSx2Kl12qQV
	 Fpf9rmKt10eAQxEOC22O1s3oYMnEEDCFMKfzl/Z/Arcv4/BhieDDfRi5yJwugPU8kHkRq
	 E07ECpUkCWCrxAbqb7zRc4I0VHTpLFHGSmGqZeY7GJjxr8PnG2SVFWcCBfiz9YGCNXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=jhy28nJqOwkTlWwqv2ePwS51JDGbzTi5b1SrJscsPNk=;
	b=swYRTMXe9ZOUJ7HxzMmqgavIZEcUMW3vQq+L4dVRbwYPWsRzxDCKt7UXEeNRLsCwT42W
	 0QAfaCn6xB043xsQXTQQy0Mk0tx98ZlRerqVcsCn8nikFOY7p29WzT5JSEzjmzkXhP3Pe
	 DVrpCd5KJXJVjkF3E+IW+xA60BCoiDOAyi2tHRhDNVBmigMbavLFTv+J7O32iymLmqNzs
	 9Er/t/6FYBlJWCcyuMmV9kWzxDbg8SDxT5f06jESBQLbM7BOhwzrrNMXKxPbZ3qSUWn6a
	 ezcBSjwUb2vMG3YCs05g5URrnGbMckas8xhkeMtBInBElyvZvnguRSkfgyPdS4QibtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T1Zlyxcg;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59AC606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A59AC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T1Zlyxcg
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49465892f7bso5186570f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795704507; x=1796309307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhy28nJqOwkTlWwqv2ePwS51JDGbzTi5b1SrJscsPNk=;
        b=T1Zlyxcgh3fG88qC53UBR0M26m6a8F2ftH2fIb5Mpzvm+pvKAuqysuPdAvJaEcNJS3
         V+KxVzISm3RUOatNxDPlG6B6ikKcRjGXE8eui1O+jEcTkg+p9trP5NQJFCGks0hhMtYp
         ovwy99SJ2XPMbizkluKwf/h5JmGzZw2zOKk9x2HlCba1OVAcrHsdKuTNBbyDwDjLP2Xu
         uOXWCst70PyKsJGUT+Rxv9x1eQ8KtsjBDow1AYpyRreZ/b2EB+H4Ud5LTWdjjYMJaFvZ
         RyEe4ZCYSkHBqpwKGK6AFyB1iVXdQtKuevjSLw5S89O4V8kTiK+aZfLCidqb9+S4v1mB
         enlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704507; x=1796309307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhy28nJqOwkTlWwqv2ePwS51JDGbzTi5b1SrJscsPNk=;
        b=pI9QuuNUPmN1YPqmitXbQdPtOeRx64G9FOqw24f2ovm5p0L1lw3NHP8CI6SsFB8RKX
         S9HL2cKR4Xm2JyZSPCeE4ooCaarw8wMBGU5GWQNaIQ6jgJvVOnUBDc06rLavOa/ALWFR
         frJkq+jP7LVgzgz9GDqJpwcacEwnF8PG19/wTJXdKoyQKVG1EnluXpG8paYJLXDOW5sY
         IDAvA53NdzI4RxSUgQu0w1s12ZLjUGMrkSt3XWoTKyjGUNR528tfjvdN7WuW6/Gf+TvG
         2DKVSeppEi66shdqH6Zr82V2Xl9Deu8q+weysjZB+cmKW13wuLHE46iSCl7mnsouGGmg
         WJ3A==
X-Gm-Message-State: APuU4Z/2MMvdVrc6BnUc9uSP1kvKIkhIkpusBN0zjbjIQVpfZXftX5ag
	0ZUMD0eKTWwvza7qFSUU2foOWh1yyZpBl8OLbCPdSjyVZXfZcvVJKSYM0BqREcrmKos=
X-Gm-Gg: AZFdTZdcQCqIjtEmxuC0SI9+cPjH4tp7YlwQvGoY88zsxYlguBlxXP2exbgR/bO8xVz
	//xjW3Smc7mWeryDzlUWKz+vmoKF/u4vm3nbViaSoN0xTm+HoNvs3l01q7sDF7S0UAw1ZnpLEa7
	GJRGaGxbIOT9ZgQJf2UmTcnsKUaiVBYGOsHyvRZ9eWv5FE902FvRe7zzLxgn//0Yqg2A4gFaaT6
	Zzmf7KlNHvw3wZlPNCFXO6mtKORaqHFl/iZhYuh5LiQ2txdCflz0qm5j++GAna3UqTnExtTSxmK
	VkLd8ptB4KmS9j9DFCw0xmF514bxh79wLBlPttIdAyQSCRy7cwQUOlCMEG6DBX/2GaZhupJK4MK
	I9SUkJ24aIT6tXQi3fJeBbOBL6AZVNVDGw2eM6y5YlfZkKRpZTM1jmAt3ULdyqVIBLpZ1z2xK89
	1dAFU7p8KqNZtFSVGJmIpp8VzGAH+kXqZY5AZnJHxscIDn/NxFdsubRbgfF3IAiOJeSgSt7RNx1
	0m41bm50rTdnuU/3Pg5Woim9olGOKGlEqeijjtQT8n/OiLDCvpHLtO5tyD8G4y9U+3ahPdI5Vk9
	HReHidcxBtSJ5jTlQ9AXSOiZ+hwbFENN7FQTsLTP7i5aSq72l6g9MG+LlepF21kyXa9qO29OXRI
	KsCXY0VsfmznKWvYEwOVgi1FvHCodoBKGPfLi
X-Received: by 2002:a05:6000:2b93:b0:490:9fe2:6a39 with SMTP id ffacd0b85a97d-4abb1baac17mr29812496f8f.20.1795704507036;
        Thu, 26 Nov 2026 06:48:27 -0800 (PST)
Received: from localhost (p200300f65f19a904aae808b8a2e91502.dip0.t-ipconnect.de. [2003:f6:5f19:a904:aae8:8b8:a2e9:1502])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6a67fe48sm37528780f8f.23.2026.11.26.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:48:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 1/3] spmi: Don't limit device name matchin driver name on SPMI_NAME_SIZE chars
Date: Thu, 26 Nov 2026 15:48:11 +0100
Message-ID:  <da200883be074587458c102c170d88df5067a155.1795703292.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795703292.git.u.kleine-koenig@baylibre.com>
References: <cover.1795703292.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=791; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rVjAK+NZmtP/hMHBYxbhTV1bAdw47qsCHyxwXOkFa2w=; b=owGbwMvMwMXY3/A7olbonx/jabUkhmwOt7X/yk483J7fWsNsK+3pqXJ1g0mw1NuUz0Hx0wOsL aOmPeztZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAi97rZ/xeuOJKdEfq6jtuA 1f3G37kXUlSle5cbrDRWN3wdfbbp8OsG8zSbhpMmlyKLDm469sa26kiznLE8/+0J3bMNZn3NtHl exB3p8I+VcWPYT9500fb0eL8rPGwhUoy/lzEl9K88X8ozt+LhptOmm8/aVF9k2TBHofzTVqGW/y uUGL1L3GZeXRO4/FnWtgaz5Fsd3Ap7FhSoFK2JP8fpKFNnd5nz2pImO+OLCvOOdb9VKNlR/zlNr 8F+itgTJSN5nZ/KnWa2bo3WDyR5OnP5G1YVpTFUaZ2XWSmzxsbuStSGqAeliovese+038wveW7C JzmFyZ3bfGU3P5kfM6N94s165qIr+5n05vhw26bJFp8FAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Both device name and driver name are not limited to SPMI_NAME_SIZE
chars and both are always properly \0-terminated. So it doesn't make
sense to use strncmp() here. Use strcmp() instead.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/spmi/spmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index ec97f12046f5..6d6805a5ae69 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -64,8 +64,7 @@ static int spmi_device_match(struct device *dev, const struct device_driver *drv
 		return 1;
 
 	if (drv->name)
-		return strncmp(dev_name(dev), drv->name,
-			       SPMI_NAME_SIZE) == 0;
+		return strcmp(dev_name(dev), drv->name) == 0;
 
 	return 0;
 }
-- 
2.47.3

