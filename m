Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448385;
	b=wq8q1o0SzHVaXRk9MGbbNLlvDQdTMjyd2z5HZ9pcDdy9d8Ha6u+vYUOMy+b8YqIKrlQe
	 JHs2wbE+AWPczyP7NzFPApqPOLF/jBpAXX60k237aJpdD9nE2APghFZWZ9WU/2Ur7WY+3
	 aUyY5HaoQ/Ec51Z6wavKvCRy9rZPBZSey1vQGhD/JQaVy+sb3diDSNWKhF80MaafP4m2t
	 or/5PcpvT27heefV58f1VtYz1a4WKs6hmgK8EGJ+T3Dr7wBcDtEUNr41sq8UIXhJVs0xQ
	 bNzU5dVg9NI9DhDfiWGg44JaliEVHMEe6f598dggIxvimak5tWCtO5q+JFfdB91SEQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gg6u6KS4BHnwCfzVFUldneMf5zb5FDtQCD09MbvPg5c=;
	b=HqxeTeDFv0NYu0sM5im7IS7wMT9H7GO6qjbelBAxNaDpK7Z+f29G88QKZ6+W2hcA1js2
	 ihUiuleUgzUm35UuUqgDwO5s6Tvtdb/fKMiWXiRWOPfo5rbiTI0SAkkwkKM7ouaw05uWE
	 zpcAvsDRhbfdw/AqUtRdsyHmE1KD40vAvgZCJ1nQgUvqWjyyUH8aNrg+EwDWiTMIeVZRD
	 b/lqPpnWalwMk8m8f167W8wu3DK0fIA6kaj9vqZfzDZD/1UCpsDII2i7XlIytogG71zzb
	 mlqilMf2aL9w7r+Vhh7VCZMRjGYILBytKf28FlpinIwmG0HQf9dntN4etmWs+39shyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2iJ6ygL;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB19E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB19E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2iJ6ygL
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4321106c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448384; x=1796053184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg6u6KS4BHnwCfzVFUldneMf5zb5FDtQCD09MbvPg5c=;
        b=c2iJ6ygLdNkbsPoO18wGJ4JUpSyLeDAcswpF72m+U35OWh7PKn5Dq68bzfI7KlBlZe
         kAuAMnXnUqH4plLvtGpzM8UCKYqD1r6699vGPzh1iYwaPVTlKLo92s6vtdUSpRXQAIy6
         cVdNL+CxzgaHeBp6vfoxRv0De8lW913NS5s1GSzaUYIcCH/bQpFDYjEXjE4q02WABJzw
         LrtPn+cBgRFYtQucFnEpJiwMOwY41QkA5bmJYqfsXQ6OO0ObWGT9bHesMSEo2sL37K7L
         e547FWmnzriNz//piUx4sbKHV+kqFVP74Ll14+v+FT5zvFKz7m0lRziMu82aKo3dgdtf
         4iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448384; x=1796053184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gg6u6KS4BHnwCfzVFUldneMf5zb5FDtQCD09MbvPg5c=;
        b=v6gPiWTzfHiMlTFF/RsSCOn6fMc0exaf2QV/1DBAFHfYdjOamYsNZW6z0M/vgGyedB
         qXaAHhWgXdznQX2zu2xFGS8Jnul+gZYezi6u0ZqQlSyh0s04ENzobAVIEHL6c8RbYPQr
         o2VdRnjb8bQ07E8sd5ZjaW+yN+nuEYEXHneGSLI7YOIHMV6A4cAd5uE9+OeWaoMathNB
         W1Tr/sq69i6qcr2Tuoeyaa9j+RDR6t7rQH5jTod2EjE/H0q310eWiYElBmsrQ/S1nde3
         JxAnLo6OTLmNeHeU92GjBWrjoILVVLkVU+16h6QnAQJalr20zICGY6KAJrsgXVJeTcaG
         pASg==
X-Forwarded-Encrypted: i=1; AL+hErGNWQOju6+pCXNGJBTjdPxg0rWUK/+JceG8z8D5RQaiEO0HJps4B3BxM58XrMyxuJtq+9A2Y5aJ/aJSFWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hiSvh2mUQ/sovwAm1i8Vezc4J67IqCEzo8OlW6As35UJFT5bS
	91cAbQOh7DUpddCFG3y+1qvWMSj/XeavuanIYT3I7u/eCzkS7d11KajL
X-Gm-Gg: AZFdTZfP+j16vlKgRMb1iC3lyD6KNc9AqFrgLocSDo60G5DjGVTAvrzcJ4PNmrZP+qm
	FSsS4Y9PSUiOzuxWeHl/QpdD4YqTcnnR1amyRorLp6ZB45lMR+GraPrr9Oyxztt/CQO+q+38mkz
	X8qcyOl6VTCTnlnQM50YbToIoMhIH6X6AB85RbQqvckBjkLqnsqQJvEF+pM37iG6NzMmG5BxoFv
	tdfpdOc1/LgBL12InuVDMP78ksdy3yyzgnIRKOpTt+/1LB3XWFhyRFEsLGLZzniLMxLeLkIisU0
	rapMQm6Bt3ou8zzc0roCf9Md+Ryc1DQb7qiClCeKQFEilnM+IlxGT5OsI4K7OZN+Sj9cwszZT3O
	zabkxLpQc4Et2fytoOU3EDnJNeibFXNzwHcE96LyAivrzD5mGjcB2X0aq/0jDiUM88vxb6uenys
	0T0EmX69fx0HEp/ubdTVVT3FplynKrIUsbohZhyzoJhCwqCkIwqarBKyjLxr2fg3uOurxkNYq6z
	ywOgP47HeoSVxRcnOX5hr0pM+kCDFGWwJwZMmWMJx+jDj5Fo44LoLoiLQSvTyiezX86iM7CWmF9
	od7VtUg88rqJebOPVlHjhXq6WdTuefQtoTHYwGGYDTOMQFYmhEwvh1UyvNmIXPjr6Zvo
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr11352062c88.22.1795448383825;
        Mon, 23 Nov 2026 07:39:43 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:43 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/16] media: i2c: ov2740: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:15 +0700
Message-Id: <20261123153927.2547169-5-congnt264@gmail.com>
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

ov2740_set_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. ov2740_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its regulators and clock
enabled and its reset and powerdown GPIOs released.

The probe error path already calls ov2740_suspend() when the sensor was
powered on. After disabling runtime PM in remove(), do the same if the
device is not runtime suspended, and set the runtime PM status to
suspended. Avoid powering it off again when runtime suspend has already
done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 866edc895171 ("media: i2c: Add ov2740 image sensor driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov2740.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index ca2ea5d4e0a3..8e495c70b961 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1456,6 +1456,10 @@ static void ov2740_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		ov2740_suspend(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
-- 
2.25.1

