Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754852;
	b=JLxRpr0gDmSV0I3vvCduaW/j/56XfchBQo6AQWGs2gsqHa70SyqYZrK1JhFLXALLFyto
	 TmjH5ugl4qkOuiAku6aYNIOKTpVhGo2F9qCB9VEd6sE4SqDaAw5S2znX3EB1OpkZPqdEF
	 v6rfS9gGo3pUiKm3bK84xU8a4rFFyoDb+/BN8yEdS/I14+6+HpAj0wkFvO5njqElqAdKB
	 V1y4frCq7e/h5HmaFZKhvX3KIq8pJoEcGAcuIa4Znp8EUBUPii8AIfU04RtGEkxwOhZ7f
	 tFuf6mu0XXrG4/dUco7h0CMhrT82e0hHwGGl+k9g3PnnxDKH3BU7Ef7YSX6J/yVxarA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rXyJvAkypDoHjlaEtA65cirM0oXb7Dh89hlzN8jZ+Vs=;
	b=JncLJ2AIvwo4K9u4UyMlyl1FbugUJmzGX271MXEwisVt8ipFK5N8bfpryckqfsIcfwpo
	 Pg4Hd4QCe7o3+rBgCMfqsQCMCCQDF4871iPO1Ch9DYeBAEMzJ19ckE1nEO7cz+C9GHXby
	 3kzZmiMH0i8ci/DHiN4zDtFnb2gSQRSslK4SHztUesgkVqcGXZ9qcmJpZ58r9Es4L1dNf
	 w7yv9bN10Ru1ZrlQ5G33yyt6C0qHk5uVv7mxNa/ZsBH4rrqbKdpqAc/fgaqFWTgdINpwf
	 yewtDsKicUkFh70RT10lhkPZDvU/hNy8D+zhF+ZleUpJNdhAjPTqz4QVsFprFpj4xIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ol94ZQlx;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0487B606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0487B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ol94ZQlx
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380c28f9e35so8586558eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754851; x=1796359651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXyJvAkypDoHjlaEtA65cirM0oXb7Dh89hlzN8jZ+Vs=;
        b=Ol94ZQlxOoTaBFfHL0ERXTVVQTimop0+0lnXX1HmTO0ROCsV69CcS/y2RK4v9juJ0r
         d+y3QpFVJ4IHlP11MNIXe2MhH0HJuWzO8X/JcMjXF7AB7Kxfs9Q3+NvuToBHmPCtWzE+
         /ypA1pzmTot/+RNUhaGiO5aPhQ3Zf3TWhaFi5AWJVdvQGGyo48HiAybttIZFQFWwuiij
         TxIw8pcxRtxo/JRnHR3GtYYedeZ6XD8EPvDESt/+OpT6p4tjhLwAXBY/xY4qKuIc9+9m
         9X3Kdr7cBG0YWpoDfJ01tzg2MvJAFhW5iNOFN0bE5Jr30cr3/ilPCNdwroK8n8PT0N+i
         77lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754851; x=1796359651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rXyJvAkypDoHjlaEtA65cirM0oXb7Dh89hlzN8jZ+Vs=;
        b=nbA3rtuJwHUoJTrMmdshFVk6Kq16mHnBYuBsuD2A3wiKrgNjAaPNeKYPESjnvUgkBw
         Jd8AIQ+k0R7s8TfGHKd7jxAYAg08LGBK4pywS+H9RyQtNI2Pxe68FJSQZfwRbU+4OiNM
         MUhd+bBoAJSlKIthqfsPZ9eXY0NAuTEptOP1b1mAo7hCSkGJ8JzO/vxP0kiM3CoXG8CP
         0YWDTeOxa0L6t3LyiuCayp3K0B5XItGSu6bymS/OQ19mCB2MG4H2+MoPgDjkPRSBGbMJ
         V0EuqpWmuzOX4qTCi2UFtz6OnHOZJe3RyplugX2qX5oU4PHbrBWhImLWve6uHwn+3wka
         FRdA==
X-Forwarded-Encrypted: i=1; AL+hErHr2czD0mkogG0nMuGxvXRqK2F/TVxF3MyAC4bcO0w+3Yu+dCckAicnpSYqg+lCliPPMQKKWUPHzgEVJXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7WdUKMHNXck/E5utHF+exICgWvQpX4M0mXJ3NnelYf7VCmy83
	KnqWxjRwWUF/ePqJDffnH9y+jcioTqfM9wKMU9bgcyTsy+CPXs9afle7
X-Gm-Gg: AZFdTZe8w9OKfJyy/oBncbjopdIrk2Cr+yPTOlltIPDbmXi1qBXPnROeyKjL3tj/4HI
	ptn8rtbqh5aWZVdQXrW3u0rtGIJ5Uez3oPj5cCZq2579BLL2k1l5fXJ8jXs6kwOxroJXQ0KG3I+
	pYGhSdFhiUrP1LgZVmwSnnB7N0VtW1tsUiYVCSFDONnDqDgO8O24jCCMR9SNT70/BvVxD/TesiN
	/XGlzWindra9xex9bJstcdf8nDIMUAuZpKIgX8jbQvynkdXgrbsXjwkbypr5rm+B+zc9o3Y1vHY
	jgsZitiukRm/HPD66k5r0n0AalWLvuBGrw5ew+Vs5jNRpZG87CSuuHqrOwT2B4KOrZI3SqtCE9m
	io9nqVYKxLlao1kv0nj3grWL3oQeLuAg2DmK3SD6ALaUSZVGZ+oCwUS+rvucYHzmrQguPWcw/UQ
	rbvR4iNcdljOPFaQXiEoOQrmOety1k8h3yEMcMTBz16rHzneYXRUTY3FJESK/0b9+FVUBokvEe9
	D7rDatGKcl+ZO6wiZI9NUZmLf2Bh7nz9bxbGbjsXvC8jEPoado0G/S8MXEaNk6NjAJlFOKAWEhz
	OHggtzZkRirqqKnFK7Pvhr//mTzlBm4n
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr15451088eec.27.1795754851116;
        Thu, 26 Nov 2026 20:47:31 -0800 (PST)
Received: from archlinux ([114.79.176.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm77084648eec.26.2026.11.26.20.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:47:30 -0800 (PST)
From: Gururaj Naik <gururajnaik166@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] HID: amd_sfh: Add DMI quirk for Dell Inspiron 7405 2-in-1
Date: Fri, 27 Nov 2026 10:17:17 +0530
Message-ID: <20261127044717.129941-3-gururajnaik166@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127044717.129941-1-gururajnaik166@gmail.com>
References: <20261127044717.129941-1-gururajnaik166@gmail.com>
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

On the Dell Inspiron 7405 2-in-1 (Ryzen 7 4700U, BIOS 1.20.0), the MP2
firmware does not respond to sensor enable commands when intr_disable
is true, causing sensor discovery to fail with:

  pcie_mp2_amd 0000:03:00.7: Failed to discover, sensors not enabled is 0

This matches the behavior seen on the HP ProBook x360 435 G7 and ASUS
VivoBook Flip 14 models in dmi_sfh_table[]. Add a DMI entry for the Dell
Inspiron 7405 2n1 calling mp2_disable_intr so interrupts remain enabled
for MP2 commands, enabling the accelerometer, gyroscope, magnetometer,
and operating-mode sensors.

Fixes: b300667b33b2 ("HID: amd_sfh: Disable the interrupt for all command")
Cc: stable@vger.kernel.org
Signed-off-by: Gururaj Naik <gururajnaik166@gmail.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index fafba3ec9ced..aeeabc3be2b6 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -335,6 +335,13 @@ static const struct dmi_system_id dmi_sfh_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "VivoBook_ASUSLaptop TP420IA"),
 		},
 	},
+	{
+		.callback = mp2_disable_intr,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 7405 2n1"),
+		},
+	},
 	{}
 };
 
-- 
2.56.0

