Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786777;
	b=RBPq4VYBTWRT+i6hV4wvdnZ9TQc1+nUiej3f2np1hAOZmT7++ZJg28FP/dnQ0vBSrDBF
	 XQJvv5U4m+WrnEHjI0JJRzH/3qQS0KxRXf9sHmqeG73/kDHaox1GHbWGlaHeTEFMO5849
	 knSUImWSkpHzkU5hI5SiIJhVJmyyLx/KeVAti0RS4l8VjUWA3U9tBXC8bHTyqGWk7uq70
	 iBtbOaqEr0EZEP//OrlYWMH/fmUvYp/KglEYaLeDhXBfe3MLT9g712xV5alHJi3BzpGy+
	 lW6YxnNrlqwL63vWdzQNhGE/JKnZ9pUbMmCWkpgBQepzCTQBrpHfP+AnWPhzJzPehjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GGQIQ8OHiW8XFxoCL792i+hinooy801gxNMY844Q3m4=;
	b=kS+EFI/g3WnUdSa24KZGV226uadh/xF4YgSjQb4fUqO6HejWpqn/0isUE2xwBkLKWnt7
	 czgdrLZiWBUOapMxYVIrPATkT9KBPV5Dk3pG/9kg4cedvLek+jY5TByRcH5Zx2KvqYl2u
	 uaLN/5GdsVnZd4S75qomn8br+ZHIVIwGj+Ug1syg42ONS0i5tcQOvsy98hhPyJyQWddl0
	 14czddfWiMM1uj4UkgQ5fCFtHdDQvaqJCJNpoXd1ltpzBnCCfm2WCD1HJYIqn2WuA/74M
	 IVvLqGAoQhfLqcKMst0+EbwVi3XSocQktRoygttSbLi3jCsxdWnkDyLa1rRH9pF8y2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFmnAQCG;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7238D606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7238D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFmnAQCG
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso3141190b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786777; x=1796391577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGQIQ8OHiW8XFxoCL792i+hinooy801gxNMY844Q3m4=;
        b=PFmnAQCGmUDdTMbFjohN5Qw5vbSUu9pJkDMdy2HNY6Sog+4dQa4GU3wUGczYnePJ/A
         wEIjLiXanLNLiHF4IXuj1YwNx7iZFZ0EejX1Rdf0VtDdet9GjOUC7b3MA7uqAAsCuj3+
         muxRDUokbipsylxiOmFwswCuhloPN/3k4YEg6FaJFyM9Tfl+q5d9Hxjg9UD1dIAlnZnw
         x2o23YNO3y7U/6SD4kiY+6t8X3EXSMiNZdgQ81z3dosbd2RXflQLOVPNpWCnS21VLR2L
         p4Wh2LJdXRSuKgkoafexf5yNKJkGgHoiqmZ4kfCg/tBKJnCaQqMhQRY7BdC3Jv4n82At
         26VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786777; x=1796391577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGQIQ8OHiW8XFxoCL792i+hinooy801gxNMY844Q3m4=;
        b=qTBrR2z5WkkeEv4gdgs9rmU5gXc06BHxfrj7K532qd2Beve9UjQDvuNevwEjnLXydC
         ACohZ0TV2pDL/jDLyWrrqSoEU4mGoOf4KSWCGFPxswPY1p0ti8Y8Zhx2Az5O8MUwSnVP
         QKTqu5GvORgP/zcHnqe/iQjPmvo2Ru0YTj+YYgCB91tfOQanfg33tZluXztRCiYwRvnl
         mowGgFYwQ96ZILRVc7poKX4Lln6vDt16p2C2NfTd18U6kG9lm+FvGSgUM21vHok5QRKv
         FmFaqB7afhwSYXvdECx4vIMOLhy2TfzIT4RdqQ0HLEO/Ajf76oZ3LZCi285jugvayEYx
         l9EQ==
X-Forwarded-Encrypted: i=1; AL+hErFfgoXk7HTZZyzr1Esl2GTWDf6758eDc9o4K0/MEwTu0hGSrb44XbJBiPilPhjw9zCiydetfIwx50MTBzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z94/gqgz9Lu9oc9PjeSJLQWdnoAPGA1/XEmKv03yeK4HF5ujn9I
	3OInHYWwp9Q0DPpThrzOzwI1hEhq2JbDj3h65eNA4oCZv18w/b15GO5G
X-Gm-Gg: AZFdTZeFb0QChTlepJn7lTEE2muyWpXAy1zXVklopUdRcbyVygAzasFteR9cjzxVKGC
	rWDIEWkroRKPmpL8SBNR/eOgKMoJczqqEs8whyxqLskHV0AfK7csFup3XekaQmwyOSdOD2ltGKt
	q7X03Rf3pqLDISD9Je1mhlx/cg9LwAlT+wqWKgN9iPbvJWe6p5L3nr2ArdnKY8C3uGLHrm0tpSK
	Ctn1ZLKxnKfK/wTacBvGb1aasESxqYcEYLtn11w597LX7l0Ig596zxCf9uQRcHt4fSszuEl2HMY
	a/MJvdH3p6PcTubeOR6ZTZjlvmKjH9cd/EElhImEJGIi519yFj5P7GTlm1cKEL01F+Ry1HEh0UN
	J5zI0uciK9oroj9+EjvFnpmywiJBnxIeX9ZOAfPTNnnM3DDscPWs6GlFxmLCAqK0M+ecrHw9kAD
	Lb+xFeOGOnMyTOLz9WtFBY/J/dCu/OZtl/Ep1DUmRFke2FuDJ3TH62zoTTB9ZFe9Q7Agebo0QRD
	e41DWZ8sph+FEjbaSmjntmzT6sPHQBwotlcZBjUboZh5Rrv18Aiz2+BC66AskZygVMU6dM7MVcJ
	BHOHIQ0PtnnO31VBtLO8WU4gvWCRBwVSINYXBIKaRNVJuKFP/qYoNN52pK3WGOn+cL0jVfGODyj
	UqadTJafksjQ+xZzYo4sxVS7dJCigIByDDBOuCX/jSfrkyDrfXfcdX9OsGyvjhMsZBwv/cBkmuG
	5PMSiTkehYTxfjpSfGEqFZftYZupMMCWHu9IUWfToM0yePliMQYtcxgzlI/NYh
X-Received: by 2002:a05:6a20:a109:b0:3e2:a47c:9eb8 with SMTP id adf61e73a8af0-4014d360003mr26313617637.28.1795786776717;
        Fri, 27 Nov 2026 05:39:36 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdebb45c972sm4091144a12.20.2026.11.27.05.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:39:36 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] usb: phy: twl6030: clear comparator on probe failure and remove
Date: Fri, 27 Nov 2026 21:39:23 +0800
Message-ID: <20261127133923.1452-3-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127133923.1452-1-luob87709@gmail.com>
References: <20261127133923.1452-1-luob87709@gmail.com>
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

Neither the probe error paths after omap_usb2_set_comparator() nor
twl6030_usb_remove() clears the registered comparator pointer. Because
twl is devm-allocated, a subsequent VBUS or SRP callback from the OMAP
USB2 PHY dereferences freed twl memory and may schedule set_vbus_work
after teardown.

Clear the comparator with omap_usb2_set_comparator(NULL) and cancel
set_vbus_work on probe failure paths, and clear the comparator at the
start of twl6030_usb_remove().

Found by static code audit.

Fixes: 0e98de67bacb ("usb: otg: make twl6030_usb as a comparator driver to omap_usb2")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 drivers/usb/phy/phy-twl6030-usb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index b28a94b..5ea0bfc 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -368,7 +368,8 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	err = twl6030_usb_ldo_init(twl);
 	if (err) {
 		dev_err(&pdev->dev, "ldo init failed\n");
-		return err;
+		status = err;
+		goto err_clear_comparator;
 	}
 
 	platform_set_drvdata(pdev, twl);
@@ -402,6 +403,9 @@ err_free_irq1:
 	free_irq(twl->irq1, twl);
 err_put_regulator:
 	regulator_put(twl->usb3v3);
+err_clear_comparator:
+	omap_usb2_set_comparator(NULL);
+	cancel_work_sync(&twl->set_vbus_work);
 
 	return status;
 }
@@ -410,6 +414,7 @@ static void twl6030_usb_remove(struct platform_device *pdev)
 {
 	struct twl6030_usb *twl = platform_get_drvdata(pdev);
 
+	omap_usb2_set_comparator(NULL);
 	cancel_delayed_work_sync(&twl->get_status_work);
 	twl6030_interrupt_mask(TWL6030_USBOTG_INT_MASK,
 		REG_INT_MSK_LINE_C);
-- 
2.51.0.windows.1

