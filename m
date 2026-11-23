Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447298;
	b=Yg23EP/6vNVc7D8h/lKWefPJ7JVihsZD9Pf64WQ7tIAtGS2AX+jjagEBqkS8si51C4mb
	 VDTs7WLkPm/xv8YzoKlnb5fLNobW+QGxlZSRbwAgQhCZSnC8Le65iTDoYujSiMZ1Mksd5
	 gLavqajQvnLsetPR8WTXxUHwHBvFoxLNzoShhDSqt5I6feJm/j1orCDEH9sc/qjtmcqkD
	 CvLdVRtqhou7g3VFBoIrFpdgWsKTvkiWkp9CP4nbrzy2KGGYHJOcC9Vqtb5q9/5YVG5Gb
	 w/wJnFv3pNTWcNQVZKW5VNWbnRdTIDqBCCLYzBeOKg8Pb9xH/juOTlW4PUFpRSUOITQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
	b=LbJvy+86z02OI5RIby7KnwM+xzwG2psXjW2np+xRPRseSNjEKovaVasERWM2JSkUz9KX
	 8VldRQDKYsHOg/KT9qRXb6PFLTZHRd+bd0rg3WYR99Qh6IyncRtIQPIy8Xvraero81Vci
	 aviQsPSSsfEzcxwDrNMokNt9dprAMoV8qzcZIQpKMxhFkpzBJFhlTRkvpakgC3p2yYWK9
	 S868YwgXXELE4498qUT/UP1CrVlZv96tt5IlRya1XxoMWuLrgsHeWgKPnqaYifJdnBosv
	 wUO9NwN9sMsu0usF4bvPM9oF5uSUDS5hLYee31mB9gD7+7SxiRPKd/I7FkF4b46dtYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cUKLxk2K;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E3606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cUKLxk2K
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso24517105e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447297; x=1796052097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
        b=cUKLxk2KwQ1CFNjJAH55dYSowalnoMS30KlFmfFb8/N+MJ3exeJfkl4VS1J7+/m0z4
         CD41NjZuAo0C0xg2DSfSQIcCFX39/3Pafl9W0i/Mxu+b6Aj4sB8y61qqcpCBtXbu0l50
         WR9q/4ckU1UDOVB7OvM7kUJS35kUzB3EvX0Zf3tXfkqo8q1Dv/kJFm0qcxhxmOvyFt++
         JwjWYXgwt3eiohWqgRaUlDUiXq6i2Doh8KfmqKS3G12hVppqV2c5ztjV1z2h8bQGMQRb
         QhNW6EtHJZFV9i0GJ0pwBOHzqz9vYFH3ZDtfZkWmplZ3miZrgLNDKiMqtib1kaZDW+GA
         1NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447297; x=1796052097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
        b=iE9+E5vioFOIctYmMehczwc+DMMn/imyz4zFC5Fylevj+g0tuuwMxeJtmPqAj3Ln01
         Ehju1qxnytOlb2i0KMaa3eBevUQkKPE9PbZEDedgDD5yWPmlheVQrqIrUhv0pCmYQy+1
         odb1OxfnIVoOd5tovWblKRi6r62WJ+vR4OFmUx/zYZl7yp7jwLi7NGZk6UQlTviiTvrO
         LD5Jb1Ne47BSq3KaP7q8FZtZSASeFXGW9svO2sziwfP2luxG0NJDn06zodYm+VxnGHWh
         WfW5m7h67wfzlmAXdzkHjjf+dG6xi3aiU96ImDFOqqYVolWFynF+ZLxxYjfHfbvT32qm
         hybg==
X-Forwarded-Encrypted: i=1; AL+hErF06cgic5nQq2RUdFsr8fpzPA4rjqUAyrPtO7Ly98xVNo0pK9SKDFImpWPBw+2fj7v2165CuN5nqbXU6N8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oR7f25tywRCohOd3KQ9ogdEnlt2Mp+sDCia098vfugsaK4iNV
	PC+DzyuDxNiOxUfI5xiq8nTBMOxgO3t9M7h5wmPnfXByrHgNXEfautIbPEYTKZf1n1M=
X-Gm-Gg: AZFdTZc0XpEUkAYnJ6HAiBJ4ZitFxHeY/KRuKytos0kVo4qkeHSNh8/BrncOLG5Ldjc
	tcWdu5WOCMeBJJ0bRr5SpfdTcR5oHLdIv9ajup2uZt4jInNku5e/OGd3YzlWCVp3wvG8zfRPT6d
	Xm70AvuB3D2RVGpQQrm5TXX16soZMdw4yr33J4pEyZi+VJ+T52YsSiU5Tveg4+noEEHHbQTr8+j
	lAE7Yy5ZGcOLBMKUTn2ZcjwIcS5GMFsg/MeFZYvdz6RexFXCXQEqXvUMmSCWy/DcL4S1HOEtV1p
	KaZMFvYjEakpyhJuvhT0yUFECiUOcAipNgn7DPUx7ipzVMWF6v79T1l/VM//T4kNdI/gf31QMc0
	9vHthA38mXIYV6k6FDLQFOZyui/0204cISBGTXPnAymqFrBZ/ylarO6Xm7myjwtzdtI0hmvAnaS
	/M1l4btT0AWso+6HLvBwJeQz0EDoZX3k73Nz+5QPn3Xhs6LvfErrrzvMO2w1SAvniaxApctkAkk
	PZp1HmNHudStqLbAWYcoBTacnisneqeWPQNOzfN6wOiyRDI0hD8x2pIqPOYjnzLGpWigd2O12fg
	V+FLi1LuFC0fG+T9YWMUByGK2d5chLu6NrjpvABYm53gbbN9nK8=
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr163432115e9.26.1795447296665;
        Mon, 23 Nov 2026 07:21:36 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm313174005e9.4.2026.11.23.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:36 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:28 +0100
Subject: [PATCH v3 06/10] pinctrl: scmi: convert the drive strength with
 MICRO / MILLI
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-6-d61f039be008@baylibre.com>
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

MILLI has the right value but not the meaning of microamperes per
milliampere, and <linux/units.h> has no current conversion constant.
Use MICRO / MILLI instead.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 80c6e83a3a2a..dc3282126d54 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -181,9 +181,9 @@ static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *va
 		return -EINVAL;
 
 	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
-		if (*value % MILLI)
+		if (*value % (MICRO / MILLI))
 			return -EINVAL;
-		*value /= MILLI;
+		*value /= (MICRO / MILLI);
 	}
 
 	return 0;
@@ -228,7 +228,7 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		*arg = 1;
 
 	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
-		if (check_mul_overflow(*arg, MILLI, arg))
+		if (check_mul_overflow(*arg, MICRO / MILLI, arg))
 			return -EINVAL;
 	}
 

-- 
2.56.1

