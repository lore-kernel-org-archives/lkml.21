Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448415;
	b=3vpMSbYNoRL9lrCNa4isujwM844ld42Z9U6F0mdpP3pSyv1UjHTcGg2JeVj2pUg+c+KK
	 ww/TEYHNJMFnZ3h5eMp23hyHa6YQYZSJNWE5AJRpZST0UmVwdWmX1YqLzLVfPWoLvCR7w
	 JsWe++KICFURZmd/zArrphL5U+VqqpyK6cfMXHwd0xDH286cBWLg5Ocwy9XhQFDmgY4t7
	 96LXpab/ED/SUje+T33LkZnhVCvAcksKw6Ci7i1R+vfWwcdN12bEVtxE88BB8/goLEu5D
	 9vbLaJU28Uze2courMRH0tzvGkKSfwkIv0loHORSepOtINx7wkutWa8vdhjMFIpwQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uzo3PCKNFMxYSTVKvMB2GFaEBvmy48DeYUeNPuhdPJQ=;
	b=v491rBM6aEsXIKwfMPqVGKJedF6VAzy1obLmo3DDggEAzKiJFIbOJQofyj3SGbc3D8HO
	 dcn8kDb413aXXVhCCdM3uHIzArqrF1f63JQFXaPpEBiPNKEkdUU4Xy2VAaCgC6R+ZEoIN
	 iBQKBwVqupaPocxQWF7VsavaYVnblL/g0wORcb8hwjWXJiPqVyOtv3M5pVmUnhEAd32lZ
	 wWgXF1MQbF1VKMUK5C607xOFT5/XolM0Uj5ooKn9CQq0KOl548j7PLJw20ZpxmTstkJlm
	 vEiC5Arg5nvGmVyprTrtlqGH1GkwGn/pPXtxdxKscGHfvrEBD5jv4HVOP7A00CSWpCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTMyQIKW;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3901760A5BCB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3901760A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTMyQIKW
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so2292690c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448414; x=1796053214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzo3PCKNFMxYSTVKvMB2GFaEBvmy48DeYUeNPuhdPJQ=;
        b=aTMyQIKWhdzg8MSj+HReTp2SI+48ElaZDKRE3zJ0TNTd6WDcHJkTctU4GIdmyVzFB9
         ecgl1GdaYP8hUQxJcuc0W7FSo52Bb60FwpRZeJXa3DoQlByQwB25kop8wwJpOaO6VmOa
         gg+zHSZPK78n08i8LrLK15wSiIiAU6K3rpxfszQLBQYJ/EfGZ7aUoPD/bl5Z2zcMP+SB
         M1/m0V1c20ZQTFPmQHz50RDyIwnWnGOzva7uaf1XLHgKzkmzfzbhqwbs3DijK9HxeHLh
         CFWJrFMVoETrEPMJebvwvpbVN4//YdDpgspXfx1GDQbQnNjdZt2BIsILVNLuNt2/R4qE
         v+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448414; x=1796053214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzo3PCKNFMxYSTVKvMB2GFaEBvmy48DeYUeNPuhdPJQ=;
        b=pTxrju3AeAi0Bu/0eLcqIug6voQJSEBdpsvy8g5ZV7BaU/Xlju7RAAjVAgqNd5WZF8
         1RcmJRgR3qRsxM8v7S+S++KeVAqQkf09C4V1I8e/CJgqhIkVEhxpvUxJVKwoGKbE3B/4
         +lRoUfo70kg54fST9oWyQK1m+S6ITeOJzt9JFfhJa0bp7hqxN9KZgHdMVUzjZtX26dvc
         X/TPfVEpYcl7KShl6i90PljqFK004nJk7Wzd2WDhE0iNUWPcAaBUxV+zmBXPR5y7g6Ky
         1XTWtULKDj8I5n9nxPxPGeyPou+0yqkIB3h7Hx/eCjkju89NkYQTYggmUZFhaudYJEB9
         4DXQ==
X-Forwarded-Encrypted: i=1; AL+hErEoGAjFpUXN8baM6TzsedNYpTvm21HSpGSjDRA2Y9tXpkIYFu+Ws10btK/JiFklUzcFnTXlXGQtsnhCvf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FLvJeLVbsP3iSRbmjF4C5jdxX0h/Eop+wxBnNOVBsenraIc2N
	s/uV23H5icX/bjI3qBz6eFmx5x+T+EtAqrh74837IUqeScfYrh8FcZtGvYzdsA==
X-Gm-Gg: AZFdTZcS2pQvf0d1+HgxfScm0B0BQxxmVysVWYMmhGEaWDVphh0zpDwUfFRcR8oj6GV
	npE98p79K5ZfjdZP5QLwbNecL7qokw5p0PpqimkxuLtZxMGLWOTsFgEKNkX3mI/vvjwnImcJ6gJ
	dL7imgrQG6R2acDa7w/t/7OHmOovncnwfUCzuAmrJOZTKV4XUr2JLdVeZJ/YWjDL3qUJEdkUbKq
	paTEpW/vixrst9MrXLmvYta+Q2mCPjNgMJeHwIIMsI3BrQga7jGAH5s1N4zoR8rdcXi+6T8aMC9
	lOncSY572ztDFB/5tJ34XVo3eFe6mzd6+R0LDMXoBGquzI23wbO2wV0cn579nEt8TvUDcSF0Ymr
	6YubtZTxR5hdNCrAnYMKPacKmBFvAv5dt/04UeVuqD0c42IBNbMz1uFdozoELn502rTPjCcqP0E
	9H3hB5j0Ofwnxea4T/TNOp+xrz4V8T3VbP2khzapJIa+bICoFKjv4nlA4k7mnn0LX+P1k8d/Rwz
	hWXM2Y/vmOu71kj6Ida1LwBjqKsmmJ9yacjompABhdUqkAgtTOFkWExpET6GWOglksNXLA8Eg/x
	jf1YUs5vdC+sKt1zJKGLfGF8D0Ix6dNLlCo8hEN7LgO3k0dSaXws82MecbZWfNljSEYt
X-Received: by 2002:a05:701b:2096:10b0:151:2e62:fe5b with SMTP id a92af1059eb24-1b5568eb642mr13573403c88.22.1795448414378;
        Mon, 23 Nov 2026 07:40:14 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:14 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/16] media: i2c: tc358746: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:26 +0700
Message-Id: <20261123153927.2547169-16-congnt264@gmail.com>
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

Move tc358746_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: tc358746: power off the bridge on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/tc358746.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 91d26a634023..88ff4a90eebc 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1607,24 +1607,6 @@ static int tc358746_probe(struct i2c_client *client)
 	return err;
 }
 
-static void tc358746_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct tc358746 *tc358746 = to_tc358746(sd);
-
-	v4l2_subdev_cleanup(sd);
-	v4l2_ctrl_handler_free(&tc358746->ctrl_hdl);
-	v4l2_fwnode_endpoint_free(&tc358746->csi_vep);
-	v4l2_async_nf_unregister(&tc358746->notifier);
-	v4l2_async_nf_cleanup(&tc358746->notifier);
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-
-	pm_runtime_disable(sd->dev);
-	pm_runtime_set_suspended(sd->dev);
-	pm_runtime_dont_use_autosuspend(sd->dev);
-}
-
 /*
  * This function has been created just to avoid a smatch warning,
  * please do not merge it into tc358746_suspend until you have
@@ -1692,6 +1674,24 @@ static int tc358746_resume(struct device *dev)
 	return err;
 }
 
+static void tc358746_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct tc358746 *tc358746 = to_tc358746(sd);
+
+	v4l2_subdev_cleanup(sd);
+	v4l2_ctrl_handler_free(&tc358746->ctrl_hdl);
+	v4l2_fwnode_endpoint_free(&tc358746->csi_vep);
+	v4l2_async_nf_unregister(&tc358746->notifier);
+	v4l2_async_nf_cleanup(&tc358746->notifier);
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+
+	pm_runtime_disable(sd->dev);
+	pm_runtime_set_suspended(sd->dev);
+	pm_runtime_dont_use_autosuspend(sd->dev);
+}
+
 static DEFINE_RUNTIME_DEV_PM_OPS(tc358746_pm_ops, tc358746_suspend,
 				 tc358746_resume, NULL);
 
-- 
2.25.1

