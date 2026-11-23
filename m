Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448404;
	b=pse/o+YB8lTQlxMs+PnixBcLy1NJZP5kOjFlvROdrsHt+rRKQ5ZYRGplxaWwgVOJUlDC
	 QE1jjL9wAN9aKo/qfTjjEaEOeEMUjbHvzOgyb8Y9gx08R1MTYu5m46uzvX4Yxlaihiab4
	 l3oINnLpC9g+fuqu1TL9xhKxHfidDp8BpJehXlThzfH+1SxggagluCd61Mxk+MXfcrGZQ
	 KkGCtp2GQuAkN+/t9vP09zreOzphYUvpdMXgNwNt+zXIDy2Pq0Kro+7H7QVoorXH+xKu8
	 RYZfjHDvlvZIQ22fTGSZLvD0/jPYqQ1gk90sWg5nIjVJgjkjY6PwY9GXbuHBTKAqspw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JnXIma4YtN2iSsfSPRgrg8cOsz4M8vjVbnmrPKec7R0=;
	b=i8OQRIQLQhGucrTqx9ULcKXOHRoBHNdWgfOtsh/c9OMm+BTsjJn8HMtJwtj5PxvMjOTz
	 nXx+mwoz02cOcr26QmUfxUJ67Vc64O/loBr+f0dDPX1GNBwxmmOR55P58x0aV2VwOCCNC
	 4qhNX3Kcq334f6xx3Q63UwZ3mTzXgTE5sLImRCf6+dakT5mySYPcpalsee7Cz2u5t3SdB
	 XfYmS8jmL771rttBvSs2FBE+iDKoObNjV8+x1bbw2Yfx3uVigeJG5ORtThY/1y4zPejRA
	 3q3nAgT7hCk3+1VKufjjZLnITyaE6yxDRrq9B2LlEiq8XgY/1t/9Y1X40weG7zfi0hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMAFUW01;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7F606A6AB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B7F606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMAFUW01
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4321727c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448403; x=1796053203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnXIma4YtN2iSsfSPRgrg8cOsz4M8vjVbnmrPKec7R0=;
        b=DMAFUW01EGyBKKPHGz1YCRmTSB0oy5xhgTrKXgFMtP8k6vq5JkI4q8U8WWs7RQG8R3
         tpoYvdcRkYgEf4u7oWA2NUljx8lNGVHNiAKOTSKUrZ822WYyPGtd2IVIWHuWp87mvopT
         PzZ+YrAgE9fFZMcNTr371vzZ01o0A1w5oDZlwFUbCBHNaiG0+jPQfyi0m9RPxCdrVLsu
         OVtWNl825wP8bwIWOoYjlKyzQJTaiFBe0zRx79Q3Hw0FzkICkHW4f9KowL6p1uJBNi5D
         /S0IC39SgoKNfd554bQQkxkRW3mffYuIJvWrW1lgqnDzqT5Sl9XmyKxNSdb8gTHnHGiv
         6vZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448403; x=1796053203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnXIma4YtN2iSsfSPRgrg8cOsz4M8vjVbnmrPKec7R0=;
        b=iFULRoVCbjckC4aR/t3H7aTQArvS84PJHq0VYh53PR2Gtw6kjzyCmsFFerc2na9whN
         wYB4duQTk63PR+NBxpUVVZC1dYbwqDz9FS8QGXIUUMNuS0ttMd5Yk1hvzR+STuA5YYWb
         wUni5Z5epBm3UlJELlrf0QJ03T4iB7QROCa9uq9MlKYEnyuljW7qJIXDGXUHto6LITd9
         QvC0uNKzz5+Js5NyUwZuE0YzQfL2AokaiD8q4aEgtmVZHat9/hiLTQFBIqQJz+fuGZ/v
         SMXnYIPzrP8yYNukTzMz5ULsPtOLuJkdt4fF5L7+CltOJw/J0Uu7EXzTlqMUrMonr9Ie
         SglA==
X-Forwarded-Encrypted: i=1; AL+hErGlmFpEkcU7eBUskfcDPn0K48qHughO+hdMxiIHkhs8K4W//0Hail4DJ0Vvep18fYX7W3TeXR+9Zo+P3Po=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UOBOvjf80VzO3/+dt9CytqIq0s2gbR+dCym0oP1XMWr89uaPw
	ApQZy7u7wToypheS2+aarxQNAbhhJkmbEKvxvYsRCXoN6kW81Q8HsuPf
X-Gm-Gg: AZFdTZfPN7d96pmoZVo4ljFzDzn5VCcl7CB+i5nBUGrTEUm166F75YDj/tb6H3v1bLP
	/45wV17pG0nR6X0a/mM2wePgkce08gc0ZBMzjQP8memeUQyU8jRLimcwDv9sLOMdfnHrYQA3NNR
	D4g2ilVi0Vn4zZmfSMgdYpt287jAmA/IbUJSadqgceyOe9buKXSsvflQ0879qt6KoWirWGBgI3b
	hUwgvhtSB3kAlbjnAIZ40EeWNPGKpeBXPjVho+H2EjxHjG/AAIw9yzt0YajctKOwd/QYdfVWOev
	ZlEB7zySDn7ENq+hw1w/HmApSstlJTeNHkvtu8RQzNoch8lhwUelzVhQG8dXOq2y5/nRiiOn65Y
	dhvDkb0fffK4YmC1zdF3rTRiLV3DJs6vxbiu7azFv/GgPSV07UahQiDNsZo27cS2XR4ZVnHaLUu
	kXdDri13zJaMlZeQ1h3e2woQD9Se+YOcnEB5V59CDZm+3lsu79fsz4/KzN2aCYKk9s56XrVrdWi
	9zmtYJ3S9F8q1lxOAzSi4JY/ABX8iAIv7GdC4WEdjx+Mv/g62mUiTkRkcumEbIae6ujg/cHmObE
	MxbSc+CHiEIlYEqgQdfAf5c1mWTSCehS/QoBiIgjwQhxqe+p
X-Received: by 2002:a05:7022:3d14:b0:151:6e80:baa9 with SMTP id a92af1059eb24-1b55687f17dmr18299006c88.12.1795448402877;
        Mon, 23 Nov 2026 07:40:02 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:02 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	=?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= <kevin.lhopital@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/16] media: i2c: ov8865: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:22 +0700
Message-Id: <20261123153927.2547169-12-congnt264@gmail.com>
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

ov8865_probe() ends with the device runtime suspended, and
ov8865_s_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. ov8865_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its regulators and clock
enabled and its GPIOs released.

After disabling runtime PM, call ov8865_sensor_power(sensor, false) if
the device is not runtime suspended, and set the runtime PM status to
suspended. Avoid powering it off again when runtime suspend has already
done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 11c0d8fdccc5 ("media: i2c: Add support for the OV8865 image sensor")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov8865.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index c7dc97bf75f6..02948c5888f4 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -3118,6 +3118,10 @@ static void ov8865_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(subdev);
 	pm_runtime_disable(sensor->dev);
+	if (!pm_runtime_status_suspended(sensor->dev)) {
+		ov8865_sensor_power(sensor, false);
+		pm_runtime_set_suspended(sensor->dev);
+	}
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 	mutex_destroy(&sensor->mutex);
 	media_entity_cleanup(&subdev->entity);
-- 
2.25.1

