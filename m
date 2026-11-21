Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267981;
	b=nBnHoD1OWbZyv5+UkljCMH2daofYzbgVmDXpsYYFkLi8LsEzneNnJFkQzw0CPlrmyPtY
	 AUSWRBkNxaC82MtUaVtcf35ihPUr8xwJgxeBqBEUJKzLdjAJZA7xlSiyA3h0o1tV1dWI0
	 /WXub5mkhydzFXnINr1IUx/v3mIcLe9698opP+8a506mck68IkWuxDBoiTBWGOhVi4mf8
	 bhJBaPEsb9C7nc7ANLjwzorfxJFmcTcXfToqlTHNdyY6KIBLfsR/UxqbMW/1+0/Oigbn2
	 kVdUI6O2PfMXPs4N2kzpI75MSbpZdLhlgPqNrG2NNsh9ZOET0WKbD1OQ7RmdYp+CroQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VpH7vOBV8zTAkCwE1fdPUsN34Rs/B2a+/bMMRlSHON4=;
	b=oHl8q3wcu0vFUbEOYguQykXc/uL2zjlyO8bYms85NzbhwWXivjSnjCg2vYN+mKrArIxD
	 yNlADzhwdtLrj4mawAUweBT9vvXu0KuEH3GvwtBNBES4Ga2czldAihVu4dJi6mK5NZcdX
	 KcK3lhSsXZbX3a4SvRzaFpcEjOWs8EDElMwa6+u0b1QrmsGNzQo626+LtFR9IScFPn7mK
	 i4JniMDsgfEetSR9ztOyhaKiT3WjIfu57SYJzrqW0wubGng5rZb8A1WM0WtpyLEUVx7gg
	 bJ5GbcqKvlOtiDl7JWpo7xYAdatLzFQ91ci/d1pdF1gxw5uHLw2nMN0U/N3rUvplLXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5DofsG7;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F02606A338
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F02606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5DofsG7
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492690dd5daso1337941f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267979; x=1795872779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpH7vOBV8zTAkCwE1fdPUsN34Rs/B2a+/bMMRlSHON4=;
        b=m5DofsG7cV/aIgU22NYy3EVCZX7BtBnsald0Ejtjr01c1Qg+HVTSTpW46ooJQP9vwz
         2jZUu/YEhqVeosla5OM6RWbtITXm+j6rsnJCDAjVAYnWH8QvfO9Pm3GWRBaKmgHSfRQb
         RBMmFlM5qS5kKPAoNbtABwxq4bxaUkPhGeCgUIjExu9uwp5BZys2XgkRBSLiQlPuGYUE
         LiYUpFKKrU/t8g7uppModsNnJ9KvagfXkMntpmae77FvTnAvu+AMWWrHX79hF9b4du2l
         5CzjR/r8lJyHT/MXE+FZ2A6yHuVUP9OKoCPV74NOt3Zb0r7+KHLUZ5Y9HprcizPWhgDt
         CV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267979; x=1795872779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpH7vOBV8zTAkCwE1fdPUsN34Rs/B2a+/bMMRlSHON4=;
        b=tURh4x6quS8dbII2spssT1qIBIfqSmgdAVUYnM2PWk5J4FKOdgBSLeXvI3NJC1vdaX
         GJvOlwuiU8gfIvz/LtQ9bClnHfEbv4L9hVhIzNudsvg9Sp5PBbb2pq4Px2OeIrfavG2e
         tYwcYlqWAs1KPWYtdf0JPtBIdTtCLmlptBfWXYxGULc5uhmzUOOwvIw9pMn7eN+b7cjJ
         9bkeqpfLX/3esJiTquyp6bVti6XsHuM0oZbVtOy+sN8KJ0J/J148bbOaWYTB3op40wWv
         HFtXKsw7ZA5Dg4Knj6+jKBM20/iFc14QhaioOlU2aUUeYKBPMEfY5/XVd5knh41jVqOH
         UTvw==
X-Forwarded-Encrypted: i=1; AL+hErGl4sI13MhtYc60XXRJyYs32OyL4ybaKJxDcNNG5aIRYcnOc06M6m5EETnwtb9yoe7g/AmYyMKD36+/M9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z92bgXT6x+2gOWQwlgcfZG6SzOUiYrmwhJTCxPeFG02WuQTMriJ
	SgJxPaUiGztjb11kyT7rgi0n+EUJHHnTV75Iwe6s2kawTMFNU2ZVaASB
X-Gm-Gg: AZFdTZeS/Zd9Of/xgV1dUNtouC02FDJfbnCBqVs/FBik84BqwTdjj0ARtyt6x3X6e3V
	DJrJzOsihsA7YrnN8ZZfEr9HAUCiuop4jyB0WKGoNg03+b4+kvmTVmimEIgMgJvCF6F1treZNH6
	Oqrn+7ULkQTLnbYGXC0vBinmU9Eym6miTjxwLZ7119r5xzKzqNNCcCxonQUl/ucvUWMHJyHSUO3
	SPj7OTWbIULsxAWqaknYQJbJyylRALLMLeAaiZKTqrdYsdp6PrmsqpHJSlWDxNCjcX1Mu4vlyNz
	vSSi5CNaz8205npjxESr4Ikz5y6hd7MrOroMp5ObXxCir2gevmuA4tP8+LI5WE8N+XJ9eNhE4dY
	JHTZshTQGSzK6Fbt17N+E7eUCsXMMMLGDIqpLllX08FFSR09/aRjLw6agz/PelOKobDNY7S8gNP
	eUk6tuuEhZZwC3qQPPRQDdn8Gm9+uP5El8+j//h3CZ3+3+lGoZuezkQ9UBxOKJdCcJB7h6+n2F2
	HlXHlNi+PbcIApn4QP67lNAePAriIEpHWAQ9Z9Hh/xJl6gC5oK9xcm3DEBxLJsCiub9g2SO5YRj
	7lfKdLOrH3NNsKELSNBl7Jb+Kg5S9DfDihOJLslfFV2g7oMckVGPdOEQ1f888L7xWI9L3Ouq5zx
	56cbj5O0rdmb8
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr145819765e9.2.1795267979159;
        Sat, 21 Nov 2026 05:32:59 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:58 -0800 (PST)
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
Subject: [PATCH v11 06/14] media: atomisp: Add Yoga Book camera configuration
Date: Sat, 21 Nov 2026 14:31:36 +0100
Message-ID: <3768f17b328286f4dc3e6a31a265eaa6e484e57a.1795267528.git.mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d7..56da454f0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };
 
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -359,7 +373,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };
 
-- 
2.53.0


