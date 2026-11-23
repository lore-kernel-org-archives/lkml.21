Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447302;
	b=Z4/ehVjOeFIHHLiYw84XjRJJtXm/sHWcnlOWfcq5AwmoiXsg2BXPcwzXXRW/mSRHTNtU
	 1UpzelLPVOJhbjabeW1rERpOIr/NEhfFxLu+56heYdksYI2AgBNVaWskp7YWF1gLD9iPM
	 oGBesCGhJuq0T+uXjeiT91ic/Wrisw8mxz82ihNO4xUvB91CywoSY1vXCqubuPBAxTfHM
	 eu1eIMnqEoTi8nj1dd5i8Mv+OyV1vyikpLqFs+ySXaM8jdzmQ1l0GKN62bPm121PkS3VY
	 D7Ei+n8IdGQ38+MN0aB8u2aMCuaTohxp5W5cjIrx3TFLx8iYq5IxWhv5qwunUp/Bbfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
	b=XcBZyJuU+L9lUyc2lcODSvv8W9LTpt4lmNYNWdLXEuP5sropw4xGWY9jnydTStB5Sdl2
	 jrRHwwlcucxVLFRn/YmfHTEe8jjhWrJv76HpAlBOx92bnbGQXYuExIgZLUFc1DPWq+jUn
	 9yDl2i9gvuWCV2K6lcAHL6/0AJRPedLprnslWDZt/dl4DBZuNkOXqKf6niNhQnnDYaBoM
	 IvwT035v7aPet9DyuVSth7V0YsqywmJlKQNWOJg5tu3k00kfC7WKRvZ7DRcLHOMkTRlis
	 eTXaYhaxfMXNpMFJIKirwc7FXe1rOJXRU9Y7lBjB/x+mzxpcEEprNYnndnKV8Wi+azQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0n77Wx4;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63531606A6A1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63531606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0n77Wx4
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so5494601a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447299; x=1796052099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
        b=p0n77Wx4SqlI35wj3vSW5/a4xAdd4wNUNkh6YbMnzBVQ54OiVYdXwuDS9gjnUHkZJO
         113Ix9RduNcBVNZhUsvmmaAQszrFfW10LvTEOpHUVO68WLndMwTMBR8QxmKc1q9/4HXl
         TYgwU3FMu2fAABoP7Ggd9CHuD3hEOlsymAC0F8NBRefLojQKEJqNrBa2etf2kwTwisFz
         042NXBX18mrhZ6KVHLQQTEKrIiFws5bdZrfumK2QmX5qqN3O+VHtMQW7uRaJ8QGZqb9B
         Sss/h2R8j1cWU9e0qjKAJoAIn7t1nww74JCdAIdkMTzlzZE/l6j4r8U61jNwpUWqsH6L
         dG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447299; x=1796052099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
        b=Ffr3VsrwIsh6Wr4wGb6hkDomjaYKtAmyGvZM6ftOp2UNGMR6qX4amDtDVqQ/aXmss4
         dAxsBc3i4sHiCce5vZy8YokuGneDFOBHz7lx8ZmReBfXmOBPPCkfYHLzJbFpY5r0Yzxh
         /+b/4rdH2TyPRFzdhjf2mfBNmc72VnTYxkInP/MPgFeNtjzQvGoAt0Qp59tj5UJe6U8d
         XoPOOEfKesM4KmzPqX47M2WXkQex/nMQKHBeAQ6DN0et8RVN/U0p5MOp3Gcs364nwtYW
         0UFkqfoX4ZF5ivuYhDrpBZCh7bon3KOPi+CQ8qRbkQ0LrOI/Ezg5tQKba5PqKSpxY5PJ
         4LRg==
X-Forwarded-Encrypted: i=1; AL+hErHUQNmCYpZzlJ2luFAAXtV2OdXXtySB0Nlhp03sMAle7SDx4P5LvYZTqIt8pGHnN7A5U9Z2v8bps8AOVqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+nxFM0UV5DquyD/gNfpbYl2Eb0y6zkULajFG5O4Fq0UP+HWH6
	mRcVeq7aQN3NtAXZWiilvnl5Fp0ff0y4wd0MjMYW3+qwSdu/IUNu7Lkgg/nUsZF6XXo=
X-Gm-Gg: AZFdTZcQ4GRkgDAdpIvktRWtljGdSr/TxfwkMd0ccDasUHPkYTkJ9snZJxI+ucOLEWX
	CWW6Lw0ZVR2V6y5j/RmdKZlRVh7uEFuGcwDVvwcsDhxz8mdUPnt3VEU25Lg+L+sZWanDuTFXwap
	DEzTtQUqCpgPUHN/epUpeu//SXytDCtXFqJW8JMA+kkyYpA1x1VNDxfrWxJc+abxIGPeb9GooQl
	X0/j2VngWiXT+j+HBOig0Gl8yyFfnHPTgCj2BT7HaLEXKuek+7mADJJmRGUJo+VWAql6c1qBRCN
	Iba8PJ7FxdEX5yudHvL5t/AWfOmFKiEVa5JTg3VuMf0Z5S5xeXj7nOLuSv7J4ZfV5Dbhssoz/mU
	N00jnLENchCIBrH1bCx6+kmC/9Kx840wf/4xBiTqZHQfLby89OtsBlA/uCVqqtvGSwqlYVAl50Z
	0ee0ZDRjwy76EntQefgl03UN4ZiptJZGTITP4Zb9TWcwIQjFhm8YawWNIbSJvquEMvz86irvXQG
	RqEn8z9co3dt7xDAqd8Od8xo359sieHHhlBXTayRFfroBcM0QAMQrqvgb0ngOAYm8PaEe0Np546
	xbYmO7rxcJugZjBiPfiGixp9yNrXRWWz7QMbJL9pqjMtClQqA6E=
X-Received: by 2002:a05:6402:4004:b0:6b5:8719:6d51 with SMTP id 4fb4d7f45d1cf-6ba37e6f76amr9086912a12.32.1795447298876;
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm22884229f8f.50.2026.11.23.07.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:31 +0100
Subject: [PATCH v3 09/10] firmware: arm_scmi: add an operation to set the
 function of a single pin
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-9-d61f039be008@baylibre.com>
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

Add pin_mux_set, which selects a function on a single pin. mux_set only
works on groups.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 6 ++++++
 include/linux/scmi_protocol.h       | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 1bc4bca4c48f..4e3968fbc5ec 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -790,6 +790,11 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
 }
 
+static int scmi_pinctrl_pin_mux_set(const struct scmi_protocol_handle *ph, u32 selector, u32 pin)
+{
+	return scmi_pinctrl_function_select(ph, pin, PIN_TYPE, selector);
+}
+
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 				     u32 selector)
 {
@@ -854,6 +859,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
+	.pin_mux_set = scmi_pinctrl_pin_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
 	.settings_conf = scmi_pinctrl_settings_conf,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 072190e89064..5cea4ee14a3e 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -789,6 +789,7 @@ enum scmi_pinctrl_conf_type {
  * @function_flags_get: tells whether the specified function is pin-only and
  *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
+ * @pin_mux_set: set muxing function for a single pin
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
  * @settings_get_all: returns all configuration parameters for pin or group
@@ -812,6 +813,7 @@ struct scmi_pinctrl_proto_ops {
 				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
+	int (*pin_mux_set)(const struct scmi_protocol_handle *ph, u32 selector, u32 pin);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
 				u32 selector,
 				enum scmi_pinctrl_selector_type type,

-- 
2.56.1

