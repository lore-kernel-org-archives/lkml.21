Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614305;
	b=pNrCSP4uj/SscjXe0aC6ZlR33hygI3E1ouBDM1avQ/cLJqs4ATTGQwmU+LV7V1Qnt+q7
	 JepCnxXNISNPikVrKmYC9TuLi6dnWrJ5D82PuiwHx7lwBX/8kynY/AGkuVktreVtqNUZK
	 Aovzik/7zzWhbZCvyLcs4vAhpazg3bHNjUjCi1UaBfGpt6kx8SrvDpJfa8KnEkuBwGmBS
	 /FgaCr37ChrSz2GO2MBi6sMkZlg1xcU3mB/ASvGBohucKyei64/EEBFxYw3p2M6AtJknU
	 chbdWl+ku/DgAl8yselTA3zoF4elvF1PBJSQesZBewCgpp47WrLBsnpMJhsJT0tgvgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s0Od9VH9UpG5Ndkdf4jvk5NSEfMYmhVaO3t7hSReGUw=;
	b=pCe+y4UpsOrYR9li5Iqz8juN7MLYXpR4iNXUAsBVLmpF/WmA3HFbPKOAAswO1rwFf/8+
	 4W20cvZRqzE6/nCrnVquIRe7nFB16/ZGnkGGc7xxxAdFV//hEohyhdCtfqNCOdurSfO7J
	 4L8jxQOq5jyqb/JJYz9ikdeLE+lcCfBK6YyhrOzsgYLEdIL1m6S4xFjkg+vrLe8kM76Ll
	 qKdqSxtBjns4nUi/2IyARZAE2N/XKNCRES32qlVpdh4h4mUJnQzPHBU7R48oq4sVKq2XQ
	 jx3VZhz1jBHDb/TMdd8VJ3+V+GQZYJYO1eFULOwlZWVQ46RQOuzsAJXu8dtgY3+5tsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xozhstFc;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEB8606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DEB8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xozhstFc
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3866a784546so7734129eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614304; x=1796219104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0Od9VH9UpG5Ndkdf4jvk5NSEfMYmhVaO3t7hSReGUw=;
        b=xozhstFceUDCgTCb5vaNUNE6gMRbBiSjCVklJuYVVgPuXRfzJBv59Wucpx59B7zIsK
         0jBXqTb700ESRMytDIinZGHF+Of7mgqeaIDE90RArg65rKARxuDitNkVtbrBV3ztlJUu
         Q6N6OFX0q7X+B2zJLEHTQsjqAWIpUV/pY1bWQ6k1senqGDAts8g8Nw9Z54VFUoYMQyHc
         OAMo35Dlp0aw2lvy+wp6XFX1qkd6ce6vICvoQAF2VJMpcuxeVMvlyEsi2/HVQFXF839o
         /vMZ3R8zDVzJk+HJw2bsN00TgklmzBv+MGeaiQQzzdKe3l3hvonENhGYhqM6huCpd/TA
         jqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614304; x=1796219104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0Od9VH9UpG5Ndkdf4jvk5NSEfMYmhVaO3t7hSReGUw=;
        b=ig3cqz7PMgP5jNygvJznjxOXWto2POuzlNzBxFQCueHw6EZjF21+XyU6N66ojiM1Ol
         BqFxIcAXT4aeAAlc6/HFzJD/DwnFr1Rgtnh4e8BgPfiwvi8rLcJrmO+ZF88S8ZVjxdrE
         vRKhi6NwbhWc5VY4SNczOywZMSYfSSIEmkiUkxlq+d1AFpnVTneYrMkdga8OetWr2QQT
         WTOCiA251r3ziWWTH3yMJoPnCyA+Gys8h/ROjOMzsYZooL0DDPIGIyte8q/UBgTmo5jQ
         1xvYptnx9dPIM/Fs1CAiPv+pifIGeJjWGIRwwkU0yKUy/9ucdD3qUCIkKqfdufeMCJ24
         QWOQ==
X-Forwarded-Encrypted: i=1; AL+hErGfFOuSYOpVJGBX29hSm1LoMAdsjigxud7fSjp9JMXeULDVeCV6Q62tg5DAAyk9p6A3qad+PTDlJbcJlzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L/T/SX59dscbI4/cFybNNCrAvHTzycU31yDd2Alqjm00LmOn3
	5hhijRvfr4IOr22HBNNjMXhJtEEy4xVvici7NyGU4v7OleqQ3oBwDsSW
X-Gm-Gg: AZFdTZdi041AaEK0P6cubW38f2jtzjiK2wZXZILhEvJb4oH9KigbGgQYBI4nkfkttLs
	8BN59LqvSkXFKHONZ0GzUWhJkmOTTToDCmzZo4xajVaYPSDYZGKG4BFgiJ1QTZFDXYo5TvtxPjL
	5O1O9gfMFOIHaoRtRIh1NSVGyIhHK5l82pr3yIJJKVJWv4/2B78+7+BivOe61B9aqbmNgCojntk
	qVTP8ZB0/g3VpHhpisWIOwnOpzzmVE5REFWLhVwfJvm0qKtI/NLtYCXtPo6EEPSCw8OsMywYfl7
	w6o8ReRXrAbz0h2mQOeQabyYNVAtSMHVuxtYexydlMqb2QTgc6ZPCkPBW6f39nx5kpbd3R7voZf
	pN+nhJ1ZevkuNdhRbHdHPYFPizHOHZfIsLy1kbcRwe5KTGIa3kJ1KGedpbp1IfA6xeW/olgBX7b
	KLqJNqhQgaTLBv1DoQOsIgV64TcVe97SP1t6P2lzmpNUOCcOZnk2IRY1BD9+s9uxfDIvqIG3+Vz
	XfKKkbNLywB+obccbSPoArREGdfuz2r0RbNyWH8I3rQ7IksBhUUSL2UxKJyA/5DDSEbPHqaLGqq
	39+e5W7SxSahoFksW3k6gS3opRRwWKHVdZ7N2LOvrDEtr/c=
X-Received: by 2002:a05:7301:46a3:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-3856f65ada3mr19391252eec.8.1795614304136;
        Wed, 25 Nov 2026 05:45:04 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm51101413eec.7.2026.11.25.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:45:03 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: qup: do not disable the clocks twice in remove()
Date: Wed, 25 Nov 2026 20:44:58 +0700
Message-Id: <20261125134458.2704674-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

qup_i2c_remove() disables the clocks unconditionally. If the controller
is already runtime suspended, the suspend callback has disabled them, so
they are disabled a second time.

It also does this before i2c_del_adapter(), so transfers from client
drivers in their remove() run with the clocks off.

Delete the adapter and disable runtime PM first, then disable the clocks
only if the device is not runtime suspended.

Fixes: 10c5a8425968 ("i2c: qup: New bus driver for the Qualcomm QUP I2C controller")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/i2c/busses/i2c-qup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 731bce9f9a92..f61ef2d3a10d 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1960,15 +1960,17 @@ static void qup_i2c_remove(struct platform_device *pdev)
 {
 	struct qup_i2c_dev *qup = platform_get_drvdata(pdev);
 
+	i2c_del_adapter(&qup->adap);
+	pm_runtime_disable(qup->dev);
+
 	if (qup->is_dma) {
 		dma_release_channel(qup->btx.dma);
 		dma_release_channel(qup->brx.dma);
 	}
 
 	disable_irq(qup->irq);
-	qup_i2c_disable_clocks(qup);
-	i2c_del_adapter(&qup->adap);
-	pm_runtime_disable(qup->dev);
+	if (!pm_runtime_status_suspended(qup->dev))
+		qup_i2c_disable_clocks(qup);
 	pm_runtime_set_suspended(qup->dev);
 }
 
-- 
2.25.1

