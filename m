Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799183;
	b=kVPXmDrhyS4geJHqqPxRv5IJWchj7nO5t3/PYxhh5gjS7hf+iKfr1ZY41bBnVRqpxYUk
	 AreHDx/5BXgnKNyZvNj8+/e1sGS57OFTVKR/XL91qBTODvFM41VDzbVvw1WOwfUfkRfmM
	 VmaonnEmXCraHD11XcoqWOzpyNJ2nC3VgGeve9Mhg2K9sgO9WfKdTdqYrnAb2RexwZ8JB
	 dATkAE5s+4XgROydtq+u8fMl2S6wfq6/M/Kf4uNTSH/q1PhDoa+tmLYcEhRjYrXHOiL+g
	 UcJlsOIy8M5n0E6MFg28pXDGUUXWRmxdtVQuBs8+mXemSCh7JdmAAMZTVVyOgTreqlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g1KQmw9HEAIV75UKtQgFIwtTmsEH/I6XD9iictGjPFs=;
	b=DHctLGNEvMLQKnqin477bVstiXO+Q7rrF9VhZgCuVZKC8cUbvN2MZmiWn3KSw3wfIrgL
	 DBgG+0wU+7+kecvBPdaNj7YpbQqvb8XEGtCrc5NZ0TJ9kQwho8Z2lCh2GZYCJKzvU/CaV
	 0YdFr/u3svDWZZOtjiWkxh9YgK0INcgASsL5bxpXkOvem7at8wJr+2S8kdh/D2elwBGVE
	 E3hy9LyaWuihNSUxE1NNcJlz7h/12NFWA+8ANO7lOppCO2RbTcATWwU53Ax3bRynNK97T
	 YAzXmCiT5QV9rLzulb6KYDLRk5aGc8zekGcnt0oHgO0ADKYLaZNhPTy/Z1glF0ed1bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWNFIC84;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWNFIC84
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so7828254f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799181; x=1796403981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1KQmw9HEAIV75UKtQgFIwtTmsEH/I6XD9iictGjPFs=;
        b=VWNFIC84OhJEVgXGSOwIpVM2bJAY0l2A6L/QADtOLadrGJKpafRkcyne+ATWZ1O8fX
         tRC8CSqMDh8bQj3/1VOrJZ5yXTAHYZ7teRJvBe0KKZfu5bbDLSBEQmKeidV+3SInrbeY
         n7Whdiv7nRLkfWL9HgabGFfVzlGem6+zihaOYweVpSDoQo758P2GaZ+A3Cx1nIGiWm+l
         VjLhT5bj3dxO1rdDjwleNsyBqzhdB4vIcz467dG417yp24vVq80QOaqVo4HcJFwROw/M
         Ga9UxLdx2KSniycMoCYntQb5EfYt7yRzrTKdX4Ut5UVQdH4jdQhQfEtmtjt6pt87KNC5
         i+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799181; x=1796403981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g1KQmw9HEAIV75UKtQgFIwtTmsEH/I6XD9iictGjPFs=;
        b=wvFZ+9VwsKmmDoGfychK5QFjr/kdMwfmW9Pt9Ho+kNARhbE/VG6nEZvuQDLU2d9CLj
         aADndwQf0y265EaET5QD0B3jlPXWcOnQlBEcQIfvmK/sElkTpuWNJ2hkNafFxokkRBE9
         wBacnGObIaEvS5rLpQmgtLi6bmtnJiMI2+OMrP1NSH4yFJa0WdBBXELjE9slW1iUTcvV
         As+aNy2HrSRSPilUpbyd5MsP8o4/kZFA7tI2LT4h3aQvNN4qZd723E3ukv+Wu5bzIShE
         kq8edcPzY6nKusK/vCwubvVkEsAEV146ChhdjbAYuHMP+F4tpupYqIDn5BN9iUKpqFeE
         NrUg==
X-Forwarded-Encrypted: i=1; AL+hErFXllOEGE0uMaEIsB9AN3xd/OtaJ6FgdozhMGFgT0ixbBamjO7guxLTnBSrJpFP4thMClfIvQIYUDtcpnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YJtR/6ojs3VYCA6OeqkEESah2yPJ3yQ8s1rVsVSG7DKnu5G1l
	mVGAjGezfxriN8vdJvVWO0VigihX7KfMINO0HdDpKAtAfweS/s9yOTM0
X-Gm-Gg: AZFdTZdWdvvVxB4mtE+YFiiZde2gk/fZRLUyOg1EadqCP7vYAZ72qOGI5LcDPNqpyuk
	oceymqyGx0BXIJKRCuY2SaIwhAU253d2DNo1Xy6eI1OrKYos1vipq6evUpdTuK15H4/EuF4RbFn
	i1IU3gDUbyuRDOJai+1A4swHPsDqRdfv2IV3+n5b62Exc1p9Befi/Fp5cyBIMxoAOBYSCWtzRR1
	vKkuYnj4sJlQ98jbpttKSYkkaDwWMwdEAEwclV5u4Y30LDR+XwTsoLCBl7VRE7MzxZfAuh/Slew
	huYu6Ul+OmdyY+HIr+nwLshLu6ke9FlhxVdFipEuYUWVki1PXuLqCg6zaH1O1rmIgVE1HvMKtCm
	W1M6gc3aBmtT1jYk/oEhW/xlg6XYCtq5XiZeCZUEJbAqUObMZ2phFLmE5Z1P0gzEKCNMUOmPyZo
	iWCVkjyPtP2LzdguH9vjv8wMNJWaTbSBS5Q4bVlUWPZgF9NPe9t1NQScLfrKaGjwPNcF6GH0h8t
	U4mMHJpWTVyEpH5cf3OLAUHhHRfC4dC01hDhIkECVDXTwMljoMKyoMkX6SqhvoIK+Vhcxfolt0I
	GjdNhBz9e5+0QyAmcmdxFnSmdOXgOkhIn98R5vx5keI/sK5MuLXkKKqbsA==
X-Received: by 2002:a5d:5d0d:0:b0:4b7:66fb:b098 with SMTP id ffacd0b85a97d-4b766fbb5abmr28304884f8f.20.1795799180462;
        Fri, 27 Nov 2026 09:06:20 -0800 (PST)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm49324759f8f.3.2026.11.27.09.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:06:20 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: wm8962: implement GPIO .get callback
Date: Fri, 27 Nov 2026 19:00:37 +0200
Message-ID: <20261127170039.663-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
References: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The WM8962 codec provides two GPIO pins: GPIO5 and GPIO6, which can be
used as inputs. Implement the GPIO .get callback to allow consumers to
make use of them.

One important detail to remember is that the get() callback will not
function correctly if the input pins have debouncing enabled and DBCLK
is not enabled. In particular, for MR-NAVQ95 where GPIO5 is used for
headphone detection (LOW = unplugged, HIGH = plugged), what would happen
is the get() function would always return 0 even if the headphones were
plugged in. This would happen whenever DBCLK wasn't enabled (or, rather,
when SYSCLK wasn't enabled since DBCLK should be enabled automatically).

We might be able to get around the aforementioned limitation by force
enabling SYSCLK before reading the pin's state. See TODO from the code.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/codecs/wm8962.c | 51 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 1832685aca40..7122d93a742c 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3505,12 +3505,63 @@ static int wm8962_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
+/*
+ * If your input pins have debouncing enabled, then make sure DBCLK is enabled
+ * before using this function! Otherwise, the value returned by this function
+ * may not be correct!
+ *
+ * TODO: can we work around this limitation by force enabling SYSCLK before
+ * attempting to read the pin's state? Is SYSCLK's source clock guaranteed
+ * to be configured by the time this function is called?
+ */
+static int wm8962_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct wm8962_priv *wm8962 = gpiochip_get_data(chip);
+	struct snd_soc_component *component = wm8962->component;
+	unsigned int val;
+	int ret;
+
+	/*
+	 * only GPIO5/GPIO6 can be used as inputs! Note the difference between the GPIO
+	 * index and the register offset.
+	 */
+	if (offset != 4 && offset != 5) {
+		dev_err(component->dev, "Only GPIO5/GPIO6 can be used as inputs!\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * we are forced to resume the device and bypass the regmap cache for the
+	 * read operation. This is because the GPIO level could change at any time.
+	 * Remember that the GPIO registers are still marked as cacheable. This is
+	 * because the configuration bits and the GPIO LVL bits share the same registers.
+	 */
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0) {
+		dev_err(component->dev, "Failed to resume device: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_read_bypassed(component->regmap, WM8962_GPIO_BASE + offset, &val);
+	if (ret < 0) {
+		dev_err(component->dev, "Failed to read GP%d_LVL: %d\n", offset + 1, ret);
+		pm_runtime_put(component->dev);
+		return ret;
+	}
+
+	pm_runtime_put(component->dev);
+
+	/* mask is intentional! We (ab)use the fact that GPn_LVL fields share the same mask */
+	return (val & WM8962_GP5_LVL) >> WM8962_GP5_LVL_SHIFT;
+}
+
 static const struct gpio_chip wm8962_template_chip = {
 	.label			= "wm8962",
 	.owner			= THIS_MODULE,
 	.request		= wm8962_gpio_request,
 	.direction_output	= wm8962_gpio_direction_out,
 	.set			= wm8962_gpio_set,
+	.get			= wm8962_gpio_get,
 	.can_sleep		= 1,
 };
 
-- 
2.53.0

