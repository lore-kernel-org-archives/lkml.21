Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719119;
	b=4dX6cTOI8rEefdVCTsmJI0x/Kyv1oZ0AF3Llsxuch4nyfxf+elhZGaSSCeHI6OBNkQva
	 hOuBRq6vAgQSWDX8JiDDJrn3om+lwOJ3A+M2BkNlnMCioPbQVPj03RqBzxcizn+sD2zZI
	 n7J5128sTm5lCXBiDYBDheuc2FB9kTNnFtz2L0qEhcGWA2qW9qHm5NAoRIJ+K+K1yDioN
	 SLWUeOHB36jxh3PCv+24EmNpHhuQ8L4ROlkDhO0EREsM+X6aUjlbAulnZOXTj2FS1AGEv
	 rhRbS2tOA2EMLXIQQktcN07GNPw5dFlXq2JVq//5uuTIuczOZrJTzZPiMDbcNG7N19Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XMYQyEtwx5GngECoxaqxQHLv5tzhAgtmgz3LLMihPqo=;
	b=26CGAPbWoYECDtEQ3Xl5EhhajofuSqK2qqDkjumyxXRk7pD6+gjUvQE8xH7cC41cGmDb
	 Lwckb1svwG0O8OVgdAGgN0OjsCHDVP00IqVORLwsugQP2rmxCrEboRNhv6E50cvaX+KZK
	 8RW4O2UJNI34oqLrYIxfi+KCzdapVW3yr9m/dCOU+QgotJlnDfBfIU97T45ERW1oiQRgn
	 IQiDMF7tkYQnt4M82GZFzoLicAM3Nu8Lvw02JiwMwy0i9HiZjKunn3GFbMywelCF0v0iT
	 2Hd4bH54pC4kgHbr3bctgGP1FONd/CSYiEt7mphOlZD+93MyD4qtxVYekUJVRpNKa/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJYXIeGj;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1880D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1880D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJYXIeGj
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efe591a1f6so24605095ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719118; x=1796323918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMYQyEtwx5GngECoxaqxQHLv5tzhAgtmgz3LLMihPqo=;
        b=eJYXIeGjpHWGIP0+FDDlb/WL1DED4ZHVzuIZr2Ktc4hVEgvXoidtTh8yy5G50xvolD
         ZOT6n388P33hHVZXJRz74nZm99jpQ+r3a3/sJCDW+AnW8dYgTUerAEtL+aTOz02t1rrA
         5ZeRxtpprYoVNMUy/Oyu63ENViLvZo/pSjUkD03IFeI1ukFrq4B7MjRxsm2toS88yMNn
         NXfJpyeI1Kc+Q7fhBO1xwC1B7mk6Pdz0dM/AvdnEN2SO71hbH8qHnlpwJNvDcnxYAqy5
         HmMdn0BmWjBTBno0cL64EyKCjkgQl7GXgXh81B4V7ybQub/tSNIyPKwLubqXT3410elp
         66YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719118; x=1796323918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMYQyEtwx5GngECoxaqxQHLv5tzhAgtmgz3LLMihPqo=;
        b=k9gJTbjlmu8I8xBq4bUvPz6stQGOwXyEQrYh5Nj17zEWENoPPhmhejM59hMKlAIEoq
         AUyUj9UP4iikcN2qNh/5504coYLvMniD711vHU4mS+++Rt7o09G7jkebaWk2lNUnvDd6
         T/bPvsbjDJ0Vp0u3rd1bBdslc2g+62KnylrY1HtoqlY1pFFe0YX8JW5bB9h4iRgOvd86
         8ePhbDUiEg8YZFda1i/tHi5t5jG2cM8dZz44PYpMmyFD+Pu+4QtXZDfDKrql+psf125z
         WH/N3th5cvH6t82VeyKDjpLJ2TN/N6BTm0bBWsv4A43tvvqq5Bvjf4P3I0KKq1RAWfWn
         tKCA==
X-Forwarded-Encrypted: i=1; AL+hErHWrflmWUT7Z9ZajB2GIDnbTkIOOeK6pvwL+PuHXqiT+jCtnKZ4F5zd8JmsczGBmoMkL+8oXWcXTtj//N4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8npS/G10Q4LuwsIcimfjDuGpgJlW8lrYeLOZfwrLqieJEZw7+/
	6De8hKMM4nxsX/ytrA9Qp2jgcJ78hzgu11BiICKAnGtYSRlz1moSl9kp
X-Gm-Gg: AZFdTZeghPPo+rpqECWRagxdnxBvv+3c0ooC8PGtYZwrCgxdVqI5zuHkIat6K6TNIqz
	88H+DS7wzDXrzN4QIqiFHcANCvAwWC0Fwr+hDIBfwLAjfo4kXk7u+IIBfRDZ8VitD5w6K2Fe0ib
	R4hzE6mbBR3Fx45w2wfY6mlhs0XuN3Sjcz8++7krFJrfLS0JW4fzdoxabmY7mD7oK0VUAR4StTc
	PF8vi8Xd9IBZDKS9wnvMHt9tqN/OPIQPz4XTrWzCevLPgn5NkJG/LNSlM5+KPgzg4Nb1bO5m63c
	CjrH0gExQao/lVLF2+1nzDWase4jBw1cDTbWmwUr+gCFzDRKzYmlxft1xUzZ1vd5o0RbpF9/5GY
	dHkHjLYf+0mAMHB7Z9r3ebVYUFMqCmyB39sTw6Jqwh/ir+9lIqbiPVcmmBf1sDVmyYGIsZQjbrd
	8CgY61yOfaDmpB1YDCgrvOJ6WEOBMagksRxUWettiEew+bzfAip7GMXpL3zEr9EAI4MXd04xUIf
	Y1mdtZ66EvxQTPIoGAQKvviyDgCSHnHuEPas7L2PQK56plBPAv90ijnvuskQo/5Sml0q3B7qeeq
	RuznhFIj4Hz8ernn2iAUbnovZMauUrTEoTDEyqqMcLSBhfskKJAfwIYCrjQsXp91wnWUs6kWagG
	YPtLV5QBDDuPOz9jCgglUEWA=
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr207485285ad.7.1795719118446;
        Thu, 26 Nov 2026 10:51:58 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:57 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 7/7] MAINTAINERS: Update maintainer for goldfish PIC driver
Date: Thu, 26 Nov 2026 18:51:20 +0000
Message-ID: <20261126185120.3815699-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
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

Miodrag Dinic's email address bounces. Take over maintainership of the
goldfish PIC driver and change the status from Supported to Maintained.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f6c37e1dbee7..b69c1a334587 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2000,8 +2000,8 @@ F:	Documentation/netlink/specs/binder.yaml
 F:	drivers/android/
 
 ANDROID GOLDFISH PIC DRIVER
-M:	Miodrag Dinic <miodrag.dinic@mips.com>
-S:	Supported
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml
 F:	drivers/irqchip/irq-goldfish-pic.c
 F:	include/linux/irqchip/irq-goldfish-pic.h
-- 
2.56.1.839.g22a8290db9-goog

