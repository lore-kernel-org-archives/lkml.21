Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708754;
	b=KKLgaVP8nO66kP1uaV6zp6WdtH8IVJWMjmab4FehWwY/Lv+DzIXPEu09g7eX6VKTjKB8
	 kV8iKg+Fdml+oheRKhzDKbfWgqAMLpINfzJV+3gt3OEhMQGYfNxF36HN25/8U/OWGRIfD
	 ZIukT6Wl+7FuWpvYSwp2XfRPNOU98b47MiiXTNtBCjJUtZe3OE+zbq/FMd0sDFV/XBE80
	 z30qkDiHMstBoMG7e110N/OC83V6lRi6DXdZB49gv4d4fjUybjmUpWvMyRukPlV0XWaSn
	 OQyHqVguFkkACnOX0fUAgU8q+i2g5dprOxw5C5ban1CddO1pyDs5HPxkoAk4l/Xo8jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xdJp+FlW0fAnBajETS7/P+7V0hYHEUFR0KWFN0IaqRA=;
	b=iRJnemd8Lvt34i+Wf8+QXHszwcNSzOcCB0wobIR5SHlItBKbvcEVhLoqkrVPwGxnAOYd
	 SVhXLvpDJfQNJMb/a4cA6tEk8wJQEdNr3WrNh3vcGzttTjcfnpk7KzScTWD84Xck78q6i
	 gp8ZNQlcripOc/ojD6tk5aFgNEoRCeePLTxgxFJv5JJsOjFoXGUGMVcFrEmflKOzS2ked
	 9b1sFpFZ8MKQ8KDLWn84vKdzKMJhDPZsY1Mli4JwJY2n1O6EUss4dU7Yvmda/L2GZDoXM
	 skUkcjTNOSGmNHSfEToKU2UPFcDANgCE4dtQ68LyuSyGL7dQ1g0vEPhlJP8REuwNK+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr2+JTZn;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC06606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC06606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr2+JTZn
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385c497bf94so5832970eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708753; x=1796313553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdJp+FlW0fAnBajETS7/P+7V0hYHEUFR0KWFN0IaqRA=;
        b=dr2+JTZnoqQ5ydoqHLJw5HDebXiwsQxPv/wpFTjgGIVJyfNDsoFmgLKfkPx3ggrRqA
         ngEZ6NeCmv1npWvMuch6Cix+6odE7FiPOOXMKNUtBrwr4FunUfR/kbF2VAXk/Pc2cA4J
         1K0/xySxzaI5GKCIk0hwAHlu7O9ropeohMIjni0cn7/+FYi+GKF8K1f8Tfcu84EyI885
         +7iEbxii6KCvbiupWUITr1vtEd0xNpHCVTjCsBuJ8wSAqxxcw2/bhOdp80UCcfbljhbr
         Snqz2ptyQX95xjZw96jPsnibIPvgC5AwqfHyx5luSNEXfxZQeGQZlIy/+08zKXmBctU/
         rEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708753; x=1796313553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdJp+FlW0fAnBajETS7/P+7V0hYHEUFR0KWFN0IaqRA=;
        b=HUeaAGm7eM/U7jDlOt+hMpQlIk7DNLeDbbDDWN2ubV7stHG05MkSboBlF5paIt6jBT
         BCNu70CX3ooJ8aV5Y0RuTFrEe9oAtvl5rESQMkeMSQIIXGeEooDxz4HczjPR/PlZpPuL
         RmAiXq7KsjKl5H1R73jl0zbb4OCzufgJO2iZxt5kEBCEK/C7roimZSf3V40X7+6DLEcQ
         qnTSlR6AZ8KCHqecNI4YifzxaKGS4yBBNP8yRqL2UCkl43Vz/ExQ7SFYtVpp4ZxepXCd
         h7DS3J7kEecVoywMCbm67Jvu7vJXbb/hulZG/VrS53Mur/rt/KALeEPGlmH8DPBGKAoJ
         E2oQ==
X-Forwarded-Encrypted: i=1; AL+hErGQDum1Yop3WFS6QojqzlsLH1CAUMWXTdE4UAJQJr0zIW9Qb9b5x5bO7UF3STlg+u50KeED2G5apE/Psrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EpED2iBtK00XbsuexW4l1lUJJERbPoplVKlnElK+7GDv5BY2i
	GQJqGq7oXSCRl290ecVJe4v90MfXkKS+p6bZPk0F94seeRnJg1JsCFc=
X-Gm-Gg: AZFdTZefzrzhkDXIcy1Evr2DhsV51DsX/X7WIsnsIIPpQ3hg6uALgw3quvGUm53xbi+
	eOhQlgfoM9MxkrIa3V7ibk8XhuMUNyXf4uo8oTadMqboyIo7wSGziPPEtQsPS97sbZUfwwqI3iO
	t3dhMUujj73aMzAZDLkrqI6Gyo0ecYoy1GHwtcu0jYgGLykFw5MpVWKfRKbQ8hGW5J/CyFhl23a
	xhq+js0P8z33UQ9Yu2UDXmEs86zm8qdu12tu0w6Xwh+DJW9lrq7vpAP4gCFfC3cn1Mr4o+ES9WC
	0dHJW1vAw3Ac58KS6HLs9QQrL9/7nSfpoSuOJdfYdqv2pq2BoHR4EwL7q7Qdq+PZGC0u7j4oP8E
	smj/9RK+OaP+pYrp6Pq+QOv387QbR8EEeSXhBjGOy6FH06QUr0A+tmUlQQ6aJM+2zWr77EexBUT
	QkCu02Zd1Pmasz/J2Zmapgreb/CkDNu5QkDX8zeA6roHPgotZ48gJ418gNcWnuQ8yEPjMRPpW8b
	b8q7ch6BeLQKaz5HlPgmhRgxeg8A204G9ujcnkvBassXgQyyvyNH6gZ15YZi/sJKqEqTdak0UCZ
	KO458ajYyCFZp8Zj/cM+xm3Q6vl/noUcvC98EMIdGoNfiNuxD+9JD1UfzeHr5r6+nmpMad4uNGJ
	iF2INQLNy4FqL
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr21471812eec.22.1795708753327;
        Thu, 26 Nov 2026 07:59:13 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm35099691eec.0.2026.11.26.07.59.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 07:59:13 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: JC Kuo <jckuo@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: tegra: xusb: Fix OF node reference leaks in enabled pad setup
Date: Thu, 26 Nov 2026 23:59:07 +0800
Message-ID: <rc-b1-20261126-vc-166-f94c6693453a@gmail.com>
X-Mailer: git-send-email 2.50.1
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

tegra_xusb_pad_create() looks up the node for an enabled pad and passes
it to the SoC probe. The pad device stores that pointer in dev.of_node.
Neither the probe caller nor the pad release callback drops the lookup
reference.

Give the pad device its own node reference before device_add() and drop
it in tegra_xusb_pad_release(). The caller can then put its lookup
reference as soon as the SoC probe returns, including on error.

tegra_xusb_pad_register() also looks up the "lanes" child. The PHY
provider takes its own reference to that node. Drop the local reference
after successful registration, as the error paths already do.

I used an AI coding assistant to trace the node references and prepare
the diff and commit message.

Fixes: 53d2a715c240 ("phy: Add Tegra XUSB pad controller support")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).

Julia Lawall posted a separate fix for disabled pads in 2019:
https://lore.kernel.org/linux-tegra/1550928043-14889-5-git-send-email-Julia.Lawall@lip6.fr/

An earlier version including the disabled-pad change was compile-tested
on arm64 (GCC 14.2.0, W=1). This revision has not been compiled or
tested on Tegra hardware.

 drivers/phy/tegra/xusb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index cd1cd985f36a..aa6ede9f4a21 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -161,6 +161,7 @@ static void tegra_xusb_pad_release(struct device *dev)
 {
 	struct tegra_xusb_pad *pad = to_tegra_xusb_pad(dev);
 
+	of_node_put(pad->dev.of_node);
 	pad->soc->ops->remove(pad);
 }
 
@@ -178,7 +179,7 @@ int tegra_xusb_pad_init(struct tegra_xusb_pad *pad,
 	INIT_LIST_HEAD(&pad->list);
 	pad->dev.parent = padctl->dev;
 	pad->dev.type = &tegra_xusb_pad_type;
-	pad->dev.of_node = np;
+	pad->dev.of_node = of_node_get(np);
 	pad->padctl = padctl;
 
 	err = dev_set_name(&pad->dev, "%s", pad->soc->name);
@@ -249,6 +250,8 @@ int tegra_xusb_pad_register(struct tegra_xusb_pad *pad,
 		goto remove;
 	}
 
+	of_node_put(children);
+
 	return 0;
 
 remove:
@@ -285,6 +288,7 @@ tegra_xusb_pad_create(struct tegra_xusb_padctl *padctl,
 		return NULL;
 
 	pad = soc->ops->probe(padctl, soc, np);
+	of_node_put(np);
 	if (IS_ERR(pad)) {
 		err = PTR_ERR(pad);
 		dev_err(padctl->dev, "failed to create pad %s: %d\n",

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
