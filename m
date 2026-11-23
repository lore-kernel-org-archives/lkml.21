Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448382;
	b=yyl4xEQx4sZtsO3rgk7O5NS0W+CBZUlcLjrThHTRrKYVlrEZ+yZwkF+bV8pE2uaS62+5
	 PWsH+FpvGfsi4L8zA/0jeAt0d9F6tDN7UESl+1CBeSe3dAp14FFh2gUPp5oNFHlT8nlUN
	 cN6Tsk02bYMQ6PgMlJ+7xcPcDXUerZ4P7/FNYZAi1nhMhr+tzrgYRnByoWyjJTvnNanpP
	 Dr83dlJKXu4vF17Ox23UuGRUYiuyEHALiQTY8kw2DqRiZJf8xEMafwPMpXHJQ3wVohhJi
	 b8lbGrQ53mGYkRkfjvSIb2qqMfvn6eQafHm/kFqHoNeXcWm4cUwcOIED3bHXZFQrKhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qIijkM6MY1bCZr/143mwHFpjqtMizBLsQ/aPcgegopA=;
	b=XcHitx8nX/AQAexfAyQcyNgp6KbGMeSl5GGj0kJpSXvicvjGtuqZeYC1q1lc7Uc7Gw8e
	 dy3yHA8SF5YDpCLZXkjVbihbJun82mhvihFtJfT6RmgOp3lRNUFX0XeMJtAvFaFyFVFWP
	 pF1rDVOu3/z+bTxyaWAPQy6QoT4ohhXd5gKg3etLBGzZH94jO/rhOHqJS1KiQMiQp+jUu
	 nkpkC1JyxgnWqNNO2I/STGTQj1zy6xVhwdNRp585bAEI9BCgtzmyLboask6jNFnO+t0oQ
	 f/uqlwqaKKdlvEGPvkkZyxJv2wTurEQWCK6CchVqJg47c8u9w7MW8jXVtQCmPEnp5vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Lbip2/cb";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3350606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3350606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lbip2/cb
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so4738711c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448381; x=1796053181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIijkM6MY1bCZr/143mwHFpjqtMizBLsQ/aPcgegopA=;
        b=Lbip2/cbBCna80zi2kx4R0NYJr3D9fkZfE/lw33PANiyGYyOh2KPFz6T3481cPPX0Y
         Sk679aDN9vbIOFZGgNxeuFCrp6rbVkc4+nEod5w02Xe9RWOwuobOiu9B1VIVQ8Zm66hI
         8bIBjYEK+2Fj01s8wAH8TzPmQpVRxKN7X5Ycfr7QP1sME+sG81pXGQZbsZxYxE1L/+ol
         LfAyoQ08vkekzNEuxpvDdJSugbfXYm07iyamSqb82DrCVh87vOUiyQl85LMmYI/8hMnI
         1LTtzMDBLJlbx4I72LDBroAQGjiutIdh9BWHA0Wn7lBV5MTTvsaYITkwjNyEQo+alJ6J
         DCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448381; x=1796053181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qIijkM6MY1bCZr/143mwHFpjqtMizBLsQ/aPcgegopA=;
        b=m+JB5LbcbR5MruOdpHfP+QXd2lnFNfhNGELoe860YMgEs1fiB5ErL5lLgEuMtGzQA7
         sO8SjJpH6pVhZYzKA0esQrov/XCs5TSsVDs49Aa88jmd7k/nfpeVICelDTcCvAnPna8W
         g3FOEC+3/+9pzeN3/UaTyrjwWhFya3DyY7ndPZ7KgNz3r9XsF8DnssCJBH5ISbJA3N/c
         Mh/bwszsIBRMt5uhaFpgIgj5j/64n1A3/2qmXHhM2dG3cxL+haIS4v4XznOczSL4W+R0
         YQ0Rf+1OiK0jPqROoz8S1DYx6KdBa1EoX9uuVPdLGJsfaqNuG9YrLvsOBCsHRzIodn7e
         Cv9Q==
X-Forwarded-Encrypted: i=1; AL+hErE7P2uRwPg1D0jw9qPrd/DDaN40GsvmnQA932wVUmwtbTu/KhZ+Ey1gIuzrLoplK/OSxuhgMVFTpY2+DmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9WnnyuiCiexoTMPUo9COWKJPRLgVUCO8m7SFjrIk7pmHFYRz8
	YfTu/+SrfHZlo2mSSrlBaQQFfH/cD7AcCf9ICfpfqSI4W/NMnQ4hlXTR
X-Gm-Gg: AZFdTZe3QR7FJ7WD5sTQEyCrnkD1apNcTgihqD7EQJoxMAZbDx6DjquKVxsSIv8/N6I
	lja9XejkCz/QG1cqw+mdr3IuVQgHOC1QUr3JMdcRseqEXl6rx9/FKe7LH8NifyfnAkaoJT8rtu4
	pw46XY+Ged88hsUty16BybmIM9hswMTFLaBMA+amVwkZgQRKc1P0TPqEwZR7BJZdNnkD+uHY7J6
	vZJhldMCBgLBQKpu3Bblh5QG8jwwMPQcexIluw5Nj3+7nHpbRVcsUfFhvV7O0UAoMxzrYfdzoUX
	TMv4+L82FruR+qFTKPY0A4x8P6e+cp5m8ALBuS/p422BTgxUQNq4fZ7AIpZXRNfq9tTYEjgqBQg
	AHccQBr9xAnZGDkovD7y8nTlk3lstK2bSSYMidqvw+FagjCynuOjj98efUlC42u59AB5dTYDl10
	0FN0xqOqmbYzugz9/s5YorWdMtUUiyXlBR7YEdXpIx3M18xKGIfknEsJyhpNt+AY8uVqSuKaiIM
	RT7ea58HBemU7CIfgHxhmQwZRjVZrYEQpzs5sqLMsalmYW81jHFU5yt6MWbP4LCP0ZAiSTGujDE
	ZCB981M1YZ6lhIORm7Rx9qMM5TdUQsOkkIVknaiqPBviuZrNE6WDZ2GBqt81KJ3OYeNn
X-Received: by 2002:a05:7022:ea8d:b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b5568f6f77mr12668772c88.31.1795448380844;
        Mon, 23 Nov 2026 07:39:40 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:40 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/16] media: i2c: ov2740: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:14 +0700
Message-Id: <20261123153927.2547169-4-congnt264@gmail.com>
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

Move ov2740_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: ov2740: power off the sensor on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov2740.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 31513d1524a3..ca2ea5d4e0a3 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1199,17 +1199,6 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 	return ret;
 }
 
-static void ov2740_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_subdev_cleanup(sd);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
-}
-
 static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 			     size_t count)
 {
@@ -1458,6 +1447,17 @@ static int ov2740_probe(struct i2c_client *client)
 	return ret;
 }
 
+static void ov2740_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_subdev_cleanup(sd);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+}
+
 static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
-- 
2.25.1

