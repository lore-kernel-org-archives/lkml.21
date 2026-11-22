Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333642;
	b=BLomhTJYO89BDqebv/JvY5SmuPGEZOv83iiw0I3TjiGoldqGsiAao1GRKREZyJpSYBp5
	 WyQsQ9GlmFyRtukF0qSLOBtHv8omUdb/WZr/X8lym3P8Wvb2LHenaPDSJ6QBTD7ptmC3T
	 psbEzh6bXhpBybbtFIN+7CLDWu8LhTnEBtpDKjlB+JN3hRehxW5nIXgj2O8fmBUG/5DGb
	 BL8jjhHqNzry8YeFPiNbew/Eg+RQQb98yS9sXLbiwDOzM4F40SbnurJhAkDyZbmczk/he
	 BdgugLF4qZgAmyk2N9+3VsmpNIScXzBlcRNPBWe/jwT77aIIW89tTS+ueAOfhLZf8kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oLtriKjTvSSHrsef7Np3jMgnZ+Hl7Owr5a+y0JpAEig=;
	b=KQUlj3NAnuE8zyx98dm7V3ONarBd6DGkFnZRVw4ytAcJsnpu9WjYc7+/tS3MlCyBdmtr
	 YP3WzYveS0KYK9wVn8LQRp82/ym1MblN48/6eIkAwl1DJvYf3tRbOmjYBDS/CrVq+FJJZ
	 ZJEMlsdPFzkrxNCGjhG+OOrpQxCDXcQZcSnzUSivK1ogpBeaJxRixuhn6YkBm1RdIpP/M
	 nKAbQwAeB8R1ZHlZgNhT7HT2B9RZOHEfGojZU+DuF68w+JogSBJtvEao8+6ZKkc1shmcM
	 I7z3BqYEBpSGpcD12aK9LWxv6UmFiyz1Xf26Tfmt9CN1ZO1CX4kxnxfHAOtR6Nf11eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNVYmQ3S;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EDD606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8EDD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNVYmQ3S
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3863db981d4so2827077eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333641; x=1795938441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLtriKjTvSSHrsef7Np3jMgnZ+Hl7Owr5a+y0JpAEig=;
        b=TNVYmQ3SDqwJx6bSFOPl/W3yucay7l3pdptwu2FB5QtcNSs83X1Ux7nb15tBWU06/6
         +W72iuM4iMScP0sKoPp8oENIxpoiIR1Dz1ZFqneheElACCo2sjBKlGSWR3xUAYvC5YjQ
         GTdtgdVCqRQQgS6X4XxJ03ER6avZMvjo3jmvfRV0bUJo63OsC5heIqQrxyn5GdIVWdCr
         /He6Fcu7RKmAKvsfOcwN+ALIxr4AoEVGe0zuy8BBJbt/DxdhYmMQNoHNwrfuwfB1fbva
         n1A1YM711sUfjZOYE8vPNYV/wOIhOVIr2CSQtan0wAliVpTZbvY17LVYHfssA9bOfTja
         xfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333641; x=1795938441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLtriKjTvSSHrsef7Np3jMgnZ+Hl7Owr5a+y0JpAEig=;
        b=C5fuJmCiAN6c3hDJjuAet565r/0p3cOI6b+9SIOX6xoVoJ7SbqR878+IuSTkZCpv7o
         v/A1+MqUqCEAgX5zivSF0+vKASROaH/szKwEpr/9IUV+tcY9HWe2rwW5HpVZa3sY6qFm
         vjCnQfkUJHJEAbVlPbvongEciQcSwwj6Dt0I6U9VXJULKp079RnbbIfS/g7J9LjKjqCc
         4+L11Mea9MXtHe/iPS+BpfTfR8uRPZSKPxxTRDBYDZeJGxd5WCVw5Gt0VjBDEVHKDiio
         zQIbGic8VqHFaQJGM3SxNP+mIFjv1lVnO4wLeqSEVgQbkvvJaQkwjspFrhvrpvaimQ3Q
         xZuw==
X-Forwarded-Encrypted: i=1; AL+hErHp49r5btd/p+f1PtOJXQMjNEbcE4rCwxg4hcKWg7Cimh5dtixANZz6wjcSZD8oMzlxE8OpPQTVuU1RaZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qm0gvMP8WJfIN85pSlKKKjHHYtTLOufIw3KPvhpOMLySWEsHV
	Owq/EkzCxwS8qnU5YKxrUgoJTlqHdLhzWHhG4ZEsPKA0kZhQvRIQ7ccs
X-Gm-Gg: AZFdTZfQ43x207uU49cZRt7vi+uV+0U5q0QDt4GnWN5SU7GL4ot6By31utbcuvf12HU
	mj+BtBNaI1PgpNVpdROVz+gqLbTBB+9ft3B50NfrlhJ9neW46ixrp6WhhybfWsWnWrx+VQUkiUS
	TZD+D/ZW23cnG7zLWN5c2rGCZzPGD/l0n+N0nh32QN7+AiDoRwd5yQq/uz7MH6AlVHNUyZk4NMs
	q6K7ujguYshgPi2mO3WDOlMO3Fc6bvAntXaP0d28B42N3CzeUMJEKHgNewQaxlL1wXHGLwDMgfu
	yyNWlf2F8MxmGEft1cjoImPzpjcWqhnRhqMWjt9BqZs0bB/FXaSGVuDRv+iPeWSt0W1NmglRKQF
	lBxiVOLAJYSG6QZGAk+GREZz3XqWCU6xlvtoKTwAi8IbWalAnjMTw4/caOQJYG/cQwg5KWibqyP
	/JP4K1RDvt/BHe8JXzrR+N9gc6HvQIqb9h3FKHrFpyVLQPrbeeeZJBAp6bSwyLdlQvQnU1rqq62
	lSqfv6uyIH2GdscmUVNGIjqelvU7jQS84Ys2/LQ3g4hwxrXjbCRlM8YDjFXLOieKQsyJuO6QySO
	nGflxlai3KVB7qCdtV2NK1KFw3rZBI87qpKXcVN/Q6+5dXo4JwiaEoiMwpfBva3tB16PxJITUzF
	XoJ0Nn43mrcrPr8a6uMa3L02jOcAKPA+MWLlqqA0D4wo0CrsvkvLWpz8LjjE+OqFcVJfpnPfjJV
	lvf8xbEDijGn9uXijUvdXGB6mFT4Aktb5j562XqWH9BA==
X-Received: by 2002:a05:7300:ff49:b0:36e:b05e:9a74 with SMTP id 5a478bee46e88-38570c30013mr7138252eec.30.1795333640975;
        Sat, 21 Nov 2026 23:47:20 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm24898071eec.9.2026.11.21.23.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:47:20 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 4/6] iio: proximity: sx9360: fix hardware gain encoding
Date: Sun, 22 Nov 2026 13:16:44 +0530
Message-ID: <20261122074649.239441-5-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122074649.239441-1-kapoorarnav43@gmail.com>
References: <20261122074649.239441-1-kapoorarnav43@gmail.com>
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

The sx9360 PROX_CTRL0 gain handling was copied from the original sx9324
driver and has the same bug that commit 108e4d4de2b5
("iio:proximity:sx9324: Fix hardware gain read/write") fixed there:

  - The gain field holds ilog2(<gain>) + 1, with 0 reserved, so a gain
    of 1 is 0x1 and a gain of 8 is 0x4. read_gain() and write_gain()
    use ilog2(<gain>) instead, so every gain is off by one: writing 1
    programs the reserved code 0 and writing 8 programs a gain of 4.
  - SX9360_REG_PROX_CTRL0_GAIN_1 is 0x80, which sets the reserved bit 7
    and leaves the gain field at the reserved code 0, instead of
    0x1 << 3.

Semtech's own SX9360 driver (shipped in Samsung Galaxy kernels) decodes
the field the same way, codes 1..4 as x1..x8 and 0, 5..7 as reserved,
and programs 0x09 (gain x1, bit 7 clear) into both PROX_CTRL0
registers.

Use the same encoding as sx9324: add one when writing, subtract one
when reading, return -EINVAL for the reserved codes on read, and build
the default with FIELD_PREP_CONST(). SX9360_REG_PROX_CTRL0_GAIN_8 used
by the range check in write_gain() becomes 0x4 accordingly.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Link: https://github.com/TeamWin/android_kernel_samsung_d2q/blob/master/drivers/sensors/sx9360.c
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index d102e20d4084..9ba967a33c98 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -64,8 +64,9 @@
 #define SX9360_REG_PROX_CTRL0_PHR	0x40
 #define SX9360_REG_PROX_CTRL0_PHM	0x41
 #define SX9360_REG_PROX_CTRL0_GAIN_MASK	GENMASK(5, 3)
-#define SX9360_REG_PROX_CTRL0_GAIN_1		0x80
-#define SX9360_REG_PROX_CTRL0_GAIN_8		0x3
+#define SX9360_REG_PROX_CTRL0_GAIN_RSVD		0x0
+#define SX9360_REG_PROX_CTRL0_GAIN_1		0x1
+#define SX9360_REG_PROX_CTRL0_GAIN_8		0x4
 #define SX9360_REG_PROX_CTRL0_RAWFILT_MASK	GENMASK(2, 0)
 #define SX9360_REG_PROX_CTRL0_RAWFILT_1P50	0x01
 #define SX9360_REG_PROX_CTRL1		0x42
@@ -289,7 +290,12 @@ static int sx9360_read_gain(struct sx_common_data *data,
 	if (ret)
 		return ret;
 
-	*val = 1 << FIELD_GET(SX9360_REG_PROX_CTRL0_GAIN_MASK, regval);
+	regval = FIELD_GET(SX9360_REG_PROX_CTRL0_GAIN_MASK, regval);
+	if (regval == SX9360_REG_PROX_CTRL0_GAIN_RSVD ||
+	    regval > SX9360_REG_PROX_CTRL0_GAIN_8)
+		return -EINVAL;
+
+	*val = BIT(regval - 1);
 
 	return IIO_VAL_INT;
 }
@@ -612,7 +618,7 @@ static int sx9360_write_gain(struct sx_common_data *data,
 	if (val <= 0)
 		return -ERANGE;
 
-	gain = ilog2(val);
+	gain = ilog2(val) + 1;
 	if (gain > SX9360_REG_PROX_CTRL0_GAIN_8)
 		return -ERANGE;
 
@@ -663,9 +669,11 @@ static const struct sx_common_reg_default sx9360_default_regs[] = {
 	{ SX9360_REG_AFE_PARAM1_PHM, SX9360_REG_AFE_PARAM1_AGAIN_PHM_6PF |
 		SX9360_REG_AFE_PARAM1_FREQ_83_33HZ, "afe_param1_phm" },
 
-	{ SX9360_REG_PROX_CTRL0_PHR, SX9360_REG_PROX_CTRL0_GAIN_1 |
+	{ SX9360_REG_PROX_CTRL0_PHR,
+		FIELD_PREP_CONST(SX9360_REG_PROX_CTRL0_GAIN_MASK, SX9360_REG_PROX_CTRL0_GAIN_1) |
 		SX9360_REG_PROX_CTRL0_RAWFILT_1P50, "prox_ctrl0_phr" },
-	{ SX9360_REG_PROX_CTRL0_PHM, SX9360_REG_PROX_CTRL0_GAIN_1 |
+	{ SX9360_REG_PROX_CTRL0_PHM,
+		FIELD_PREP_CONST(SX9360_REG_PROX_CTRL0_GAIN_MASK, SX9360_REG_PROX_CTRL0_GAIN_1) |
 		SX9360_REG_PROX_CTRL0_RAWFILT_1P50, "prox_ctrl0_phm" },
 	{ SX9360_REG_PROX_CTRL1, SX9360_REG_PROX_CTRL1_AVGNEG_THRESH_16K, "prox_ctrl1" },
 	{ SX9360_REG_PROX_CTRL2, SX9360_REG_PROX_CTRL2_AVGDEB_2SAMPLES |
-- 
2.53.0

