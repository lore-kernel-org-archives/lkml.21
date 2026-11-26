Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692629;
	b=ZYU19el/K/v56nuPm/h98hW+pfk+nSBGvvL/gSriaOYVvTVYdm5iP73gFnYMBV5vVi3h
	 Hy9+K5PdGdVgz3YD1rtAkylKMQoxwd3CmzYlxrjzaGhXGz6uYRgiMImSHyJ70nkz38Hom
	 8lP6d81ieGk+c3KlHk6i5ecygxe+8PxifBTZLXcEXx0uEJOmHM2sQcYv5ELBWVxL5ChaL
	 0KydQMr/bBrMtNcU7814VBSpjQopx1N2p7Lo2T8ykBngDkJ6YQ+AyWAKf54yxWZMvFqdg
	 burEoEd9XVplbDRbI2SuhcxdqqF0CBgI8BRdNx2idE54E0GDjkxNKy1k5a/J+D2yU3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692629;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=qn/ZGmZLFTVG8t2k7W+O3NQBT5iNa04xrO38bQugVWA=;
	b=F35i8BxbZXeUMUqNuSx5wrg2bBuqJCBJuwOogBAcyENlM3tPtatyuk9JCFnXPA7vuAwI
	 zULrSVzZW/HSofgcmiwTwkLxpTWczPim/VCJSChrRHUagU/oR8SHy9nuk7kS1mj0JmiK5
	 vImNihlILWh2w8PqnUW9cJ/EHFhTTKapKRD1uNUNUYHG4DMuRuacihX4XxQ5LwBsGtpjN
	 ScP3h2Xjla4H7782icVQ7kv47Jsn4oSfkJQjxKNiT+aHDqVej51n5f4I0ZoMdC2IcXHGW
	 4m/mleX4oCAHaXr8PZTbobzdzCa3NRWBY8Qst/a7rG+L1whPEyyT/a0JZsk4v+dWrLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vLwKw8q9;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1E606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vLwKw8q9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 607B91A1807;
	Thu, 26 Nov 2026 11:30:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3510260237;
	Thu, 26 Nov 2026 11:30:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDFAB11E6B363;
	Thu, 26 Nov 2026 12:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qn/ZGmZLFTVG8t2k7W+O3NQBT5iNa04xrO38bQugVWA=;
	b=vLwKw8q9LuS/cEqiqpDN/Vi7FSMYcZkU9CB8OGlOx4xxWkrktr2XD4tpDuRdDft66hQB1d
	6Ycr5WtYFCzURaZlpW21DAPwCYJ6fNHG53UMxCjY6qecdcny0/P1lRZhS2wMdbAl+z3TLZ
	65OoWCx2wpolZawdc9X3FxJ9pUIIjbwUs98kyL7wlHecLArNw6upp+iMJoDS2KBiNFeWmC
	YFuE+wV87bRpfUZAQ8k0f/tF+lvnZ1NLBNNMuHVSD7kQR+ox3VOKfoHIItS5TSVhiOWs5Z
	EHVDwtWjQV/Tf4Jo9f7SdgEK3oiqbFFPB+PwQ96NKWCY4V+MjcMutiuj9u6L3Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:55 +0100
Subject: [PATCH v7 12/43] drm/vkms: Add KUnit test for device lifecycle
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
Message-Id: <20261126-vkms-all-config-v7-12-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
In-Reply-To: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

The configuration objects are now reference-counted and their lifetime is
driven by explicit get/put calls. Add tests aiming to spot UAF and leaks
using KASAN.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/.kunitconfig          |  10 +
 drivers/gpu/drm/vkms/tests/Makefile              |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c | 280 +++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c                  |   3 +
 4 files changed, 295 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
index 6a2d87068edc..c9752bde8487 100644
--- a/drivers/gpu/drm/vkms/tests/.kunitconfig
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -2,3 +2,13 @@ CONFIG_KUNIT=y
 CONFIG_DRM=y
 CONFIG_DRM_VKMS=y
 CONFIG_DRM_VKMS_KUNIT_TEST=y
+CONFIG_KASAN=y
+CONFIG_KASAN_INLINE=y
+CONFIG_KASAN_VMALLOC=y
+CONFIG_KUNIT_ALL_TESTS=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_OBJECTS=y
+CONFIG_DEBUG_OBJECTS_FREE=y
+CONFIG_DEBUG_OBJECTS_TIMERS=y
+CONFIG_PAGE_POISONING=y
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index d4d9ba8d4c54..a7810a12c9c8 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -3,6 +3,7 @@
 vkms-kunit-tests-y := \
 	vkms_config_test.o \
 	vkms_format_test.o \
-	vkms_color_test.o
+	vkms_color_test.o \
+	vkms_lifecycle_test.o \
 
 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c b/drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c
new file mode 100644
index 000000000000..7f7b31368710
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+#include <linux/string.h>
+
+#include "../vkms_config.h"
+#include "../vkms_drv.h"
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
+#define LIFECYCLE_ITERATIONS 50
+#define STRESS_ITERATIONS    500
+
+/*
+ * vkms_init() may already have registered a device named DEFAULT_DEVICE_NAME,
+ * so give each test configuration its own name: vkms_create() fails with
+ * -EEXIST otherwise.
+ */
+static void vkms_lifecycle_test_set_unique_name(struct kunit *test,
+						struct vkms_config *config,
+						const char *name)
+{
+	const char *new_name = kstrdup_const(name, GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_NULL(test, new_name);
+	kfree_const(config->dev_name);
+	config->dev_name = new_name;
+}
+
+static void vkms_lifecycle_test_create_destroy_default(struct kunit *test)
+{
+	struct vkms_config *config;
+	int ret, i;
+
+	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
+		config = vkms_config_default_create(true, true, false, false);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+		vkms_lifecycle_test_set_unique_name(test, config, test->name);
+
+		ret = vkms_create(config);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		vkms_destroy(config);
+		vkms_config_destroy(config);
+	}
+}
+
+static void vkms_lifecycle_test_create_destroy_with_overlay(struct kunit *test)
+{
+	struct vkms_config *config;
+	int ret, i;
+
+	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
+		config = vkms_config_default_create(true, true, true, false);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+		vkms_lifecycle_test_set_unique_name(test, config, test->name);
+
+		ret = vkms_create(config);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		vkms_destroy(config);
+		vkms_config_destroy(config);
+	}
+}
+
+static void vkms_lifecycle_test_create_destroy_with_pipeline(struct kunit *test)
+{
+	struct vkms_config *config;
+	int ret, i;
+
+	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
+		config = vkms_config_default_create(true, true, true, true);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+		vkms_lifecycle_test_set_unique_name(test, config, test->name);
+
+		ret = vkms_create(config);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		vkms_destroy(config);
+		vkms_config_destroy(config);
+	}
+}
+
+static void vkms_lifecycle_test_create_destroy_minimal(struct kunit *test)
+{
+	struct vkms_config *config;
+	int ret, i;
+
+	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
+		config = vkms_config_default_create(false, false, false, false);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+		vkms_lifecycle_test_set_unique_name(test, config, test->name);
+
+		ret = vkms_create(config);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		vkms_destroy(config);
+		vkms_config_destroy(config);
+	}
+}
+
+static void vkms_lifecycle_test_create_destroy_writeback(struct kunit *test)
+{
+	struct vkms_config *config;
+	int ret, i;
+
+	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
+		config = vkms_config_default_create(false, true, false, false);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+		vkms_lifecycle_test_set_unique_name(test, config, test->name);
+
+		ret = vkms_create(config);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		vkms_destroy(config);
+		vkms_config_destroy(config);
+	}
+}
+
+static void vkms_lifecycle_test_stress_many_cycles(struct kunit *test)
+{
+	struct vkms_config *config;
+	int ret, i;
+
+	for (i = 0; i < STRESS_ITERATIONS; i++) {
+		config = vkms_config_default_create(true, true, true, false);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+		vkms_lifecycle_test_set_unique_name(test, config, test->name);
+
+		ret = vkms_create(config);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		vkms_destroy(config);
+		vkms_config_destroy(config);
+	}
+}
+
+static void vkms_lifecycle_test_interleaved_create_destroy(struct kunit *test)
+{
+	struct vkms_config *configs[5];
+	char name[64];
+	int ret, i, j;
+
+	for (j = 0; j < 20; j++) {
+		for (i = 0; i < 5; i++) {
+			configs[i] = vkms_config_default_create(i & 1, i & 2, i & 4, false);
+			KUNIT_ASSERT_NOT_ERR_OR_NULL(test, configs[i]);
+
+			snprintf(name, sizeof(name), "%s-%d", test->name, i);
+			vkms_lifecycle_test_set_unique_name(test, configs[i], name);
+
+			ret = vkms_create(configs[i]);
+			KUNIT_ASSERT_EQ(test, ret, 0);
+		}
+
+		for (i = 4; i >= 0; i--) {
+			vkms_destroy(configs[i]);
+			vkms_config_destroy(configs[i]);
+		}
+	}
+}
+
+static void vkms_lifecycle_test_destroy_uncreated_device(struct kunit *test)
+{
+	struct vkms_config *config;
+
+	config = vkms_config_default_create(true, true, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	KUNIT_ASSERT_NULL(test, config->dev);
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_lifecycle_test_double_destroy(struct kunit *test)
+{
+	struct vkms_config *config;
+	int ret;
+
+	config = vkms_config_default_create(true, true, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+	vkms_lifecycle_test_set_unique_name(test, config, test->name);
+
+	ret = vkms_create(config);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	vkms_destroy(config);
+	KUNIT_ASSERT_NULL(test, config->dev);
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_lifecycle_test_create_after_destroy(struct kunit *test)
+{
+	struct vkms_config *config;
+	int ret, i;
+
+	for (i = 0; i < 20; i++) {
+		config = vkms_config_default_create(true, true, false, false);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+		vkms_lifecycle_test_set_unique_name(test, config, test->name);
+
+		ret = vkms_create(config);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		vkms_destroy(config);
+
+		ret = vkms_create(config);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		vkms_destroy(config);
+		vkms_config_destroy(config);
+	}
+}
+
+static void vkms_lifecycle_test_connector_ref_outlives_config(struct kunit *test)
+{
+	struct vkms_config_connector *connector_cfg;
+	struct vkms_config *config;
+
+	config = vkms_config_default_create(false, false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+	KUNIT_ASSERT_FALSE(test, list_empty(&config->connectors));
+
+	connector_cfg = list_first_entry(&config->connectors,
+					 struct vkms_config_connector, link);
+
+	/* Simulate the rmdir while DRM hold the device */
+	vkms_config_connector_get(connector_cfg);
+	vkms_config_destroy_connector(connector_cfg);
+	vkms_config_destroy(config);
+
+	/* The connector must survive, detached from the configuration. */
+	KUNIT_EXPECT_EQ(test, kref_read(&connector_cfg->refcnt), 1);
+	KUNIT_EXPECT_TRUE(test, connector_cfg->unlinked);
+
+	/* Last reference: connector and configuration are freed here. */
+	vkms_config_connector_put(connector_cfg);
+}
+
+static void vkms_lifecycle_test_connector_static_drmm_release(struct kunit *test)
+{
+	struct vkms_config *config;
+
+	config = vkms_config_default_create(true, true, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+	vkms_lifecycle_test_set_unique_name(test, config, test->name);
+
+	KUNIT_ASSERT_EQ(test, vkms_create(config), 0);
+
+	/* vkms_destroy() runs the drmm action, which frees and detaches the connector. */
+	vkms_destroy(config);
+	vkms_config_destroy(config);
+}
+
+static struct kunit_case vkms_lifecycle_test_cases[] = {
+	KUNIT_CASE(vkms_lifecycle_test_create_destroy_default),
+	KUNIT_CASE(vkms_lifecycle_test_create_destroy_with_overlay),
+	KUNIT_CASE(vkms_lifecycle_test_create_destroy_with_pipeline),
+	KUNIT_CASE(vkms_lifecycle_test_create_destroy_minimal),
+	KUNIT_CASE(vkms_lifecycle_test_create_destroy_writeback),
+	KUNIT_CASE(vkms_lifecycle_test_stress_many_cycles),
+	KUNIT_CASE(vkms_lifecycle_test_interleaved_create_destroy),
+	KUNIT_CASE(vkms_lifecycle_test_destroy_uncreated_device),
+	KUNIT_CASE(vkms_lifecycle_test_double_destroy),
+	KUNIT_CASE(vkms_lifecycle_test_create_after_destroy),
+	KUNIT_CASE(vkms_lifecycle_test_connector_ref_outlives_config),
+	KUNIT_CASE(vkms_lifecycle_test_connector_static_drmm_release),
+	{}
+};
+
+static struct kunit_suite vkms_lifecycle_test_suite = {
+	.name = "vkms-lifecycle",
+	.test_cases = vkms_lifecycle_test_cases,
+};
+
+kunit_test_suite(vkms_lifecycle_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test for VKMS device lifecycle, aiming to catch UAF and memory issues");
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 24572bc779b4..f73f136e5588 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -18,6 +18,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_colorop.h>
+#include <kunit/visibility.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
@@ -252,6 +253,7 @@ static int __init vkms_init(void)
 
 	return 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_create);
 
 void vkms_destroy(struct vkms_config *config)
 {
@@ -271,6 +273,7 @@ void vkms_destroy(struct vkms_config *config)
 
 	config->dev = NULL;
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_destroy);
 
 static void __exit vkms_exit(void)
 {

-- 
2.56.0

