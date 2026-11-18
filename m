Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966249;
	b=r6BjkvKtCKzJbn2tOFYc4CnJLJsDl5I3eyHZfEcI+UBLBHRWzrORe/ihHSV1Ao3Zmuwc
	 JdtbNrzpvPMJYwCyRBnVyHsuVYnfZL42kZd9PNqhU3TnN+DfxYrb5cN4D01HzI4BQSZxZ
	 +h9wedzCPCWjkuLP24EYYnYBpEp25/aVwoZcT9x68hYTIn0OizqtKYov793WrBOhpWH3T
	 KES3QL035ahMnadeuhOIxw9XYyjMFSMGd7OXtQ+tWFEapWuTtphZ+gJ+v+yEOCTMqlOAk
	 5kCi2kV78COpQptq0Ih4NezVR3hFncHQ8Ylvk+FKGLmiOVpISUBJ848vEqeuvdQOouA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
	b=v4AyaWxnPLPeNQ0i1i6+kTVGMjrgvAF4kGtZAWN5B2FXNNhSRckZLbEY22zO4Enr0/RN
	 HEGlElYjR4QPDyQ4YQA6w1UzbJZ3uAxhYi7yLnqJhj4+CqF7ricj4C+pej5vRk8bXRj4x
	 t2KRqebh2kxfYnlKezOEsOTHO8XcIHokYXRYyRVUXnlhjFnV95tikfvXPei4uUMyUlKbx
	 qUthDM/SURsfoHAarcZsCou4Bcc2NgkriLrk4JhbQFNNyjk/qDrhIHusCc8TBJz0GADaq
	 YzNTmlEyF+1+gkMFBh7HeRIxTwoDg2uqGxzrA11Yt90yLU0h8xTuU3b1p2r25Yk3hgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="srOS/ykz";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA943606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA943606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srOS/ykz
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-381d542bc29so961574eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966248; x=1795571048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=srOS/ykz3dSNDqloWipBs4oVtUh28EAQMJKnKgDd8CzAWxxgw3VwmpdbwuV9izrH6V
         EKmeofezDel53zYmFKIqBqqOEzRzUq+PnqQ6WMkJs7V2XP6JQ9f0xUUaALoCFIcrzoou
         1Lu+daVcNyTQn4EkZE5eGAXVLINlUevDoKNJtt6haz6dV5XeyjHBww3zJqFap4bfFAfJ
         GyzqbsJB+0H6sn0ZNbl8oQlmd/B+C1QLHM3qCio5Zzmdpl5uKQgtBAycq9PqCDCwgMYF
         spSih4ZD/vogfvA1WTsHH+XaSn1eg0FGnxph46w6uyGDS52CwwGTTJ+iMPdc5QkuoaGq
         PNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966248; x=1795571048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=BybEDZnaetDTYPVguYEg2VWGYCd8zEbPyzePewTraZIi+PeC+ayIXPyFthZLL3Avdp
         0bYM1avGYU19RSED0rWUDeuOLQsFQQOeY/TfR+RnbhyC7nw8XEeC3/4O3E337tqr9gRN
         pKvd2+pcqniVqEVH3F52mvEcf+8H+KJ5At5Issom7twkGEChMeaEiTyolyijc3a+GRU+
         +oy6MzIAh7hrWUjjRXBFUPGMZHFqF9KoKN8kbBTFk0IVVxlWP0nWnCQ14dyeVsOtMZEi
         alOPWeKN6v8JRZKLAdu+7AX9YlpJVIAJ2lTwItVIT6fB6yAgad/sVHo8oFmCYqqMXO9w
         w9WQ==
X-Forwarded-Encrypted: i=1; AL+hErEP81hAKqjB2N26MVyee97oU4jjEEsoq20dlKZYvucc4HSqNRMLS3I13Wd8t1p8GAOjfcBy39XjQO4W6A8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VjpDtMw7bzVrVhzWUob3hX3spNVF9lX1MJiXHc8ANg1HwFNQM
	BGTi3dBkkbyb3IGdIS3SDNo+hXctHKq3MKvJlOnAYAo+XSfregothS6d
X-Gm-Gg: AZFdTZe7/Hij4RNlmYLpXsKUYfqXM2L1R9d7dKzASIAttSEyof1uDQUnyrOcR+pdl3F
	jOMpRs7qo80lVeyUJlMKLwDVkiouPEoHa/SJg2gLqOPHYAT4ujuJyLfWRCsJ9rNbJKB1oBQcDn6
	NG9HxbFXSN6gAUs/g3mr3EPYu1sq/CVM0EAY5jpNw8SUyQLQtX5E9KjScgdJr3Fdyohqpq+Br/I
	DEg6hr/ckhds7M0SXCdcMfpfDY+nA4WRGft5gu9iz7g7FC0McGlZwR6ZWWb4TfvsesFvmBm1Teb
	zHGDksyu0BBEPQgicyb/vSErvto5ghbdqR2ka2u6HxD7tS5kSLgozUJvUAF0GcJbOO+EseIgsJV
	JZb6xHL4ow6qS9L5NzbdPIU1sV9b4MgvSqFRI3ry0W7+/xf1g1zcmB3F+pwADlXszbBi6BqFXWe
	+rnh6YzvUbz+zNApgobSpknQNITEiwebQ5E/f4nWtnKxBdqxuOcDwp7kDgN+Y+aGwCc6q6IuenM
	rhz7/EE5YgIYOUzeNkEzDi0R+58JJ8wARqexRDUhlpI1X00bHyYcUW6Woc67wbA4n+RSoQoizCz
	3MM5MThcFMIhS+mD8EzQamgiB5CrXP5r5uoFWVRfNmwsMZWmZtT0ui+1Sow=
X-Received: by 2002:a05:693c:69c2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3828141dcdfmr960224eec.26.1794966247812;
        Tue, 17 Nov 2026 17:44:07 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm2157822eec.24.2026.11.17.17.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:44:07 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH v2 2/2] media: i2c: saa7115: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 22:42:35 -0300
Message-ID: <20261118014235.419385-2-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118014235.419385-1-paulo.ravazzano@gmail.com>
References: <20261118014235.419385-1-paulo.ravazzano@gmail.com>
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

The entity member of struct v4l2_subdev is only defined when
CONFIG_MEDIA_CONTROLLER is enabled, so the unconditional
media_entity_cleanup(&sd->entity) calls added by commit 6787d5189e32
break the build when CONFIG_MEDIA_CONTROLLER is disabled.

Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER).

An AI agent was used to find the bug. The correction was done manually.

Fixes: 6787d5189e32 ("media: i2c: saa7115: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/saa7115.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index f4015f113..32c526df1 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1868,7 +1868,9 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1927,7 +1929,9 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&sd->entity);
+#endif
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.56.1

