Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449400;
	b=UR5l7iX20K3sFFo4FtntxP5NPq3HwQKUB7RqUzHp7ngqin6axFSoZy7S1u7yuPRreasd
	 wSP3YCjtaY8GMlKrFAbDYQ2VpC9ynY59X0f23fUq9C7eUAVKQpSAYdgneTg55UoQpHKtU
	 5hIRzrbUYO10haJqlPuJYlVYBDicaHeyHjK6AsYJN/hmOJ63PEewrQXCZ/jqcnwjMsdIw
	 hVbP81IU68IZiJONgPigTBTjbRA/raFBJJABezP5KD1D1IvR3LqPwgR6NcMd+ACeQ7vKh
	 bGq3A95Rv2JLnOJpW0t8lbhvunIEJqEt1d4BvdOudcFLH1bd1UMHADI1wGYZiVLAAvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0adq+ONEx57ZnjGJpUn15eG9GXBluRIJ1TKsnKAxL6g=;
	b=zW4YuMCL0/R9PlzslY8DfJH/zBcOm0DHO4ZDtxQg+5IQ40rfRszHn8DB3DjDmpc7S/or
	 ZNEm8gNiDgAydD762+ofAvxyuLkFCYELyg+IGCENNjtpjiBzD3I+rm+PtASSA7PHYDpY2
	 1OD1WYOkL3u2oapnDPzZifytzBI63vJM19y6/eo5Pkq8XYJzOZLOrJEnCAY962Q6TXoSE
	 WW6ooUjnwquiB8NIsIBF/9uByikFanq6rc+0KLpoWutYz7mbT9PY4ArWUWpBItMP6PB42
	 VzP3ganPSvS/QKUmKfjZ9qQdlLafC0Lvj4rTUefrs2vPIwzKTG/JSI7UUXqhtshFqXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfaMmF+3;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B7606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfaMmF+3
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1736696b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449399; x=1796054199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0adq+ONEx57ZnjGJpUn15eG9GXBluRIJ1TKsnKAxL6g=;
        b=XfaMmF+3GczxEPxS5wyKLu2GejTMGopazkvZLfsBtlVuERhGb883LWYIRrL7dgwwE1
         o8SPrIaaDwDJVl8wjvRpSx4QBGpLmUEVtADGX0klz0qK/6cUyOaLENQePCjJFSQCRkv4
         NErIpQsBRH6OHbR96XvwLPgbdJaE369sYHf2TGE6QvfH0+3m0P/a/uXlnW7EVThiLxFY
         WYZ0zG4gTTUPClmUlKjrd4wa31Z3qXI+2iYilLhp3hbFvjj88lqfvnm84SWc4CYjBGOZ
         p9EDz5+XWqzd3b+j+sguM7wCmWuRghtyzE1As652BUg8RtM7Car+IHnxohuwdJKnCKnV
         L7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449399; x=1796054199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0adq+ONEx57ZnjGJpUn15eG9GXBluRIJ1TKsnKAxL6g=;
        b=Of4Oe556BRnDddpcADI4cfudrEi/rUYQtW50gxz2uu92hie0iiW/u+vGcCqeasVO+4
         TlCxz+NzOx88Zq/liJ1PbmL5ScFr2sKG1I01feCITE+Yb4CI26T9YmiXISE0lFy9mTwk
         voJ66DhArxINbbzewCmRmWF1/RnxnDcY7PAN/iy2VhpPbNNmlk2j0zuVcQ7x+XrGtrh7
         2+jMPpJfpcnx4z25Qt8RagqAhRFeKY2Vlowe1L8Yu7w0VJcYeeiHWZu10yB/hsTfvWu4
         z7BrjLOJw4r5hFP8XgGcT36z2T+4zTixeqUxKv2AZYg3ThAGtPFmMdxZBVD6YQhypaSV
         ZpGw==
X-Forwarded-Encrypted: i=1; AL+hErEznDFMoBgIvoUqM8G1ujX2qui298RPePqFz61LOds9wi9huM+5Q6CKoN1j1fXmuROjcfjR4jsVL1UeWaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t9znXGoPZAaRljABt+v2q4+JaDB8e9MpFF9aldczqzOmRbbbV
	hDlHaVio17WUlzQTOl/b9p0bPdWzLVESaMxcm3hCkqsOd+13H4FQ2iMq
X-Gm-Gg: AZFdTZdH6CxeXdtt2puoyWW3hCkVgnnN6JMqOzGdMKCSpAuJAIRHyNIxKQpWRCq+Shp
	eThtPNLIRfcWhxuksu7bMnJmStzna/DT82zFL/8AK69R5jJ81OgIvmTPM90IBBFe6haBRQFHF0N
	FEYF+NDrQQOh565YaoicCqEln8Fz1ZUQhxC8XuLK/ne0/z2OdYH4j35K682Fj0Up4TmVOF53pQn
	4o/Qy/xQ9nPVY+RCQXzBnFiKHykKoIHNQHMQcUtZSZnf9vP07gswP9xxs6rLlZ3KLxFW5nFtJsp
	ledlT3DDXL/G9vADuWXsDmV5sZURQzpJZ3LgN5gq7SfSv9NygR6kjKXVJsoG6SIga2HBedKuGWS
	IA9GdE8qu2tHsDNbbUaYk+WrkxayNw7z02y/iqpFlppXIYRtlNDzUs3fa0MD2i0zGg04ILNLBVT
	2+7n1IFYEnV5tIudRgHcZpdO7tcuITd2Zav8RoiY05+PSHWuNDKlbEUYlSFxE+QyY+jdku+5ObE
	FXEL10gF/lwBDyi7sXS9Va3/NFzQsg43JZZtmC7turB3xVM8+XYVMPGgo9M/077bcg6zydDgkr9
	n0cvIuaPvcwj9enjyyZw
X-Received: by 2002:a05:6a00:4207:b0:88d:8074:1a7f with SMTP id d2e1a72fcca58-8c87bac53d5mr8984694b3a.12.1795449398967;
        Mon, 23 Nov 2026 07:56:38 -0800 (PST)
Received: from fedora ([103.156.164.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5851960b3a.29.2026.11.23.07.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:56:38 -0800 (PST)
From: Mulky Fauzan <qapkyy3@gmail.com>
To: jlee@suse.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mulky Fauzan <qapkyy3@gmail.com>
Subject: [PATCH] platform/x86: acer-wmi: Add support for Acer Nitro ANV16-71
Date: Mon, 23 Nov 2026 22:55:20 +0700
Message-ID: <20261123155520.121595-1-qapkyy3@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Add a DMI quirk for the Acer Nitro ANV16-71.

The existing acer-wmi driver supports hardware monitoring, fan
control and platform profile management on this laptop.

Enable CPU and GPU fan monitoring, PWM control, hardware
monitoring and platform profile support for this model.

Fan control testing on Acer Nitro ANV16-71:
 - Automatic mode: CPU 1796 RPM, GPU 2255 RPM.
 - Manual GPU fan test: CPU 1807 RPM, GPU 5555 RPM.
 - Manual CPU fan test: CPU 4838 RPM, GPU 2238 RPM.
Both CPU and GPU fan control channels were tested independently.

The following platform profile choices are exposed:
 - low-power, quiet, balanced, balanced-performance, and performance.
Platform profile switching was also tested successfully.

Tested on Acer Nitro ANV16-71 with Linux 7.4-rc4.

Signed-off-by: Mulky Fauzan <qapkyy3@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 60028fe9f..f9d92395e 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -493,6 +493,14 @@ static struct quirk_entry quirk_acer_nitro_anv15_51 = {
 	.pwm = true,
 };
 
+static struct quirk_entry quirk_acer_nitro_anv16_71 = {
+	.cpu_fans = 1,
+	.gpu_fans = 1,
+	.hwmon = true,
+	.platform_profile = true,
+	.pwm = true,
+};
+
 static struct quirk_entry quirk_acer_predator_ph16_72 = {
 	.turbo = true,
 	.cpu_fans = 1,
@@ -728,6 +736,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_nitro_anv15_51,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Nitro ANV16-71",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV16-71"),
+		},
+		.driver_data = &quirk_acer_nitro_anv16_71,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PH315-53",
-- 
2.56.1

