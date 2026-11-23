Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447294;
	b=myXnN+PKrtM5jLDxS96Q2/dsV+XZ7GmqtbWAHWhhp1S7fD8eDeDk+/tJdk/5vdnf6pD6
	 /NkmscMfER62ix7ddq0DYwI6vDsm7opWTzmVO3pxZ1nLKplpiyk0pSidvOJNpgdkD7lCg
	 3ou1f0Eg/bqq+38Y3axbiWbh6q7n24BQKw0wmPn4VnGk8qPkpf4XYyS3wHNBRHOdNAG5a
	 3CusOh6JBBDN+DmfYA+X5J1LMxGapIDI4H3q8YPEgNhwKAPTscYknfk8pNoREGasAdBpN
	 xGgJwMYzM9ML9Mi8cxZ6bczmK0hLcZRFR0bZ3bWtaYRJrtkb4osAOxjOP1CUmxsDQTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
	b=pWX65YjLHeqwmAnoAjIasHJpZIXPd+9hy/Y2vw9RkaJKmvR6LEolnPs/nroLrNWlVDH9
	 5bFIjOrcp3yITNeqAVC+XtG6QkbxUyYyPrmVy0x+4IscaqHHHtg2fw/lMhvTIJxGWzEzV
	 SLFGD9wHr8M0eABmb/ZkbAWGVSZCoCw7J0AA+zHFE8ifPXm4mfGDZb2Hs9MokcWAPpnCB
	 vD4IBDCN5x05e0shDlKiD7EhPwRKfR4Rf7o5XsIpu/vxRs4JKUOh7CQJwmFSfZpDbxu95
	 QFubst22zUj01QGzrSAdzYEHPskmyjnzOE2aujxEYrlJPLKkR/qmW+gTsyvQVrNAu0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K8Hh2hKI;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6D606A682
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E6D606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K8Hh2hKI
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so896491666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447292; x=1796052092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
        b=K8Hh2hKI+q9qtoFkFiwwkPbDWbfiIH+6O0ziMm/VuQLybG4goxo6XGBsq9EjVm/Mvl
         3bwj4U3lqM27HDzy9c4dZj5HHIk/YeJvBxCu39C77lukSPxVzc25JoGnCuWCmNQFkiHO
         0ufA5U0Br66Ac16cthppU9aZ7QDKal13zgvBPa5pFe9qCocMXUi0WVFzxDq8IT3UaX24
         H3HHiTCKC3ELUMDOtda58vBqsTGdGFsHqQ8pw2TD0EttSkh1Y9DnptwJ/WOZ2kiCAqva
         mYPd7xMdurMblBQ3Ie4C48lAGmRDotf4e6+BKXuI1XPWhpgDYoKsnAsUtyiyFQdNj0pw
         CyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447292; x=1796052092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
        b=WeiwRcbngoT14zTPbmdxb1XuOZhc53m3dAJHLSR7trtSrF7BrgmU711VwQhoyz61kJ
         IYRDIONuf1oIKIWuE5hpA55PpIWopopcA1KkX3PRq0iey6w6NjJ4MTSjLake3FW5Kr4o
         3Q+QATnTdexzwI4B/qF3KbNqnU8UGYrlOXkJ3xPpjk00uQV08XJkvj5iDH7VgCk+0qev
         /MTP9Wj1EhWM/wQ6KXxaGM+Kpo2iuXVw3la7G4CJG1p7rL46W9vRId5HSUoZq+LzYuJM
         A+GpuL3qhQySkzOEsg5mcOYz2hsxkNhcvgI6blg9GzGfszwgxmXS7QE/BLaz76MGtBdc
         yAIg==
X-Forwarded-Encrypted: i=1; AL+hErEDylx8GRqXu2RNl6eTdZiGhcyhT/nGIoVdmjfxefodlNfoTZIlSBEhJhNe0Lt4gnTyYoZAwXPmhEXi9qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aQvHQ1mViy5iB5YUOkFBouVAva7Hdm93/TifDiWAlIaVwSpXo
	SDY+jyIC+Ke+yWL97P/zISMsfAiy+hK2twAz/XRjIF++OOdeQPbB2LWKisqhgYI1tyA=
X-Gm-Gg: AZFdTZdVy7Gei+mWiO+J9dxr1k2VJZZLmYlKxbC4Mph44v9n0JEQRoorF1rb6d6vu32
	j+hpd8NnNNmCBwC+gXQgeLdD+sKeeN8IehnvNVPHC2YlpqipWXVWZTPob2m/r1KwX6VFTrh7rFl
	qW9Sf3OgaNNISLb2rg06FNdEaSn0drifrODPz9O5AfBrBQ8BH0rlHzoXpJs3rgb7XI9BrGkvWBE
	oL1SQXWVt0qnsfwlx9CYx7N8hHLFH+NdV9oaXsMSzl0+Uh1Uls3Gw2JrWM4JXmMGK2Stb6bCh4I
	Q6UEMSAYw6joGXBS7FbfFyopHTcAEt0LHj0uFXSQJdTBgasyjtxOXOAL0tzyEzhpB8c617G9bT4
	6P3GsLoX5DLWt4kuyQ7d2N+k8LoOK1ws4jbnSVUASIIulNBixZPplYG4TzQHxvmc2Oiqxr0BXyi
	vynGIVB7RvGFy4qpunSlSH28qXVO5d3nCjCR35hs8SL8c6Py6ZyUuh+U4BcQgC7NynFevIOrAPC
	7aCSBDXRGg9q2rkY3sKbw4uWKhaigRkaeZ1aXlk2QO1DjHOAOvTkcTHp+X/r5SXyDh6zj8Md96G
	9WZ4aTHsk7UWppKLBSuu1Y/FiayJcfL+oXDaXqgF7T3XGuxFBRs=
X-Received: by 2002:a17:907:3d4e:b0:c4c:e91f:e1db with SMTP id a640c23a62f3a-c51319a7850mr1124091666b.25.1795447291740;
        Mon, 23 Nov 2026 07:21:31 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm22628600f8f.42.2026.11.23.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:24 +0100
Subject: [PATCH v3 02/10] pinctrl: scmi: refuse an inexact drive strength
 in milliamperes
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-2-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.17-dev

A get of PIN_CONFIG_DRIVE_STRENGTH truncated a value that is not a whole
milliampere, and a set did not check the conversion to microamperes for
an overflow.
Return -EINVAL in both cases instead of truncating or wrapping.
PIN_CONFIG_DRIVE_STRENGTH_UA still reads the exact value.

Fixes: cc2f90768e97 ("pinctrl: scmi: send the drive strength in microamperes")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com/
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index b088a24e4ec0..23287c3add35 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -179,8 +180,11 @@ static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *va
 	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
 		return -EINVAL;
 
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+		if (*value % MILLI)
+			return -EINVAL;
 		*value /= MILLI;
+	}
 
 	return 0;
 }
@@ -223,8 +227,10 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 	if (pinctrl_scmi_pinconf_arg_ignored(param))
 		*arg = 1;
 
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		*arg *= MILLI;
+	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+		if (check_mul_overflow(*arg, MILLI, arg))
+			return -EINVAL;
+	}
 
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }

-- 
2.56.1

