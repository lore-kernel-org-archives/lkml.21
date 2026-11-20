Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173104;
	b=GndUWQlMF9JWksnhXaNWksvVd/x5bVoksG9yqJnjE58CV7vFSvy587qxYhJXyOXm02Y0
	 jyQJxWMABXBufOzZyc8Pbcjf88kLD4zJNJy9OOC9aLLpLwMnl89dM9xmJBBL4LuOLb2Gm
	 sLlTu8dvK2ypxOINdYdKpT76s9or+IOrj0s2xwVdGBy3p1kpOW5W1Yd3VREmD6vzmAOnx
	 VhuA1zUq7C2KHEyOmqbae0f5Rd7BJgy3n6NziMY/yrKYQ4X60pFfvlQ+FV82Dp2+oZEa+
	 rJ7ABmHuGimUIEgfwPfHbk8AARUqAHPVe3Jwx6Dbp4Fwx5SCzQSPRJVnk2GEFy2xN3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=LvlKqVyRHhYvlUCPB8iGyJoia7M8Y3oMPiJsyGR4j1s=;
	b=n0gpr17ia1E1IJ+xadKBiJAEp7talYn0HuXSXJtfHZJ/0UgSmK7v21TIIUidw2s73+Lh
	 z7HgbdXLQkbJSL2Q3QhVBHcdr87YEBuFGnUQFCP+5VoSHWgTCtNJkk5bOU6Anaf2DABZt
	 vSy3fzTPH1X6s6tH+qgJu2OOD4nTHxLGS3NC/PDE/cIDWvBYQ11ZXtPEM22xl2J++3MCH
	 P3re1ATk5zaULXh1qoWjXFhl8bB2IuYvEuWT/9fD89vyFuGO8MA7Ix1ug4E4xXaJRopTj
	 aqLNx1V7P0XGRb6929Stz5x+D4Gvv0c5x0UjRcUoEUfszwvYTn9OWaJOVQRjLJVCgLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aDWBOkEZ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05B60A263B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F05B60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aDWBOkEZ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so7170845e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173101; x=1795777901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvlKqVyRHhYvlUCPB8iGyJoia7M8Y3oMPiJsyGR4j1s=;
        b=aDWBOkEZ4qQRUHVhnFnZXjz6gFJEBlNyEyOoHl3cV5UW6Rq7wSX+1fES1TXbs+3IN+
         IAKYtLt20bq7t70W79xhmgxqItOqQijVxo5iyutKZ8jQe1SJ0c8ax6LFcFKQD4/pFVW4
         Scvf+gg55pm8RdsI6l503C/MgY7Jt/K0LEifX++rJZPpsAb41pguop94McXiGc1R57jR
         FWm0KPgHb8+GbMuAMQaM6CEjHnVaWvkGjKpL0Zwmz+m1lkmBwIH1hVaHU8FL9W489041
         MhdVrJqCpXT0gVwTihwed9HE5FTyyCmxQAMbMtU/vnweUAG4HMgIO82NKmvfP5w5TadQ
         9Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173101; x=1795777901;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvlKqVyRHhYvlUCPB8iGyJoia7M8Y3oMPiJsyGR4j1s=;
        b=NdKWvYMQwvjtwd4SbQ09EyMVeMIh7+8tQhjOWWOe74qHZADej8Sp35mZdkX0+bI8kr
         kDKql1nzusqiZ5hfv78DWYqLMumOmkhD99HYxWay/KAMEac463u6EGdhG+Bj/IAcBIWq
         Ad4YZFebc5iDTdOVNyqPiZsQeUgQIN79npoFGLsEBuqG7JGIbuRgZHv7yaHcSDf3wB6W
         vfCEvPWqu0VHzk5ZIIh3xJ0c/vDkhKaB+kjh0Q77EdiqDW4/VVgvJMw/9MwomWtZpGSq
         7fLua02SmBQbFSLxbO+35MAwGcThaTpX0S7mlPIemBR5Gnnlwg0qZSw/Hrtb+sqbxlBz
         Oasg==
X-Gm-Message-State: APuU4Z/USXqE2he1kfUzuhb8Hjhz0WZpt+Qw7FOh+FFQKhSKeNorLXMu
	iZLDXg4UCKLO/0yWuZFphVcLSxVhO3EQBSyl682c1ps3LABea/Hsj620WkMheO6BYTs=
X-Gm-Gg: AYBFou3TV/OmIAELfkesejmJz5B1a0bOGz0ZzujD2vB2CTFHHbIMFOrvAZIWEhHOTWt
	8qYYKnGBc5kJ1+KaZOo/JJbawaGhmTinnYhxg4FoAzSMRAgoVbtQ+8gcBPwTFqFvXsBGqcyxSB8
	STa3+KTd9n12Yz1vwChUpBan1dV5ggYyzPZiBfBP//8BNxXi7X8gjJOZjU5CHXg0H7lQbk0OV8D
	JXT3Zafq59SWC4yKWIbXEulaUOA6bd7zox5bpzALK+T8ofXZnn2G6vyW2787Ed5yqsqXHt8G37u
	Ejlc5f5UatWDQaIZUm+EsSQWTgvgW/vsp5+V/1aDN/n1RAcZuWxoDOjvyk3r2h0iVY4AqNFHOdR
	+/lcRcPldtmKgr7f9ggMU8ipK3hLCzToEp/tPqFct+sEnaoIwPGMUEvA7Oc2/S5ue+NraNCjv3I
	YX9hnUawlsNBjeuG+xtfGESfEazo1qXp5SLeybwh+926yhI5mR6x8XFxxFom4Zrt7hUB2wUUMbg
	clul6YYauJXOgqGPx0ugOWiR+BitYVxkT0SPjuBdjbhcUILUskWO4fnXuJrhV5yBt8atpxY0Amt
	xicxZ+dedIaRu+7Gd4l7Rc0dk8YbsdBTdGmfyLcouFSoScj+pZiv1m9hYLc6XzfbdnMgspokK8R
	VqryTFMSp+4SlAx6V
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb88826810mr53126695e9.11.1795173100811;
        Fri, 20 Nov 2026 03:11:40 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb88f148aasm25552865e9.0.2026.11.20.03.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:40 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH v2 05/10] uio: Allow untainted use of driver_override
Date: Fri, 20 Nov 2026 12:11:06 +0100
Message-ID:  <190f97fdc22c161c4721283a2beb20bb477f9e56.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iCUi/7tI/zgEkK4zQSmtLg1qQ9fsMtrvvDC7LGhhuns=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrACrTI/ZTGZ5YUYLg+hewc2YLCRqh9DJjAObYH uU0wg5v0smJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawAq0wAKCRCPgPtYfRL+ TikhB/91CrSUe0WLbAkxv/SKrwgCyHDlQP/ZyGjOoKNTEMIEV/ql4vVu9pMRDw6sHcxLfLYl9/H rIhWYQ2bf49lE1MoG/fCG8BD04CU82cvNj1qID0PlF/Y4W+6ls38K4tyflWGBfZZCxxirnW1QIx zDiWB3NW2veRL+r6Zka116LLr88v2PKOy+HsvWogO22SrxIOs5BSmfVn8KULg/MKVGAhYDycSw8 AS06RrlsL86KNGd9D7fKdhyZUZZO0KGGt0MVBMMh2ER7V0705/JMbK1cCtVwsDJy2s45E3HrNS2 69fihF7+EhGPXckf0p8NlRnPsHwNsOhRYJu6IMPJTGIT5tYw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

uio drivers support being matched to devices using the driver_override
mechanism. Add .support_driver_override = true to continue having
this mechanism work for them without tainting the kernel.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/uio/uio_dmem_genirq.c | 1 +
 drivers/uio/uio_hv_generic.c  | 1 +
 drivers/uio/uio_pci_generic.c | 1 +
 drivers/uio/uio_pdrv_genirq.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
index 263c1ebc2d57..71992431770e 100644
--- a/drivers/uio/uio_dmem_genirq.c
+++ b/drivers/uio/uio_dmem_genirq.c
@@ -309,6 +309,7 @@ static struct platform_driver uio_dmem_genirq = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = of_match_ptr(uio_of_genirq_match),
+		.support_driver_override = true,
 	},
 };
 
diff --git a/drivers/uio/uio_hv_generic.c b/drivers/uio/uio_hv_generic.c
index dff92dcbb10d..255c2b5730f6 100644
--- a/drivers/uio/uio_hv_generic.c
+++ b/drivers/uio/uio_hv_generic.c
@@ -407,6 +407,7 @@ static struct hv_driver hv_uio_drv = {
 	.id_table = hv_uio_id_table,
 	.probe = hv_uio_probe,
 	.remove = hv_uio_remove,
+	.driver.support_driver_override = true,
 };
 
 static int __init
diff --git a/drivers/uio/uio_pci_generic.c b/drivers/uio/uio_pci_generic.c
index c0cab3adb7b0..9785df9fc5de 100644
--- a/drivers/uio/uio_pci_generic.c
+++ b/drivers/uio/uio_pci_generic.c
@@ -140,6 +140,7 @@ static struct pci_driver uio_pci_driver = {
 	.name = "uio_pci_generic",
 	.id_table = NULL, /* only dynamic id's */
 	.probe = probe,
+	.driver.support_driver_override = true,
 };
 
 module_pci_driver(uio_pci_driver);
diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
index 87e43821ab0c..022178248962 100644
--- a/drivers/uio/uio_pdrv_genirq.c
+++ b/drivers/uio/uio_pdrv_genirq.c
@@ -261,6 +261,7 @@ static struct platform_driver uio_pdrv_genirq = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = of_match_ptr(uio_of_genirq_match),
+		.support_driver_override = true,
 	},
 };
 
-- 
2.56.0.rc1

