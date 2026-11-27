Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797671;
	b=BGN9qzjl/honRXxUpJWrSd1CDJnMyj+bIuCN1FWmM0EApAsgrdgBp2RrSEl6fc9Opewj
	 dLqyZ8q92KnTGyyjoWEXXUT7NnOUmPWCL0ZE45DTn0i5Z/1P1B+HfMHxUdrBwWus2u84P
	 aKsxduVLYUCY8dxKkTp1eEwEIG80ygoe0T15XhKfkgbaL5TrEs5TVwalTmJfqZKidlN+T
	 ugvPQ69qUr4Gm4XTdppm9NadY8sbZ/nXdnBUTHcddMWMDNsDSeUG4nrbgG8KJdFeHoJo4
	 /sgHPAi2H2JmFOGroeRMPe/AJZjWzgsghYC31PFDWipsp+e1RxLCnGCDFD9uRBxOzQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eBafZ3TGt48dalipcHqqjuuDy+fPjAZl/ulwRNWBUSk=;
	b=qHjJf0jYTFs7HrQHIl5RwiYWJMuYDiHgZ7hfA+1d/HyL37evkKMellBiaUtD5Vxme4sY
	 q80ozrhtnvnScKX+uUj77N4P8YfktO/wGTf5QcF5JrWQUk5oSXhD4iNsIXMvHMu3Uwo2+
	 RnHFzz2do4sHU7qkpb7Jk2YQQcOvfEfM8E/exkdPfqTjdvlh/uT+cM92aFLyjXgYcu+D3
	 LhvTktXNJwhNb/r53TDd7ooMTNYlHJERdQS+JCItu0Ua0qOrQ1jEQpCNl11l5OEqJmkfW
	 O0s18g7WEJuN/Lz8p+UrnGzGvPxksinDHwPm9jYfczbpMuOmnY/FpcXf/NRyGwht39w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zh9m8F1f;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD1606A69D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DD1606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zh9m8F1f
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50933bdf4bso1564424566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797667; x=1796402467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBafZ3TGt48dalipcHqqjuuDy+fPjAZl/ulwRNWBUSk=;
        b=Zh9m8F1fS68cH+pIlfxWQbSz0bFTRuYB3nYmeFs1D87MCTgTN+hYe2G3fC/lJ//eNV
         XeQvO1IXJcucmhn86+rp4URWH1MjL5uHjEfWcurgxGghI1zaGqxfgT4osW0AJYqrAmf1
         xj4ENR/00Gm+rt6BbGg013MPob5yGoqfLi4MCjrJWr5FXln8BnpAOuJJd2tY0t67BIZ7
         oK0UC8p/JyDyRa+u+ijOwESzHtMGkHORr6cYx59gonqu4CWBtVjMhnTS0+V7NcAVsb1L
         RWpna9+PO28Kfm7X4Xnf/J6Hz7hzVIU3ruIbPu8IpR3Kg5m0UQTlMLqKKVRvK9i7Sh64
         UUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797667; x=1796402467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBafZ3TGt48dalipcHqqjuuDy+fPjAZl/ulwRNWBUSk=;
        b=KxlTdMkczE27ce2Npz18Ambx+OedC9LUKSIGrPsGePCIHni8rxyayS97Mu2Ee1CYEv
         PVA90OgHC4KF1WEV8dhtkUXje586pDPe3Pg2dDjmyNb9GK2gdUBOlh2VTRa01fmUXuOa
         o06R8YcL+BN9o2MSm+bkSNjBLqGjBZqcS+HljsmSGfqXXFi2Uka+ol6xd1sJ5HjSBusz
         AH/JN8W+p02PczFTZdbI+lLy0UItSQbMqrKxtKQXL8MsumHr38NSN7FKNTwsvTSMMenW
         eioO/vMwnu0q9I64WQuslKUoUuL7MgeoK23/eAxAcTm/WaMzHdzEi0usNzdxYL9xAQiR
         WrEw==
X-Gm-Message-State: APuU4Z81Emd4dsoV13E3e/GQpv1y9xzbmiJgoVXlbb2s1GSB6IS9DRWU
	zjFqMf1EDcQUylj/yKfiRDiJ/eYsirqf3MKWxZQTID63cpKZExGkIq7B
X-Gm-Gg: AZFdTZdBoS0ogReNuI7iREOryVOmiak5w7D5qEXBWEMsIIXGDRMQXah2w1pG64b1Yk6
	VjdJjmi+HfbzwIvBgd/fmD6qaVYw78OYrZCHQC+18S53ZGZOhCtTsnG+ku6e4x3h6SwW470Aah5
	ylpy3Et/D3RBOWCtfrW6P/xvu4wbSPQ5MabDSMcHa9qY6N1GsEhQ7iWuEvjPMhsrFVAjEurckxt
	qQ4ggyX/gZEOP1UPv4nwFf7l5GAbK4ccGoc+LTZsiyiYeTJ15bHGPaG/lCawkjSCwHkWP2WOFn5
	gjy0AVubsewPi+U+44drDJCVaRSNCYAW/RaiyLCLRnDwrMSr9338jeDC/x3NQ4iMGwvkgHbDaB2
	O/AwXm8U2ntG9BqOZwfxrTWkuNW9G/rC94yePGoXCRxvmd/HDBPC6op5/iNTkiM5UlTDcjxsi1L
	yyN1AXzKiXnzkwB2/r1LJo7riEHDhpd6LvpZbzbT26mnAWEpmohL8H6U9hYpuP2jd1yAlo3Xo38
	0WWzjcmb0f4RC5xXoC9Wjqolqo+0DCYrx3weo1u0+GdZkXRrwABOgxE30ugFw2OIDPobbxOsvLl
	VIC/PLhnNagJMKYLhXlCzmfNaBDN1ngMdJKVuanU4xTVUees+YSmplLax8xcHiIP+iRMJ2B0ARs
	KttWJnevy+g==
X-Received: by 2002:a17:907:9301:b0:c46:78af:6150 with SMTP id a640c23a62f3a-c5131585160mr2353132066b.2.1795797667115;
        Fri, 27 Nov 2026 08:41:07 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:06 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 4/6] mfd: max8907: Add restart handler
Date: Fri, 27 Nov 2026 18:40:42 +0200
Message-ID: <20261127164044.285910-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
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

Add restart handler to reset hardware properly on system reboot.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 14 ++++++++++++++
 include/linux/mfd/max8907.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index f6eeefb419622..b511c57026188 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -185,6 +185,16 @@ static int max8907_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max8907_restart(struct sys_off_data *data)
+{
+	struct max8907 *max8907 = data->cb_data;
+
+	regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+			   MAX8907_MASK_SOFT_RESET, MAX8907_MASK_SOFT_RESET);
+
+	return NOTIFY_DONE;
+}
+
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -244,6 +254,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(dev, max8907_restart, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register restart handler\n");
 	}
 
 	return 0;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 35b2ede54f856..9865ae52877fd 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -164,6 +164,7 @@
 #define MAX8907_MASK_OUT5V_VINEN	0x10
 #define MAX8907_MASK_OUT5V_ENSRC	0x0E
 #define MAX8907_MASK_OUT5V_EN		0x01
+#define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
 
 /* Regulator IDs */
-- 
2.53.0

