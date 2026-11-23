Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446170;
	b=gMW8eZ6YL+BRR0WXRaz6x3cqfU9lYE3QYbWmGejn7joNbCt01hBuT8Wb0rcNfqgsHwDV
	 vpBQ+j5urfamkKhUbPEHFWTJcjgrDLijx5iAO2qa+DqAQfYuE041LHt7e4KPbu5nt0+ic
	 JiEMottWsnBOl2GyuOYSlghX6ZLcY4EzTP4MF8r2KhfRgiB32jqf1LvKHsL9DFe9NVuhw
	 V8r9ZpuXun8BYtFj2tADwLnIeUmwcVXKsgpWfQ8CTQ2SCA2BIaTAes6ea3mksIeZDDoa+
	 c6qiY7qcoMQwNtxRJ0paWmGv/ItiGUdZe0ZuVasOByzgjP+I+/B+aXl4/aBSYwxw3bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8eOO1ST0aXmtMw3eaUAkBoh7IoqMZEQ2tzDQbbldbdY=;
	b=VFSdBmrOn2+rcK6Sk7XgSQhfhn3jVswFMFSt4RFKp7y/ugJDP99MeoS4buZfjnF2SKbO
	 wovH8ruBXMhURE2KrLtATzm1Urm/mBVyYd8iVOVkMXyH1QO7sCghAWK7IQqk2sKOwmhL4
	 kHZi/tlTX2MrzYsa0hzOg268y6i8oEZwXGP5FsyG0KnGSXyr3ZaHNggWuyTabS+eOa4oJ
	 9Krhwnqz4hsD5ahVbIIx10lfLzLdLq7IVgEDRi6eURTrHvByAA5O9DGREkKjIeFDpU/wy
	 88iHiHs2Hw7wN8r664esOtpsGo2uMN+wpYTqWM+s5H/QeFK5qLc5L3L7EWsuEE3HMOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9VCKGmZ;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42751606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42751606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9VCKGmZ
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c515369b627so303258266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446169; x=1796050969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eOO1ST0aXmtMw3eaUAkBoh7IoqMZEQ2tzDQbbldbdY=;
        b=R9VCKGmZjXElTN978wMjwwQYnx5I3az4MVwEXqa2cMGX/vK9eQ3tPEy1qlmAM+drpy
         sS4AadhMZTUT/4y8UkVGcJv4nG3BlVkhL5y8k1qitKB66wj2Nw9vux1Pn+BNwQxvf655
         RtgrKDQshzOw7abDecJB+mbSgbK/uyGAlsKIpSMZh40/Kt0wrGT3e/h4wn6W24ck8zq9
         bW7YzR5ifW+DKzce1sIufsCnNIqTI17bKyuj4xnWPfWbArLuajGI1WAKFUCj0MM3gb6I
         KvNfoF14JtalU0MS2PSzsSdQMaGYXqLNKRFGta9K2eFYnB3HletSaLWUK1W4SxUbjxFk
         +Sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446169; x=1796050969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8eOO1ST0aXmtMw3eaUAkBoh7IoqMZEQ2tzDQbbldbdY=;
        b=JbXiTMdfKOZMP7x9JYyubxdrTa20Kh+WALR3OagSsXw+p6l2ULedLxJNCKHCMqW1Ko
         7bVycOMEiRWKpzHaKme47pkkmGkDqfjpqqdr16QpjhtwhKcYW8jkjvvcmFZUpQ6F8BcL
         N1bsYQWogRMTNXv4RyQSthP19WDQS8g4Pdo2emvsa0HDNXnuGTkeFI+crK5jUQ1lhACW
         XYfDNP0SLhDAyhInzu7MoHC0lj4Mk3dsb2ccbHNLezD/y0Qk36cNLMcCSHfUJMrLMr5Z
         ylm04Q3WtGCD/WuYEdTeeN5UlGhnthA4XkdnUBpe7u2OATCy1j8fJ68Y3yk+veQNVJZt
         XZNA==
X-Gm-Message-State: APuU4Z+6kEwEX0cqSXQX4n9hOo0231b0EzF+t8Tkkc5fpbyk6D9k+B2H
	fwKAQi3YjjZDuROgs5jSFUvpyq+9JrQbe5SKZ7fAsDSQanoXta+XpZQL
X-Gm-Gg: AZFdTZe6Sk5jqvPNot++uJbzmkJAC8JxcnYWMganYcSrgJBXYvLUPWySXJIgOaNb7T6
	AlbGpYTXS0eB4TmBtP6EF+c20ep6eSL6lEAlc7gI8+kRW9yvltMDmqPNL8EPSi+Hw7GrB8i1Z94
	N/o4IDO1eZtX2b0I/PcM9B/ywa30LG92iB2nLRLeCvGAYc/ChXbHfbn4Nk+C6UcYPM1+8gc/XNi
	grWp8jKqhhddoci2WFBICipGd9LD0KDhdTLKTVBm2uFoUgC5/dLbKw9JK2lbG44Pk9XFQAQyxo8
	U5exPs0HOZGWZeo9COXb9bZlSMh5xFzItpHeTlNJB2mZf7fUntr4OrayNOoBYd29FQb2HTU3nTx
	ycvWQl8hkD+F9J2+0gle4t7lKt3hct4DEQXZIkMjflYasxSuTHiJWgnqn8pTt0xSTrapzLj/g8m
	HKcWOi/3YKKxe19+bjzCZSY7DPt8nj4A6Ah6o6G2ty06KgqkzaP+AGKeDw38Z/xm70aKMZd3no1
	FNJ4IBA2qkenAlU66t2MIeKIvW5xT6wrvBhAK8OGqa1/4wViXMdo6tu2xQCqZRVs2c4IpAB7A2k
	tZrrul7JlS0ne616HOU5m9vCMLE8ArIWpYB7utVHuAO/WnAkBSjaSnfdKB8tyTGLZVLXaZlCxnh
	uqPFc/k27Ww8=
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr574859566b.1.1795446168301;
        Mon, 23 Nov 2026 07:02:48 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 4/5] mfd: max8907: Convert to use device managed poweroff handler
Date: Mon, 23 Nov 2026 17:02:23 +0200
Message-ID: <20261123150224.199601-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
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

Replace devm_register_sys_off_handler() function with the dedicated
devm_register_power_off_handler() helper.

There are no in-kernel users of maxim,system-power-controller property and
all new users will use generic system-power-controller so check for the
legacy property can be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index f1cabb666d8ed..5d17971a8e9ab 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -189,8 +189,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(dev, struct max8907);
 	if (!max8907)
@@ -241,12 +239,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off) {
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
-						    SYS_OFF_PRIO_DEFAULT,
-						    max8907_power_off, max8907);
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
-			return dev_err_probe(dev, ret, "failed to register sys-off handler\n");
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0

