Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448387;
	b=QJBVX7JN3NHW34UDq2NCMd4bWrgOIHzdqjui0nwt6hmuaRfb0ys03UPv1yOCkDz0rLlk
	 yzBxknGx5fuXVLp7KF/oiRYp6jsHwrJ6mkZR+Rqt8YkZIt0msxJ5QhcjURVMwt4SKumZv
	 r1l/hL0xoymOmHnhIiNadr1ulMzQANoCTJMyJzf09fyNXdmx1jnDPO0LZz5WQIRt62BSi
	 /MAAD6JQGbx1d7c2ui0YZ8WXgxLFfspXgFkAZSyZ3pu3DnmKQ2KixHxxxSBPHdEwKYyd3
	 stmvhcPcEdRfKTHE/vJDWmFGcQAAq3yLqRgHh7ZNqrTxTXCh1PkwRFX+ea6ueDbMgog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h2es8tuJnBEC1bxJsfksjdYK11MeTT6qyf7M90vq1nE=;
	b=uc0bzy6HuJkLuqHHVcwedL5sGIxfW8IrCSqBg9/Pg/PDa6WLQotC8z9XhruOll7H+pkk
	 k1DJqfZ4JlEEuKOhx2Zkg+r8o0Y/omC89DODZao/O/alPIYqZxDPTKuFc9m2B05qtf+dV
	 kqVqrDyDp4EtyV43wrk+eTYAfFwi8zRLb30eLm5S87YFdX++26j+y30NVokxdfZYYNmPD
	 WV/Mnp4D+ATP7cm7NHVY4sqTClHz4m9+5pamLWHx0G3axkO1ONEDM16BmoANKAXhWGQyt
	 fZbtRzudfzj9aWW5hu8j0zmgXinKQ6em7ZVWNbkB3ThZfiJo3ska+rj6jGPk9zw9Clw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+Bj4Ciu;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710CB606A69A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710CB606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+Bj4Ciu
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so10281720eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448387; x=1796053187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2es8tuJnBEC1bxJsfksjdYK11MeTT6qyf7M90vq1nE=;
        b=g+Bj4Ciuucg7+rplxCzFkjO2jrw03UI2fqDGuTV0a1SwYfbO4dBdLXfNh5LMtu4LZQ
         qs3tIFXbg7dkEFiliFBYkxjUaboGTmDwIEX0S1n4xTXs0vl9ISuljIJYBXSaqyIjUE9U
         my+fjsJJHyf6efvVVQOP7Jd+ZxS1Syb846aThwSRNrHgyI8rjt8ffU4UHMaqCjLcG3yK
         Z3WxAhMQZJmmuqhF4Jw/lGlM25rGydSrM8aPV7lQarMxNjtyVeSe8GtQTfzHcdD6oLyc
         Vdb3V7WUoEbDYrW6K0+gKsPhZ1cXxNXUMR48o+Rgy7ntemd+1EDXF15mQHG5jIT+RMf8
         Pnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448387; x=1796053187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2es8tuJnBEC1bxJsfksjdYK11MeTT6qyf7M90vq1nE=;
        b=fZblv5Y3Pvxejgwk0gXwUz3JmCYXVZ5PMu5Ye3ldqEKYBmjtywN0ndh15xkxwdHSBH
         B4UhR/z+0ZExZAlsXxdbvnkK3KmPbUMGxWitSeS9Rl43VsaUYAiQy2zLfN1PRCamnFpn
         B+9SI6U25oR4+LrRV5HAslQFm560Wh34RUnczkAMzwVXjf1KZeZDG29mEDXZ+IWPzS6V
         jcAtckIKhpihOPn+Z/tMvLUu0YmZ+9yKdzZIGKCxZw6Fhd8g/me1K1QoWPwtcfMVPE5G
         Ux57tiwTqm09iXqdlujU+/gm74Q8jVgUPOyu/HQW/KItI0utu1J+gDMp69dWuFH+0ain
         PUmg==
X-Forwarded-Encrypted: i=1; AL+hErH6v+hDudpifv91PvRwcO9lhcc3XJuXy022g/c+LgFYJxqjxCQazyKfjF3Ae4DcfyaLpYbV9eZ6Oa5dlM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tW9iqg4xiUn1VSGGZa2weYHHgzyj7jwrHcSpeCHnOfy3f5hmm
	gbSoOKvATEu8rlIgF7jpp7aEvbHyl94kPtLPDUQjYOZcMkEo1DNKJ+SJ
X-Gm-Gg: AZFdTZeVVPE+mKIcfb0nHOYEejutblIJwvujk9ageWSoDRxD0fu53Z3K0NcxxLTFwIH
	g4LOAUcF03eivpqWFy5OIeIGtNS0h4QL09V1rox02E66bQ/eI0j8jIMBO6hrCs2wJQdbN9yl63E
	78H32k5539PxM3Hh54Wr8SPSo1EwOvxtIoH6vUHFGVD0PUZltpeJBn4VZFqDdKhKh+hWshmRVD3
	5QvmauKYZxWpejwUMh+uVL1NO8A3rZmr56PHPWUM8CGYwQeyImTz4/9L+/psZkDLOI9W/YCQEHi
	J6XusoGfBY6yoeXM3O9BgPiHBrLOc79E9eRE+miztM002syFC5A3tV9QNLp/LruTCTuBLjh/ty0
	WxbXqs1x7z5o/e7SgGETyfI4r3JUIoRWrRG5j8ByQntXFXoybecoOjAtN7L09eIWCo6Oy8UnZYV
	8HPzbLGOVbuOCedkDH9NbqyBT/TgdixGHq30qxDi0Hj/J91VwcbckqaNBgftEA7uQOAxLQopExY
	sNGF0Ns9hXl0W8lUcrZqsz9RG+NgPMTOx+I+T+fzIczBSpFZ60r6N/RrMI2ab7iXvEgUQXrU3II
	t4s8ZbZtwLj8BKgAl0DNSeTWcRTY8nibpQ==
X-Received: by 2002:a05:7022:b044:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1b5568e7699mr13828058c88.29.1795448386401;
        Mon, 23 Nov 2026 07:39:46 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:46 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/16] media: i2c: ak7375: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:16 +0700
Message-Id: <20261123153927.2547169-6-congnt264@gmail.com>
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

Move ak7375_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: ak7375: power off the lens driver on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ak7375.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index 1ece5708b4b2..2827fdb29298 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -228,16 +228,6 @@ static int ak7375_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void ak7375_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ak7375_device *ak7375_dev = sd_to_ak7375_vcm(sd);
-
-	ak7375_subdev_cleanup(ak7375_dev);
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
-}
-
 /*
  * This function sets the vcm position, so it consumes least current
  * The lens position is gradually moved in units of ctrl_steps,
@@ -334,6 +324,16 @@ static const struct of_device_id ak7375_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, ak7375_of_table);
 
+static void ak7375_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ak7375_device *ak7375_dev = sd_to_ak7375_vcm(sd);
+
+	ak7375_subdev_cleanup(ak7375_dev);
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
 static const struct dev_pm_ops ak7375_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ak7375_vcm_suspend, ak7375_vcm_resume)
 	SET_RUNTIME_PM_OPS(ak7375_vcm_suspend, ak7375_vcm_resume, NULL)
-- 
2.25.1

