Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164278;
	b=xHtUwjSatJs13jspAJ8Fyk/l3FUMztSluNeViQHWcVUH1lJFeDkStOJ6JB/+OZejKJlB
	 rW7HD1xRiaYRIIwuOshW6rxXIYjgC7nfQnWv2ZJEQNlT+koX3DKsQI+7GtX0ASC80JxXo
	 Z+E578DR7Mo6Wk3xLoYAm9N6weMbVX3jgEWy9cEr8D7kGzh4SUHrwPZDrWZO9/RHy64Wq
	 lVoO3ddyGcjuzFrT0HXGU3IptGd0cBkyJCu7UFbdEPc482HSxb/cLDqW3h131THcr3C1a
	 LycuVn9UaUz7uDPIDncsDMNUgHLHztNdtJ9dMu/lyR2tyoNMrqPLG7HoYiFSa2W11Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=REAY0+Xv0Ze5gPcOy1Ka65XxLhykWbtvWxqzjPw8u0Q=;
	b=c9DZ3L+93SQqJIMzlruJB9yBAUAI5900+kbkDleSTAYMF5aQOYANwW4mdHlPKRnFSeeL
	 ucGneBqjAjyfNIvFIEr+1atqq7CgCYE71mIm7x9CFNHVkYBd3dCCm/buGyM3Exf0zC/yc
	 uZ9iXw+AtrddS+mKiDmRWUtPaZEkrE5XD3rj5WeJfvHJtMlWB62wzZA490i7opDJR4i6E
	 B9GaCWEmZ2iynHmAT++e4Rlwz717nJADnQjEqVopL/5/0N+bQOf5u0pH2L8z2xtWR4WeM
	 3C7Ta7GM71v7cVDBdlyOO9YWQQDedLV2UWbPG4RKPySQYxD/W9ry/t0Y7SdXrVZ4IFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmKfCC0H;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA753606CAD3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA753606CAD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmKfCC0H
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so1139842c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164277; x=1795769077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REAY0+Xv0Ze5gPcOy1Ka65XxLhykWbtvWxqzjPw8u0Q=;
        b=CmKfCC0HGc+NUT4lQUTKOid2ejahxWYjkQUWHazInvYRF+eLhJN4KJzuJnbFVoq1XW
         b9EcAgctWWK8a1Ws7Cvq+S+x8YMmKsC8EiwYoHUc0BC9dk8KukYdsq6imnqBkHm6Kfqq
         IEOGCy+KihY6dsMQZLtGAuAhC9iBU/yJu/Um2UW52TZAlhOrNCPMLiQgF5ptPzctWJET
         CWyVtxMZPe4Yu/vSlZ04vD3Din/+hgfUt1twQMB3t4uEs59vJDaj6Jeg901dMeiIk/YV
         ckHXfRsXXGJDRlr8NKKQKzzNJFy6vM/WGbEx5tvF5QxZ75g+WdXf1WVgFUxQ7qlFNEko
         XHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164277; x=1795769077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REAY0+Xv0Ze5gPcOy1Ka65XxLhykWbtvWxqzjPw8u0Q=;
        b=WxOTc7ladijnsPKWtJH7vAc+x/pCcSrqowZlzOQzeUgvkfzhDTtSKeZARQ1JNxHRdU
         W9w2u0SrLw2pT7Jedr8v/BNBtkR3ppAoVDnD5Yaqzib+Bg3YL6Sioo4FV49j2RUrj8k5
         UKEbC1lcx7blxGGu3BX4RsxZVQBMVTXLI+x8Hp9DkDyePFCxc/7OFPBInMLwKult/s7S
         R7+fWThDqNerAUpl0duJ1z2+Lal1p6C4u/jEnw1maeJUZCOkAUO1YzJIHiWCaUM8tHuL
         So77Zzt/1xAO4oN7qc6gAjb9gr957mE3EHGI9y1qvL5T6MZg4j7zqVUy9yfjM8lOe42E
         xzqA==
X-Forwarded-Encrypted: i=1; AL+hErEavLzSNUE7rIABWRud4VbTebl3inVRU0qgpUmveQiT5heLFvUrlxbe4PpWEI70OgvOR1fyvcUivxSxYWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nDrAnO8hPmJ988rgMpidKZJs6J+wf507gTwXLExr8hEUoh05M
	hAn37wWPkN27x2CZB5TPVOKrdJEC4uylsE/Q121SW/qWaTxr4RXKbc5u
X-Gm-Gg: AYBFou023O41zjiCSjPvgmFkcsasTzG96UTBEdWsql/3/Ox5OFVm+EkHBvU22N2YEbx
	02FPsRF5+j3Tl6yOvpm2risY2Z4GN8ZoTaMsLPISRPSoirYOwd1izTYhKtOP4JX9eu94NoR4BXJ
	m5QBUQiNT3QaESDRcCRJek2GiYvfDUuvhJ+3PqyuQybZMJgTnVz+MngG4aRqs0OC1VGE8HSZXzC
	3V362G/eShshwGvvWhgjS0NzH9hIUaIek5hDDHKUXXqV06P5ZZMUUG+hik1EHbRw1XKjPbtYFVs
	uywDlXNvKcnhPbTb+yyruK4pg0zfqvmNN5unFvPVacH1sU9zA1HtxlLpIbDlWbqrhFCJHIs27pX
	NppXoQ4PJYjUezF7IU1Q8aspNSbVhIaW7dYcdubAlkAZOtnWpQgnAWVM8tgUyRbLUtY5tZ9SZHi
	YvRMdK72sO0nupzWJXm2pqHrpk3gyxqDxwV0vd16S5dPxybxpSJ0mgHoN+kuNh/uTrxhgwsgpz3
	xzv7pPqZAnHqBxioeBO8WHjlIBoAESsM5x6jA/hnV1U04ab5bR+U/E2khVVEStPXiFoXm5wEel8
	SYNPJyZ8MT8SV2ka6PcWp24LnvHlhgH3ESwUkS/ml7RJ/5oiGxY7yndbwTVjieDVQ8ZJpArxLLW
	5jZ0kAtYRP1zYqa+bvCFgWfyOtjg2IgLxQ4eBfqo=
X-Received: by 2002:a05:701b:2701:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b5568e8253mr1970423c88.33.1795164276917;
        Fri, 20 Nov 2026 00:44:36 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:36 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:44:08 -0800
Subject: [PATCH v3 17/18] HID: logitech-hidpp: manage ps_attribute_group
 with devm_device_add_group()
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-17-ba39242d4336@gmail.com>
References: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Managing the power-supply sysfs attribute group manually requires
explicit cleanup in both probe failure paths and device removal, even
though all surrounding device state uses devres.

Switch to devm_device_add_group() while keeping synchronous creation
before connecting subdrivers and non-fatal warning behavior on failure.
Drop the manual removal calls, eliminate the empty start-failure unwind
label in probe, and simplify device removal accordingly.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 261022e4088b..5c2d967246e9 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4625,7 +4625,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 
 	/* indicates we are handling the battery properties in the kernel */
-	ret = sysfs_create_group(&hdev->dev.kobj, &ps_attribute_group);
+	ret = devm_device_add_group(&hdev->dev, &ps_attribute_group);
 	if (ret)
 		hid_warn(hdev, "Cannot allocate sysfs group for %s\n",
 			 hdev->name);
@@ -4639,7 +4639,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	ret = hid_hw_start(hdev, 0);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
-		goto hid_hw_start_fail;
+		return ret;
 	}
 
 	ret = hid_hw_open(hdev);
@@ -4698,8 +4698,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_hw_close(hdev);
 hid_hw_open_fail:
 	hid_hw_stop(hdev);
-hid_hw_start_fail:
-	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
 	return ret;
 }
 
@@ -4708,22 +4706,19 @@ static void hidpp_remove(struct hid_device *hdev)
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
 	bool claimed_input;
 
-	if (!hidpp)
-		return hid_hw_stop(hdev);
-
-	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
-
-	claimed_input = hdev->claimed & HID_CLAIMED_INPUT;
-	hdev->claimed &= ~HID_CLAIMED_INPUT;
-	if (claimed_input)
-		hidpp->input = NULL;
-
-	hid_device_io_start(hdev);
-	disable_work_sync(&hidpp->work);
-	disable_work_sync(&hidpp->reset_hi_res_work);
-	if (claimed_input)
-		hidinput_disconnect(hdev);
-	hid_device_io_stop(hdev);
+	if (hidpp) {
+		claimed_input = hdev->claimed & HID_CLAIMED_INPUT;
+		hdev->claimed &= ~HID_CLAIMED_INPUT;
+		if (claimed_input)
+			hidpp->input = NULL;
+
+		hid_device_io_start(hdev);
+		disable_work_sync(&hidpp->work);
+		disable_work_sync(&hidpp->reset_hi_res_work);
+		if (claimed_input)
+			hidinput_disconnect(hdev);
+		hid_device_io_stop(hdev);
+	}
 
 	hid_hw_stop(hdev);
 }

-- 
2.56.1.750.gf70dc682cf-goog

