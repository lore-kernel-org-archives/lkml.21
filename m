Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776362;
	b=maMqXr1GAncBrdp77445u1VWbIoG1gzAYf5gv0psX7wA6eWyJG0YMmSWpgBJk1FyXngY
	 KvbrlVB1c6UklXDdhmJAIeDTuNJ9TOQHWaMMi2Dh1Q235BkS2kUobgzjqmMtJd2sgyzV4
	 g1O1BMEyaPTN9BhSKTXryXf3D9biO14nonKPMA2ogbD+2tq5qnwmV4pscP7HBXHid4QGp
	 I9ToGdQAynJXchUuEijisB9DoTNKa9/hVvEKxxRsnv4Dck6krtElTISgBJgOunuB5XA7/
	 dR9QqCz0CvThue5NkdTQa2xFvPc/4MugiSD8kAbAemIS+c0vuXg6529SsYxw10zlEaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=ZhKYlXDI3JwUFTWXo3DFbUGXJbLoPH6SPe1fLoK7eR4=;
	b=ywExQGm6Dw2ffxk+zVK/1zckzRKUkKWOySfMRLzVNXgmDun/0U5rsdOgSiclYfrJNBYP
	 5ZeiKghbZ3abnTEMHSnXuLBtan7rzljg2zDfWL1zsN3W9xItIZ9JXHMGh2+mBq54Bqb2h
	 Rit+aMzafUMUA2u7+l2C6qsQ0cgr2+JWXwWhk5Td6fetiQ/AV89vOiP9qVgf1ssI1bDK3
	 lL4A2IY+x82IihIzsDCpVaP5BrkMJW4xu19LEZV5RFK5+HtxV9fCv1x2o6bYamNs9Pd6r
	 SEaaePDiDifJS/yxRqCjYzNTbHvw7YgX/S5tVZdzTV+YFxIiNczvn+fjZdt0D10om3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lxBqdHlF;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F7D606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F7D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lxBqdHlF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so7255646f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795776360; x=1796381160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhKYlXDI3JwUFTWXo3DFbUGXJbLoPH6SPe1fLoK7eR4=;
        b=lxBqdHlFM7q8/VS9/ubScPFUzGlN++LvG6wDHoI4OaVnczXTEPG1SHx1DQbjBm0hhc
         RUUbj6zUv7d+2sBLyHRkwSyw/D71jnQs8WmA/xZYXiBmr8FG8f6XPUwcd/tE1l2GOh+y
         Yr+G+jYgMgEueUVhXLJNBVnwdd53xtFt6Iw66gtaiodOaoz97P8ouXVYXv1pyKWlOKZp
         mso7GLN2ODh/nGUktV4InGA2g4mpqniYR/EtQ54rmlO+YfF6bF5vWpQMxlE2bUrQRttY
         2RPCg1+NEmOqA4Eb/Vu1pkYbUYlReSMQnFEkL5Fn+MhCIq5QZ/+sdVUXn3JmPkHbEIBX
         RmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776360; x=1796381160;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZhKYlXDI3JwUFTWXo3DFbUGXJbLoPH6SPe1fLoK7eR4=;
        b=Eop7g2vcjHdadTfURCu8NQ24vBo2/oTrwit5RX/RZMI9RtpvMrcUjvXiEUgfrJ9zkG
         3C35Hrg6oltwxkYvVKf0m2W5pZxi1LFyS4eo4aW3ffD5rGeqWVhnIpbIRk7fXdrgzr2v
         TriSNREXxRSsKtDZusjei33XpR+IhJSLNyx/UvJLNv6fl2in6isspQf4LCTzDYMPHjt5
         4xsHFOkWrvpoWuZYcWjmVkL5/4Ylf6o7AqWMS2sQz6IjBpTP32ThRSbeukgIwT80uC1E
         dyY8pVpRz1Gpk2fg/RKMmDAVIe8L0Xd77TejieFnpJcqwdIEEEXBC9kv79pmAGeHgPgg
         aTnw==
X-Forwarded-Encrypted: i=1; AL+hErHme0CRhg9DyCXKTj8ueBxgw388t/Ln8WUI0egE4hj+mf/+A1DWqY+SgQVVBK/unDe4vTbfexlHCIWED4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rc1bG8+YkI8OtGURrD/3TU5ZEUt8HT2UZf8Etwbm4F6Z1+svM
	hmGXBJWZYkzgv5XtFhTwQdb0jdFN+qYLZHHzrH5aO/t1vXPDinCbgN90sJHuidTsuUs=
X-Gm-Gg: AZFdTZfEblAeN1UjjW1Mry0Fgg+OhUu0yuspqisr0lq3r6BOXcCnRy3BoR2wKXQ0xJZ
	KazRGXPKJ7AWx9gJnG1Ezl2dA0SmaZ4mqexlb9AREqg218Q7luSqJX/FTCEFI2TDGUgoAzzZea2
	voD9URPg7YYYNJSkqVSeZrgZm6jBgumhpyix0tdRNlukzeGjfIexSalarYQjrQL+mmd4DVe0zhV
	M/ZDA9hukqdAY1+U9fQs61evfq83VwVXsOH2cxEKSr1FtBkACetBIwVGC4rQAofNrflFpn14HYH
	59O2b9X0T3TGR5vEYQgz+ZMwE6sJnO1zl7bQrA5LAp6RI6nK2gZyyrtKKhWX42K1UpQYqfUx4bY
	jXuGrO4gTQsyPmTIRb7oPxCQTYM5rUGp0h6n6k+c/SyS/hX4tcvG1G978Q+zlmpJVnSQy6xmiF8
	reLjb+SuSst6owFHG9SzJaExlP+494Z1VeR06sJiLxCcB83FuWheY8I0jHpKDaUGFZ2QLoxu8us
	RtSZcYZvzvFouTUK0m/XFloExTfp8HDXoFeReGR/dNlZUzjcfgrj+rBzYaJ64x9E0QtPf9nJ0Ws
	mPEynLGcG826kETAnhLWMSrDkqU4EQMRSuVbeW44m0CnunSoyhedf9farA3IPaSM+LB0RoUaR+P
	TiXABXP93L448c7Hm
X-Received: by 2002:a05:6000:4812:b0:4a9:be75:8645 with SMTP id ffacd0b85a97d-4abb70d711dmr42846705f8f.30.1795776360407;
        Fri, 27 Nov 2026 02:46:00 -0800 (PST)
Received: from localhost (p200300f65f044d084f6d53af9d755e3a.dip0.t-ipconnect.de. [2003:f6:5f04:4d08:4f6d:53af:9d75:5e3a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4b70c05b9desm22100803f8f.54.2026.11.27.02.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:45:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Robin van der Gracht <robin@protonic.nl>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Randy Dunlap <rdunlap@infradead.org>,
	Wang Jun <1742789905@qq.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] auxdisplay: Use designated initializers for arrays of i2c_device_data
Date: Fri, 27 Nov 2026 11:45:51 +0100
Message-ID:  <45e66776a1cb0fa54d1606b856887abe7e826ae6.1795776138.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5206; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Xxjz3d8nrfRElfLSwa7jKprqhTts1mvXKnYqvVVj+Mc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhmzO+HiDz0vbox4/4xH6kfFrwje3pIUqZrOPxXLq1zdnr 2/Y4cvfyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBE3PXZfzH19XH93b/dN+FJ aORfn0kiXyV+au+YpC9x7E6IRGj11Hsm4jJaT2d9rWzfkSrJMbfVpKTcfM5+D1Oni0rFH2t6Xsx RM16u7DFB9qS+hqKEnMPejMLV9k2LtL6Ft7f++ZTKO5F7x6S2cJOY/d1H5u6xD7vH5sfQ48k2bZ JxllXiiqOfUlwjsnYfz2bd+v5SjX8ZE+fM0CeWsdqFtcyVQZpzVskutUzLMjU0XcIZuP7snVmP2 KNa516tCe1z0311Zt7lF4rtFmJXeQrOCMTu425zPlgt9Wcb55efnu4L/956N3OlhZanZRT7EbEd 1W33fwj7d/Sp2mlLiEQvqTfdev1YFWOb0dE7SQn5GzIB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using designated initializers allows to more
easily see which members of the structs are assigned which value without
having to lookup the declaration of the struct. And it's also more
robust against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned change to i2c_device_id is the following:

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {

	 struct i2c_device_id {
		char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

	diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
	index 0123ca8157a8..dfb0b07500a7 100644
	--- a/drivers/regulator/ad5398.c
	+++ b/drivers/regulator/ad5398.c
	@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
	 static const struct ad5398_current_data_format df_10_4_120 = {10, 4, 0, 120000};

	 static const struct i2c_device_id ad5398_id[] = {
	-	{ .name = "ad5398", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	-	{ .name = "ad5821", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	+	{ .name = "ad5398", .driver_data_ptr = &df_10_4_120 },
	+	{ .name = "ad5821", .driver_data_ptr = &df_10_4_120 },
	 	{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, ad5398_id);
	@@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client *client)
	 	struct regulator_init_data *init_data = dev_get_platdata(&client->dev);
	 	struct regulator_config config = { };
	 	struct ad5398_chip_info *chip;
	-	const struct ad5398_current_data_format *df =
	-	                (struct ad5398_current_data_format *)id->driver_data;
	+	const struct ad5398_current_data_format *df = id->driver_data;

	 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
	 	if (!chip)

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that. (I didn't find an auxdisplay driver that benefits,
so this is "only" a regulator driver example.)

There are no further changes necessary to drivers below
drivers/auxdisplay for other similar changes to other *_device_id.

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

Best regards
Uwe

[1] https://cheri-alliance.org/discover-cheri/
    https://lwn.net/Articles/1037974/

 drivers/auxdisplay/ht16k33.c | 6 +++---
 drivers/auxdisplay/lcd2s.c   | 2 +-
 drivers/auxdisplay/max6959.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 83dee9f8a8a5..ba70c8ef0dd5 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -742,9 +742,9 @@ static void ht16k33_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ht16k33_i2c_match[] = {
-	{ "3108", DISP_QUAD_7SEG },
-	{ "3130", DISP_QUAD_14SEG },
-	{ "ht16k33", DISP_MATRIX },
+	{ .name = "3108", .driver_data = DISP_QUAD_7SEG },
+	{ .name = "3130", .driver_data = DISP_QUAD_14SEG },
+	{ .name = "ht16k33", .driver_data = DISP_MATRIX },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ht16k33_i2c_match);
diff --git a/drivers/auxdisplay/lcd2s.c b/drivers/auxdisplay/lcd2s.c
index 7b65f4306fae..f198208e4531 100644
--- a/drivers/auxdisplay/lcd2s.c
+++ b/drivers/auxdisplay/lcd2s.c
@@ -354,7 +354,7 @@ static void lcd2s_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id lcd2s_i2c_id[] = {
-	{ "lcd2s" },
+	{ .name = "lcd2s" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lcd2s_i2c_id);
diff --git a/drivers/auxdisplay/max6959.c b/drivers/auxdisplay/max6959.c
index c31341637515..035aded09991 100644
--- a/drivers/auxdisplay/max6959.c
+++ b/drivers/auxdisplay/max6959.c
@@ -161,7 +161,7 @@ static int max6959_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(max6959_pm_ops, max6959_suspend, max6959_resume);
 
 static const struct i2c_device_id max6959_i2c_id[] = {
-	{ "max6959" },
+	{ .name = "max6959" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max6959_i2c_id);

base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.47.3

