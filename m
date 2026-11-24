Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543960;
	b=CUYxp32VVAjihkSzUxmG1Qb9qk3xhfzw5yNeMVYlMTU5THaKmDW3bKr8o4hfVqW6dmBu
	 /NToZUuyORZkDIU3KS1QpTUB6Q37cDNQU51k2sawisG9fLwY6tOpXGDgVmO0GLn5MBlev
	 cpCws4awqe7ZSU4Z2oIGqjuf3fydCpkEw5zbqSJx7yxHG3uEQ3jAF9oYibt1o7HJGU4VP
	 NaJA1EuCm0x22yW7pnliLwKO6y+/4D6EUzoV89y64C5aapC7KsgVt3iF82FmnsbFsfm8S
	 6ZwV1Ug7w7lODuBpd9y+bYeVJtI0DkdxykVXSoHRyMyHRdvO4NgbaDolThOmvZEocLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hmoMr/xIeQkn6KEQV65vhstYDu1X6WGPKu2yVoQvURA=;
	b=C/hwbgTPPS+QpBwp7JRcTJiDvzDQCN9lzzlkq4G2gg5MqBtA/KKbP9WFnrEiWlzAYVmC
	 +r/asqpv1pttSScKVUqFothH9exqXL9i+0YJLoE+VXIZLNLL2yvKry7aER8TF0v0OkvlY
	 6msFuexaS1xYNxr47GbsKid9E1clPgemL0iDaqyABq8xRIpwhwD5WilJK+tASquCXmOZN
	 50zslfSlZ5jIBn4x5RXAAxEu6IlpSGz069pvYwmZR6UGSz8Qm0kS3td6BIk1HU2GM4JxX
	 Yb8Q/ReyvRy9NNaaIltRRWrkPODqfY72NKOgnDNG2iqkP6NhXrVtQ7WQL8eLz8g7OEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDlKXeVY;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C729E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDlKXeVY
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so8128129c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795543959; x=1796148759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hmoMr/xIeQkn6KEQV65vhstYDu1X6WGPKu2yVoQvURA=;
        b=XDlKXeVYOZoodh2mRJeu5yhtflJc7zvQnwvqBsK4jbUuAbRlyxUFVs2QzrCpzkJE9Z
         MqkEADG6hncLx/+kuxoKK/erdsygYLsZ/hBU8VZGRhPoxsMVFQDMY7MiyvB65vE04jr4
         tNA3JDQkxnwMbQT34/LoR49RVrrWJwx3h6gkUXp1MqoDpj82vwmjV0h3MUOeHnQLCa7l
         ICQ0qT30pIlVwm7twfrgZOD+b1PKG12zyo8P56onpQ5mHOIfpvqBRJ8Xr1HTGvQdB1CK
         tnC64PrOQItUC5iz3bHS1Q1ZIrzoR009qlAxTAuPChQawZt2bCXEHTGkB29Zz2s+UX8p
         m4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543959; x=1796148759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmoMr/xIeQkn6KEQV65vhstYDu1X6WGPKu2yVoQvURA=;
        b=XukJaWasG2qMl5L5DSX0bJzLOFpa6Gsk6B7dt+37EGFneYbkAyjRxpog3KDAr2kgE1
         Bmhnvgl2XmmjNs2N6pBxbRlkijx1jjHIbIseoxhfrK5TS4d67Tvsjpz1aM5Wlw8x+IKt
         yn9UHKt00gkezEXUw9HtoAYugqG7JzyC1WhcbQLnClBWbv7/kDnQv0Z2bAR/sQxR4U/G
         R2vCrm9FsrZyNKquL+X+e88i/5Sn+O1g/WUahSGfiM/bFNLp5G1g/DCqn0dtwGvbik35
         1tL380YNjWloxJW7smOywm1rb6Avyg37YZLDSFQVnyxFf2XQZjbjcE5j9J+IepTYopyk
         pPog==
X-Forwarded-Encrypted: i=1; AL+hErGEzPnL4nSpWzWd+YXNs+LTo3ahZPKvA3r5KtgTQxUe5XqFXSu5shulcAwAeikALwVzk0sQYpiuiP/Ybm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hCqDrE2ITi+yhP8zNP19pcdpYJTFQTdb5uJf/17H5xCkDe7b5
	OT81SiTKs7FnbYFg+zZRsP/u87/RPNa3cALJPEJmyMvoWPyJcT0lV2MZ
X-Gm-Gg: AZFdTZeiI23Z5vAh03TpdDuc0CZOvMKs9O/q+5mOadQj3E5EWe2uK5pZbJNp4A9DL8p
	fSPqK5qAUTa8ZQ/Vwg4qs3y2XPJFYyhOArMzngo9ZT9wibvaQawXlXmMD2ocmVAHFCZUZ/IFdQe
	nLjyViEEwnqsv0OV1Gob5/+0PhBg/PQ211k4WJqdUFIW0oMFYkEbJrRP8IoKMl7kbmQ6Q7RsKDO
	/8IzWtb1O+A1MmIYTudplbdkwk6H/xJSQIxG9fF0yn1lhM0bWIQxeMTD4ANgZSxHSvgScbQ24X/
	qXSHlmlTdE3/BOCmq+HHQdmML6upZHTv0wsb6RXBSIdbhCTVhQhe2ecTYZoNwo3DB1+nkgSiK9T
	WW3t1ttV7eYB6cekuB1zmyo+8ns8fgXVKqkUpRTYvPDK9nL6dmABgVr8+XHPAbeZwOed4PeVeC1
	Zq0atCrasrmg6nXoNDsHGLkY02CQofPtFX3poDs62D1OgrjaBEoTynrqfCxxRPipf/2eVh+/CAO
	3iJryhawDvlBRWqoOCHoQKcTvJrhwAXy3jrcpmqseB6ouy6zKkzeKsb0Q3EJl2hnI0B/FZbLhj0
	LJD6k4hLPr1kSSGMElmKqAEQZp3GndIg4GpPeg==
X-Received: by 2002:a05:7022:5f18:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b55687ea53mr12696132c88.10.1795543958747;
        Tue, 24 Nov 2026 10:12:38 -0800 (PST)
Received: from user.. ([2405:201:c052:b00b:ce4a:5cb1:57cf:1361])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm42713885c88.7.2026.11.24.10.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:12:38 -0800 (PST)
From: pavankumaryalagada@gmail.com
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	elder@kernel.org,
	vireshk@kernel.org,
	esennesh@leaflabs.com,
	skhan@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH] staging: greybus: bootrom: use firmware size for debug output
Date: Tue, 24 Nov 2026 23:40:46 +0530
Message-ID: <20261124181046.44750-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

The firmware size is converted to little-endian byte order before
being stored in size_response->size. However, the debug message
prints size_response->size directly without converting it back
to CPU byte order.

Use bootrom->fw->size instead, which already contains the firmware
size in CPU byte order.

Fixes: fc41c2da44c5 ("greybus: firmware/bootrom: debug output from bootrom protocol")
Suggested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index fb1fbd3f7b99..4e225084851b 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -222,8 +222,8 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
 	size_response = op->response->payload;
 	size_response->size = cpu_to_le32(bootrom->fw->size);
 
-	dev_dbg(dev, "%s: firmware size %u bytes\n",
-		__func__, size_response->size);
+	dev_dbg(dev, "%s: firmware size %zu bytes\n",
+		__func__, bootrom->fw->size);
 
 unlock:
 	mutex_unlock(&bootrom->mutex);
-- 
2.43.0

