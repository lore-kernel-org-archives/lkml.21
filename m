Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948716;
	b=CyMr6Jwp/5dUVGUe5VIeegR14rNqSNsSZY7v9cm5etemHwJnVRspNtI/R2YlC8YHGEit
	 Pi8Q1q0B8LEsJJqszzTez9/O6AjN7f9fXcpzUvrvrRh15Yf4FBpNvzOoVMxTAfANy1wXx
	 FU3kbpIMGgxO7ZZ5OC1VhQqwy0boOm0SuI8PPs9NZ1pZmiSSy3kQVQokiyQak6hnPZsIn
	 alOD9ZoDHh+3GP58buAAok/Dup2rhjN6PCdcSCh+Lc9v9wNoHrglS5oKYSFF0ibj9U7H0
	 hX1vpg1S1nNLULpvMsfk9uJjsWHsGNKiz7lWKeA1TKDa5sV+gCRq2oEewIsPIjDgoPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SjrwptKFm3Vihql0/6aiH7GcwGBfiFtHJrgvKlaPWhM=;
	b=YkdesNOTN40+SKjWzB27rFsw/PzqNmQ62dUUxLkYQ6tcSPQLegT+8WxbypAhQ2YVx+yS
	 akjFwOAYHYPur+hVwJV+GYBfpsJQLXiZc9EeF38C+MO8cLxe+CTXjfkwhTRqYCkJXRvIN
	 1uixFoEf5Xbu+d8wb7yQ3f234OK8hP73UDy1wPethhOKTWzfFi2AIs+fq61rszll6BYR6
	 sEDIGEFfhiLd6B7q4FLAeFKudS4GEbIhgdXtuh09S/g8nd2BhT7Nwgm6PQHi9aV4N/d3a
	 rhQk7+tR29dq3YozKrU5BRR7iled8EBfxo6kBy70kYQDe+Ul6CKN1gVr+synwLosIBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WTh6SgE8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F285606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F285606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WTh6SgE8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so3073685e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948714; x=1795553514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjrwptKFm3Vihql0/6aiH7GcwGBfiFtHJrgvKlaPWhM=;
        b=WTh6SgE8INjNLhZxD72Ir2ZQrCbWJrl2Ud+7gBHxAmFggvs8xzdlqYqoYbPTSGS8EP
         dv8vMZnA5j6njvlJGmKphAOGoBnwGYar6Gbghy/Mzg8XismGaqzHOmeYSuDkGFaKf9c6
         aaX+i22+YGPDLUwvC+58241Kl5QqxMDQ7BfERNYhNwFc0imXO/SaoN3iknkuGo44KmZh
         rT/kUINplpgVVt+jQzBTpAw+ZaTEKzOT8fAFbLWcyoTUddqUHgSyAXtVJf3Ulu4LZDh2
         WWmfzpbsRzdJiJS0CuYp+E4V5C5kq5mtfXp4/eoYGo2DIWC7agOuAG2KfRN7dURkSLlJ
         tvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948714; x=1795553514;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SjrwptKFm3Vihql0/6aiH7GcwGBfiFtHJrgvKlaPWhM=;
        b=WWQK5LWm7ZZiDQp1iVsrgWaQtpzEhdQnqb43dX5UfCJTdzkya9ll0aAGjwM8zGPkyU
         Ue605YrsSIGG4EypE/LlkIzUC23CEQq9AyhOBZHV8lUN4a5FpS+R5dYz7MCZ1kerhfDr
         1DbvJJUHru3nxJJGAUuJ4sB1mCRl8AnbKIXVLcIG4xP/ZKWiYM4bLj44y/5gdUTs5OSC
         hzGk2RYFkfUFcLNkxIS+9Nswu1OgEHxdP9J9sZYgb9sa4nsJe/V2Cw+3gPkwsADMlPAh
         hev0xVknNCIz5i+aETU8xNTMljUcncdaRlMPSEHD+6F3zcRXSeInItmRFzVoOaEupH6S
         ZGUw==
X-Forwarded-Encrypted: i=1; AL+hErFy1CmeHwWRCoaXwi4BW/+Q0ylkeiqGAAbvzo7WJqclEomgwZGgXCHj1RWb2RFR8sccDGFzG9ulosc+AIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z817st40lI4eskEwJSJ3roq0Pp0As/TVI2TlpVH1XKUXsFEEhIf
	z0TnEYzySm51OYuNR3H+Mt4VWqbZzd6nn8eQ/HzxnVMe6JMs3pSWSkgV
X-Gm-Gg: AYBFou0XJ41m/qRWy43ddBcWhBfhZBsc96mNjdcIMlpGCH7IPsO7yh+8pFdDwhfp2l1
	0U21nLMhCiz2aaoay+l4ey+p+bCAT0gU9czTk8rj0Cl42bGwMgKBn4kxkQpiZ69+h3wslDhbr/3
	CiW9XWw81CK4yOsGHaFMnuF+p0PYM8/s4sHed3DoxoP3nOIdq+dmcZm1/oT0tkDpynOoyaY+EL2
	ap1nJsmR2xh2EdDyqcZvPyiCENoIcfNbCdLTanIJf7PsRGLRXztuRDCYKXtWkM+KvPXgTAIBhum
	QdS9KyJ+6nxKl3mIqB6XtFwrZg8tq9eN4fwaJUD73E12hEfPjPPtR2M4kBp9dJDMBD0FoLZN5kS
	LUzT9F0qnu9PMufTbKlt1kObsdDA7flh6NI5f9f3WJQterfXfgatBHs2egad2OMUuDMAOiyO9Jl
	xSg99qlDfL2uL2dCO5qhjQd8Ojoy4pKf8KpeJ3SuoKRyWBXzR+z3Xu2P10kdHppRqhGGdc2K+79
	ZSLg7T8VycAGxUaHIEBaHG25K7eEbfqMCs0BP8euNY1flugexGx0UI1hMxmGXHrJ4Fe1FKwy7in
	zQ+kQpnp+aKFI/6/BQ4SV6+kCRU/56pr08SPsA882DG+rb8WmoHx7BjTRzloUpnuX0nh5z2nUjs
	mRWA9dDLvxQ==
X-Received: by 2002:a05:600c:3485:b0:4bb:741d:eba with SMTP id 5b1f17b1804b1-4bb7da1b79fmr7626115e9.13.1794948713842;
        Tue, 17 Nov 2026 12:51:53 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7840b05bsm136893465e9.7.2026.11.17.12.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:51:53 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH] hwmon: (ads7871) Add error handle from spi_setup()
Date: Tue, 17 Nov 2026 20:51:32 +0000
Message-ID: <20261117205132.141964-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The ads7871 probe() ignores the spi_setup() error return value
and it attempts to write on registers even if spi_setup() fails or not

This patch returns the setup error before accessing any registers.

AI was used for peer-review the patch.

Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/hwmon/ads7871.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 36297bc6d047..a1ffc35d9272 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -187,7 +187,9 @@ static int ads7871_probe(struct spi_device *spi)
 	/* Configure the SPI bus */
 	spi->mode = (SPI_MODE_0);
 	spi->bits_per_word = 8;
-	spi_setup(spi);
+	ret = spi_setup(spi);
+	if (ret)
+		return ret;
 
 	pdata = devm_kzalloc_obj(dev, *pdata);
 	if (!pdata)
-- 
2.56.1

