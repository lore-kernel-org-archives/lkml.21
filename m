Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265086;
	b=vavl9/PgqlV9CHvSbA3ArFDHWPVGDZaskWsjJDnCGzhklLYE1ISob0LutdKY6F6Yzo+O
	 rLrRW5zaTlxt40HBKS5MsLaKjURLLVkBfrbJsh5yfE0X8t80tCJtYAEwVCGbqEe8HGdsq
	 AIfimzJnTfBnXOyFyCnEkSHDcYSlX3CY6Rt3mBA9NQlOFaO1jwWxxboEP1oXwuE/1CS0g
	 dPh7tYf6yYtGOqBbEwbV4hAFiCyfIyUKBfvsIZRDRJha27ZXt+C8MW8ozFS34qUVGDPIr
	 R2+KDoayoFqA8LSfzmKYvKmGAALpz7j9oiAbXapwbEmuqQ66/uZ3ATnOEHNJuu1165Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265086;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Ju2BXwccP9syBqQMdgnQHqvrtqMLj05bAyauqWyrjrc=;
	b=FDiWUqf98+ZdrrlaKY5+CLh0yxtdCVBz3fn0LSewrgVGsY7InmSd5xdkfP6QxIBVmeHv
	 d/I/5cyP9YMlv5IkbKyQhICa21PEIVSs/euo/cj3Np1NPyAL7onuy+WrLB0VFLjg9oatJ
	 D7ijrq+iWUphaauMPIxXc7PUoeyhV874RDjwNQR1wluElaRgtbZsa1t1eg6XFR3QJXiUq
	 WvodTIB8ei0JFWHhoZePmZGKysIRhRtz8jPKFHaJ+gLb0M0rTxtReBqTnaIK+kTrjXJXd
	 XTpXUG3IxibISGDidZ4RCAdj8cO1asVSZn8X/2EiPEgpwY46ultjOi8TUbcDg4ir0PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bU9wLUB4;
	arc=none smtp.remote-ip=91.218.175.227
Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680B0606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680B0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bU9wLUB4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DQrheEy5+ObfvndJOk4fyT/8v3NAxQkFe2IZ7mZ0vQ4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795265083; v=1; x=1795869883;
 b=bU9wLUB48UjABpzJwphWFt04QX1xerkjX9r39BavEiwJ0CQzy46xkEBDagVxLy0Zr5ZV8iCs
 xi4I9bA0kswkN30rfGRJ9YjGONTBoFWdiQv7Te42yiceHeW6O2TuLnk50P1vnbWVylIwx1OOqUL
 9e7+zN8iTQLx1+52285+J3Zw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dcbc891ec8d23f4e;
	Sat, 21 Nov 2026 12:44:43 +0000
X-Mizu-Trace-ID: dcbc891ec8d23f4e
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 21 Nov 2026 20:44:21 +0800
Subject: [PATCH 3/3] regmap: kunit: add test for regmap_bus::init_limits
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-regmap-improve-2nd-v1-3-6b5fd59451ed@nxp.com>
References: <20261121-regmap-improve-2nd-v1-0-6b5fd59451ed@nxp.com>
In-Reply-To: <20261121-regmap-improve-2nd-v1-0-6b5fd59451ed@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

Add coverage for the optional regmap_bus::init_limits() callback. The
test bus lowers the raw I/O limits and relies on raw register defaults so
that regcache_hw_init() reads from the device during map initialization.
The readback must be split according to the limits set by the callback,
which also verifies that __regmap_init() invokes the callback before
regcache_init().

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-kunit.c | 91 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/base/regmap/regmap-kunit.c b/drivers/base/regmap/regmap-kunit.c
index c948219f46a3..75c251132c89 100644
--- a/drivers/base/regmap/regmap-kunit.c
+++ b/drivers/base/regmap/regmap-kunit.c
@@ -2247,6 +2247,96 @@ static void raw_ranges(struct kunit *test)
 	}
 }
 
+#define TEST_INIT_LIMITS_REGS 16
+#define TEST_INIT_LIMITS_MAX_RAW 4
+
+struct test_init_limits_data {
+	int num_reads;
+	size_t read_sizes[TEST_INIT_LIMITS_REGS];
+};
+
+static void test_init_limits_bus_init_limits(void *context,
+					     const struct regmap_config *config,
+					     size_t *max_raw_read,
+					     size_t *max_raw_write)
+{
+	*max_raw_read = TEST_INIT_LIMITS_MAX_RAW;
+	*max_raw_write = TEST_INIT_LIMITS_MAX_RAW;
+}
+
+static int test_init_limits_bus_read(void *context, const void *reg_buf,
+				     size_t reg_size, void *val_buf,
+				     size_t val_size)
+{
+	struct test_init_limits_data *data = context;
+
+	if (data->num_reads < ARRAY_SIZE(data->read_sizes))
+		data->read_sizes[data->num_reads] = val_size;
+	data->num_reads++;
+
+	memset(val_buf, 0, val_size);
+
+	return 0;
+}
+
+static int test_init_limits_bus_write(void *context, const void *data,
+				      size_t count)
+{
+	return 0;
+}
+
+static const struct regmap_bus test_init_limits_bus = {
+	.read = test_init_limits_bus_read,
+	.write = test_init_limits_bus_write,
+	.init_limits = test_init_limits_bus_init_limits,
+};
+
+static const struct regmap_config test_init_limits_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = TEST_INIT_LIMITS_REGS - 1,
+	.cache_type = REGCACHE_FLAT,
+	.num_reg_defaults_raw = TEST_INIT_LIMITS_REGS,
+};
+
+static void test_init_limits(struct kunit *test)
+{
+	struct regmap_test_priv *priv = test->priv;
+	struct test_init_limits_data *data;
+	struct regmap *map;
+	int i, ret;
+
+	data = kunit_kzalloc(test, sizeof(*data), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, data);
+
+	map = regmap_init(priv->dev, &test_init_limits_bus, data,
+			  &test_init_limits_config);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(map));
+	if (IS_ERR(map))
+		return;
+
+	ret = kunit_add_action_or_reset(test, regmap_exit_action, map);
+	KUNIT_ASSERT_EQ(test, 0, ret);
+	if (ret)
+		return;
+
+	KUNIT_EXPECT_EQ(test, (size_t)TEST_INIT_LIMITS_MAX_RAW,
+			regmap_get_raw_read_max(map));
+	KUNIT_EXPECT_EQ(test, (size_t)TEST_INIT_LIMITS_MAX_RAW,
+			regmap_get_raw_write_max(map));
+
+	/*
+	 * regcache_hw_init() reads raw defaults during map initialization,
+	 * so the callback must already have set the limit which chunks the
+	 * readback.
+	 */
+	KUNIT_ASSERT_EQ(test, TEST_INIT_LIMITS_REGS / TEST_INIT_LIMITS_MAX_RAW,
+			data->num_reads);
+	for (i = 0; i < data->num_reads; i++)
+		KUNIT_EXPECT_EQ(test, (size_t)TEST_INIT_LIMITS_MAX_RAW,
+				data->read_sizes[i]);
+}
+
 static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(basic_read_write, regcache_types_gen_params),
 	KUNIT_CASE_PARAM(read_bypassed, real_cache_types_gen_params),
@@ -2290,6 +2380,7 @@ static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(raw_noinc_write, raw_test_types_gen_params),
 	KUNIT_CASE_PARAM(raw_sync, raw_test_cache_types_gen_params),
 	KUNIT_CASE_PARAM(raw_ranges, raw_test_cache_types_gen_params),
+	KUNIT_CASE(test_init_limits),
 	{}
 };
 

-- 
2.56.0

