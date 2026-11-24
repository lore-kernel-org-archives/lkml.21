Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483725;
	b=Aczy4OtYqrbQE4191BYQWUfSMVAbWeSo6eaGI5BQEB4J6UhcRTOzbauTBAQtr0IFvUAm
	 AweIWuB8UL3Q84mH7nmTcMmS9h5V8dMXPizV318WRbW8HjHxFJkb/GGWQyuIrv2ZF0vEC
	 NL3Pe/p5EFL3055MjOOQp3/oYQR9dwexYCqH0FixJHyIgsxOruxGYjxwj4VEeR6msrk9B
	 fMQLAryMu2bsYwMO10hj07xQ5TEVO2X8EUQLSmEM6HxGtnisfDVzh8XO/sfOwamwpvmWs
	 6S4hyxkViZ6JefW6hiZuyXlHdV1FPGGHfo+0t1omBoKiyuXcup2KlVCrn7e/1ZOSxTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1w/HFhKVIFry3YZ4gWPmqGE+Lmzlg0zffNXSei6jGjE=;
	b=Yxs6OA7MQagr5Luuf87nlCPq422dU6guiOe24tR//2UQGupbAfIQRfKYL2JiDlT88tJp
	 aJP35nFHpYSlR9KrDwO8YlxuVsDl34ZGRRk8JIE7NYYjQ5vj951anv/nPvhBW4K+GxjAx
	 NR329c+5F7wi61J2LAMkWtsgm1I82Tm6TsDaIIXtnqzLaxmUYaICSvibiL2rDJiOHfy4l
	 we7YEqiDOmJa3MiSHvDHdDSFANs5+/R7VDKSkMPaFaOfSaBVJSGUhiFsMVVujGqo2B6ef
	 zQu+8r1P2LJUztcsrySDInIVgE98e42h7Te8OPDZLJ0jr/bVKigurGa6UB48UhsiPFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrJvk7Rx;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8274606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8274606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrJvk7Rx
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1836747b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483724; x=1796088524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w/HFhKVIFry3YZ4gWPmqGE+Lmzlg0zffNXSei6jGjE=;
        b=rrJvk7RxSF+ASR6tC8nWJBnBvhZfEJMSOXXR+y5F1FvM5tXWP/ekOnFoVnIfwGXBkk
         CFqYLdA2FE/GvQ/4EF8JRIL5Dcop1MZobT+LNel+6lenlpD+b+me47oV/wGniWiv8qZo
         zB77q7Sopxzl/WMNtXNLCdvsceSHQyWbaYaNaSjc1/oUKbZMq88nbvSu3fUCrINEpqTI
         lAWqx2+b0qcHUMwtq38ppeXo99QuUcjYBVM23P+DMk2Ga/XnzjmdtxFQmPllZ03zrWrj
         ZA9yzE/gddItziRoPhv7NIwsSbaySsz4BF53NlSxizAdYmLgP1vZWD1SKIcanGSf3sg9
         nGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483724; x=1796088524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w/HFhKVIFry3YZ4gWPmqGE+Lmzlg0zffNXSei6jGjE=;
        b=vkh1g6+mVNZLFgRqBfNTbXzUVkfNRUwseCfgGYXNKB0RWoz1Y/3q5vurpLm43GzdPj
         GcxB1ti3TPhXLeO7OZTmkr7stpVn1ggDydFbFu/yC1m1B1jBC9j4HkDzdSyrZ8IRXr9Y
         6fxgv+0L3LJEXOpX49vO+K6s5hYDiL6GAcUdXM71iYKvi3Rbu7xrbsWXlvUXoACwrZ76
         9tkDwQfxJJbDHo+QLb+tsP3AKrdSHNPiFTJ7oFpwy1t9SFK6sfGpvfZ3AfGKvrY/DMLA
         0EdsdH0t/8TXq7sL/lSIjDAHcqik5nBRACRveR2jXKd7qLeadjSpzEJ21ZpZQAxkdrtF
         ER3Q==
X-Forwarded-Encrypted: i=1; AL+hErGptuREjSi80cXE0hhGaifBAmUWMleXy+KLbbodmNj1bNRfrhVucnYY1Gz1hKu7dW+khaYRhvP8yI1IqaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z++4UbcdBGAF9lJun8UBF5nQVS00vF5XYSP9epRkokYWnK1EMd1
	bQJocNGUhMnA/Z0qjLFPcTmBFh4sHTF02TpP36o55R36jDDxiJSOfvEG
X-Gm-Gg: AZFdTZfYfoZLm+RopeasW03ZpkW96YaL3e/C0t56PYpOKldKEPXGfbWJsEFizvL5HbM
	YA/qSMauojl73hT9vDozTN6eY7L0L3c2OmwlD14tvExFYu7X/5TPbqVnyXJtdDdn84QcmuAYFp1
	Q7YzGcq+EF4OtIpcYg1n3i6dlsVQnY+laJM3/5WdxXNkHkVcNo3Et6m8LifSV/maPQxnwevBAYj
	16TLOhJLuM7GQKZWefRf69JMZ8/6IOtxI4hVPhSo5WclVQ9pYV/ZB83MpfzTylaoEf1I+TJk7zu
	1juHXfnonTFBF8BpHyBYg0bPzLnb0QRqnO6P0Qe2iM48MyGLnZ/toeRuJggmobjou0dr0+oJ+zu
	aydHInS7NpeKx/7hr2kkRaU5wZXHBdMIaCS9PKEjDaXnL5E+jXNdQaGQ6NvmbrfTFGnRtgLdruo
	unRRAbl8pW2t2XwhTPtN8IEX99DgzXEGMicAYnshKNEVCHVfDdEUPUzAjHLkI4sCvu23k1Uxd9p
	meLnEP+TsOVLHUT3DaAfC+VMgCvLdW1RchBKPs+SSisIdps0dEgziitFkl8690oRlyjPn8LdyqU
	Vj9zx3sMpK2Oz8EMmRwrEjw1kv8t7fPxqdTK9yqybolIG5XbCp+QiiE=
X-Received: by 2002:a05:6a00:17a8:b0:8a0:76ea:36a2 with SMTP id d2e1a72fcca58-8c87d3223f6mr10929581b3a.54.1795483724096;
        Mon, 23 Nov 2026 17:28:44 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:43 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] MAINTAINERS: Add HiSilicon STB drivers entry
Date: Tue, 24 Nov 2026 09:27:38 +0800
Message-ID: <20261124012755.328774-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
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

Add a MAINTAINERS entry for the HiSilicon STB platform drivers, covering
the histb-wdt watchdog driver and the existing histb-rng hardware RNG
driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ac5128b756e..117823c25f2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12187,6 +12187,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 F:	drivers/mfd/hi6421-spmi-pmic.c
 
+HISILICON STB DRIVERS
+M:	David Yang <mmyangfl@gmail.com>
+S:	Maintained
+W:	https://github.com/histb-mainline
+F:	Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
+F:	drivers/char/hw_random/histb-rng.c
+F:	drivers/watchdog/histb_wdt.c
+
 HISILICON TRUE RANDOM NUMBER GENERATOR V2 SUPPORT
 M:	Weili Qian <qianweili@huawei.com>
 S:	Maintained
-- 
2.53.0

