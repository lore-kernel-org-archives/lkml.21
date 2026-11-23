Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432765;
	b=Nd3BsPICzUJCcCS5FMtPXuk+PrKwT0rRogtGfu5WM4TtLb6rMc6CGx9WqcvGG3KfeIcy
	 cBgYoSbejRVSk34pD72RFOVIz5YetRlLndSJAMubXXGczOgq+wCfT/kBlp9KQOFQjt+EF
	 Zum5yfbzrfIo8B2OqnMzpu7aQsw2yV0XiZrrNNpCDYZz9dR2hhWQaHg1eW6BOBjG3fY0Z
	 4LoMoswwNbea0LRp6gu/wsQqLa8WSgZ1dUIiyXx2eifL/dEBfzWCmqWAuXetKvSg6YOLX
	 0L+LZt4vPEG3yHcjlvrLDzGr/1Km6THRzj5Ztalyq9PFcWLb3UwOtJ0ZMDLYbVnh7hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wnHe+aJ2WsrFZPDl6pOfeR0Olf3ozD9pArGhE6Lcr50=;
	b=jbGds3g5+wVWpYG4uTp9YVuNw69P/qtIaX16+QsBFlsX5gK5QumxyfNDcGQeX9FMQ2Zk
	 uPtIcVIiGzf9445pSso7FhxDmPagrBOGWMiojUrhVp97IWdl+QRL49sNgA/E7wGEBPhkW
	 FOaR7PcZ2yeGAuE+MDyCSignh8JDAVr/xNsFZMnMkqYyuEIK9BTKjV6vPx1q0oOuhO7fL
	 AxDaZ2nt6SWl/bXrGAZL6QbqkKWic+sH2WbmFJR0sv/625EoJNzeKtfEsGrHbz6jp3yUj
	 mHG0Ov52z3zbtTynLk/OBbzPtnAvvZnWNnAoJxI6ucYjUyWyM0WGcHYVAFOU13CdD1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Mc61rJnX;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003E606A6BD
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F003E606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Mc61rJnX
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so30444575e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432762; x=1796037562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wnHe+aJ2WsrFZPDl6pOfeR0Olf3ozD9pArGhE6Lcr50=;
        b=Mc61rJnXoEpVe59quky0mZr+m/LAL42aIfNBOt5g4cFwk1FpdGd9oUlFZ6hws74mdT
         KNlhHLOuhwWgOneeYGsJI8bzHXJGZMDHwCTUE6WhuB3pfIHuPkUwsTi7KGdgr7RcbUUe
         7gzrmRjMldDF1ywQlcAZeBacmd6SraQS9Piq1DUH5wNxiSnM5WKopQnhtUF8nlrfcbbN
         PEAKHiB/VGHk3drWsZc3v4/rrdNI/YNS5FPaloBlhPs7e7ptmhFukTaUjUhkW/oZQ7/Z
         STlfjUUZYq9c9Su2RFgFjbTGQfY7W+wVQX8k89xVqyq9qa0ty9hwObc75u6EjshmMBWM
         0+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432762; x=1796037562;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnHe+aJ2WsrFZPDl6pOfeR0Olf3ozD9pArGhE6Lcr50=;
        b=v0N3TUpzOYkZ0AAi98as2AeuMxetVeusiQleGYJFNg9L99rndYltX4junIDLP1JSI9
         zt0L7Xw4TYk8S2EYPsE/fi0MeEAfqCizAWYZvQa59j2fH8FNuv7Y16MIfjBOEcrKYF4Q
         Z+jvajqyhkEjOsdy7cwHzR90TfXn76r+XFqCs5ZMIOQr4I0TAY9OYIl8alLe4W85fmyR
         M9n6PMqxcRQzPWki9BJBLU36EFCabR7/liiHcyBWVKP/ptCVqddJAajgIRbXerNyQFRs
         8hohz9ODlsQpkAwU5drU/79/0y8Hue9z2OaZ63N8Dl6Bo4Uyv+0+Ox+qqbZ4TyK2dmbM
         wBEA==
X-Forwarded-Encrypted: i=1; AL+hErEXAjkVHnoFyjBM6qnN4jbLSfVqtC+w5gPFStEYjJHQFMj546Ojyqi3cyBHm4Hd+9VbsUyXLe5GMIPtflY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1v2CN5uL1pV3RUbhFMABq+Rqvk1yl5hCes9RgW48bZ7fb2zlF
	EGYxNZIra9bYUtvORWjnSi7niQrQ7ns2TB2DPYy/nMxN+dkUtj7jl1FtnI8C66BuR7c=
X-Gm-Gg: AZFdTZf6zlsRny7n2vzaqam8+w27WUfQ4pH28OZqxCIAZZtHIVaCWtkoD7DOsZE2r4V
	xVaROjm/ID2i0voYC5Ou2Dm8vew4frJ7pBMXHcqntrLY6SdVjyjxAiyYK5Y/kV18AQivbIj5MiP
	u/gdvIZfRAQomSM7IZJ+F8pzopDMIOsNkpXTUEw75DlIiMJHjM3DUz/MRZrGYO/457JspNqankY
	qMwzUSl+iO226vfiiPjFiI1lHO5js5KItU8McvU8yeVnGtiNg1ZkQmIiBhCsA8p7rnErCX0bzle
	vsSH26a2lHILNVOLt9FiVi7rRp/Qg6XvND9k3EGzgaYUCCgHXY4rlVgrq1AiQrouSA5IaWofl+u
	/d/h8cj2IdUpfHVkHx/qp9I50Uy7o1/VLGiBoHAABceoOWFSivCnZ4sbQC0uebSCYdVXbwnLvVr
	P9Zxd6PiJZIg3EQ5T4VWhU30us5lvWrDKjESOWiPAJDl+l57dtpOoV94JV+HnfLk2ZHoD59+7wN
	4GQuWbKZdy3nJjljYNyxBnvMzt8/fzVXTx4Ot3FN6l+eDH9VaISg74FyhNK+GIbY1S2l3ZFbhRd
	8WAdobWzSYhGes35R+1bNyRLIQKTJVwESJH1HLDBOuXYxzwHIYIP/cbdbZWvGgtJwu63WyuS/AI
	XJyIxiiYj+RWc5n/6
X-Received: by 2002:a05:600c:3555:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4bb8882907fmr231833505e9.34.1795432762456;
        Mon, 23 Nov 2026 03:19:22 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6b2052c8sm21640122f8f.41.2026.11.23.03.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:22 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Thomas Richard <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 14/17] mfd: Unify style of dmi_system_id arrays
Date: Mon, 23 Nov 2026 12:18:12 +0100
Message-ID:  <2ad1457d2b4d6c036934321d6afeda15e4112704.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=r3z65v4UhgVjo0/cvLPO1/pZfgRWfVroU9ADDGE99HQ=; b=owGbwMvMwMXY3/A7olbonx/jabUkhmwWRS5R3l82m+93Gx6KDja80BrZo/1aREnp7FTPuiieR Q3nrvZ1MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjARvXT2vwKy71Y+0JnV4nDI UI9n//PjR1scE6brn7ecseX3TiWvNLvkOJsbK0U8gqyqrq6sztHzXv5ye3eCeV6p3+97p4I28gW m5zCuX+/PqDX3dGCl3SaTxseLFZQaNwpP+OBz6rrB4oh7X14vfj79Hfc/hkrXCqGAuCNeciemG8 y1TzeWKLjuLD9vp8YFo+Udkx1k5Oe3zG3N+fd9R4HSh7j7rRdr5GZaPJfxLdNgMN1m3Flum3G9u /sgB6fdT5kmufMnDS9pfvwsdUzxslEg95/0PavTt7TpeDQ9DlR6r8/kz7nq8ha57xUte2Lfl5xh 68g1cjz8aRn/2wmV3YXOQrfmuYqcL2xoStlc6lPheI8FAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Only the list terminators didn't match this style as they didn't use a
space.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cgbc-core.c            | 2 +-
 drivers/mfd/intel_quark_i2c_gpio.c | 2 +-
 drivers/mfd/kempld-core.c          | 2 +-
 drivers/mfd/tqmx86.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 8a63923d1912..d1dee7b411fd 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -393,7 +393,7 @@ static const struct dmi_system_id cgbc_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "conga-SA8"),
 		},
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, cgbc_dmi_table);
 
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 443a1a0cf777..7f8c16d82738 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -74,7 +74,7 @@ static const struct dmi_system_id dmi_platform_info[] = {
 		},
 		.driver_data = (void *)&intel_quark_i2c_controller_fast_node,
 	},
-	{}
+	{ }
 };
 
 /* This is used as a place holder and will be modified at run-time */
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 93e35f6be9d5..e61d35664c03 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -737,7 +737,7 @@ static const struct dmi_system_id kempld_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "Qseven-Q7AL"),
 		},
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, kempld_dmi_table);
 
diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 1c2fe3f91238..16f47566cf3c 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -338,7 +338,7 @@ static const struct dmi_system_id tqmx86_dmi_table[] __initconst = {
 		},
 		.callback = tqmx86_create_platform_device,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, tqmx86_dmi_table);
 
-- 
2.47.3

