Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953387;
	b=EXzif0std0kGE/S0wciR5xXucFPHtW6t1v2R31FHzNL9yz9D//+iSVxMJ26Vo7ByZ5Oa
	 yAFVmUJEhuCI+hwQyk/s8ZhcY9nJYis6oY0FKzS502KNn4yoWZSq2LiVulqgz1PT0DWCP
	 wvyRRhqXQBKRxtomgIZxSZBc3ONjVi3Z7zi7bnxatF11k6WY1epUW3JqZtwqkE+MXYqD8
	 PC9Nra50p27pCJuMv2RgVgy9ifwG2yxcJW4OdVE/m9GUL9Os9WzaB2OvrtMlS8z0v8X7W
	 +9Cwl0yuxcs9eDpslgBapnIyrke6l4HyXkpyLUWuRHavV9OOPn/sxESdFpNVk/fGR1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Nx7Fnx8ynrYtRU2zfFFoevS3m3nHQ2OljJrgCdTaFks=;
	b=qfL+XfZ5LfhPpQ0e/B2LjP0usVKw3t+98sr0VzsN8h7ZOAIAPqszmmWcg2TKrq45HktO
	 7q76nm1ovIONqYuWI5XvI3qQXtIRGxIhMifidJ+BVBXXtnSo9k2IdWt1MBDTAaJwTCU33
	 ZwjO4zJC3ThSoHNLj4q7sG5nEedzTDu4YFxzZ+Y00LibHvK+Atg6fr+6wEJ+Q7fxgAUru
	 u7M8+FHLj34qLSHcr0UP8s1nCbKFtNxDDRD9kglNhI9Jcw6bjCaQvwwUHb5t0djg0E4+J
	 xZFvNg9H6Qt67hzmf7eC62OaG3x31fh/jJ0EQzcbCwUIWPbfHnT1amtPvlvfvOrSeyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8aAKYAr;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC2B606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC2B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8aAKYAr
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-702dedeb70dso218393eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953386; x=1795558186; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nx7Fnx8ynrYtRU2zfFFoevS3m3nHQ2OljJrgCdTaFks=;
        b=v8aAKYArq1OAS+FF6szcxGbtJtsS91acry/6yUfzoaWscwk+57mz+m/xrLwcmMGSEs
         +c7JxLAFU6FKeZHP+06tRRVH97w/8Uk425la/D5v7BPqOCdQ1p/By2sL3EztQGkMllgM
         F9lvM7KZw57BGP0dwbuYIUpVtSsT6LciRKnAyehHhjt77ebvbR0rewdtsfeEdFcxI3Y2
         WsxcFLPxvS8y1tTCInSRx+8Kd7sAsgBcn7AwRUBlzFIxnQezNSnUABJ6zGp0O+EoUTWV
         JCjpRr1xCV738AuzT4G39rCTr6Y2JaEZ0BFxsrJsXwzvoJZ+ABHkHpzvtIB/eTK3+Ngp
         dGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953386; x=1795558186;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nx7Fnx8ynrYtRU2zfFFoevS3m3nHQ2OljJrgCdTaFks=;
        b=p5SYAH9SXT7khCiYCBgdcu1TJWbrtztA0+m1TZZA4QYXS45i6UIBkgAtFxkxHFUWvM
         LXfpxDaMBqyixK+z/U7rm/xOFOR60d4GbFlLlm2nFFKcIRZbCu4r+AmMKm8Ov2isrkjK
         sPoKpyhsVizMttZAb9LPpB5heHA2wE8b4m9KmembaVlAJx49hNT/SE65Hc2X4Ml60Rpr
         xQa6KAEZyDIb7wE6H0vRH+4EXWSrGQrtk+PxSs5b0g3aXZSs9475TEp4/4WO447zmUZt
         R0UjyXlmR36ARCAWlqhhk8Q4u6+YEingNQlLAV2cavqOxL034zL3Tlf75gTDaSiLr3Md
         FkUQ==
X-Gm-Message-State: APuU4Z8lvrNCSF/86dtQoR2mLd97hXbFxksvc9SlgvHWbv62k4FU0cMu
	+DR4OsS3GRls2Ms4Bf4iUqbE71ljRkuPbR8MPeG0iN0pUzUWbpBPq6tM
X-Gm-Gg: AYBFou2MYMAgDnNJPZoonz4JcX1gEX6X40VLE7J+E2iihPs3WOnBwZrrGg1nzEp9HuK
	U1THdGQtUf8qQMp+DHZV2yBtRxTtVf/y5HYm0QdFlBLRLshBAju+ByLfYR2tGbv1TLqTIvjnEqi
	L7VZ53ZC51Bfzqhx3ia+iw6yycFTNsvaxMg5oh/6CUW0jWohL7z6Y27vMZhPullHdPxjWvLKnvI
	0ryeaPV1urp8gNpk20/ntdwwwFDO70dlQH5By0pcbHWxMzPGvBLCNPhTeG+H24dJeRfLtyYAIeL
	aVHV9kLX4np9ljuz4HYt92P4Xq8J8Kl4D0DQPC/BIvN0cLF0uVmmmLSaMyNO+okusZ+ZfPludU0
	ft+OccYKSL6S+kYuNKu4oxN5NfB7CD06xBs6Cf7pGwEBXPs7DynYX3JIea80DdvVZRh4lLHA84h
	Da5qvSEHbB2Z7gVtdK30T08hfN4MLzTpEQnq0sgtA9GQrrIlCp5cU1zeg4LWmxWFULw5XdOkQjH
	dVWOT4HhOLQjvbdED7qXoqdGFVQw+8d4B/MRMqBDVHLkKsS9kp64J70jjlD4AFq979dCjygwUe7
	5nrqrm/TRFzgEAX+oc0dYNU1FuqfTDi/3OQ8ZyFvMcDY/bB+kNm6qzAhwpRhWOlLvPx/VKb8DmD
	dreOIEsqp4ac1hWwSDt4sDj/6+UsA06ykj42UQTpvuysCsOlpHtpaQlj0SHiWB3rv7wnzOyaJ7b
	QrroU89xx8aK1FLZN84joQv6zY/uimKDkDZWTaKvOSrdzJcMcBz16r
X-Received: by 2002:a05:6820:3414:20b0:6fc:4051:d2d7 with SMTP id 006d021491bc7-71b184d9724mr449895eaf.38.1794953386149;
        Tue, 17 Nov 2026 14:09:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm559629a34.3.2026.11.17.14.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:09:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:09:08 -0700
Subject: [PATCH] nvmem: keep write protection disabled while writers are
 active
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-submit-nvmem-wp-serialization-v1-v1-1-539d121f8f5e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2O0RJDMBBFf8XkuStiVI1f6XhAF9sS6SbU1Pj3B
 n08s/fes6uwyIRW5MEqGGeyNGoP6hKIuit1i0APzyKO4lQpdQM7VQM50POAA3wM7P2yp2/pfBN
 mBZgkVZpF1yxTifAzhrGh5VDci5P9xhNrt+/+E4zvybvdGRNVaREcI+ZB55yxuZQtufCFrLEPR
 26lmSpp60H2pKdFnoc9Iy2TJnm8F3oOmpHh9Bfb9gO/Cd7R7wAAAA==
X-Change-ID: 20261117-submit-nvmem-wp-serialization-v1-e44b68058814
To: Srinivas Kandagatla <srini@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The core deasserts the WP GPIO before calling the provider and asserts
it again on return. Two concurrent writes can both deassert WP before
the first one finishes. That writer then protects the device while the
other is still writing or waiting for the provider lock.

Count active writers per device under a mutex. Only the first writer
deasserts WP and only the last one restores it, including on provider
errors. Keep the mutex outside the provider callback so providers that
forward writes to another NVMEM device can still nest.

Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-219526@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c      | 35 +++++++++++++++++++++++++++++++++--
 drivers/nvmem/internals.h |  2 ++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..c0da902d909b 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -70,6 +70,36 @@ static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 	return ops->reg_read(nvmem->priv, offset, val, bytes);
 }
 
+static int nvmem_wp_write_begin(struct nvmem_device *nvmem)
+{
+	int ret;
+
+	if (!nvmem->wp_gpio)
+		return 0;
+
+	guard(mutex)(&nvmem->wp_lock);
+	if (!nvmem->wp_writers) {
+		ret = gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
+		if (ret)
+			return ret;
+	}
+	nvmem->wp_writers++;
+
+	return 0;
+}
+
+static int nvmem_wp_write_end(struct nvmem_device *nvmem)
+{
+	if (!nvmem->wp_gpio)
+		return 0;
+
+	guard(mutex)(&nvmem->wp_lock);
+	if (--nvmem->wp_writers)
+		return 0;
+
+	return gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
+}
+
 static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			     void *val, size_t bytes)
 {
@@ -84,13 +114,13 @@ static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 	if (!ops->reg_write)
 		return -EOPNOTSUPP;
 
-	ret = gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
+	ret = nvmem_wp_write_begin(nvmem);
 	if (ret)
 		return ret;
 
 	wr_ok = ops->reg_write(nvmem->priv, offset, val, bytes);
 
-	ret = gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
+	ret = nvmem_wp_write_end(nvmem);
 	if (ret)
 		return ret;
 
@@ -930,6 +960,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->dev.bus = &nvmem_bus_type;
 	nvmem->dev.parent = config->dev;
 	INIT_LIST_HEAD(&nvmem->cells);
+	mutex_init(&nvmem->wp_lock);
 
 	/*
 	 * Must happen before we assign the release() callback in
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index bc7a99f5aefb..aab2ee4f9329 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -34,6 +34,8 @@ struct nvmem_device {
 	const struct nvmem_keepout *keepout;
 	unsigned int		nkeepout;
 	struct gpio_desc	*wp_gpio;
+	struct mutex		wp_lock;
+	unsigned int		wp_writers;
 	struct nvmem_layout	*layout;
 	struct nvmem_operations __rcu *ops;
 	void *priv;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-fixes
change-id: 20261117-submit-nvmem-wp-serialization-v1-e44b68058814

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

