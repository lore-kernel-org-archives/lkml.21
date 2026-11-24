Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515070;
	b=sKBjjhtEw7kixBKZgP2NLgasBUgDp2gyuAoJFiqas6SrvkKvWQkvr5NwM2yBeaDoyy7H
	 8OLpiNwpBlxPvLctSwoceNqqffv8qYN/qdcoxng7zUH9nFUnwALUqiMN6h17cRoWgxOli
	 CPkOk84gH5jT4mCSMsHwjDNBek/g2bjG43C9SOH6Iuv+KWCHYQQ/Cc+EthZb7qCoOXBig
	 WM8NnAT7mL6bnMuWVEmd5rM35YEryEbqPJogDLH9D48CWGnyILn5ADk/qnRv9CGxWd5Da
	 /Xm7x4KKGn+2Xj2HgmNY7f4oUmO1nC5QoINBkDoVizusJpn4J1K5WP26pl3ghjohGnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8LzBCOLhNJ/F4/5I+BBpSJLxAOQbmQSfZhjMSBmDwl0=;
	b=Gne52S/GoZ6ulCN6bxzUQY0PW3zJ4mG1TJtVh9i7kmyYXN05ewCo+LUJH1awd9irEhcA
	 vo6CVKZ7YITJBJYN+iRy+Z0rN5CLCwv6dKOo0uqWMRIHgvwjaokjpnk1V2gSYLMkGkdY0
	 a4A9E+DMeHJb1FxcVCsahUGY5w+cPocMg63IwHEsLtrOpK/wMl5dcHXkRJ7O16NT822sL
	 AMiQKpxfJ4sjLYPB5rITQv4bgLqgsUUwqJFpGjCDKN7eZO3PL5ay4xh46GmtyB8Wbv57b
	 OMcb3rf/8B+DgT0cRhdLnNknvK+Pv3ooj8Sj5IvIh7Pk/5hXeQe5daV20vfeNjLxgrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lny6vb5w;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88606606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88606606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lny6vb5w
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f0918f9e6cso7999005ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795515070; x=1796119870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LzBCOLhNJ/F4/5I+BBpSJLxAOQbmQSfZhjMSBmDwl0=;
        b=Lny6vb5wrWwMhZUdnN8hlCF8ORcEMD85thGQm2nYx/wH94Q96b13rnVRmOaCgtmzma
         +OhNchu9zljtD1f9WIH7Roi5sZ513hx6PJr6J9p9VaokRB0BPCYEUSRWujNivnQ80qqu
         vb5ppEbk7seUA/0bQnw1FIjHgBMvr2EoMHqv90TLbSesyd8ihvsRj2w52lWtIZP8qoUX
         PPACXh8NB/5R19HqP5uCmtnzgAdvZWWGdNsimnBVeq9Dyk+OaMETDHyDX8Ywg0VpsLc7
         cBKxj5hPv1XST6cFOS+ZQK6ko8Aq1nj/QcalUSKHzf4wgvJ87id6m2q139orUnoebmj5
         wBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515070; x=1796119870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LzBCOLhNJ/F4/5I+BBpSJLxAOQbmQSfZhjMSBmDwl0=;
        b=io2z0s3vDSr7D8Eptnq/Af1Gm7YzUzI/9ZQToewv+N5BCo1Un9/Lfo8qcDqdn0sUhW
         5kWzFs3nY+048hf/lutzRfgRdvIVqink2xdmr5fmpzkdOvRgj4ThhxbeNWAqRXu4m+7M
         5IrpLHJqwFE8QzWDfLhHj6eQ1jw552A5UHLNwd2lRXJ6IavcW4CHb3PLVAm29N80wHqH
         63ex4/1yOFSaD+p9JaksderISQ+OC4b/hdi0kvZ/CgPYM9psfAekFCEtKDGeJ1H/iGRO
         VzkdoA1qKkVxeqjn9dlR+ZhEAv22BIn9eOvyjujWD4Jh+0xv5rlQpYYUJzGHJCyV97f7
         Aurw==
X-Forwarded-Encrypted: i=1; AL+hErFisYc5xTLy5Wup3NtGORRzEMUX2PR9RnN38u9k7L1x3Za/BgQrVdasPcpddLJIX0dh8JJjAsaQrLDB8bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NBltUiKpHKOXkqcsSiRLN/17iEKdW37p02PNLmRFtrFdfj5Cf
	H7dkCqmn1zxand3S9FcO5auJmeNFDE6ANEAXymR/8NVeIBxovYFkTkqz
X-Gm-Gg: AZFdTZf3ds31tAqzltxckbI2rxkAamm9z8i095LBHF6J7meTO284TiQrCguZl950O2D
	WT3oTbaBpHYmyU2iM2htEhlEZWPun5YyEDC1Jge6lo8h7++sZZRDpSkKRapKqKyD+zUorMrPS2z
	GFDRS7dF4a0b5TtuGWU8jMiSgDlLc+YtYNxO5/8pioajtbEOUO4lTX7KJHyGH5gP3Mj5M5ALaGh
	x0em4FtTkaYP7P1UdMMycOXg0ST0AHh2MEKwGwsaryha1WFv3KpEIr7Ai1mgPs8b0aWfaveZYEw
	FYihJPFYAf4rSFu1kpUmOTc6GemmdnBV4RFGrf3i0bNo7m/XQa5gbCUMzcvIBtu7ApjJzJakoFH
	wUdph7+6Djb2sWBn8WXLXAjjsOmh6Ea8ukXvMEwvmCtYJorbUFJrK/c26L3KHKn0cXFndHXCkQV
	EP6zmA21SVZDRbMbTGzPnMIGkU1iPEc1nhWHq9oQbuBdeJ+KfyFcj/z1lQCWYxjJ8mni8zbivoR
	6vPeci95tW+x20eMjq2pajTSF7ebyAzb7u/yfuzO7kvtZF68gsiQXnnQQQq85LO4FrBl2auWsCT
	XXd5EatsfFtIG5qkNwPch8ghSUd32/Mmv4BtBnHyronBXs4=
X-Received: by 2002:a17:903:acb:b0:2f0:25ea:8fb7 with SMTP id d9443c01a7336-2f03f0c19f1mr124505295ad.3.1795515069885;
        Tue, 24 Nov 2026 02:11:09 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f102fc4sm66693175ad.43.2026.11.24.02.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:11:09 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: flash: tps6131x: put the LED child node reference
Date: Tue, 24 Nov 2026 17:11:02 +0700
Message-Id: <20261124101102.3884922-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

tps6131x_parse_node() gets the LED child node with
device_get_next_child_node(), which takes a reference. The driver never
drops it, so the reference is leaked on every probe error and after
remove().

Drop it with a device managed action registered right after the node is
taken, as leds-tps6105x does.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: b338a2ae9b31 ("leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-tps6131x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
index 7f2c3895e6e9..56de7a1cf9a7 100644
--- a/drivers/leds/flash/leds-tps6131x.c
+++ b/drivers/leds/flash/leds-tps6131x.c
@@ -529,6 +529,11 @@ static const struct led_flash_ops flash_ops = {
 	.fault_get = tps6131x_flash_fault_get,
 };
 
+static void tps6131x_led_node_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int tps6131x_parse_node(struct tps6131x *tps6131x)
 {
 	const struct tps6131x_timer_config *timer_config;
@@ -550,6 +555,10 @@ static int tps6131x_parse_node(struct tps6131x *tps6131x)
 		return -EINVAL;
 	}
 
+	ret = devm_add_action_or_reset(dev, tps6131x_led_node_put, tps6131x->led_node);
+	if (ret)
+		return ret;
+
 	num_channels = fwnode_property_count_u32(tps6131x->led_node, "led-sources");
 	if (num_channels <= 0) {
 		dev_err(dev, "Failed to read led-sources property\n");
-- 
2.25.1

