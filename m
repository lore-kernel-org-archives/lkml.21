Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944307;
	b=Hd53nKlV9NsrrU5uwRhs0gjAM7IoeJNsVqA/21eR0xhvqcSKPf6iZUQ5V6huXsP4zWLl
	 Nai+/VV3jCG6D71GPLEhJDmbgK0fZD7SHV8k/nJw5/wPtF9xeDxlFNjJjKljS5AwiWu1J
	 pT7V5OREvWqwjM44zkyQ9eoa7kSibZXHQ1j1ce78kO3GhfR5RiUUNMZF+p5oWU3CR/rCe
	 Lah5Vusd9kEtqCYQxamES4NeIoWD8eDj9ro74bpMQb+hD7ufm7liqJhAYhFMG9cZOoP8M
	 amQm2/1wjce0BNtWAdO3mGBDtBSTExyoW9XLyNZumKal7/tLQJu8XKaRDsnbNPI2G4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mzUXuDR8OHK81TyfGQx/IwpVMtB3XzAxHCLnFDfTBRk=;
	b=Qofr4E7wBORqSyOZHFk4SpATBCILetmST/Gwou5T2qhpa6qteG3Rdeh3bPX/zFRm0XdW
	 pIIlI99cOpDmfI3GHpd8QjuJYmZ6r7R3OOQb+XVXkj2OktQbVqYZeaosFYTuOGZHos/s5
	 Hhb8ZYSzywCppThlzbRviaOxE0791EHZa/9p4DwBqTH9/6P0RdST6sTo1vdZaWoQKQkty
	 mW3ubvmmHdlmQfavlp5cPdXdCztEZMRsJ0kQWVoj48/Z5/acvUf2wdrnVaZljIzwIdiOx
	 s/0UiYni2r+UB7DleoPyojAmi00XajurQL4NXTvP6lRfrTsKCnb4pw62m2n2MhbBZoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISNM2mRp;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945F606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6945F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISNM2mRp
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d68de53053so150876eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944306; x=1795549106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mzUXuDR8OHK81TyfGQx/IwpVMtB3XzAxHCLnFDfTBRk=;
        b=ISNM2mRpMjnLlPKxM1AQrz10AhUQpXumcwBTXms1TdWu6I1ctRP5axExZKeJ9LzzVH
         dzJbZp9XJsw99fU3LOPz0ot5dMZEUfR15E9763zfsi6SpotW3QMNASUITfecBO82I++T
         wxPQxdVS9mxtm2bbg3yqWMmByBShHlkJiFPBliVASuaQaco6lJk5vsvTCJQvqAahY2t3
         A99iCUAClyfakFdTaEc3VQDRk1E38olc5/nsS8+Znax4cpVLpqsnCleMbMVa90jz+Wd0
         wcSPVoOIJB3yClyoM6A2vJmn+MomRGHBikbvraD7QRAt7zRTM8lBf5sbmoFJKtxrNA/N
         jjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944306; x=1795549106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzUXuDR8OHK81TyfGQx/IwpVMtB3XzAxHCLnFDfTBRk=;
        b=eje5JsxUTvOkfhEIGBG3GDink6rGPw7FoxSuZQ+H3s/BePYqkMsPaJn9sPoQk3/sN2
         PPXvy8v+PYjMETonWuCmufCYhOGUaswPKLw6p+gqBdLEtvYjZdHYvtRaf56TQyV22Ft/
         BMHrLeowubkEZ6wcXPJA7YQO83ppTXV0UZhLmzjs6997OLTrzZx+S2ocG91O3zXwOl3f
         J5xYdyXVoD3toFggwUAISrn7GOWHF3ZXXqD0wSi3jd0ce/PQiwVCiAM4U4qVq9fqTPmq
         E9nKzErvseBjhjdadLY0X9f95kvECVrK3eCQ/jFUKf/bsfr1XFYjzFqAnkAbNw07PkXu
         /+jw==
X-Forwarded-Encrypted: i=1; AL+hErGu5yt1XIagXF7z95TPacxHz4uqRt6neX9fnmZInFbgp11j3ay1PZJwkJm9bXYlNAjEl6eFifMlAKZwfnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QpKk/owdvIpieVw8FaQY1/QBgVuU3g6AuIHduVdSdrQXVb9Ot
	JwRKac5eZdyzWHabI1mJbPb9gt1e8qUw8+NOrYBw13vdS3eRFX4xa6D8
X-Gm-Gg: AYBFou3zbde5py5pRfzFK6MR521aqPMxq1kUMcSkD9cONx2uN+eRHnZFKBeY7dpSWcb
	nFQv6lK5giTKQLz1+ZlU0+yXxedZ/r98Gsc5VfgSScO/c7QFwtzp2VaziSyY5lefNG2kD0x+tkV
	i2VK+bWrbVX+fBQ4V3+EmT+ZqHkrzfxGjJFrNJoDtQDDi8mBUfVOPfk2CAzvMKeo/+qZwLWpQCK
	J5p9Jv26hGrl7+4k0GI0vzHvKpspjozhhEL2Uqn0Hebx/fbDH9Z01jhZr/Irq/2xHgNGk7WGFwQ
	HJ4Kql4kNcoe3EolhaW99dlaGc1S+S3sPJU9gOHYwS1OazuM5b7a+G3Hi4/5iwE1MmzMLFtp9g0
	Qz4Uv9ox/s1n6+PnBv3ekq/LD8BLA3n3hls/BJym1KPY4k6o4wUI2StAF/yCLsVcRiFpFQDi4ON
	eXxnXwI5l4LguspYtofNah0shSRztt3LPwqxYN+KTRUQPSh19envDZiEyS2lCca/6xuFO1ytm7U
	hxZZBZVQfwxwCf4litFC0rTn3Mmsuv//r95RXLowK4dwarvG5ceTQC1bHMZ++f2E1irfetO1cmJ
	F+HhQOuNZ1sFBYGmZ1Hf1gsnEDSD/rOXa0UgiZprHiSwlp6lmbgTD5dMRBT3b2yESxsxa84sT5m
	n8nsTJ71rvqqaVXJcXV5ceN+eiZ+crs3SjnzxypWSKecyOnBpMLD6bBUfmWuZWKdFXHgHo8aoJG
	XC9alN8alTuCSWj8zCXso7Xbw994piH6N4zrMuEPCRZwEiYZxCb9A=
X-Received: by 2002:a05:6820:55c4:20b0:71a:fcbf:2476 with SMTP id 006d021491bc7-71b18485668mr207605eaf.14.1794944306356;
        Tue, 17 Nov 2026 11:38:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:08 -0700
Subject: [PATCH 01/11] nvmem: retain the provider node until device release
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
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-1-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

An NVMEM device can remain referenced after its provider unregisters.
Keep a reference to its OF node so retained devices do not depend on the
provider retaining the node. Drop that reference in the device release
callback, including registration-error paths.

Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..802637f375f8 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -570,6 +570,7 @@ static void nvmem_release(struct device *dev)
 	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
+	of_node_put(nvmem->dev.of_node);
 	cleanup_srcu_struct(&nvmem->srcu);
 	kfree(nvmem);
 }
@@ -973,9 +974,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
 	if (config->of_node)
-		nvmem->dev.of_node = config->of_node;
+		nvmem->dev.of_node = of_node_get(config->of_node);
 	else
-		nvmem->dev.of_node = config->dev->of_node;
+		nvmem->dev.of_node = of_node_get(config->dev->of_node);
 
 	switch (config->id) {
 	case NVMEM_DEVID_NONE:

-- 
2.53.0

