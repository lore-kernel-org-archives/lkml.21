Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432760;
	b=cn1Yzd6QqOt0WZjTq1a7yuFO3o80sEhdCGoAyVUNCeJ19f61a2mcZi0tAvQeTGIuIICK
	 zwIMkPQq7UlhBNMZeRloEakn3QrnsfZMbpIIRuwaMnzPiHqrKmxxNlm1oSZ3zBHk48aNX
	 8kUzH7CnPmzx7gLmpOwNZRlhohGDyMdHkkXPWEwF58HQHwS8a889Ktr/+hRqvP2rRrCO9
	 gD7matbbeJP79t5p/edtBcBh+kumxst/DE1XFlkFPILMIxJwGt+jnlnseiRpaU2CnYEb8
	 RQMdn+MOR15y0uwoM0MIXQJjICfwcrgFBp/80X4gC5welKknFoEbKP5eZZl5ZdBBR8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=J+ac4e8fXiZIKOXTSBDTqVlqshkMfShyWtCswJZ3w/0=;
	b=ubCF2GntruPJhosGx1RBkdFtN966agYAoI/l8p4etiXw/ITir6yziJh052QyiqoOmwgC
	 sb1acW5KjNbrApsmyB+lwbGtauPj+YnRRcYx9MhReedJXKXW5W49Asi8APYHLVbZUFe6+
	 FVqDmCSXgJOhv4HlkAmLi16NSbpWsrwA2Gx2QeWtwLYWXbbfyg7SKphjZButcCVusSR+D
	 T4viut49lJowpvGSYJibKVs6GaJrpkvfQ1XWN+1MZqwnRMlycD2TwPuIwrbOYAkijrXFZ
	 LfBFt5Td7XRW6t7oPhh0Hwghfn8vy5q3JMaKtug68ap3O6JSd8Xsu5PBtlyc1KnZwog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oubnJmWq;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216C60A5BC4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9216C60A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oubnJmWq
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso38104425e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432759; x=1796037559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J+ac4e8fXiZIKOXTSBDTqVlqshkMfShyWtCswJZ3w/0=;
        b=oubnJmWqkErHwMeQhdcoYHSu0JtqBVI13SUNkc1UA1O0ZPC3cwwOInLowhRSbPeVGJ
         BnIHW+a3EGevspwvsTHj9A01EEG2fGyBwTPYZhER2BwF/uQ00rSnX/9vIo/1c3+XpYDg
         /8jfMUZAbIlr8pvMU9vQUaopX91fN5q99IGfV6EiG7QwKToY0yipLPxRg+ndVR7jMvoV
         g7iY34dJiN1Jktzi5pwwKOXTqbp8D5Fgtc0kgAwQ+BElme4aSVcmswlOShe9aDX1LI73
         pOTDy3Siu0BaB5uU9fFxBNsBBtqjjops/9cKHmD5O791b3w1l3eBJsP+IajSvwrQm8jn
         Od1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432759; x=1796037559;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+ac4e8fXiZIKOXTSBDTqVlqshkMfShyWtCswJZ3w/0=;
        b=Ws8EutQ+cmd85ceQTNCEfCLuNGns+HFzAR4KE6xHqJWO9t6oGGQAb/i3FQ8/zQK0M8
         Ir1rt83LxInwTgChxl+Ssyh4Ai3VO7mw0lMiJS/YZNRsRunN9JaqdorYjOEMCyXK+gQW
         CrOWB+urZk1gMY27fTbbMQ7nYLfIFM2stApUYTQ+Wg0EWyyCtjRnFVwlswauTlK3GJJI
         zlHasQpTZb4ZVA6sswzhGTuo6jNxskCsZCCu71bmhqWDT2eL7TSuPl9zklmA+LpXEhWy
         2y7BrM+H8us8NWm7SH/h33M8vfBGhnnMnDb/23fPN6/BNuKgEGj31JfJwhJS358JMpGa
         54mg==
X-Forwarded-Encrypted: i=1; AL+hErGb+0PCd4wSMme+vMAJtAw8+A0yCDumVEYeP50xlAUZj23rB7b531uMYgkesK/6gnMRI8uzt1oY3VbNAkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OkacDDBZA7MDKo/wysdrB5U3pnQBlWXUIjv/TTjsC1qSKKyHc
	EAwWg1aiiu5uVQ4SOA8NVkCoGH38pVk+xGf/9jIiOE8+G2zyeX3TiDXP0Bh+E1uLQns=
X-Gm-Gg: AZFdTZdbe34bJnRCL2n1nFmMPJBCBjYFOAYVC7XErWyChemYDP9y+vB+NTntsHSqeEW
	CReWfQSpTd/BcU/WTxlyDeQ05sueZLwQpAGYCOJyS0FSWqNb1huHMrQlO5tRBoLsukRmaZhYt0f
	qd3trMLWWAUP1jfxhyTeFShyyqDCZqCero6xRjnr9mUl2JxlQCbXily8g5M0Hz6SDgiwV61vEaS
	E3DYfUXeH/EM5flHgGp/EM/Uw/N8GBXDAH7Hyq55Q+hCLH0dSiLP2U2xheHFWDrvXGbQn8f6/Ev
	TZJkaHNYA/aRN8UySyvsObbmqdM47NVyVKv5OLE0wD7nbB4vSVXKvXLZtq4EpVfdv/2oeCaCQdI
	rDF7FI7leitXVeN1wE28MguJEqt8cAti9IwyN2NiUmhHk3WWlBMJiWY+GBudR5zVgsBHGiqy8GW
	fF1tfR9qloKp/Y3ShCuwzNvk1/Y9/GIuwUggsf1260G3UM8cRHkWLFEWlURXaF8A33nvuuWBWxf
	5QAsdeuJJ5GIzD4i0YU5gMkt2+LRCspLlH7FpD/AC9G3VU6vWVWktW1nUmpEuDtWK62LaVOGZPG
	ivGLHlDOKECMZbQVqD6+N2Ef+DHHDvv1vW2iRO9udqlgNRmpQuY9z4LrH4ibp9BP2Zg8QNxLkhH
	os/YmE2yOXlNcmvI6
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr218980625e9.18.1795432759010;
        Mon, 23 Nov 2026 03:19:19 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b3a7sm392572185e9.3.2026.11.23.03.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 12/17] mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
Date: Mon, 23 Nov 2026 12:18:10 +0100
Message-ID:  <7806c77d2c777eb52ed9f77673161d73220ae996.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2334; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=DqHc8cG25xY/Lzd1sVscX5JVymXLlLJWRvcHUkSIYIM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCEF7/lyc5lYuiFfMbU4eDXgBUseUJLfkDmm/ vOvcdmTQ3yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQhBQAKCRCPgPtYfRL+ Tg2XB/4z1XPxNo8oxJrqHU1Kc0kRNCOJLctkwNTP27gqiZi1dpswf7+6qRYZye0e2HSH6L8q+Nk RPvhSVReBrF6P8GYVXMqAYMYYk4jMlPrngXFdpZax4287pjYhbMd7hch2imGDN5rGYVSsS+XFNm jWiB7yfhkFnfOZ753Tb0QQp8IbnIfMUwUOoRC5wchv88MUqC/b9JEcbUhCOOfE8cXeT4YcDro/R 4qKnjxZx3DvzxO+EgXpMm1A7/KeOCdTEsJ4jZzqarA2afWJ0lzHJHOqhparwLPxnS4Q7H/sbDQq fNw8T8cVwnZOvq6kl70YxMnSzGXU2c9EGsX0rSTJvoyvekax
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

pci_device_id entries are usually initialized using these PCI_DEVICE*
macros. Adapt to this more usual style.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ioc3.c        |  2 +-
 drivers/mfd/janz-cmodio.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index a86b4e6b8f77..34e4db8c2226 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -661,7 +661,7 @@ static void ioc3_mfd_remove(struct pci_dev *pdev)
 }
 
 static struct pci_device_id ioc3_mfd_id_table[] = {
-	{ PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3, PCI_ANY_ID, PCI_ANY_ID },
+	{ PCI_DEVICE(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3) },
 	{ 0, },
 };
 MODULE_DEVICE_TABLE(pci, ioc3_mfd_id_table);
diff --git a/drivers/mfd/janz-cmodio.c b/drivers/mfd/janz-cmodio.c
index 036773b3c4ee..a0cf86460a23 100644
--- a/drivers/mfd/janz-cmodio.c
+++ b/drivers/mfd/janz-cmodio.c
@@ -259,12 +259,12 @@ static void cmodio_pci_remove(struct pci_dev *dev)
 
 /* The list of devices that this module will support */
 static const struct pci_device_id cmodio_pci_ids[] = {
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0101 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0100 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0201 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202 },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0101) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0100) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0201) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, cmodio_pci_ids);
-- 
2.47.3

