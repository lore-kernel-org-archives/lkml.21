Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818780;
	b=AYWFQV3CTZsyBq+APqxF6QGPtu8IbH1fBQt6WxK8mmTwlfA3wQt4V6Se4eDG1qinEoYN
	 GtJSm3wiD/VkhaWQ2a593GQotruraMWbPajl/3iyfeMru4MOdNXTYKXQJwi1MINyniZrp
	 SRc5QnHpgx6+7GPD4AVXuKWUWUbK+bOg46Zfk8u8EFOf6pPIQH6dHCadVd+yNZ7blYiwF
	 gYWKLkN0l7MxAuUVT4oPIjHJYRL7XytjCZ9/Y/BBi7KCAww5toCqq1OSXtLnRyWw7mEDX
	 UG+x2qJGbPPRXBTSOSWzXqcM/Khtty65UQ2htj0X2xmwWHrpGny7ncaP9fH2BJ7Bn7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TInPcOiZ4I4+9DBJQQCS2zeJrPMFR72h+olev8lti9k=;
	b=pWz2BdsUdF0b+xdlUOUdRyVeRl4f2Aq1WD/SmREmMytpkRev21FReI1+DQuJvQrgz+sB
	 3N4o05fhXY0Eu/bDLfvFf0Dtnu52o41ljN6kauZuLxcEzQmB3yo4i+FKvfCIhVM8t2Nkk
	 i497huTQZXCQKT1uPnZC6tPnSBbFTOzXPjUarXrSOlrllK6hSHvtBlSpuDDD4MOckcF1/
	 C4KEECn7iJFhf4Zgf8AKIbBEcaI+cwlEpBStSqigD3CPpavUUzdSetIkJsKJcmAFL7dSt
	 SZEC9WIfvEEADJVDS+E2F51GG0J2/gTXsPdFMbE2GjiN/8VzU6Yijaf7vm7VLlQ6XGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVAQIjl0;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428A8606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428A8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVAQIjl0
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492f0a1b685so6132304f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818779; x=1796423579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TInPcOiZ4I4+9DBJQQCS2zeJrPMFR72h+olev8lti9k=;
        b=iVAQIjl00Fz2PZxLYDy38wZ02cyQvqaIXPLXjZcdKiCpJX6L0ioSlDpNVvlNGMhjk4
         jOJEakan5Xrt82wON/W9DAZuqFdhC4/g9z1/AC1/Ee2TnooVnhYZ/BSJnoKyDKe0Rsci
         8np+SL8iE6BJi2x7WLzQod+xLixXTqtcXY9xy4ra4YF8xNVReMyDmCcodPj1HhbdTAwU
         75gaz3QPu1WR1BtvBG36giJgCCG3EydQ5/Cf0psQylxUh+vpEEO6ioQGJ7hpEGUokq4N
         5fHm+FygwkvMnJAOME0KHS7UbTJMQbKtDrn7/SlrrAUcACSR9fy/k5gU29Fqp6+Ou5Ac
         olhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818779; x=1796423579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TInPcOiZ4I4+9DBJQQCS2zeJrPMFR72h+olev8lti9k=;
        b=UUgyAGXgIzpKbwnldoJDdSrVdmyo278tMLhvKcFWjtIZa2FAS1J6v2+1V/i2F6K1uU
         C51C86FnewREW/6OAZ3Sd/+Dj2KTIQjBtaQjmJAFa+wovB+GfDve24RR+NUoSWvJXT89
         0/xDVmmPG39P+058qPY3HtMz3jFPvjmripJryoe2I07jxI9q/+ogW545Dn1ah0gy7Qhy
         p1QERcvsm+1HuStc1zqZUEwYAPJUT8+9n26gH2UuXZ+H1fIOlTrMENaHzKpTSfjYb1kI
         HalG6wSila5orT8/501orsskBd2BvfZCJfFl6F30ZTBGU7ePklxdQJc89rDPuy6aOE5+
         vTGg==
X-Forwarded-Encrypted: i=1; AL+hErEXQ1RHfbMCeMxoC9nFdSupYXmuqrOGnEwBkou6pFwoXwPY9dWueKSa58qtoryJ8LNxLzBwUu1tnDNf+SA=@vger.kernel.org
X-Gm-Message-State: APuU4Z88psgGbRVYxAsNuL74RRLYovB0xnNZle5mTB1iJhdMhXVHo9pi
	reDi9BiOpz8LyLpbso4x1uNat+iazub4IFvWXGwgKGOi9HlQYhRKgEHs
X-Gm-Gg: AZFdTZf/Mz28eSfgvEAzkwN9FGoNajrx7KdxMES3hICIvG6JNLFadxAHsyOos87SiFA
	Weo5BS+vUFRt//DcsCUAfCrJwFtRT2IXustnrDKmGYsm5tg+xpRCsBt3opOxJ7MUJOR9oI0medb
	gf8PJSYZoESIKXItNRtBLOg7WR8ZLL4mqrFIjv/6OxR42zvon2PzjTeNgYLuA+4AxTTejsrceJu
	f8osWumOwPe5jEz+SYH6aKjYcYTPomF0l/D35VNIPfh/4LkcGwepcgXuZc/ANGBUivA0w4F56e+
	6fsFYbNPb4/QK38fUPGoygS6UhmRRcjxB76YvHLHKiebtn4n/GF90xBNybp36ofdseivqsR3vXk
	85RUs+hy7lR08FmML/erEyvbt/1qdx4o9xNPYzVEn6v/6ESwYVxgGqaKp/pzAHQAkPGzpKfywTv
	8lIdX8pIX6gUYUHzGxYeVAxpQxajuykEcx3yBNlxvQh0zs+Q0NKCFN/Vt/2KDFcnckHYg67/hoa
	rrSijpNGA2JNYj6VpaFxJjQR6njBRV7Rjcf7kokp30kD2TDZn1BjQjSgFsoXkrxkA6y+qhSnUs+
	KUBsuXIwxcmNQwWayoLjfvrvj9Xq8QQ6
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr49754885f8f.53.1795818778612;
        Fri, 27 Nov 2026 14:32:58 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm50430285f8f.20.2026.11.27.14.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:32:56 -0800 (PST)
From: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Date: Sat, 28 Nov 2026 01:32:53 +0300
Subject: [PATCH v2 1/3] dt-bindings: power: supply:
 samsung,s2mu005-fuel-gauge: add S2MU106
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261128-s2mu106-fg-v2-1-2c3142e05aaf@gmail.com>
References: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
In-Reply-To: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
X-Mailer: b4 0.16.0

The fuel gauge in the Samsung S2MU106 PMIC has the same direct voltage,
current and state-of-charge registers as the S2MU005 one, but lacks the
MONOUT averaging registers, so it is not fully compatible. Add its own
compatible.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
index 05e420316a2..74dbfcacdbd 100644
--- a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
+++ b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - samsung,s2mu005-fuel-gauge
+      - samsung,s2mu106-fuel-gauge
 
   reg:
     maxItems: 1

-- 
2.53.0

