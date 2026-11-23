Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432769;
	b=mH4O7QXpRfEu4cBrwIGvNhzUA25j7asoOLkh74bN0aqv5iRJQWM5yPinCvyCGasbMf7J
	 o/PDp7EqvoI6ZHnvQ6kwCh+c9ViBehW4HC1H27A36hrO5PLr8Z0vIzJZoBNQot7yVqJSU
	 3o7HYJ+i1tZohRgcZqevqPwBTuOAWr1Mp9sVz2C2k3UAUjO4d4NsQ4KxSIh48PLKQNJ5s
	 xT1zcnnx0uOm/0nNzxenLG/+6nrcnU1bg8T780MQRoWes38o8O7qb0nRkf7HQIbetQFVI
	 Ko04j2OQ2eDMKJLPTQDrRCAo09kgPv1s4j4UzfCCUIM94jdkVKDIra3IIX2lg9rnLNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YUXTW8SKxn8Wpo9ruaaiGpQxcX3RyegPc9c7rxFhcBE=;
	b=YHIKb6OwL+0x+d9jJ0Y2gN+9CUP3zX/s9rmf91PUxxSa+NzriZMEu1lUTrDnUX88ygk8
	 HGCNFkJzM+lvmuI06LGDzntVnCCz1OGEfAqzL1yxH7lTf/oUrXUU2ZzXI7DjG4GHGi0q1
	 VwPw359LuAnQhwlFtHbobKS0JT8Y6DG27wiwXN+p/jIBACcCsD0LHIfTsA7TIxFavWJzz
	 +LyvcZoPxZttHbUcIvZFGyRk/XDirKyZjPW7kXdiAPHA9sI61jQO3kvPdY/1AlxEQhLNN
	 DcMjVCJNEQHmKVn0I8fKsqCiMXZdd+dSH3J/JqBEx9ARHogZyJOOXeFnuW7pRtEXNxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="RIN/qcAn";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8895160A2611
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8895160A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RIN/qcAn
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so24079845e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432768; x=1796037568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YUXTW8SKxn8Wpo9ruaaiGpQxcX3RyegPc9c7rxFhcBE=;
        b=RIN/qcAnbXJ2U4KAMVB2wqHkNrR+xA86G/XGZVwdB8PQYxr9AafrMHIt+Dn9kQUxbb
         4Vc58t0AbqpL9qHZRgKSyeNbd11Cu/UhKgiNyh6gWaQ/gloWHbO9fK9ot77+BG2t25ks
         aljLPKlK3sZmVktths0RRQZvLZhmbN0hwZVhjEoPvWZoTN6uuitQFkVd2lbG2lmW2h1W
         dEGXqTQjXRcJYTI5LrE5CfhZXMc/eFpf66zZLGecyrSmRHxx2fZCKX+wFOLiJ64Pjv33
         ZQCyOYaNm+gbbjLuCcXnRGbXeRgtKnMcu2MPq1ilXmoSHNgzLZM6B8X1g/nJdUji58Hu
         szNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432768; x=1796037568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUXTW8SKxn8Wpo9ruaaiGpQxcX3RyegPc9c7rxFhcBE=;
        b=F9apxBHeDjey+BtCqkfnTkoF0GZWAnVmv+HUdQpve1O/SSoZuHmO5XOOYNnGKG/zL1
         ju3W6nCZ41KU8h/3wVHmqBMpNJoH650cy909wHf/W41+m1a8R/V28hJkkrbFXZdshx3o
         AgeZwKTWhjjwDz3YfYprlaMRuiQwGlwdHix3zum79KGhUCt7taBThuEPSSLHBjmQ60UU
         yvyiai+drO9qeDo1eO7SofM+j6FW1sSZp5yu/OmMRM5BDs7nh4juIik7sWsRXPWBbJZX
         v0KP6KXQYn2xIxEmEyRQxrvRngNWkXx/M5lmTZw195Y8zF1lB2ShGJrpM8AQr3hvaNlZ
         Nltg==
X-Forwarded-Encrypted: i=1; AL+hErHcE7qRVek7tp9KnZ+itbdza/TdOA+5Eu9gVngSQj7D5qDvfSe/b9PntmuFVs5PiFpvMIi2/rhL013x4Hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xA4vNDePPDXX0FRWkh4k0L47sVJLYzNoBa3ZjIzQw+O7IwEYr
	ACuT2SmZH+GkTkX0bowQ42fQf6w/BEamKlnoFbtKwgj3uayLJEME2OZ2l8jpK5oPIa/jPKrGjmC
	c9zg5
X-Gm-Gg: AZFdTZfJNfDFTfK46faTzTGBdwz9mNsIKwcZLh5J8jVdahItMt54yydNAcyOSPt0vhp
	NXTBg2/sIpUkN7YccQ+TtzXhiviQgk3jxhPg+jB6RTYs0at4MVSMwFeY/sZw+CgzDYaPcMoccLs
	otq62RPqkQQ1sn6TYdY54bT2bJlIUTzPo0GLVRinLv/yYh+oRTKnglHz2SoeeocJkFWto3ABLyj
	jLtIb9MiD58duUMhfCCvjPoULZPo9K/nkOuEDuO76yWFtsslzbIZLoxEgbmAzjKAOd+A9lPtxZQ
	dAF79dFnBxobTyIEnJzv4yKDnIJEEV8MDizJN7f2bSqUwn0xh75FiVj3CRIbPClWBm5uASfm0T1
	2EkVZh7oB1nEEa9uFtwzo3MHJU1O0yxd87/R2WDW3kfaKsOGTRrW9utltg4AME2ciUpWf9wwrUT
	nVkTEaaUfbI0wCgiE9QL6bD936jXxdU/gHfixt0h1wDnQ6D9FtKwW6GW/bCrSZRJugjQzWd9/7o
	9kZR1i8DAlSWPfzW5jsz4lv0hmISaRUareT6+Y/9euJWwsjYZeVs8DfWI0ERDYXNQbLpbKQHNlv
	7LsCdSohVlWOklXzi9/hYWMYXzI371VXolCM3HHyWvu1QZOFnwSexAXaw40PCa5xWlIt8fCRPfz
	JeaHVWVHnDZvpe58h
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb888236a3mr231635085e9.24.1795432768035;
        Mon, 23 Nov 2026 03:19:28 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb9065744esm147721245e9.1.2026.11.23.03.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:27 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Peter Tyser <ptyser@xes-inc.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 17/17] mfd: Unify style of pci_device_id arrays
Date: Mon, 23 Nov 2026 12:18:15 +0100
Message-ID:  <efe17ff4ceea6df09ff98818c365ad31df11fae3.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5272; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=keSdCWc8b6i5OedMT7cIB7iKQFXYLPvQ+pKYJhooRnk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCEU9dvITQixoFy5IuQcdBWdwHMSh1NIUouiu Y6B38HGAM2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQhFAAKCRCPgPtYfRL+ Tga5CACxrjdW910oA9QbL+KHow6JngPLeLLPpgUbrOS0QCojPhq08gIehBwll/iPPqlVPI4qkJw W8aTRdHt/o7trugWvlPAFXmdUctZ+9DTgD0Xpbf9BF/YTqUEJEZKzppyRalaNqUW+pJtulOLOUe IhO1OTZqpxwpWFMiODFcZyYRvo5uhbN1Uodq/xWATBKejx5W7ru54uZmQD2zZwf7ZiTsxiUY4EB sHcUC4ylklcwQMnf62loePw31FQpqjWTwnGbQoy3PG6vy9UjhP9UxL5lSgSqrOuKfySbdlu2TjN ry6tMTSj7J8tQNk1C8ZSKf5f6FkYOUMCz1nBxLR+fwwHPODq
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the offenders accordingly.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cs5535-mfd.c           | 2 +-
 drivers/mfd/intel_quark_i2c_gpio.c | 4 ++--
 drivers/mfd/ioc3.c                 | 2 +-
 drivers/mfd/janz-cmodio.c          | 2 +-
 drivers/mfd/lpc_ich.c              | 2 +-
 drivers/mfd/rdc321x-southbridge.c  | 2 +-
 drivers/mfd/sm501.c                | 2 +-
 drivers/mfd/timberdale.c           | 2 +-
 drivers/mfd/vx855.c                | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/cs5535-mfd.c b/drivers/mfd/cs5535-mfd.c
index d91d60dc5416..a47f050f27f6 100644
--- a/drivers/mfd/cs5535-mfd.c
+++ b/drivers/mfd/cs5535-mfd.c
@@ -155,7 +155,7 @@ static void cs5535_mfd_remove(struct pci_dev *pdev)
 static const struct pci_device_id cs5535_mfd_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_CS5535_ISA) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CS5536_ISA) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, cs5535_mfd_pci_tbl);
 
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 7f8c16d82738..08dda59b9236 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -148,8 +148,8 @@ static struct mfd_cell intel_quark_mfd_cells[] = {
 };
 
 static const struct pci_device_id intel_quark_mfd_ids[] = {
-	{ PCI_VDEVICE(INTEL, 0x0934), },
-	{},
+	{ PCI_VDEVICE(INTEL, 0x0934) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, intel_quark_mfd_ids);
 
diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index 34e4db8c2226..391477450287 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -662,7 +662,7 @@ static void ioc3_mfd_remove(struct pci_dev *pdev)
 
 static struct pci_device_id ioc3_mfd_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, ioc3_mfd_id_table);
 
diff --git a/drivers/mfd/janz-cmodio.c b/drivers/mfd/janz-cmodio.c
index a0cf86460a23..659b926a0aee 100644
--- a/drivers/mfd/janz-cmodio.c
+++ b/drivers/mfd/janz-cmodio.c
@@ -265,7 +265,7 @@ static const struct pci_device_id cmodio_pci_ids[] = {
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202) },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201) },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, cmodio_pci_ids);
 
diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 783d44355bc3..8e4482c43e0c 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -958,7 +958,7 @@ static const struct pci_device_id lpc_ich_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0xa1c7), .driver_data = LPC_LEWISBURG },
 	{ PCI_VDEVICE(INTEL, 0xa242), .driver_data = LPC_LEWISBURG },
 	{ PCI_VDEVICE(INTEL, 0xa243), .driver_data = LPC_LEWISBURG },
-	{ },			/* End of list */
+	{ }			/* End of list */
 };
 MODULE_DEVICE_TABLE(pci, lpc_ich_ids);
 
diff --git a/drivers/mfd/rdc321x-southbridge.c b/drivers/mfd/rdc321x-southbridge.c
index c44a76285147..9405d9ac9918 100644
--- a/drivers/mfd/rdc321x-southbridge.c
+++ b/drivers/mfd/rdc321x-southbridge.c
@@ -79,7 +79,7 @@ static int rdc321x_sb_probe(struct pci_dev *pdev,
 
 static const struct pci_device_id rdc321x_sb_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_RDC, PCI_DEVICE_ID_RDC_R6030) },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, rdc321x_sb_table);
 
diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index d1a27fef79a5..e84009e596f3 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1642,7 +1642,7 @@ static void sm501_plat_remove(struct platform_device *dev)
 
 static const struct pci_device_id sm501_pci_tbl[] = {
 	{ PCI_DEVICE(0x126f, 0x0501) },
-	{ },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, sm501_pci_tbl);
diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index e75e1d6851ab..adf7a7ead3b6 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -845,7 +845,7 @@ static void timb_remove(struct pci_dev *dev)
 
 static const struct pci_device_id timberdale_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_TIMB, PCI_DEVICE_ID_TIMB) },
-	{ 0 }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, timberdale_pci_tbl);
 
diff --git a/drivers/mfd/vx855.c b/drivers/mfd/vx855.c
index 985f81c1739c..623735be62ad 100644
--- a/drivers/mfd/vx855.c
+++ b/drivers/mfd/vx855.c
@@ -105,7 +105,7 @@ static void vx855_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id vx855_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_VX855) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, vx855_pci_tbl);
 
-- 
2.47.3

