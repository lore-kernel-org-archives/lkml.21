Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648309;
	b=dGVe/FbmOqoldSQUKAN6veKNfhCzXXh4r2QSmyVshV+8+WPf1u/clmWhiDk/DL3HdJ/N
	 +xVqsFkmSgrKa1rM22D+uW8rPSRpN8WxdG5i/tySc5aIa4frrG4DZ0ww81DPZKjrJn5Vn
	 d9raz4RRQub62elBh096P4whj1uEAK7p4+LHqWsaWslJpB5VUPv/uhj1pbXt3MVGr+kY+
	 PIiv27Z+Bi4ZfdUAJsokMB6JP5bkdcsT3FqSGTX/KUTeO8ceNPqc4lRQgQOydFyPXaKYd
	 s3n4h5TNUwRh4qhE0QwMsM5VtPJcvWcSAsWWTsV92280Uj4zh9XuD+9jzNEmDbsCmJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8dwyi/LNt/sZRH2hpB60uP+84f591kldBMUUJKPT3OA=;
	b=V7wVS7fk5DnZR8NJei7fxtU4lp+4s4qW91/UEJ8/S/169guore7IMXn7cg8GliaIt8Fg
	 8igq1WTCMoOVDLzY61XaJMcblEu/7rZixyJi/xRfDkhzZcn+3+wHg0hEtxw64CKzsceJ4
	 zJVPVBjl2RgWwMkaj9Yk+NmLavtMTYWHHWjPt+7PRNMMWVZR4nBjuAnAg+y2jrBwWKPo5
	 S0GsXD6aiHLJtt02qgTJrBNEeoqRkGkhAu/0iVER4sLr/TeH5n9D7ewEsajhfp728M3SM
	 lk037RxDsNFmouh1mt/1RkjtJ+AzjeIHcpfmLFmsMXvTESZ9dYmLmpoyJtKZ4jumxiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng7WexnC;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F46606A6B0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F46606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng7WexnC
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so10591873c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648308; x=1796253108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dwyi/LNt/sZRH2hpB60uP+84f591kldBMUUJKPT3OA=;
        b=Ng7WexnC5pJR0T86OUNpKT4/gXrdC8uA4+4p8dh+tmy5ZuuzXv0XTG0CODcSnopUrz
         zR4ztAg6b4ymVurdbXh2xDkuLAE7u+JPzt4RXsdn0BPHAurAUrJ92IQN/8VwdnXVdSqv
         HxNei9t3/FGN02wFtfdauJUuQhaK4pOWtTlZhXOuNm/jMvZVn1ikZcjCXwsNMwFK3Hen
         noqc7MZNi4k09AfEBDAT9o76Z1W7jXXPiqkrY1zYvaBqBx4El5dcCHpG4MDKPPh8hFO0
         2+x6NgSfss2P7yjJy7eG/e4Og90TI0kvHwEdOHzBg7TgMhIAGc/adSmbwmSwOCp9Tqcw
         DMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648308; x=1796253108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dwyi/LNt/sZRH2hpB60uP+84f591kldBMUUJKPT3OA=;
        b=XP0mbJVzj2nv5K13x1OCu6k+wduYGMkGsizdTJMI+j4OjcqqRcPxlqeyc15yJbT/CG
         pOelUXuIJh77eHnvB3sX1NIiYI7cXAzCwfrSJIGsdlIyD3dxTbaYPRJSJmICFmQnguZR
         aNvy+yB+Unsvt36RTnyJCsFi8NpSoqn7hWbiaJmqyfGtHwB8az2QaqsLzvmRpYkQRFlb
         JvCFamPUNfUCoaqyZ1mmSMirAWVafrMwgFvboOXo9cVXZpx48zxYUEXW3h2dTk/eS8EY
         UW9t0BxZcmuoqh6+A+e+TiP0RgK1zDkR/djB7movyJjb4XxLnNesL1phis09nT4BYG5b
         ZCXQ==
X-Forwarded-Encrypted: i=1; AL+hErFK5rywedPtWuxFUMJP3x2GkJmspKgFlQ2dA0Mm4EFaVydGAfKKTvlRJpzREGVoRdDRZPrd+Ubbnzly8UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rFLTHTr+nK7yvYyGHRxys+Rt9Rb4c9xWnsDzQ6On7IokxthP1
	gyEmyqOcpesEy0/IXQYCNz+TItdGtIsR0Dea5n7lx1HmfEnUj5TWQhci
X-Gm-Gg: AZFdTZdmltwdxik9WUl9aPebG5Kwv5Hkashpo357px3Hw0LaMQ4uE4ZEcGs0wsS+ZSe
	ItV2eGtEHUKuHd8kLKWqoxOkv1sdfOHmy9ZtjaKjb/LBn2oxDihXU/s/l+Tqd9AWp45dAwG9G0x
	tZC3/7UisdNwrxbKGl3DafLbaywtMR11CHBa9lYbIOtP3G2u3qX0SGgWfBtSIiWhNbwcV/CXQnn
	3rSzTJA9iiMRU5BkJ+5BdzWYewOsae7BP7gxmfsH+f5y5geFYEy1SwxaIJHfxt+rMgdpnZEqdjH
	lpDi3+pm7V7aGiFs5n26Ej5TagA1d524joE4Ep87Yf150ecwYDBqw9viU63zssoxhiZ7sAs+pWA
	zfbO/f0ucUGMk0Zs4msFYea/hwk251gyDyMHD+z4UOSdkE55mJ2rlfgXepkciyhavqvhCBSGWyS
	vr2Wt9pT5Aw/1F5acxuEVvashg/H5NGH6eJlZ6DgZjhbNvVFTc1kiILKsOf+3C17l2h25W4qdbU
	x3WQrc6u+f7WUaj44WcwBnXS5ZsONT/dQ1Mx3z54DT0BVCXqrsgYUB0pGukqlsGImJ6Q/L1K8N3
	anhnuwtyfEuwxtDPqQZddwJagPCGobSnDa5hmPfqGpS1t7cc6DTnDvnzCRQjzBXjs4lHgX6aqj8
	RjnFsM3pQ4pj9/xZsbQ==
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a302amr2180408eec.2.1795648307648;
        Wed, 25 Nov 2026 15:11:47 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:46 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:21 -0800
Subject: [PATCH 8/8] platform/x86: thinkpad_acpi: drop redundant input
 device parent assignment
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
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-8-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Drop the manual tpacpi_inputdev->dev.parent assignment in
tpacpi_pdriver_probe(), as devm_input_allocate_device(&pdev->dev)
already sets the parent device.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 898d919d697a..e809ed417e0c 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -12245,7 +12245,6 @@ static int __init tpacpi_pdriver_probe(struct platform_device *pdev)
 	tpacpi_inputdev->id.vendor = thinkpad_id.vendor;
 	tpacpi_inputdev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
 	tpacpi_inputdev->id.version = TPACPI_HKEY_INPUT_VERSION;
-	tpacpi_inputdev->dev.parent = &tpacpi_pdev->dev;
 
 	/* Init subdriver dependencies */
 	tpacpi_detect_brightness_capabilities();

-- 
2.56.1.839.g22a8290db9-goog

