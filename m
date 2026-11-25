Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648299;
	b=2cbdrgSXrYPL22jJ869LZn/11jtahAadlHCVf+OYO1NeTcgcRbE5pULlgU22pa4sUgiq
	 CkrE3GN6kvEKgjEuZ7myP8J/juDUV3sLqwgOhBQCvzwiPIpOz+yWHzzz4crTQ3zL2eYiI
	 VOzu1qf76IcXjWKtWx5b33A2a/K3+KuOS4uBn95Fn8z8F0ihX6BYpVRtjemkj7D1yFEvP
	 Ep55A35BfLamXZGg6Jtc+4TYNCfjuDNMyrxtUenyi6i2RxtQBo+HTN1P1rs+iYOyNzdMP
	 GrSz0rgOI44M4UBhQUbHnVOVPwIMWsijvZyA79ZSu/JMUAW6MjJ1eq17ENEhKXWfsfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yfHRcLA9grK+62eWIG5EUtvcBspL1bneHzPWyn0hru4=;
	b=NzWpr2qNWebq6sAcKvfsFKcT5ZX9nfnuhHMLPxi6YAH/aKspx73v+HZf7DcsigOHzT2/
	 ZoMDr+35SrZhzpG39IRIs8rNgk38NiOFFdNx4IjSM4XNRl9JSSTgM/xpZJVMcgyCsXoKk
	 8OxBiYL4xwY1F0KlJxt3216PS554ZefztlBiBDjvY+nAjJUWyovcNu4h2PYTzEl6kf5Ap
	 fiXoTIIKMv2Oi0AF3okijApgXXQMQ2UVESIGz2wYtu1hOXSORX5F1+mn2mvS50DQE1imc
	 mAj0Sg26WkWCK5i58Lmx9V6nBpvvuQ2GyHphaweKUv8md5vQtfQsDa0cg5nf8isyymg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kkyoCB/o";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CB1606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81CB1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkyoCB/o
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so8309598eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648299; x=1796253099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfHRcLA9grK+62eWIG5EUtvcBspL1bneHzPWyn0hru4=;
        b=kkyoCB/oFa+yro5QsU4YzUxLek8zwfJCZbFAhEnMbnOlm4YiHrAvMHtGPCXgw6jLQr
         7tcTep7MpGUKCYZpD+wJqUaCrT9rc7cTBd5LnWxxvg54JxbM8RPaO1ueTPt3UeZXTNik
         K29l4KscI8NWKZDwsC9C1kiUHL0B/cRxSiHQKop5cU0CpZmjG7PibfGjqA+6k/ufpGAy
         eijYc0eG48nJgtMXAw02jGa6A/XTWIaEIwtVuvg6Abyq4xaFzvv5jUKn+b3hTejmMUuG
         W2BU0YiCGWQvkIzs0pYVm9D+qwtGKtA2FgU4qj8LNB9oUtBrBct8Sre3M7R4UVoWNK7a
         MyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648299; x=1796253099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfHRcLA9grK+62eWIG5EUtvcBspL1bneHzPWyn0hru4=;
        b=BcB/FvwuaauIlvOwuIa7pudxsTacG3bT+aPDgrbJobxi6WKT9rY+upgGBZ8j9uktj8
         SAX/v0FDoAGgn5iZGhPj1/zzr3E3vRPK00o+gcLknn3+w9PgSP/0odVK0/LTG54xIADE
         Hyu6jkrYrgN5vZp7a78rHjBILGl/bV241lSKmcTdmoSMi0GGycy4O2hP6ckTZAM68rmb
         xD9de1O9XlTrSUWc2WZ5Ed1I2McRrdHUjU4ZbTCvJ9INXJRdW5ffsdNVuCCIeK/T2jqR
         hcl+I2tXxiC8ygo5asuYk3OxvADqNX1Rnvhs/LiNCJyOEib37sb4lPW8RPZEwb9+sbzq
         BdQQ==
X-Forwarded-Encrypted: i=1; AL+hErHTDoQqV9Q+fTB9B5C3sYiWMcP5W6kOW/BJzfXkRY0WRe8/zM21ACvlVefeGaT7lcLVWuCYRAInAPq89Ew=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ldtJ0RyMtozVKyU3teA1ghkZ3IeauwPaIJcDL6SCkxtvQf5cW
	nBTDgArl8f9Rt0WDLHZMPpw84nreXdzUfPoarZb5M4Q9QzLWHTxABQNd
X-Gm-Gg: AZFdTZe6sSNildVNjP/cjVvQ4NBkKHDM/C0ArzLgP2VBSMjDa/kep2rYyW9iXLK5a08
	0EIrq5vHmOQXPuTo1IAqW3OikRlCX6BsrA7z7p9ORRfBlPVeUjNv8Twpo6yEXjh0qUTUUtiE15j
	UMmRRdBx0KxUl3Xj7LPYiteMtfawsYfZ98DYyrb2DOoOpc+QbazgZqXna58CBYPH1VcPFt/ToxF
	CofZdabkrdQYwyF+DKe/lZPjlB+ihCTV/pBkGdWmVZhOR+HMb3uEV6hJWIv4+6k8tVt8EA+QcjL
	yb1NiBW1JORbE9j5DmYcSrL2960B9w7hfPk1MM20zXlIczC028bsFAJWg6TqFhT8rX5r+/uawo6
	SwoiW4+D/pGztdDINdlTK92602g23JHhnTDdpl0I/fmTHnlbxCkHWwqF6OOHp5uMxF+oowc2iru
	7bcM8G9IE/4iEwX60YY4tOapjYjgcXx7ujXYbBLtWN5R1EK1c8bapQ3uHYW+tk6OxH+X8E8Axlp
	/UDY6adFgbjbii/C5mxiuS1uf+uosWw5c/vrN3hSzFcmXKUTC2775nvnX0v92s+N5RxbuvkhQQM
	vPvj3S1fs8SLAHn3bYJTYSXQwm0Ged1I30Hk9yxAzGa3CkXNvwlssW3QTpGMVDMEA9ypcmrZ5Uv
	vq1OLLWfbRBQpEBlyEA==
X-Received: by 2002:a05:693c:600c:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38570451dbemr22322723eec.18.1795648298582;
        Wed, 25 Nov 2026 15:11:38 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:37 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:15 -0800
Subject: [PATCH 2/8] platform/x86: thinkpad_acpi: drop dead -ENXIO check in
 hotkey_init()
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
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-2-6dee57519c2e@gmail.com>
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

hotkey_mask_set() only ever returns 0 or -EIO, never -ENXIO. Simplify
the error check on its return value in hotkey_init() accordingly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index a586113ab1a7..659a2c5d1982 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -3572,7 +3572,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 				       | hotkey_driver_mask)
 				      & ~hotkey_source_mask);
 	}
-	if (res < 0 && res != -ENXIO) {
+	if (res) {
 		hotkey_exit();
 		return res;
 	}

-- 
2.56.1.839.g22a8290db9-goog

