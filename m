Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448393;
	b=r5HVBOmSB07UcJVzfii6s1Za7EtjfQDkzPo57uDT+epDsQGyjH+RwfclY3Y0gOEoWoBz
	 uyM6ynEVeEmjlJyeLHQctOuKfrtOHd5IxAZtf+3meIMTW/C+ry4BeAWfGf5HnhB0m5vc5
	 vQypRHJV9qJMG9gdPg2QqyaWP18oa6PVb1Ijj8c7Kd2I7t0A6djL7bEoLYc9rIGGZeYGF
	 3FipMG/2IKPbZdaA0j7PkWCIAFhSfJc1qnjCKiSDzYhCfMWU2QheXbLZAmGv02n0Us39c
	 Jv04fupbAbIzclM2zqn+HL8Qx3CxYkprAd103FTFoVNT/Bmdy+FQyA76drgxi4qGNAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rnFtEm3Izxz1UaZJoPtPCYt5FC5hB7rMwqRB7aaszpY=;
	b=EKimn3jpQb7LbieP/fbEQwa4RmJsu5wA09EnbKswi41fIupBRoyCrkkTNpZddOjI2qFS
	 QBlp1igbb2JOxurs/SwoMO6oobjN6yUMbCpqbSKuuCzEiAJp+4KvexRRcX2Vz/bOKV20R
	 B9AnYo249uF96Jxvg3XP0hmZbfKjtWN/tQEh+iN0mFecX+KvHT40/lKBJbagQz/pG8WDH
	 sS7VAor2Gq/1rlQ0JQEm8yFba0qBQuHWF1Wxq5ADJHzEUtppifWObCSyCKIlr2NOeHizp
	 j/QW+KBLR0bqK+pgTm1JlNrPn8ACK6vzigBE4MEF7hIY8m3vnHrCSz5XFed7NWPvsqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ok5SYxjV;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253B606A6BE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B253B606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ok5SYxjV
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so5753024c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448392; x=1796053192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnFtEm3Izxz1UaZJoPtPCYt5FC5hB7rMwqRB7aaszpY=;
        b=ok5SYxjV6o8dq6DuX0zneZHfwHZjH8ALj/ltadv9dglVJX4zrQMhi1d+nSS6DDhxKq
         FiXhxmJtgAQRaYKPyA3S3/vc9fmfFKvrMQF8ZDTbcpX14Gxzmzl+pKbG5oGcDtlj7vQ5
         glScRIbIaP8sQlBqqtx39E6AUVB0oZ0h9+vB9tdFGyECbO45sKHKrZOFewP2P8s2b96r
         QVb5JNQ2KETNfUUaUqkkGJEQB4AH9bOyj8w7PKaO7SVdvFglONOycMO3FBivnLhl5oUm
         1lzYcACT1q76kH4Is+Oo8xpJbxKjTlGvHQqM0huRD7IlQmIXn6PGIEoDDXXKPETVHjTJ
         MY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448392; x=1796053192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnFtEm3Izxz1UaZJoPtPCYt5FC5hB7rMwqRB7aaszpY=;
        b=InRgDCMz07aGsbOvRsKH7eBEl949UFkbDnpxOIo15HUVhJU9r7Rsfdhr45hhZ/ejHF
         S1jwUTAu/aanIC8LLwF0KhBvmDf2zpqvvf7E4ig33IEyMie0B0r5w6XAie3HSE3ZJ7gr
         5A71MlRJk6IbDMrvysgXreepT6RLJ6tGnm6qcpiUH2XLiDOf4jbN7Qg/QE1F4dQ+x5TY
         xrzKwe5dhUUEzb9R/kORauAzIYp5GwFviEhRFwvc7NGebIdD+xt0HNfJfPOfgpXjdhhy
         3CQYztt1SCKdtKggMqZQaClxNeI/bU8VlkPo2uTnjlwoir9tF893je2Iun3mgKSY6a7j
         1KwQ==
X-Forwarded-Encrypted: i=1; AL+hErHSJmda9VVRRrh12u6VGin4wnm0IMfPSw67WhNAwcZznE6+T8YsvE2u3UfLktHzWI28hiKgOF8j9euTiao=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y0duBYVczyRNa1zjxuYU/nRB6clJPndCFc0EXoqaDM06sqZ4m
	r52RD/IFM4mmNRZAcO97PzPBzWyb6ImSReB5ZSZGA2SqpUZXAB4+F5mk
X-Gm-Gg: AZFdTZdSwYXjykj+Qt/EpDbyIoVvSzEYdPK/EyEKLaFFts9lfij4nqCE3ZYT31XmAMa
	4Hg3A7uBvotCKz9cRgL1/SKywZZn1XpyL+0LW9HMYE/nuEvb33+ip0wA16kwsFXYbOQL2m4ogDQ
	9WBxHQ3gguANrKqPa2xUKmy4m1eP12ZbLc/+3DNTo7cosFBcez5Vs2TH5X49zDaqOqBvzQCA4uN
	v50BXDgyk4Iqxn2kbrZa5D/hfFXAzMBI9cQZ7+nVGdOagEPjEPMGhJ/1gLcPAG246/+Yt/ZFeTJ
	1NWKqzz6ODr9ceoApEdGqCtQdlG/pY2/xckW/o9oaeFuU0FR5pX9Umwe3sMQ/RdcPPrv6pXr34U
	4dEp+hh7T2J0/mzXSKACqlrwk05tKKjbh5O7aqpsHZP0zE95Jy8nPiktS2/bh1nJhvLl5i9336+
	PPv/uHD7VslovCe9+9RWwu9Sc1pQlgxANUIzLNt/WN0kkoXWJf6okBBe9YuIcLWtwuUpX+mlDib
	L4Sjo2CIkibqnNTz+CusZqxBAD3R+6W3Z3ydHhuQNAB4qtYUxIJOd47t17J2VM4MOtoV/t8Vl58
	aN8EYkAD/KzSHQQu1l3nQ+DZ01NxAAy6BBQ+KIhNr9Jh+ek=
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr12426552c88.9.1795448391824;
        Mon, 23 Nov 2026 07:39:51 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:51 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/16] media: i2c: ov13b10: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:18 +0700
Message-Id: <20261123153927.2547169-8-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

ov13b10_set_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. ov13b10_remove() calls pm_runtime_disable() and
pm_runtime_set_suspended() but never ov13b10_power_off(), so a device
that is still runtime active when the driver is unbound can keep its clock
and regulators enabled.

After disabling runtime PM, call ov13b10_power_off() if the device is
not already runtime suspended, and only then set the runtime PM status
to suspended. Avoid powering it off again when runtime suspend has
already done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 7ee850546822 ("media: Add sensor driver support for the ov13b10 camera.")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov13b10.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index f639a70f60dc..b4d67018c983 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1689,7 +1689,10 @@ static void ov13b10_remove(struct i2c_client *client)
 	ov13b10_free_controls(ov13b);
 
 	pm_runtime_disable(ov13b->dev);
-	pm_runtime_set_suspended(ov13b->dev);
+	if (!pm_runtime_status_suspended(ov13b->dev)) {
+		ov13b10_power_off(ov13b->dev);
+		pm_runtime_set_suspended(ov13b->dev);
+	}
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
-- 
2.25.1

