Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175066;
	b=vg3IbVigmum6NhPN4GsfUbC9E2wvAEJPSVk8wgrU0AjNhQFN1+QSqebUg6E7kLsl2p7B
	 QDx3C4+KFmvtPUiRhcy0ANgpdcZUx3waKAMZ1LTRuoDVSvN9ZoParFyLfMnBgqb0cVPU/
	 TBOHxwshGsndMISjGW/FBAYaNOON7uZUJmLm7D7vl4AlAQBPIFhvv/UVS6u9HcxwBHP61
	 7E2sCCf/ia0dRhB+zWrExo9d0ozQe3lb6uWvOWeacRGQqqw6SotkhZWaBKkeanHYzgTG9
	 1JYWDDbVz2Y5U3qIlN9hpYEsfy6Dwdwpr7gM8+IAwVhZ1UsKYHkB8W8FHxhVPMMgfHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g6MTsOqU3k//pwl7FRMf2NFcyBzVHK48odAYYtmSl8k=;
	b=ihWVPdoKJm3PCTHZTzizpCayhu8Uq2VhplizaepDnN+0v5f3a7FeqBUnjQpRYgPAIA1W
	 1jYishJ3GDh5YXoL2FUxKDiU31REuhk+ZVQXyPfNAZskCqso9hwDAaJzaLfb418oZn/PM
	 4hvTf2XM/7XB5JrbTfAJZpK7Iz1Yx/pwELb15S5n9gmCM+3cSFWX5yS9XyTTCkRmC1VP6
	 6hkohtYxhzKywxo/lq2NUa7sHVbPqOXd+ZQRy5KzNp6WiQ9v2apwNywIEZlwKnp5wcyLz
	 K7oINsSnUwh95a+Ym4tiL+dpv3l/Ix5iZucOUA9EjvNv9XytKsgy16b4cM8PXLo8t4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ndNiefIw;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316ED60A2606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 316ED60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ndNiefIw
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so373880a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175065; x=1795779865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6MTsOqU3k//pwl7FRMf2NFcyBzVHK48odAYYtmSl8k=;
        b=ndNiefIwHhnp907qsXI0c9K/ItUD/rtZCnpw9HPezTyq8jq9GLkPm9uxOlNcHbxcul
         LlTJjkbxO4OpGaQScrAJErz38c+VpkeOqTH7amXGcAojUYJuiq9E9tr+nADTroZrB82K
         pI8JYhQvv79zua4bVtG/+6YPRynJJWlBn9ouDECSZZjTiKZJ4rf5z+nBQ5oToVBRpB6U
         WiI3ptR36EQlW9z8UNDUv4TA/8gu9z/xFPmmxlS2w3KKYs1tPcYGnlzI/CYnJRYjJl7s
         uCgv+kuFxwrtChrwqEkfrTvDqYczol1tNRaIRAt/5PUltGoB5ADxkCbaaTNiZnfhwD/l
         FegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175065; x=1795779865;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6MTsOqU3k//pwl7FRMf2NFcyBzVHK48odAYYtmSl8k=;
        b=lHFMhahy/hj3BHE4+7bHAOCil10rUeP6MonHuf1TRZScZ6MgW+96IQVcU1s5jW5Bo7
         p96MTn5KswB+AU0vhAqOwQwpvZkPs/I2Z7Mi0STWq/RZYvqMGz/ZQJ+LiqRA3wdv5bs0
         fWGppwQkYhgDW2/OdUnl7wPWKngy7VH5mMUFDNfQMN2RgtEk78EZsw5Z6rq9XCM16vEo
         oxRzNh0/jVvakGT9+OtUqp+FMYKScrZHwoeZjB3P6/Klk05nmI4j7/2gZWzgWKesgjmN
         YQka5GMG6uWg4C9CNPLV2gLM7iia6grX72YicrVVPevygg/qjEyst6cq6pkkZpV7G4+v
         lsuw==
X-Forwarded-Encrypted: i=1; AL+hErFp40httWoWuYNZ7i2+v5uOi7YsodMLMkqF6Q0bDy/eZiAAs6JbuouUsoBZGgO2nTlNnnCcAADM35u9/90=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ejU83UdnoCJyqI3R0L/8pZMC341tqaffQeh4qHfuL84ABKqz2
	FuwYuT6w+m03aCz/1ZjkdB/PR4c2zYw822Bz4hBeZhJdqJtxOkxFZYoRJrrakQAmQ64Rc9xmpN6
	1hdOqoWA=
X-Gm-Gg: AZFdTZd3QLUU/giEbv35n3DrvZWMYWIu9t3brZa1vDXkaNiAeJtvgrAy1fUwarHR89R
	MHjI8lJjV05R+WKgx94RV7LyTFtuGXaXn63xFTb5N03DtMU3a0EzEDlAP6+QrMzKWSTqtCop20f
	g7rIIIc6iRmARbLTxCptxuZy0Fg40WxL/SYMXu7sBoh1psWGiUu8CXdrl+egDRfXVfuJvZ2NSvJ
	zUe2KKsYgB+0z7EY6LyvNs/Fx96E5Mqn83sBiQbPQRr7RTkgTD0GOnoeaJDmIe7yNEqIvSeVkNW
	45aX5f7zdQNp5jtMYVmG9FR7lG4wA7Q80FD1mhmu6eUtwJceffU0T5ll2LBlynB7aR9wL6q2TIN
	JshFPAqnmQtusBcRofL6UuUCwv0xsg0elY6OnTmpyUoVywBU+IrtE5VmdcsSXF2dQeBkkTRXhdE
	WrcVZdUvsKjVyauZw/jJwoL7zvXVD8EFr2WA1wEUN76kOTTF8QF5/ciYvJlDvoeBLHo1ZfVjTyw
	cI9tIN8ybxvwcQ37UCUVHXi/+dd9FO3DiedDR8IP2qLtCg4u6jRcNvjju0Wa8iGAFhGhAO9U5TR
	DPg+49URZbHmt0a74kep5KE5aTHcHRg0j+FWliV3tA5qS1DT0jZGbQW0fWJ3HZSTSlU9lrfmNiA
	yvY0xJD70KjbIG1jZrej0ZY/nXJCi57sMq2h+
X-Received: by 2002:a17:90b:442d:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b41c93c22emr2584256a91.44.1795175065541;
        Fri, 20 Nov 2026 03:44:25 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm4355433a91.16.2026.11.20.03.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:24 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: bfa: bound the RSCN event list by the received frame length
Date: Fri, 20 Nov 2026 20:44:20 +0900
Message-ID: <20261120114420.3072586-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061513.962742-1-yhlee@isslab.korea.ac.kr>
References: <20261016061513.962742-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v5:
  https://lore.kernel.org/all/20261016155441.1607196-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
