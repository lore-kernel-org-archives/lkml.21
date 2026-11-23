Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448418;
	b=CF/PuOkLP/+WdJmaBMM6CDMw2LL2V8Ex8RxPzz4oyW0OnA985FHkKPNhH+GSoI4Z9e4/
	 BXJdVWPttsOzanw2aAp+ruE7ttdJnfhtXQHHs42pLJEyo1OfUCZ+uVt0yz1ozSYp7FCDK
	 L+MwDbKIeKoln5CJ4xkbkF+OlaeOLKHvq29Om3mo3rOwtgOaIVgKNGx5p4F3mXpjLM34u
	 29sJJ1yv3XFBAspur3f2SnLEosWSV41MxA3X47nJfX9v+bdrVeQKh+dES/N0+JR2Rox86
	 T7LwTsGNCnKbRv6wZDJbdezyFddXoczJ8VhZlpUdPC85k0EkiaquWTDwGHAJduNQJYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=meDtNnqZmmStY0ORBg5eu4fKzl8BJPe1cwjkjz6gNc8=;
	b=kGya00ktg0jN6mpOtt2Y5+fSww8yS67sdqSFVecL/IYPMuEX47b67o66Sre0A9AHFEP2
	 JOMRrcVFL1QPyDGRd43yQyJlKoBvM59GGyj0C44+GRecywSrwVsUr1WYNtjQy4eH/4X42
	 OD0ZNXx37jIFy3pmV/ooSFqfWrDIVa/FBkM2hHvp5MChG/NKPO7Ov0mwzWgUCmVl0V3zD
	 UYQbbHJ37rPcc7z30Z9gv3RlTsBFUwbrw20/01V5FOcT7CFCH/+laR7NEcQXBzvnY22iU
	 WIj7MRnHV/7g2JQYJ0T4FE1/JArTnbeGOct7KMhvMjW1WD/RpQXjIq2IZTznsNo8Ayg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXzBfJix;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFE760A5BCC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFE760A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXzBfJix
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b5786e099cso857282c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448417; x=1796053217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meDtNnqZmmStY0ORBg5eu4fKzl8BJPe1cwjkjz6gNc8=;
        b=eXzBfJixaGgco9FU3t4ZCWa3uqZPSikvM169FUHeyzzJYOyEr1S9CMW37iBbsc6ZDW
         IViu5GY8yXVlF84Oe4a9hl7+h7D8Ntug5vsiVCWbfPxap4G1r1mDDPSn66jnATLVCMmB
         qS4aQb3DJZdE7YP+v+0v++GMv2RO61+9K6hJnOLB+MFPNCBU6WZk9z1KIqq+8L07/8ET
         hmzuFlQuP/6y2K0V3Zdw/PjoPyosEEbBtx765KK7ouNcPbL51UcX88MUQRUlL/y43MFT
         9QZ9UaPz0GJviZ05d1yMX3Yt8kaQV+KxPUjYdlc2SlwNnkCVbychdHTrdoRXiUru1dYN
         RmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448417; x=1796053217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=meDtNnqZmmStY0ORBg5eu4fKzl8BJPe1cwjkjz6gNc8=;
        b=do1labmARwEiT5hZDYfNV3O1Px2beWZmJygAxnpiezLA8cPZiJ3F/3WQ4hpXYM+NDl
         kcoe+fQgLSrfUYBGhW52+jTW61vSX5SfaDXk0MgXMA44e3+4N9pRS1D6CSngusrtOoe8
         Kn1SeqLDiNAqhH+OQLeCQFmAEPIDDA9pjKGsZggSU17p5PMe5Yf0Wwgb6vIRXiOkdj7s
         oC0Z73kvHDp1p6XVtf23NnHO27wS090rZWSvOuqKgLxfzOyHejpDar2a8tHzSP9t5y4T
         AzhDkykSS1sknDxKyD6oWiIer3bC2Ov13Yc7AXlbtq+qxQ86xJreb/Qn/Dtcw75BNB3M
         OYsA==
X-Forwarded-Encrypted: i=1; AL+hErGnPFDmCcWjivfmUAvSUS9v0KtuC0WisgvexPhXMkSSfEk9dSYg30yXl9+gFa5RbQUHpKVYMau/UYZxGOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OsZNKk6H72sHHXeWZS617PkEbxB/+V//0+mbiFcUFSXYWoK5l
	Us4k4fPILzHHirpeTY40fNgJNegu0E8lKGlhnfFfaGDWNpKIPkLpBFsk
X-Gm-Gg: AZFdTZdj08Z2SqGvBFu9LnQa3CeO5hlgURwfQs5eQyWYtZqooc/qR896NyXho/Sb0St
	3WB3R9TIQWaSDtikrHmehgQ4awwjPM3G0TMmWeU/ZSpR+JoVACxAd5MLDfM9qEDoe99e9G8Gsfr
	dW5hYp1pUatpUr8YgDy2xRIF8IStVhLyMQm7DJ+3/ZA8OwDcFxFoE6oTJRbo8wKVGfhDzyhdYP/
	Lz6B6hplPYnn78QCnoA+FXNH9PpAT7V9SgqRmBF42rb++6xVGxKWx9t3i4FOyAv/h5+BoFF3j4B
	tJ+gb0A/sPUwc6fV2blK91VBLVfRM55t6kZp7CmD7orcNlLjTGn60P7XTk8XI1PbXQ1KPlHVtfE
	zMLTMSvCDQMkr2taVcNfUL+27exhf1yH5zNZkfi3ao3DETPkDyqpNR/h5w1/T55FUq7q5rljQNS
	+3PiFEu8DEgUZzZjXY6ksDHXhwmSIHqvv7ScwMJRkQjm1lnU4yg4htfZx/oSTB/62g46rktVikg
	nl7HbkvMKAWBKiY1udbUWAESLsJEpxVqp7GUEuk4+m2LQ9yrdINrQgwQzYZ7WuNPRxrAnzQA7P8
	h9XxBQ/O1cNL0FpUVqKq/6a+p5nSGAjPLNute2ezJbVejOM=
X-Received: by 2002:a05:7022:7f19:b0:1b5:281e:1702 with SMTP id a92af1059eb24-1b556943e35mr11158927c88.41.1795448417207;
        Mon, 23 Nov 2026 07:40:17 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:16 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/16] media: i2c: tc358746: power off the bridge on remove
Date: Mon, 23 Nov 2026 22:39:27 +0700
Message-Id: <20261123153927.2547169-17-congnt264@gmail.com>
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

The driver uses runtime PM autosuspend with a one second delay and
drops its references with pm_runtime_put_sync_autosuspend(), so after
the last use the device stays runtime active until the delay expires.
tc358746_remove() only calls pm_runtime_disable() and
pm_runtime_set_suspended(), which neither run the runtime suspend
callback nor release the supplies and the reference clock. Unbinding
within that delay, or while streaming, can leave them enabled.

After disabling runtime PM, call tc358746_suspend() if the device is
not runtime suspended, and only then set the runtime PM status to
suspended.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 80a21da36051 ("media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/tc358746.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 88ff4a90eebc..68f483534e0f 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1688,7 +1688,10 @@ static void tc358746_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 
 	pm_runtime_disable(sd->dev);
-	pm_runtime_set_suspended(sd->dev);
+	if (!pm_runtime_status_suspended(sd->dev)) {
+		tc358746_suspend(sd->dev);
+		pm_runtime_set_suspended(sd->dev);
+	}
 	pm_runtime_dont_use_autosuspend(sd->dev);
 }
 
-- 
2.25.1

