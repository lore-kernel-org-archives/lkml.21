Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648303;
	b=fJUbWDJacqC/WHEoZ1L6n55ONv9JBI12TrJoTsF/f1kZai6pG9eQ/adOypgxbOJs+EEa
	 EwRNF6IRbj9/sedRqkfe3NGaZRMROGPyXDaMJFU8DKawi/vZp9uSVHvb9U1IdnULGZlNO
	 4qHdycCM8mse/ORmXOSMj7689P0AgadcquqLTssHXkZgl+2iD6cvJYf5SoS6pVlY8Pinl
	 dsF5Agp4EejVtcMvBRsjVkpVgn5QSsJr9QQHcMRCmEvN4BZkwMMbXG3jPjLO2rehQcVAo
	 0hDF/U3XJpGrXc1ozyJZhuxJwi4X7UL04VM5wMxxYrvRTPnk3kb5asd92g4NqDlNOdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QpYNJ549fdADTammIXtO9Dh/diEXsHFrpOZSN7ztXJM=;
	b=LMzdey+V2hwFfZHOfK2oRGKr/YmSUTeEkbENRlIzquC1xoXjH3ESNUemp/w90FrvG3jo
	 AG/ZIMwKuaieONrhFJoofhoO5r2Eg5JYKIi3XDJgFSv272crL3Du/wM60IEsroFW8Lkqn
	 6FHZtOow22pwAU3TGEc7MKyQ9Ini9Kt27/vgzlyYRO9VXKKkVX1xgkEbZp8v3d3gobDbP
	 Vi3UPZMizb8Pcl6Klqm51lScaXTNnN9K27uQ7b5fx6eIy61e8U3akmk/QWJJ1tz5TdBxY
	 1MFz1aO4mefdBaYPae2oRbc4SXpvXPiyP+jEf+jVX5rIq07XEJyF9hcwv7Kd8yjkCSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKdcU70H;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD55606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD55606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKdcU70H
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38692f62b22so7716068eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648302; x=1796253102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpYNJ549fdADTammIXtO9Dh/diEXsHFrpOZSN7ztXJM=;
        b=MKdcU70Hbeyrbz4m6ifJxxgfGyivclLBcaeiSI/5fg4Rz8alar9D0opUBIUXxmXrAm
         wECPBC30/ZEPFQj2N/nYXvMToTXNJU7gRkCtN8c8HfPj2PdDkMeXMy37LJC6kKuL4sHE
         /Wp0NXWhn9U2FMyS1SmTlXydf/YJs2d22AcE9+cQ9HSjG/VzaB8tOZ50ouVKwDx55S9h
         jg1BRArw7hzsstUUT9yJszG9PAjcbMvs0cC+5xzX7/w2EEcRMEX/30TKCABa41C+u16K
         TA+tx9wriIv0bO7zOSVnMnYQuOO+2gniQ6SAWd8dXcgUxXsyel3TbI72DqsGLQOSZOZU
         ++gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648302; x=1796253102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpYNJ549fdADTammIXtO9Dh/diEXsHFrpOZSN7ztXJM=;
        b=trb/48oOWApULEuPEAw8gf33UL0E4zSfHWsDT4/EDMX+JQBD1K12t8P05/KyToaQhQ
         TbvMykGNC3vcDCKEIft9VFMgdRjKTN+HGqGXgVcfbZhowFagvYZvh/KFmFO9/7+N22V4
         n9cXu6Z9ilGbG68gigs7KcUf0LbGIpNcNajNWYSW50jkVLaEnereQiQD3VtfFQ7+3sqO
         FtPcrUXJdu8V0vMVWXJrjlQVmI9pyC3HjLwRypidifrWEez6FWLIJgpyEV3Nm25b0bFF
         2LiMnCpL//0t9BSDH0em5RCLkjO4iQ07s7J90Iv3ABeohVpYKseA7t45/DbUzrViHsk3
         H4eg==
X-Forwarded-Encrypted: i=1; AL+hErFG9rCXBZIIPA6qJnX8FvZ0ugLM8PcDTOgbyOHn8Di8xDxi0k82c4pdp2QeeR88qgIe1wc1EBcicKGuAzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ME8ESINw+C3Qrci5gkfAXXt0aQS/8V2DuuoR6NRR3UQehk4ra
	47Pg9Sla4SbGaeH0C8xLW1HekDIZsK8PlBYciSpzrUEvtY+66FdUIt9h
X-Gm-Gg: AZFdTZfw4VVCg3W3+Xz3JF3aNYQCAsUEhUAYJU3UEYJVjo4AsccuzVOqLOPsrA6mUML
	QaHar7C1qFYjQlwfXOStRFDy0gPysBySKNZV4gGnGu/08ec33VKmI50UTqAcJnv5Z7sqfgD65jc
	T4IOIbhA6LrEaFcvfwl7okE7KAQGGGfeiEK3jAreHYOdo7Ll8kHMIRoxZRImw6T+Tvb/BtQJprM
	qhcQfnXs0K8eSiIrdBCynqUM/BkMxQPL29iI/tR+eehhl3CXx+zkonioP5L1pQyuiIxeP32js4a
	lDTFpsoH3lWrtW9sUHmp4WmykMCHa0LRDouCHvEVNdPyhMX899BZQnFyPUhrXeCEkwFbgnL6/PK
	6DLvbcc7A3V3wt4z1N99TIdjeRfHs932RT2gm8GjaWUHbX0kdzDTNDgG0uNAaK4iNK97JgYai19
	+Xqq7Q5Rf4oa8Lvhp0OfKd+3ZQereydK2x9ldwUAthOhMfyvd0KUkOCy5kdWrVliar5JgC1JOAl
	sFttfqsKMbg3j82NNGwPZoHTvm6e/dVZf3Ob7L9sVAxf4KERIHvN9MEKmwaVFSia+QJm9yan3av
	96wafk2SXR3Cj+VP8fZ40UBd9sc3TRY7xOLF1OC0JoHe0Tzt/djnbfiEXFJpspii58j96jtzW7i
	9RDQ4wKBgQFab0oA71w==
X-Received: by 2002:a05:7300:c00f:10b0:384:bc32:fe6b with SMTP id 5a478bee46e88-3856e63b194mr23394607eec.13.1795648301528;
        Wed, 25 Nov 2026 15:11:41 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:40 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:17 -0800
Subject: [PATCH 4/8] platform/x86: thinkpad_acpi: update polling state in
 hotkey_user_mask_set()
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
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-4-6dee57519c2e@gmail.com>
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

hotkey_user_mask_set() is called from both hotkey_mask_store() (sysfs)
and hotkey_write() (/proc/acpi/ibm/hotkey), but only hotkey_mask_store()
called hotkey_poll_setup(true) afterwards. As a result, updating the
hotkey mask through /proc/acpi/ibm/hotkey did not start or stop the
NVRAM polling thread to match the new mask.

Move the hotkey_poll_setup(true) call into hotkey_user_mask_set(),
matching tpacpi_hotkey_driver_mask_set(), and drop the redundant #ifdef
guard from hotkey_mask_store().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index e5f78107bd1a..7a82a9014a3e 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2137,6 +2137,8 @@ static int hotkey_user_mask_set(const u32 mask)
 	/* Enable the available bits in hotkey_user_mask */
 	hotkey_user_mask = mask & (hotkey_acpi_mask | hotkey_source_mask);
 
+	hotkey_poll_setup(true);
+
 	return rc;
 }
 
@@ -2647,10 +2649,6 @@ static ssize_t hotkey_mask_store(struct device *dev,
 
 	res = hotkey_user_mask_set(t);
 
-#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	hotkey_poll_setup(true);
-#endif
-
 	tpacpi_disclose_usertask("hotkey_mask", "set to 0x%08lx\n", t);
 
 	return (res) ? res : count;

-- 
2.56.1.839.g22a8290db9-goog

