Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447294;
	b=dC1ZRGqeY7MLpdNzkoIBYhFO13h4xOjD954YrdUoQu7ZmPqrxBTNAGIgEOS0KIexf+66
	 Orti5qz11oAynmv/ZLK9ACAciHoIbCRhiha9TImHjbbX6+2T9K+AkgAze27KuTNU7cyJ8
	 JYJfQJcIW5I2XzTREQg0Bul6yoRSDl7hKxTPb9ZMSj6XVuCWOEg5sNUWw0Km4WkFxSHXs
	 iFSw+VKizJt6lSxNogXyk3JiXGIUW0khy7S/LK7ZqhXCiclNOSWMChWi7k27lo27oOKxH
	 uJyQRQspuRWHyISqsTR+XExKBoefdYdhJyuzlickbHI1UXeLZO5P457sDpnESnQ4bag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
	b=5Ea9lii8TmfD0DoHXWNPQiZ90sA+8ETdXFf9lJH7God83ZpR2ZKzECIH4H+DzvFZrD0y
	 FnsC9DVPjdlc2iKKFs/wTiS7dhXM3qL+vQZFafy/+dm+kgjLS3H2S6KMieyEAnIOYrpZo
	 nqFiIxnTRIQE9hnDwUBCr8Czq5gmth8+w9kuTnSEpnWwN93shi0B2ZCKcYiOJuTczU9dZ
	 8/kCjGgqnp1pGAdgSfEdZqkvjV3A4UBKBarig8O4aTLRFWY70XOiwIaDceUHfvZt+3dQ1
	 j9YafpbOnxM7T2vxdflisQByPtBXioD+fgd1WwHBPug1+yTCUCLXrtlukF8YqF9Oifg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bXTdx4tv;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D35606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D35606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bXTdx4tv
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3338771f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447291; x=1796052091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
        b=bXTdx4tvohK72GoHLOxkkGD9DwiHrUpMfwXxr/zqn18JqrESbQYap3hX09WzNeStmU
         JptDL0LdtxhIqEtBvTPVB6ft0jN8rUkuntlrlLhD4zOManTWxiPN9Pt34PZrLi1PEV8u
         iZGwFQZHDmw38obBBCl/x8wcpGfbbuZmrKhrdLJB02vUEHqzlvmaqkLtXxNUE/lunBWF
         uBxsyuL8hklIWu89Mtbmcfla90gaWbwDpzk1pCnFSw4Drf6TxsSYLTTFMGf+2/D92I3K
         IV8xxAkvxwXqTPsVEQ/FI01qQqHRxHPxpG9JO+sZhHswPy48JAxMSZYnsYi3Qwf5t53/
         +Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447291; x=1796052091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
        b=jgsLJSy9TryGotC+5UyN6GilgHynHnjaeb/2i9s1LACU3f/kjJhedSscF10F6a5UmM
         DkLdRkXED7yRCCHqdXrZuMljS0m/ksjW60ezKepwA/wCasZYF2yQZQR2wl556zNDxBp4
         7uVDopo4Se5m1CkPHLsqystKnUXTJ1E8dzfBTVilx1oztQJlKSADJgY9zzyECJZrZ3CU
         +iT6Xsjn8liCosx9DYtDSMhQ/EmG0ovYOSYZ2nJQ2UwthPcq4V0bzD3SIIfQAdcFZNqM
         H0+ZYmKUoSkJtIn3N+jDn9fKhdTMeSGnmcs0Ox6+XikIOjYN2KtjMsqnlip51lJMgFkC
         DmOw==
X-Forwarded-Encrypted: i=1; AL+hErHCpd4I8e9iveEqliboS9n6Qlrxar1dcaxDvtDIcq0WwYsIPuHIetGm2lNeYP8pe+eU2EIvGzoyR4HvFrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GvHB43CqfSk1keGx30vvz1WFG0xZVgsDis58ZwEagSYp8R9VX
	zEIZi+U8M2/Xsd9NJmXHUmueJ6XRYmcPyIbHQQhXiI1jlz4Jf10nnmzeS/b4lJ4RpRE=
X-Gm-Gg: AZFdTZdoSWImmkTc/sYw21i4K6uRaYfLUaPup8PR8quoQMyrPOtFjKXFc8KrjIUaMRp
	iuXl+1IcF613FWQGKQOAXvF4fEIREgtrZ/eLeHS8rYhN/LH59Oqg3DNfP2Tfemhf8PpfBylaQLq
	yb6n9CLTvYVsAQrB8SIiekOS1Xo6CbYJL6nHyPLdsfd6YOXpbDixUsiIhO/c1vXqHMI2wduLbBE
	LacR9fEuruZOdfMkZGnwfesWIS8nfw5ZDDHK+hfffjK0d3IKW53uwLQs57NKfdavEPeQ0GCs8tO
	IzC4yHaJKchaMcF9k3ami8SZhbo3gA67Atre/LomH9WG+4ouy0GMjJAQLL0EF6VwB6Ez3PNShtW
	L/JwvDB7LCQkdmvil0O/lWKmZRaungcgsapTB3Mbk3kwUtoQq5+vqkDDPMZikVV6PE5chpIAnoT
	l3/qxpFjSaNYYLIbv7EUUOYNCNwjxcZAWXszL3JdBHECYjHR0SUc2UTShg226aDWL5AQo+Obib1
	zguiXlfHm/n5oc7FeS4QZ+SzVhWGirqfBHUbQXQB8VoTY+tQ0sdDofLxOfIDm1obOKnU90f9fR0
	RrrQVik336ZaalON5sWILFH+YfSaz+Ed2ldaDH7u06o/X+0iWQs=
X-Received: by 2002:a05:6000:4b15:b0:48d:df08:307c with SMTP id ffacd0b85a97d-4abb8ac0d92mr20347784f8f.44.1795447290982;
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm23236628f8f.3.2026.11.23.07.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:23 +0100
Subject: [PATCH v3 01/10] pinctrl: scmi: report an off setting as not set
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
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
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

A get of a setting that is on or off, the flags and the pulls, returned
0 as a value, so every one of them showed as set on every pin. Return
-EINVAL when the platform answers 0, which is how pinconf reports a
setting that is not active.
The input, output and schmitt enables keep their value: 0 means disabled
for them, and the pinctrl based GPIO driver reads the output enable to
tell the direction of a line.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 43 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 982c79bc77cc..b088a24e4ec0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,13 +153,36 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
-					    u32 value)
+static bool pinctrl_scmi_pinconf_inactive_flag(enum pin_config_param param, u32 value)
 {
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		return value / MILLI;
+	if (value)
+		return false;
 
-	return value;
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *value)
+{
+	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*value /= MILLI;
+
+	return 0;
 }
 
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
@@ -232,7 +255,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -390,7 +416,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.1

