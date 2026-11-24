Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503022;
	b=Gf8T0p3FpszBlGNI8bRrRJ530VAJiQ7ApDcmMeLMUxoXXeUsX02mOY3qR6edRHrG/wDi
	 3sMBTP2TPsLV2ZDmQ/3+/H5jbp2PGxXrJUZa2RWFjBfiRzI1liqt0QRa9IJ9j3lO2KNKW
	 VLogFS183t2EiqVrF54LqhFx4hzb6jn9fqWqZDpYP/Ao4LHcwJkcS3UrMJ6+fb0Z/3Rob
	 Yc4bQLYaXgGFbPlNMdTthVdXoxIiJmWjQ5Hi1gziwYh1vaRkl9GKqbNYzi1oQ3h/IjSIE
	 bYeBjo78xIxomUwaCHFmf/yoP9LMUHotlYnGVtoQ4vZMJTMDq6U3jOz4O9tyj+TOAhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=feSDKfXb4X0Cc0WCkXLJBrlF54Mp6pt66emQvGVPBQA=;
	b=f+/CoFnH64ZRddXfvFvBh+DNQDfAfVj3octTpzFX6kxk5VHkLtpd/ErqEdta0SdURZI5
	 2uRmuxs236jhhbyYtvQejSNjiLyEs1ydMRlbJ7OfPdJ/Bes4ZthohGo/9LbEevpC5shyE
	 SsKuMPqnZj6NKuFhI264y6i0C8/b/6hGFygP/dOhtKjplqH7zhdcnk7ol5YGRnq5u50Ka
	 VP/+/Y9rGTBn2wba9zCoTuuWjMZfs/yOtiGp2K1cl5qEUhzC/idgk6EmAyXFNGlDkfr05
	 +5gJblYVLDuLejTJ3ZO+ONvLpufA9SlfN3z1rJGk+HVuE58qcRo4nXNHBTYMxWAZNPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ig3BjHTB;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B14606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B14606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ig3BjHTB
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso5680177e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503020; x=1796107820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feSDKfXb4X0Cc0WCkXLJBrlF54Mp6pt66emQvGVPBQA=;
        b=Ig3BjHTBdtYBH6XVlNiNPlmJdR0UL7uoCWxTIuClZ3Yss2MI3TvUKNxoDyXHxtS1+k
         g200IJSVV1vxF/1yZIxAZqppvQ9QmsErlWSiiA+tw4EpXQRi284tqreJGq4VngV8YRBS
         6ae+/s6d2SdqTEOSQWo8f1XiN9SixRwf+3Ef1pSpU7I1RfPrx9HDI/1aFBB0OcWQI25B
         6gJrthtiaQm5NS4kCAC8qLQs7rHUdmAmIgRwVcgs7SMPKmXsuePYMtQTs2M4rU2LWMQ8
         cdbhF/a4IbWl4snzBEFR+6qEGtS+ZNhpBYEijqMpvZbo3exEgXKgkqaNict30vFHFi0o
         1DUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503020; x=1796107820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=feSDKfXb4X0Cc0WCkXLJBrlF54Mp6pt66emQvGVPBQA=;
        b=BFajIVMAkS90zzMsIrOr4S4Kg6Lin6q8T5mAyB6DMfIiqyWZCnTZKNhqPV7Gf3Hexe
         fu7IXizCZpOsjHR5nGPO+m2BAtAqROhKJoc289CJDy10WSzYQ7aro9PeTLwbk3XHAWXb
         nHK9ljuBlsgqrKg9uVIe8jA61/7Y9CcnuzM4QjNeehbYtusahlIomsnCuCzvj9dBszU9
         YBQJ+LjKnjr65MojE4RQTabg0ULuWHzuvQD13WafKblwd4qO0sTX7cMIXycn1l30SnfH
         Ue5SHvBMF9xWAWxgB4gSDCVhSdMHT51528v1RlCdQYnWLRwL1MpC+GnqgHzdC03/budV
         rrCA==
X-Forwarded-Encrypted: i=1; AL+hErFzIMqFHmHfIaidEMWiHOJygYLdHjm+Vz9K6VW8KGJWl7hEKMZuOkxYb9qQkG7LdEJ1iMkbY7hZOBwGVqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oXbA5pyE5uBbGvevzvTjqRJkT7oerdf9QOixufqKRrl1Xf4tF
	PjqV1XgDIAKJfFN8GVYOP0F/CaQLShdJCNlVP56k+Y1X4+F+O84qr1UZ
X-Gm-Gg: AZFdTZf+l0GLNZ0E60mnK5CX92lgx09saoKolm2DXZU/PuXYrt/aLjbuUHZl0LgzDj6
	3gsydIlJFGvVe5Xe7VEnf2AyrtFi42ws3COEkpJpxgq9JZlW7D13c43RIyC5xNTuy6Yhtkfttii
	tltkCMX8a9itg08UNJ1eWgPCvi1ippAuko0sA8AcV0CiyHGHIRuus44qzXnqoqkS61YcIKISQHe
	SbHmuL0HV/e6SVoLLWDL1S+QBtFRrCJ+p5RZVvr1GgMlf194Inor3IISXHWQGF5AcitMIhdc4NS
	BjLPViQ/10yS1zdBzP0EiG9AtuNO01PKMJL/oIrvby1eFjy/AIFbzrB/kX4KyE1Xq7hjfkN73ku
	6pvNJA0KCOowsXKRJSVDciO7YoPJ+ZWOOZoL14/bDAWaiVRcJNt8AFNiFHPgYlv4LdvuOb1krpH
	LiLwzfdLjhdK8ZKRYrDMVSVaYb4IayCnQXgaR4LKSCyWm2GHDyMg5xlWRVNeQ2XV46NqnV9zKNF
	8kpIgRZxJy3BsL01XU8vG2YNT3maGthdxuxJC2dlItgGkx8ilP1J6qiGSmXhDseVebAOAgFyi8U
	q0YDRfi1yzx/vBIiWqkEPJgBEHTe6c0V+mBUYxf32pzEw2VTgkean1+b/WwGUYE0MOKO5BNMlf+
	e1kB8BhpX2t1/g51/G6FgLFAkA65po8WVQG1dVQ==
X-Received: by 2002:a05:6512:1591:b0:5bf:e43d:999 with SMTP id 2adb3069b0e04-5c1bc8057e0mr4229386e87.42.1795503020353;
        Mon, 23 Nov 2026 22:50:20 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b45sm3538556e87.41.2026.11.23.22.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:50:19 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 1/6] iio: core: add iio_debugfs_reg_access_regmap()
Date: Tue, 24 Nov 2026 08:50:11 +0200
Message-ID: <20261124065016.185124-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124065016.185124-1-zoone.rupert@gmail.com>
References: <20261124065016.185124-1-zoone.rupert@gmail.com>
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

More than 25 drivers implement debugfs_reg_access with only a
regmap_read() or regmap_write() on the regmap of the parent device.
Add a helper that looks that regmap up with dev_get_regmap(), so these
drivers can drop their own copy.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/industrialio-core.c | 28 ++++++++++++++++++++++++++++
 include/linux/iio/iio.h         |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index dabd57a0994e..e658687d978f 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -28,6 +28,7 @@
 #include <linux/overflow.h>
 #include <linux/poll.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/sched.h>
 #include <linux/seq_buf.h>
 #include <linux/slab.h>
@@ -446,6 +447,33 @@ static void __exit iio_exit(void)
 	debugfs_remove(iio_debugfs_dentry);
 }
 
+/**
+ * iio_debugfs_reg_access_regmap() - debugfs register access through regmap
+ * @indio_dev: IIO device
+ * @reg: register address
+ * @writeval: value to write when @readval is NULL
+ * @readval: where to store the value read, or NULL for a write
+ *
+ * For &iio_info.debugfs_reg_access when the parent device has one regmap.
+ *
+ * Returns: 0 on success, -ENODEV if the parent has no regmap, or the error
+ * from regmap.
+ */
+int iio_debugfs_reg_access_regmap(struct iio_dev *indio_dev, unsigned int reg,
+				  unsigned int writeval, unsigned int *readval)
+{
+	struct regmap *map = dev_get_regmap(indio_dev->dev.parent, NULL);
+
+	if (!map)
+		return -ENODEV;
+
+	if (readval)
+		return regmap_read(map, reg, readval);
+
+	return regmap_write(map, reg, writeval);
+}
+EXPORT_SYMBOL_GPL(iio_debugfs_reg_access_regmap);
+
 #if defined(CONFIG_DEBUG_FS)
 static ssize_t iio_debugfs_read_reg(struct file *file, char __user *userbuf,
 			      size_t count, loff_t *ppos)
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 8b3fd7673293..8407e6e4620a 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -677,6 +677,8 @@ struct iio_dev {
 
 int iio_device_id(struct iio_dev *indio_dev);
 int iio_device_get_current_mode(struct iio_dev *indio_dev);
+int iio_debugfs_reg_access_regmap(struct iio_dev *indio_dev, unsigned int reg,
+				  unsigned int writeval, unsigned int *readval);
 bool iio_buffer_enabled(struct iio_dev *indio_dev);
 
 const struct iio_chan_spec
-- 
2.43.0

