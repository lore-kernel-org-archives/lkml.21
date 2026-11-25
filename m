Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624128;
	b=ZcoVtMFGRDY7mJ178vH8hbLhNaKpY01QKbP8KgAd7owNdAiFraR+ldsw1Y0AMCddOG49
	 VsgFy2kSenMKoTsIv4LEA0FE/6hiSa7foYTiU3AajHxRP83EmlEXuNAxzzqwqP4007ADA
	 qRVUKkYZOViWUd4e1NyzIBfa/MCps7oCibR/uixT55L+M4DoAgxdRk07UwecBLKwOr+6B
	 ZsXw9xJMh7Y4jdwaFoZ9WM3xgFPd63rSUewASW222Ay2qcer8Sg9+jz6lOuf4msi7bRMG
	 zLLDTalvA7xk5usdQWPI4eRdcA0yXbM+xx047k27m7vYTjthbZ0FPy0CJ1o35eqLlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
	b=ANoLlcjwqIvhoCGR+XYDpsjhPJLNShht9jq7h/0xVcF2Zu0gmFiyL5NEWjjAo8gCnM9/
	 Y6dU7WZlJczIeilFjDVoNfMx/2mvsBxiK2rlC5t+xFMLflTvTIVOAv5J57VKao0D4ePsC
	 MiCWLNUqKz8BwGLH1FvNVk5Edbgqj4CwdN2YZSMIC+iwP5awJEEsOu8eqENlAvhHc+ja2
	 6qg6bLx32SO0ftqDsqeZUWK/9nP7A77CN6q2Qju3l8gYyWVw2Cx94rVaDoQ1ZgicCOIwj
	 WNOcQroDxCeg5QWwqZABKcMzVCeIDF17G2A84jYdetaFsOnLLfdovFh/Dh7IKfw7ldw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NefMCsFC;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E45606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E45606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NefMCsFC
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb61185057so38965935e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624126; x=1796228926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
        b=NefMCsFCYDXwhFV3ueputNOzDkBj4XzJivUz2f3/HIbE1fJlAZ9HYyIAIkcjs0UXAW
         uzT7s6u+4XuGELC2Mpc2tBhIjwM/gp9PM1WseEEcwm5yz+M4qG1dQYgRKQoMHqcUqjlz
         8ZjjabXUmAopEHH0nRpqomLHzOVeH7IckjszkEGd0yQzVqXRhMG5BjZbc/4PlYIxzC9v
         3NQpqlwr010/Nynz8SoNlM2e7DQRTxY54NPmjxkxxsZXV3kMPkjwMPf9Wwj9Nc5Ss3BF
         W1d3nsV9W/vF2SSvBmEfUp6QQD6F08os+W0PL0tPlL3CykglVfWa94ZslCHWlwaLwsr1
         dUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624126; x=1796228926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
        b=sNlN5+IDFKcrKTVAV3LNsY8Fql5rKSjj7nJ0ApD6n4tWF7zQA+vEOq/nGzfcqC+kgT
         yGf2xjNWJfbNpp3vHM6wsYi3pJmx1TZg4KKRowQ56jWUephmbFIUIPuqnnEziEimQB+k
         s71X3w12qyJmXV/Yp6n1HhwHHONB3qdY67RJJBAuP8g0l7CufxF9WUVHqzRJcVdRdOHm
         8vzxBMGF0x6sOObuompRA8NO8DToreCINpRMMDHFlPk5l2jXlXS4HczQWi6zurrl3h3+
         h2DrHDQ8oX2bj3x3gNnp/vRWt2knzkaSxo62Ua4ID2En9pnMWruRMw3JoTZMkadA8acj
         J4EQ==
X-Forwarded-Encrypted: i=1; AL+hErFq3PgaYKhkiXYYXfzR0Rs/hJE8Ro3gbntilwOmdVm9s8sNOMJbt2Lfv73VMmIOCfgKhisy3za/oStppMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tlKlYuaZRz//x3+kQGBBnfmQ7YowS/jRbeMqeRQKQQfTMYbtN
	M3TH5iNzQSMMCGxzpdqsNJi9ZcoFxo2iSm4ufe0HywEJg3/+kLYqYNW82gFiTxq4vzs=
X-Gm-Gg: AZFdTZc207ugCzTLHtEzDTPhh1XxLMkZi3mhC98Xa7MDA6pkG1u70C9gR2yEtYg9F0W
	Rjqaa0t6c2B4sA7Auqkli7ZS1v/CxbtMhOh6iBS8yepcj+mTu1hUFPhzH5Zs4C9SlVjpjZ9V7KX
	OwtdMqYYXnys9Oncy9HrbisVTUVioF5Nx8SRlGCcRdpCg4Vj5yO2+2QO+7I82EArxqnV8n9KsAc
	uvnVV3zQdX7vOewJBK05nOQWuEUBAfY/X1FG9pfrcCV6EN/5zpJJqsyfVZ+ZNdWEtbpXENCxWNe
	DmcSw8gWBVV5oZe0+We2Cv4mX7guRRsT5vZCzSr13kLj8l92ok2cU8aAOhYmTTBpc8YJOdWa/na
	mXiNO5Dqtp3kZH+DmbB5oa4EsUFOsKlZuWjFLIgj4Bup9jc9HD65qX76sISoTx6E8diM/xWVW+U
	KD3Wfmj2yzHoZ/TXlvuP4kMAiP3cIiaMEIOHtMzfn8EwKna2P5oWm7FZSeacoJxXTSb5hX5AlHj
	yYb7hpuVz51IKVSr9lNhUheAjguDKmOhbmIHVhCqElgS39aNwvor5XH4aRsa5gJUrsRkzKrYWjb
	27dXRzXMy4YQzs3Lve8nBaupbZRzwVz4X7IY2Yal0mi4sw==
X-Received: by 2002:a05:600c:34c9:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4bb88810d28mr405948895e9.18.1795624126434;
        Wed, 25 Nov 2026 08:28:46 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:46 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:30 +0000
Subject: [PATCH 04/10] mtd: spi-nor: Unify of_device_id list terminator
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-4-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=1549;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=pw1yVugjZoJ1sYzSavbjoh9EtNi40KpLFcyq3KxCgNo=;
 b=kcHPBXNDukNV21LLTOphkMkZzHhEUE3GVm5MT4GkuuM2LkB9EPUAINUu71xJWBBbyUPxGyGvR
 NyJA9ZKxwfTBYz6TriU3QIhP5Egb+QnpqA24EfhtbypOZI53FKPwK0u
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c  | 2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 4f6631950a5b..01048ca46a60 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -474,7 +474,7 @@ static void hisi_spi_nor_remove(struct platform_device *pdev)
 
 static const struct of_device_id hisi_spi_nor_dt_ids[] = {
 	{ .compatible = "hisilicon,fmc-spi-nor"},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, hisi_spi_nor_dt_ids);
 
diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 30fe2d414f07..71ee50eb1a71 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -440,7 +440,7 @@ static void nxp_spifi_remove(struct platform_device *pdev)
 
 static const struct of_device_id nxp_spifi_match[] = {
 	{.compatible = "nxp,lpc1773-spifi"},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, nxp_spifi_match);
 

-- 
2.53.0

