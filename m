Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289567;
	b=JZ+CSRqFaPxdqUwKHZrTKGuZTnlNoh3iClLY0ED7xZVFRppk+gPRyzxG++oRiOgXzhbS
	 P5rhmC9OiCgNmWxTnqR6Czf0EcYfkhj7H6zaJQnbiMyMr7Vgawhq07OgBhWhesDnN3O5I
	 ewoI+X5pZY5bPcsBu6URAHS9RpG0XR208JIRF2c6L6UvLFcfVHItXIs2XrFZ/OL+BdYjZ
	 GCaUa/xqRIMtHvebiHkvLr0rV8rLgogvipsmcFPAB4ZAy53NqAHn80kG6xe1U+MIW1V7F
	 jYnFOtwewWHI5g42IG+pL9wb9UPfQ6IdZD0MZCAKrPKhVuZA65RnQJ5zcbnriVThTAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289567;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cAnI0c9hFjCMwUmPlUPWn1Le7Jb1Y2BnchBdQ6mVz6Y=;
	b=YPqHi9PsrhIkNDuecyGCCKrEBEyyS+aqEdrev9/Xt93ehuGPRw3UqTtZ5v6tiItpy4Ck
	 JdZP1D+BTlcvOQmLyO60Iu/Z9XVg7hBmN7dSRSta/zJYaLCzjsS2AXIT0L/ABRNJA8VEh
	 WcD4MlqszUXntqwiCr3/V49gDDVv7CWmquUrRXQYNAuAxYG4HNZ2dmhG7TyGmPi3BkR1v
	 5QNFIZxF4FsdjSA5IwiFawON53y/C8bwikmjYZDhNBTVpw7b2wWLVRVMR9LSIjAbhKS/G
	 x4jL+zGn/tqkwSvfvytM7cCvNgpVWrLjLEouXdcVs58VAgELtGRW7DtXzmP4jZEVLXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ipvych.com;
	spf=pass smtp.mailfrom=ipvych.com;
	dkim=pass header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=h9JzfjAc;
	arc=none smtp.remote-ip=91.218.175.1
Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA6606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DA6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ipvych.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipvych.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=h9JzfjAc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i2m/DFlMYzZ+rROkmhKoOHRI1qUFGH+RsFuOBgbVOsI=;
 c=simple/simple; d=ipvych.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795289563; v=1; x=1795894363;
 b=h9JzfjAcaxBpLxbeqHyOPBWgPvzufnokvfuQj7xWLnBhLHoMGBNjnoiWv4vRP0t+v9tmTWdM
 vjNOFRis1fTo3SBqUV4XHqauptvM6K3GTkJQ/qM4Q1dU3ee2HDaFX0jUVhpedlizfrtU289V3BA
 zNmmVUMFwHZ4D7TDLNw+CB6fY+htzrHPlYLf3oPyMxV1mgES9sUqGSJZPumRKbbaU/AbFRzF3YY
 54W7wILpewwWU8tSpiOww5QwtX+tsgzfcFItA190tSxo7EFNJSSFD08PjArF954aMcz5Ix4o2QL
 NAJnp1MB0nzy94d60AZs75GurQtW9Y3C1+EYjhYkQ4JZQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ffd402e7f7cd30ea;
	Sat, 21 Nov 2026 19:32:43 +0000
X-Mizu-Trace-ID: ffd402e7f7cd30ea
X-Migadu-Flow: FLOW_OUT
From: Ivan Popovych <ivan@ipvych.com>
To: linux-kernel@vger.kernel.org
Cc: pali@kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	Ivan Popovych <ivan@ipvych.com>
Subject: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control whitelist
Date: Sat, 21 Nov 2026 21:32:27 +0200
Message-ID: <20261121193227.9408-1-ivan@ipvych.com>
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

Confirmed on my own Dell XPS 15 9550 running BIOS version 1.14.0
running "echo 1 > pwm1_enable" disables automatic fan control and
"echo 2 > pwm1_enable" enables it back.

Signed-off-by: Ivan Popovych <ivan@ipvych.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5963f908972f..ba189b086b22 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1640,6 +1640,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell XPS 15 9550",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 15 9550"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
+	},
 	{
 		.ident = "Dell Optiplex 7000",
 		.matches = {
-- 
2.56.1

