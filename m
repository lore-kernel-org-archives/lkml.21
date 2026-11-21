Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267985;
	b=oaiZSiYruK3W6zaB/XBM/b8i5wr41hDSUQiVDZfpRY7G54bmVbR0Q3JdxnukWLs062M8
	 K4GjFedQwNzYgF1qtSf3qDOzVPGTLZpIH715LVC+TUedffw2peR77K7UybAZH7QOAKKbn
	 O5QeaS7s3ov4b06OxQ52oQGPagwVodC8Km9PgD3EyWmxs6G4bVhMupiYHxLFEsMt4zxqF
	 +QvNHC51vA5yA9Ma5Qi8YLURDsUJQlJk4DiFfwlpuh8BMeq2Yhpu57hkOr8SVNxAwPo5k
	 jjOlTEKRzmNgUSUrymV1DjjDzo3pJFmAvsGRp1SayrX5BNAXxazfSNoEBOWuYxTAH7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zgg4MnVQv6eXgMCmnMqV/EBaLR8DuEalyOb+7ER6OOI=;
	b=WfjIOv+TdU60nMTSswGrSNV+jLvoXneFCuCqEYwltoe3ONdaYIppMahMLcVsrwqNDl1b
	 LNtUnPnrMQczuuSgHT5EdD/SjaiFdZPydEyVLcnS+A1jxm9NCqD5uauDmsMAaYOzCLsin
	 Aho56C+v2BYuEyfjhKjYywy4QfV+/3ilIucsA6SczDuegAEVzgKT0eSWVyjqzQbQCNT77
	 Qp2l8zb6VdwNkTuqiHFDF7kn6J3OpM2EgPMQ6CZASVyOqImZZxfQwHD3apWYeZVct/lSm
	 OldQIaBxaekQgkSZ0YmhxOsmMCZdUvWlBaEnq3H3xt9hu6JhFjOGwTzyGqMjMTpJnaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPRuaaJB;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE3606A697
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EE3606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPRuaaJB
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so19541215e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267983; x=1795872783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zgg4MnVQv6eXgMCmnMqV/EBaLR8DuEalyOb+7ER6OOI=;
        b=pPRuaaJB6IYv8fYThOP/xfRsBKfp2b2ApTm3d2bfi2AoV1aWO9Ob1S2Db7uJKd++a5
         mmknRw0F5uGQ7OcXJCcqPdVwH4D1Nz6fUFherbE8/6BW4vbFWQ+CJRcRMm/1HuAI1eoM
         Cr7OzL8voh6XZO8Gep6egxH2tRkWYK6ayof5az8z3tGqwnDJK/7CnWnMqKow6jn8SPte
         sIZyO0H6bdj0Ov/ZxjtAUuh2OpAmlLj/WfOAYijLFKExSKKAljk34V+4tVopxqlN16ke
         7OHTuO1aZW2LPbxkhEZA0QmHCJlBhEy+GFCTbaXtys2R83fZqNVUtRQq1CWYvG3koaPg
         1YyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267983; x=1795872783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zgg4MnVQv6eXgMCmnMqV/EBaLR8DuEalyOb+7ER6OOI=;
        b=D2E4SUFxqbXCOsXnhCu5RZ9KRFrf1sRzEVH2/2KJc4VhmlZ+w8QJTDV+MrLHo7aZq/
         IponxPyQEjGwI0Y0lyJNlbGR14qG1NsyOzPliH6GFIJdQsC1FLDvq8u7QI79hOk1lJLW
         E17jysBy2D20t/L9TelE0+XQKPtjlllGuMsNYeohrVf8l0U9pXvrVqgcPAYWcRzCRUtw
         UwEq8oXiCW52T9LAjcA6MmQZj0W5+MbnbDvD5bp1CxmlSyzrSEDF8L9hsSclviVo//35
         skIZbmwbUMeLd0bvMLQChAZgaJqFKQNCQ3WnfnyRFMVTHRxafX5L0H8ICfbTKusf2gBO
         dBnQ==
X-Forwarded-Encrypted: i=1; AL+hErFjTCRGzZogi+maJyUmocFtN6NlULBprxLxPyKtOyREJiOVXkPevnVEaxy9s6uaHOtaQpOOHuUAblJ8rzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DUiZMpT+ENyXHWBL6eLyXsdKXZkA55dUE6g4W5+Bk/yIBLwlf
	/Z7uoQZy85zGSh4Btw4hdlRLWjyXPRCi2S0tJT9c42LgW4abfgJlb9jo
X-Gm-Gg: AZFdTZfKX/V3VtqdWyd79kIaYyztgqnG1nCJZqAal+h7W+BBIw3/s4vo8oEJZIgFNb6
	LuCOzM+MXQcJrOA8NBo8cqvD4yJBLAe5vCdtDhxUp6JgA+Txt/LjyFuypwTCPkt2JCcfX+koCJ8
	vqeSBbRjEzuWuuetzKIQQyT3F8QHDMhV7iqRiXuXxTdwn1HZES8kSddRCtZieVwplliaidoxbNg
	ujO47hScyEDUsqpjWWkBIK2Lz6G0wI6Vp7iOWOdVeajvA1Cj3kdMxylAijspc4iST7kSPS6J+HN
	1Zjqw8HIcYBovb1DseZGhaY9kImnwBI/77n74rRm3VXSfvHlsOJOL5vWMCQwaHI4LAYDLrOLNUm
	7UkFiLBWJlHUxf/hYgZaJnFM6XrU+beHGnP7DoZuH5IXC1w6mMl1+HSRde1A5RNPBEvNCr7ky83
	G8oz5cOP9hOBhoaWHKYiXrOPMLwD2/tzaqesBO5uyp3eRHYcaL8fjUaz+FuF/og+w4ka4wiidwp
	avWWMLmmS65Vpzm4CA7CCTu3hAXKTiTM1m0Nu3Wln39ijZVdtQcv/1yW6yfab10XVmdIDkZSU/5
	qKiaWhjlUYTVW9DskzqtgVrzXv9gK2OpnprltJpZif6btX4Zn7XcdyYWpN6ZRLcAdnD5VPRlMX+
	zPFhvxr5MXKVj+HVoDL3NcmohHuKlcQYUow==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr158498155e9.6.1795267983223;
        Sat, 21 Nov 2026 05:33:03 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:02 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 08/14] media: intel: ipu-bridge: select OV2740 frequency by IPU ID
Date: Sat, 21 Nov 2026 14:31:38 +0100
Message-ID: <388d5bf4b5e2f99f6e6d8c0eb41e88ad28091b75.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The OV2740 connected to the Cherry Trail AtomISP uses a 288 MHz link,
while the generic OVTI2740 configuration uses 360 MHz.

Use the bridge's existing PCI-device matching mechanism to add a
Cherry Trail-specific OVTI2740 entry before the generic fallback. This
keeps the platform distinction in the bridge and avoids adding a second
per-sensor link-frequency override path.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 5f6baac2c..5dbd74e2b 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -58,6 +58,11 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 	0
 };
 
+static const u16 atomisp_cht_pci_ids[] = {
+	PCI_DEVICE_ID_INTEL_ISP_BSW,
+	0
+};
+
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* GalaxyCore GC5035 */
 	IPU_SENSOR_CONFIG("GCTI5035", 2, 175200000, 422400000),
@@ -116,6 +121,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG_MATCH_FL("OVTI2740", atomisp_cht_pci_ids, 0,
+				   1, 288000000),
 	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
-- 
2.53.0


