Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067657;
	b=M81Xn0rSmjZnE4rJ7UAzccmYJKs88oSf46LUzzSDDIVHIEoBK0vpztGfTJBO1JcoHq6o
	 RS3wjLus4OZtXR7q48M+ACPuS23Z1t52RGc0m8E7yP9x/EqXzVSktpUNL6hsSOUKe1DPd
	 WN6Ozbr9CMziMcFlzG5FKY+LxBQXFVjnleAC5l/hAIodiNgYd4ATNUa6CfMJvkwSp0/+a
	 Mej4ndEiuJKRYtfoiCS1qbbSvmUhAJa24C34U+aqhvuUZRImL7pEeZQ5Dd5sUviV0xpx1
	 2Zm92ato93o9ZQ/Y3xD/N5gqncRqK2dN0qEJ5a9zhiIi4V6PnzzUpf9XJx2s7Pbo59g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067657;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Yy6UPA1x+dgBp1oYwsbJqoBQ2EhZbFzvPu9SCMCc1gU=;
	b=Nq84kIuKcm/dRoiFH88BSYmxCCsZbswpNHHgSxC+jPj7670vb6NI0O+G6hblSsf6wOUG
	 HH35Uzo/JMOo/IZhSbOVGgOFz6HtRkZq77ecHEO29f3zzazlphgH8HB/6ivPMu1XaiAc3
	 MAerSiIvzBx3ind9fnTogI2BLHrc77oSvQ3NG8QsX02ulZQFrCwPMUvBQJpn0nNf85NS+
	 OwfqOFCjO2vh/UHcZGWRP3IZBko0qJ9EOUZ5rV8IEGEMlbyds4E4bh8rUMuwypjMBlJo6
	 a3mNj7Fu1Pc7X5QqaXKFS5o+E4ZJx+RELFDSp7+BAl69OZzNE79oMiOWu5LK90MtbFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C2l17GmL;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="VYTo/8ma";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60448606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60448606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C2l17GmL;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VYTo/8ma
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795067656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yy6UPA1x+dgBp1oYwsbJqoBQ2EhZbFzvPu9SCMCc1gU=;
	b=C2l17GmLJcpBJEIAbPAmD4AbzWGLEu8yd9SF249cMhFlAdGYw6+EzM4KJBE1r+zZojHh4o
	YqC51h6scC7craQBArScNwqXxWtTJXo1MN6o3ks5Vrr5oDR0OXcxNLQEwCNYOIZAoao00F
	3YMMoORwRiYSBBSum8Tu36Fu7bxlSwI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-O5ZOSPmaPJWGoZkGROCGnw-1; Thu, 19 Nov 2026 05:54:14 +0000
X-MC-Unique: O5ZOSPmaPJWGoZkGROCGnw-1
X-Mimecast-MFC-AGG-ID: O5ZOSPmaPJWGoZkGROCGnw_1795067654
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso15797815ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795067654; x=1795672454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yy6UPA1x+dgBp1oYwsbJqoBQ2EhZbFzvPu9SCMCc1gU=;
        b=VYTo/8majIOWNVXPgqsXLe9OxbpF3rMxLsxWwjGOqR/XxCac+NkHv8uJhjB4CYHMW4
         aZbxp60snr4wgxXgxaqCK7/+8CnVakAovUdiboBDFtGpZfj6IfXitqrwL5PitvWdluva
         cZHkEl054T1bac857Q0pZ6ywZqbek9KL76NbsdxU6V8wIZT9FzSdmEnvLbCxzowE3nSm
         Af3iYgPxfnnl4s/1QK4oc0wcEVM1CTI60O5CEGFYdlDHHdSvL+DIwcQOuH77cBBodhgO
         HzpN9DadQZR6+xTc8uqpWmcScbt6uPA0WFHYXT6xGiCHWS+bhF7N6fJRE3WaS+jUF+AY
         pLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067654; x=1795672454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yy6UPA1x+dgBp1oYwsbJqoBQ2EhZbFzvPu9SCMCc1gU=;
        b=KXRZCNjhd+0kcKRGCLwQBCwzqM2GuehsZN1TNskV5NoDDg9bggb9ChZOdzWSKm3seI
         hRFPI5cNlPpfxoM/YD3uIvuvMsO1qIeWZI2TxFbMu6tybCkw0Wj8SLV6IozK0uBiyhD0
         VIVkXV2UzckgKF4Cb8aavX3jlep2l/ByIF8U+5Xs46WJX2ZyvvRRAuNm17kXkYDCXdak
         7ac6jZgaPISBu6T8lvjGDOjGD1ItiZIuAeWPGsnR5MSWMkrUfJIUOUIBVG6W/DNsIRxX
         hJnX9YWiHN/ACcCWCMtRMSJ3QjVvj73TpAudZ2C7hYhQlom8YcdtZO+GFwzkog9osD8A
         iFOQ==
X-Forwarded-Encrypted: i=1; AL+hErGaGPUFSWDIxVuoHu/tCWriDrmaCheBT67BKI8r45kgwAR5to2cljmJTVpqR0SPFHpWbgpiSonyK/2ESqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o/9h/nVDdqFpCIoSRT+md26ZGek3ojLgXfpwKiCZdba7tmPOy
	gLc0mPWbvMVNA30hrTrKyJDZvA6GZab1Zm0qSKRn6F7eTtCv603nnRyMNxiX5vO/GgZ6ZZ3oPRr
	NdQ+4YNeaKrLPTGldZdyfCiPtVDTBmNj755EuwvatOzqxPiydyXGh/GSQ4HGFxF8kWw==
X-Gm-Gg: AZFdTZdlp/ygJeOHfm3/2XjXX3g3TphTx6OgIsMcklbj1CQsYTMjhG9VOSbxajdc1Jj
	aLUHW2orzsvdSvtKkcMy6U/W/WGMrmRqOKQIEDu4iY8d4kcRyZXdg7jezu6i/XHFUxRLDjn0DMs
	yHWAg3KjWasamDimc7pxAThoOLiE38IwTgOS8v6CsEDBQXmterkxpC7m4S4KQm89Z1fACGBZRRY
	n0nZdZMrJeseWlFErC1Vvk3511Fqr/+p5v+GeAlYKsIybNmJQfVBaaiOCT1kvYUgSJYTkTLkKbD
	Z0bEmlo1WmMLirWUzYTiUIf7U1OYPAgzbHHlA61mErRnus+zH10TCtO5CORpXF6HuNuc8uANtKv
	VZCjfwHGyD2anenMHWDlbT+WMgOnkwiMTN9mD/GsEVuoo/k8xZPi56i85X8bRfQ1ACZnNTcaYkt
	OWeA4l6uNSZgSPXQ==
X-Received: by 2002:a17:902:ccce:b0:2ef:f652:a08f with SMTP id d9443c01a7336-2eff75352b3mr49821625ad.42.1795067653669;
        Wed, 18 Nov 2026 21:54:13 -0800 (PST)
X-Received: by 2002:a17:902:ccce:b0:2ef:f652:a08f with SMTP id d9443c01a7336-2eff75352b3mr49821325ad.42.1795067653185;
        Wed, 18 Nov 2026 21:54:13 -0800 (PST)
Received: from localhost.localdomain (122-63-66-168.mobile.spark.co.nz. [122.63.66.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6183f8csm23799715ad.31.2026.11.18.21.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:54:12 -0800 (PST)
From: Tao Liu <ltao@redhat.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	alex.hung@amd.com,
	bhawanpreet.lakha@amd.com,
	ivan.lipski@amd.com,
	george.zhang@amd.com,
	adrian.betschart@cinemaone.ch,
	rodrigo.vivi@intel.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tao Liu <ltao@redhat.com>
Subject: [PATCH] drm/amd/display: Fix pdev lifetime in dm_test_conn_init_ctx_alloc()
Date: Thu, 19 Nov 2026 18:49:18 +1300
Message-ID: <20261119054917.184758-2-ltao@redhat.com>
X-Mailer: git-send-email 2.56.0
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

The pdev backing memory is currently allocated with kunit_kzalloc(),
which ties its lifetime to the KUnit test context.

However, pdev embeds a struct device whose lifetime is managed
independently through the kobject reference count. This creates two
independent lifetime management for the same object: KUnit manages
the backing memory, while kobject manages the device's reference count.

Although dm_test_conn_init_release_dev() is currently empty, the
embedded kobject still relies on the backing memory remaining valid
for reference count operations. If KUnit free pdev while its embedded
kobject is still referenced, subsequent reference count operations can
then access the freed kobject, resulting in a use-after-free:

    refcount_t: underflow; use-after-free.
    Call Trace:
     device_del+0x29c/0x410
     device_unregister+0x17/0x70
     i2c_del_adapter+0x128/0x1b0
     release_nodes+0x4a/0xe0
     devres_release_all+0x9e/0x120
     device_unbind_cleanup+0x26/0xa0
     device_release_driver_internal+0x1b6/0x240
     bus_remove_device+0xfe/0x200
     device_del+0x179/0x410
     device_unregister+0x17/0x70
     kunit_remove_resource+0x93/0xc0 [kunit]
     kunit_cleanup+0x49/0xa0 [kunit]
     kunit_generic_run_threadfn_adapter+0x21/0x40 [kunit]

Fix this by allocating pdev with kzalloc() and freeing it through
the device release callback. This ensures pdev's lifetime is managed
solely by the kobject.

Fixes: 7db85e4b053c ("drm/amd/display: Test connector init")
Signed-off-by: Tao Liu <ltao@redhat.com>
---
 .../amdgpu_dm/tests/amdgpu_dm_connector_test.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
index f09e2a72c534..b43c4eff2bef 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
@@ -9659,7 +9659,9 @@ static void dm_test_fs_caps_disables_replay(struct kunit *test)
  */
 static void dm_test_conn_init_release_dev(struct device *dev)
 {
-	/* Backing storage is KUnit managed, so there is nothing to free. */
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	kfree(pdev);
 }
 
 static void dm_test_conn_init_unregister_dev(void *data)
@@ -9667,6 +9669,11 @@ static void dm_test_conn_init_unregister_dev(void *data)
 	device_unregister(data);
 }
 
+static void dm_test_conn_init_put_dev(void *data)
+{
+	put_device(data);
+}
+
 struct dm_test_conn_init_ctx {
 	struct amdgpu_device *adev;
 	struct drm_device *drm;
@@ -9702,13 +9709,20 @@ dm_test_conn_init_ctx_alloc(struct kunit *test, enum signal_type signal)
 	ctx->adev->mode_info.num_crtc = 1;
 	dm_test_create_mode_props(test, ctx->adev);
 
-	pdev = kunit_kzalloc(test, sizeof(*pdev), GFP_KERNEL);
+	pdev = kzalloc_obj(*pdev);
 	KUNIT_ASSERT_NOT_NULL(test, pdev);
 	device_initialize(&pdev->dev);
 	pdev->dev.parent = dev;
 	pdev->dev.release = dm_test_conn_init_release_dev;
+
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test, dm_test_conn_init_put_dev,
+						  &pdev->dev), 0);
 	KUNIT_ASSERT_EQ(test, dev_set_name(&pdev->dev, "dm-test-i2c-parent"), 0);
 	KUNIT_ASSERT_EQ(test, device_add(&pdev->dev), 0);
+
+	kunit_remove_action(test, dm_test_conn_init_put_dev, &pdev->dev);
+
 	KUNIT_ASSERT_EQ(test,
 			kunit_add_action_or_reset(test, dm_test_conn_init_unregister_dev,
 						  &pdev->dev), 0);
-- 
2.56.0

