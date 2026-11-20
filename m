Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202561;
	b=gDsKv0AKk0+mETq1f/502h9ghlwgLmXV4ATe8YKuL+3opaX9Mbo+YlJpvZhAuEJiC2sZ
	 7688acXbiDDBGWN+V+D4aD+rxY4pzDUBk/GdlBKWux/Co45KOFJ6jS7iHPYyd+ciFr2ce
	 Tx10naun0iDtggt40XcDwofMZcnQti1nqb5FmFe9xGPh00OXtbf4Ow4PVj74DRSUiSAl1
	 tMSL0jct5tY8JhMoNXyFbTXdCSDWqPXVCvyrswdIX+IrRbuKtECc+YIBNx939CTx7UxMy
	 yI5AKGgHPnxG5ueUDVtZAwL8yelKiAhSX+RDwbCC9xjX8SfiZg3aH2i/Gfe/b11A6lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=3fTBwITHRCHhMTw7Dj5LKL4SBycn9eq+C/BpvV4iDsE=;
	b=UVd3cbQYBzGcKUZ+UHZMwpzk0juV2rqeFg/MqBYaffQBAA0y/FxmHkynzOlhcK3gnIWa
	 sbspuEESwItSb3e+Toc5qUHmScnXsxELPaadKY7llVaUrngJxiG0xGoKN6VXAptb1hm/U
	 NcFgZOsl6nW2eOF7yzpKj1tLh9J8PZ9Y1d2Zbktjj4qU8/Zjsd7BxJAyqJygCpzyGsRsm
	 41WdF5XNE+1Qd7IU7aDWipY4aEUth03kYRmRnMjxY6qYBGfyKSnTY/wZ3EKuqhgNC1DwW
	 TZoK6Z5Y0xeAXtugGoIedjBtOAkIG5cna7IxY5Sm6Bab9hDTUDk7OYucYeZZ8EECtuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ldnWqM6g;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF19606A6E5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF19606A6E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ldnWqM6g
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so2537149eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202557; x=1795807357; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fTBwITHRCHhMTw7Dj5LKL4SBycn9eq+C/BpvV4iDsE=;
        b=ldnWqM6gq5XHbKzwjd8P1Q+wvwiJMXinLBfBlVCV5dtRmei6RF6PzPKLlUBkxoY5V/
         HaM07D92hy0cK2O4GfRiQNZFHRveP1F1WvyMW9PI6yIIar7Xa+0M2WgBFCAuXG/wlj5e
         GiUlhAywipip3HVKD3BZuMuz2TsHIlJBYKidEhdS6ApSk8zv67ucD/QrU3C+lmaGfjar
         dHDVcs/FdhwxUzTAQw9qAb3FdVpFU3NF3XB0qxnmpnuN6CuQxxcZoy5A/NQICLi4U50F
         w/erDBDfE/csTtozHprPN7jURPfca3thJfxCwDEoA5+nqKkjiBjOO3WofB6ayU9tLGbo
         JXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202557; x=1795807357;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fTBwITHRCHhMTw7Dj5LKL4SBycn9eq+C/BpvV4iDsE=;
        b=xc4eDCtvzYG8G3qJgip0UCsQPUjcwZYirTORyXQnuJPHLkbOEaZMZjoqt/naYKGzQQ
         ulYWCaC97SOWPtxg3BzC8mQzxCeylgszLrh+h8yDSUjbf9KGDtiYrGP0t65UhT0OK6tT
         I5d1qsuRN2SaJTnHB870+WrbvNm1VdEheTvZ9+6iTJsDADeMs++1ccj/V6LUAGLwF1jQ
         NrKY8KBhJ9NOljdDjGem2ykqRPQDFQ74445SD440cKSMG6+kGbzm1oL8MAc/tkD+trON
         jJbIP9fILXvzv/6Cvb2yQZLrC19OiPKsvvNkh97UictJYrv36/tp6Oqii0cDlEDsX9Sn
         LLcg==
X-Gm-Message-State: APuU4Z+zt5iT/fWMaoD5sECMslFl3rEmEMfZ1Li/x/6BQoyu3CpAaHOf
	/coONWcY/PCx3B1LICP90GNUgPMZUVSqWud686LjOWW8YE4pk8ziB2ZzM1OGGrOwbkMXmDV4AK8
	YhA==
X-Received: from dyba14.prod.google.com ([2002:a05:693c:63ce:b0:381:935d:2548])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:805a:b0:376:a6d7:8f51
 with SMTP id 5a478bee46e88-3856e63bbe9mr4561064eec.12.1795202557046; Fri, 20
 Nov 2026 11:22:37 -0800 (PST)
Date: Fri, 20 Nov 2026 19:21:47 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192147.2869595-1-elkin@google.com>
Subject: [PATCH] serial: 8250_exar: check IS_ERR() on __xr17v35x_register_gpio()
From: Elkin Cruz <elkin@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

__xr17v35x_register_gpio() calls platform_device_register_full(), which
returns an ERR_PTR() on failure rather than NULL. Both
xr17v35x_register_gpio() and iot2040_register_gpio() store the return
value directly into priv->gpio without checking IS_ERR() and return 0;
xr17v35x_unregister_gpio() later tests only if (priv->gpio) and
dereferences the error pointer via __xr17v35x_unregister_gpio().

Check IS_ERR(pdev) and propagate PTR_ERR(pdev) in both callers.

Fixes: 1145d1a0703f ("serial: 8250_exar: use platform_device_register_full()")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/tty/serial/8250/8250_exar.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index 42e55a8f8c69..66858e383afc 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -1173,8 +1173,14 @@ static const struct software_node exar_gpio_node = {
 static int xr17v35x_register_gpio(struct exar8250 *priv, struct pci_dev *pcidev,
 				  struct uart_8250_port *port)
 {
-	if (pcidev->vendor == PCI_VENDOR_ID_EXAR)
-		priv->gpio = __xr17v35x_register_gpio(pcidev, &exar_gpio_node);
+	if (pcidev->vendor == PCI_VENDOR_ID_EXAR) {
+		struct platform_device *pdev;
+
+		pdev = __xr17v35x_register_gpio(pcidev, &exar_gpio_node);
+		if (IS_ERR(pdev))
+			return PTR_ERR(pdev);
+		priv->gpio = pdev;
+	}
 
 	return 0;
 }
@@ -1286,13 +1292,17 @@ static int iot2040_register_gpio(struct exar8250 *priv,
 				 struct uart_8250_port *port)
 {
 	u8 __iomem *p = port->port.membase;
+	struct platform_device *pdev;
 
 	writeb(IOT2040_UARTS_DEFAULT_MODE, p + UART_EXAR_MPIOLVL_7_0);
 	writeb(IOT2040_UARTS_GPIO_LO_MODE, p + UART_EXAR_MPIOSEL_7_0);
 	writeb(IOT2040_UARTS_ENABLE, p + UART_EXAR_MPIOLVL_15_8);
 	writeb(IOT2040_UARTS_GPIO_HI_MODE, p + UART_EXAR_MPIOSEL_15_8);
 
-	priv->gpio = __xr17v35x_register_gpio(pcidev, &iot2040_gpio_node);
+	pdev = __xr17v35x_register_gpio(pcidev, &iot2040_gpio_node);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+	priv->gpio = pdev;
 
 	return 0;
 }
-- 
2.56.1.750.gf70dc682cf-goog

