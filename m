Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164279;
	b=ETl+0kDCkOKauIQzzfdJFsU85hqMenNWc1fPgn82095DBK/VLSPCcHLX30Mr/jDjs+jg
	 QEt3dN7t8DKovMnM+QrzSdQOE08m6S+h4xsPU4mF4tWAod/nDZiPy5uNG+fvUvflEhsKB
	 hGrJxbvo6ELOXuIJ8ldjcy+QGX1GI40dQ5yr8kA4xLFabNjmY1tvKU9fWMn6qByrWOYu8
	 18xADYr863K7r7VXrnC/79TCTezLqGmcwywuGdixTbRlOz9pPVSeccU0xHlwnGVH7wvtD
	 n//WsqvpQiFSXsfxWPZyPt1Juz3ouvCvOlsULnPG76ucrHNWprUKIoCzuzxHOaCPTIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tOCPuzD3mb/9AQ/h1SGIaad3lZj+puZXHmyeEPKL9VA=;
	b=p+bWNpi+kW5fiWVXXJHRGnFVpyaNZthwVcsFBNJ38A6hyVlmUXCM76zzYv9XZ9ZXjWzX
	 xlMo9KPPM+cqG9c5nuGzxAbajX4Ca7woXnLaZR0jZ5THE+hTfztEoJQ0/UEXNMxbFm3U/
	 j2v4ojLytHeRIfO78NfyCdU2Xp5afUTJZGklhSJl3qK385ND484ZgGh1Fe79NrGT9a93D
	 /NfhicfhZncCV06Mp4ufKCiXQcpTPmcUEa7Sgxye+NVtPQlHtGy9aniZtHI0VUYQ5gqu0
	 p52fRHfeNZ3ci+YHWmQIEoB1GI7Bm4zxUK2EYcNKPWmm2/umAC3H0weJfBsk8EbXTaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kJzR9/MZ";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74A606A8AF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E74A606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kJzR9/MZ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385d8a00598so497515eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164278; x=1795769078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOCPuzD3mb/9AQ/h1SGIaad3lZj+puZXHmyeEPKL9VA=;
        b=kJzR9/MZbw+opyxDmMh8DNVury0Lo1W9ftyv2yVAZ30yE9IXhY3rfBJmAE19PA3YUq
         wQbsT3qSUyQm7vGPoAlTJxFUUfVUz9VogfHvUl5nVHNhrDE7NWxlw9+wu5aE5lXrGJy9
         WF6BfBTGVGfnYIPn+XJFLrIBN3DGiv3k4IE0qr0Fp8n5O+LcDVRNJETTX2V1vI1KvhQy
         q60moWLto2CQnEGCXScbO8Lblr6UrudKt6Fia155rOmvjnOpXIGIdWsKqHv8Fh69u9Vt
         yaVyBC5dLzqdvw5p7c+PTLOzt6G+RU2h04H9k4T/rx/GvW2bE9NCPJIk3R82fFAGLQh9
         v8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164278; x=1795769078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOCPuzD3mb/9AQ/h1SGIaad3lZj+puZXHmyeEPKL9VA=;
        b=PyvFUWVnzPlNi47bsQ9CBRf2TsMa3yuaWXAU4QWQdhsF/6LsNpruU+bpoGq1L345MN
         EntofrGJxfsLcPpV513JhmYrkCQJYYrXniN5lUvFzZ7fDGQNzkOBN2b7+QWIPPDNq+1J
         nW+XI0+Xv/PoXr1JyDVfC0MDr7KNEk8tzgRHUQISR957jINdil4i5vYE2hkNXVkpOjKl
         Yr312IBSDEFE3QyScLXMI8w5GkxIf0f7YuclgRZXGYR6pxk9rNYh8J9tgkpwv5+T+5nx
         Nu0ciQwRRp3OSTMtlv0e7OHb38Dq2qLxcqzpYTF5lTb6GLS6YgLSGI9P7DFm8eLDZlwq
         8AMA==
X-Forwarded-Encrypted: i=1; AL+hErHxptTsVj8wUf7Ri35x/FZpK/pctKR2vk9ni0PXiA5MFqTuSSMl+VgeiiPxG7R6xaW5Dmf55T3E9jr3vIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h0RCh5lH0W//R52G0GxZ1ecwgWblMSVFfXATMBSJvqwxpxvb+
	xhnf4Ir+haCoG6/rbzVHwlA1TzmvzKc8M8gbB0pZF63pBH5EMNZv6pam
X-Gm-Gg: AYBFou0PCvU9bS7FQ1/TRL7uWUnOPtC66rujpQjugL6OcpKCS9hBML8S80PsQcBdfLt
	uUVMEJvYbbj2ogO/UuqPSUCidq6h+mUkDdDWcDc8ZIqNQzDb20s3yQoaGAt8HiBd8G+n7tGd0Ob
	0yClJVZYhgUygaadB0vl9HO0VF9K8uqL6gfQNEs3lzf2Ms4UtfaELdl3JC+VD2zPfrhNWEd9Jf4
	5kkk0JY7Gqnee7qm3pY8CCjsFt1Tu4DBF011yjiUTlKGXKmx24CazM+J+GJvrnLIdXtcERPA0nR
	gAmyQvXsdIvWEZMoMgVoF9GfjwNw/mGes6cwHfuAeVFn8PZ9uv6HY6K5W4+kAzxCstrd2gJMjAh
	EGdOYzy737D36EKAaWD6Mwc2ZUeFje+PrWch0oDnyTvJQik+a1JcbcAzdO7IiJhb0fqC+XQbK2S
	zqX3j3ddeUexIC/wtmbrnaciQEn8G4NPBalhYdQQ2FdkgXrVuXrUS7368mr+PZF2lqZL9Hf69fq
	5+S/TqtDtudBE8IpZoZHdTzO2krUpxo6lKDk5rsnT+K1VKUoDActNXjdG4jDolN63X1T7XkA2oj
	/kcldWIy8sImkzb102KhbcfaWAvOMYDvC7oSKcmTWEiu1TYT/5+QFi056hetE/HTAsg7rNrCLx2
	bJAc7wnRvDCVnk5+5/w==
X-Received: by 2002:a05:7022:e80a:b0:1b5:4b48:b9fb with SMTP id a92af1059eb24-1b5567c0ea6mr2231915c88.5.1795164278408;
        Fri, 20 Nov 2026 00:44:38 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:37 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:44:09 -0800
Subject: [PATCH v3 18/18] HID: logitech-hidpp: remove unused kfifo and
 clean up minor helpers
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-18-ba39242d4336@gmail.com>
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

Remove unused linux/kfifo.h header inclusion and the unused
delayed_work_fifo field from struct hidpp_device. Also drop the unused
finger_count and button_feature_index fields from struct wtp_data.

Drop the redundant input dev.parent assignment in hidpp_allocate_input()
which is already performed by devm_input_allocate_device(). Also drop
the stale ret format specifier in the hidpp_connect_event() input device
allocation failure log message.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 5c2d967246e9..06a5482029c2 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -18,7 +18,6 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
-#include <linux/kfifo.h>
 #include <linux/input/mt.h>
 #include <linux/workqueue.h>
 #include <linux/atomic.h>
@@ -198,7 +197,6 @@ struct hidpp_device {
 
 	struct work_struct work;
 	struct work_struct reset_hi_res_work;
-	struct kfifo delayed_work_fifo;
 	struct input_dev *delayed_input;
 
 	unsigned long quirks;
@@ -2833,9 +2831,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 
 struct wtp_data {
 	u16 x_size, y_size;
-	u8 finger_count;
 	u8 mt_feature_index;
-	u8 button_feature_index;
 	u8 maxcontacts;
 	bool flip_y;
 	unsigned int resolution;
@@ -4346,7 +4342,6 @@ static struct input_dev *hidpp_allocate_input(struct hid_device *hdev)
 	input_dev->id.vendor  = hdev->vendor;
 	input_dev->id.product = hdev->product;
 	input_dev->id.version = hdev->version;
-	input_dev->dev.parent = &hdev->dev;
 
 	return input_dev;
 }
@@ -4461,7 +4456,7 @@ static void hidpp_connect_event(struct work_struct *work)
 
 	input = hidpp_allocate_input(hdev);
 	if (!input) {
-		hid_err(hdev, "cannot allocate new input device: %d\n", ret);
+		hid_err(hdev, "cannot allocate new input device\n");
 		return;
 	}
 

-- 
2.56.1.750.gf70dc682cf-goog

