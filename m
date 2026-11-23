Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448390;
	b=Xrd4DLEOeuA1TNCQCItk9hc7IBQJbNY8i3/oUI1ewngIPSE0sNADHJ3OGiZJCgECso6e
	 NwBl9vmAy3xaj34UsGDFetnbapii8V8iZOU3nndI2PBNYJFcyJlVdNfhCX77am/pOg1ZP
	 g7Ep2rAx7ZtVV5bTg3vH0EjedlWwiXRkMlUJlzisZLmm5Lqau5Mq49IvWWZyrBNIENzN4
	 Nv5FjKJVfS5Zp/oe/1nw7mdtgHZajCF2koNNFzy/PqXRQdkHhNIr5VW5hFCH4AbcUI0u0
	 3cG6Dz45/ZaQ25pd2ynp/1p/bngTog9PgXaA+IRuw4fijOZAhS+LjK/84twmz2w3fPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4q37xjETul02efHg9agH08x5RvqSBItQGeKLb7Kc9eE=;
	b=wRgsRgaDqE/ilCm01jlk00R+vMiBMplv4tD1dhWlwjond8UHbTmlVHAf8EAseADzFZ4m
	 7v5TI8942qdpXSpBzjeR0yFTm2Gaj63czmeN89cJzZusFOXxGXri6oCHBLKQ8wVt8gfd+
	 Wf3F3rxNgRW84WYNncjHeJ5SOg7t71J9VhAlxquGUpULomCzKzQUoCqZnevT6dDcmMj4l
	 NpB1zyXXLMY8IkR20nLKGBXMW0pimgI7Zcv17JXsaKiQ5rqusUt9jmJFKHu5H1Yfl7FEj
	 U2nYKvOt7m7NeRDhcjas8VcR0hEtglqCHeDkxbIUcUvsfPK4M3XEK4z1paHZ9qkgiEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJ1oG13w;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12037606A685
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12037606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJ1oG13w
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so4738951c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448389; x=1796053189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4q37xjETul02efHg9agH08x5RvqSBItQGeKLb7Kc9eE=;
        b=tJ1oG13wDf97si/lC54QovfpoYFyVvC4wRuI2/hakZDue577prlDbiYbJJBSjRmxlU
         WSn918t7xP4SqJYePG4QXp8Jgiv932lfpSHLhznAFdklUVcwW6ZkLCjdGrTlGFt+5zaq
         U+4brvT9EEvJAK+8NRPqKXciWxLS+7ZK5O3ApoYOXhmBaQML/tj+8I3I81oiXSYJuObw
         FH8Bl9gYzglO2T+6BVaWM8B9xupN7SnQHlLFnXVSHTHA09Tx6+TuniO1T4b04NvO39o8
         sUxJyeVVbyh65wKimwG9wrXm3VzmXo8M83qKGB4oO7VU5X0cRRhEfmjsm7/NC5aKyLou
         PwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448389; x=1796053189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4q37xjETul02efHg9agH08x5RvqSBItQGeKLb7Kc9eE=;
        b=zjXBZIMmqrip8OQ11KMsJVqPnqmjA6a7jvSLO5eRVYGcYMGxMpodSBHMZzVfTVxzdK
         YRA9Y7uPQ+QOFGdWw/ssmQqW7XxkiwlUZCa8QAdveDwJRPM3hujIRV58HTUWWeM0GAMH
         QAjilWXXpDBNKgtIn47VK6D289uOIeXFw8MSs7x3MN/QhCs0kjr9ZVpd4d90lWjx62L4
         IKYNAD1SCVwU+1xvQ2zKBP0Nyg8SIEVfAQ8Iz1tqY+WNZxNYdTwqxvFu5/BNFkYRwBnm
         AqBEASfvnkDG5V6GMdmkP2ezH1KhsylkU1BmkY/fjMFQAzPqlFtqEeWhttjc5pifvvUk
         72FA==
X-Forwarded-Encrypted: i=1; AL+hErGYlnqdpqd8PM0FmGQxbf3ftTMmQERWiPfN4x/awboIQAKvkoIZYywFL8OvoRCUblA45QJMz2q41Tph6RU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pKHDzrK0HexrE5laTi0wIeXnpkzHa7NT9GVeYeD6akoW4w/mV
	3YU1dx5XVwwRIQXbMade0QSrVFmKOzTvisQj8QlXb0Att2zz/YziJdfpQeIeLA==
X-Gm-Gg: AZFdTZfHelj2ahV5H1LvXs07kH33dvYGfFKEEkpsQ08TgSWcyyVVIzP2kmQNf/jOB92
	C5zVWrt+enRz30wPGFCxnJhwbyF++k/1pWGcdw7POY/ZfHIzprn6Ebw3K5xtPNeyCpUBOLzNUjU
	79MJauu56r9Vj56SBvCFf6U/w3Qu+VkJeQ1AeDJBAj3hkmXunrhSMNB6hb/VFCrPO3+vv18R3zB
	QEtvzBx8p90hcrtohbAIqvJZZgzt9dImEyxb2w9bMif2Efl4d54bK5Xg7ZiQ37pbOjQa24fptA/
	LHsy7jiTbDjrl66HMrr/9wVWFnCeM1MKkVNKlLBQmnY5Or8BP6cjVaFFVI5aUZs2TqgRN4d0PnY
	38H2CLT6K/sHuEZ9Vxbgb1v0aEedDUrf/7pURaNfpC1GFenIaO8OrbwlnFEwQvx69rI51Dnu9Us
	lqC6sVMh6cvemyIWHPj2t6bI9PPvLwpmgJoJED7aCWMELFBYYVZryBnbgx73rqLVO5Kfr8eyqPD
	8l/jCU0tGT61YFj6UfXmk/JZDmKI1mkR6vZAzGDn5ACXiFIVkcbAMjmdohArcDgiwV0fucWkvRp
	ej2ifGv9bnrwmBdwrIdlTYuRVX9XtyP2tXPQbPVKu0GrxcZ9IouD0jaPkHDtC+WNBOR4
X-Received: by 2002:a05:7022:7f12:b0:1b5:4dff:8b67 with SMTP id a92af1059eb24-1b5568eeba1mr12061043c88.29.1795448389170;
        Mon, 23 Nov 2026 07:39:49 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:48 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/16] media: i2c: ak7375: power off the lens driver on remove
Date: Mon, 23 Nov 2026 22:39:17 +0700
Message-Id: <20261123153927.2547169-7-congnt264@gmail.com>
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

ak7375_open() takes a runtime PM reference with
pm_runtime_resume_and_get() and ak7375_close() drops it. ak7375_remove()
only calls pm_runtime_disable() and pm_runtime_set_suspended(), which
neither run the runtime suspend callback nor release the supplies, so a
device that is still runtime active when the driver is unbound, for
example because the subdev node is still open, can keep its regulators
enabled.

After disabling runtime PM, call ak7375_vcm_suspend() if the device is
not already runtime suspended. Do this before ak7375_subdev_cleanup(),
because the suspend callback reads the focus control that the cleanup
frees.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 90ee26fb2f50 ("media: ak7375: Add ak7375 lens voice coil driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ak7375.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index 2827fdb29298..a81cc1df81e7 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -329,9 +329,11 @@ static void ak7375_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ak7375_device *ak7375_dev = sd_to_ak7375_vcm(sd);
 
-	ak7375_subdev_cleanup(ak7375_dev);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ak7375_vcm_suspend(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	ak7375_subdev_cleanup(ak7375_dev);
 }
 
 static const struct dev_pm_ops ak7375_pm_ops = {
-- 
2.25.1

