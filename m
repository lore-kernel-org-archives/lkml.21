Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164259;
	b=gAMULKLlO3RKbw3i8dmdWb09rpKLB0mATN9sG2MdjfjbqLmeMp+efNDJcof4GjuiQaE9
	 zLhqVlT2wyr35lrDfgFdhezE65K2AnN4fgEakraTH6njEgD7PeyYCUGhX8H3kB8K99aMB
	 izgq3LqRINlrCFdJHQrSozOW0McP6lWCqxgzpFWWZpi4uIhh/tUhhUnWyYKaHMyNW6cFT
	 YyT2aVhjG+kHGHOR+n4DX4b2tC408TR/H4O0ILq2FC+ZKgsr5OGFoo7IJlxHvvVe68YCR
	 RFr57VV/OBtKJpX1fH6G1Y7n9emSpktBfZV8/t02lm8CmWSrNOIpf/TXerFdx5fHbmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jGsUaimTKRgwm19cze5+eu6IryKYQ+oQFYi+323HxWg=;
	b=LM1J+M3708clRgRh30F21/zWtLGkWAHSjbzV1/thKm3VUPRMOrSDFAuvEnWKaQpuSqbu
	 B/D9HDYMjqzrbGWXNTviR9hzSUjtCf3oBFqv04CjaUYNrBDzSVpMgcGjWxnlW1wlDVMsz
	 8jbomd9Te/ao/Gdx//dVtXwKH64jPcyN9h6D/9rf2SoFmDzM1sAcSsFI0ZwSqGk6EZTOT
	 ge7kJdF4bOjW1c629zcSmTRBWDpTGC6WfpU7VEjwVL7FAU4lszkDWb9Qhc8n+jpw1X5iL
	 hN9hQ+Q+nVc0FUX1RP30mUkNVazVdEG6WqokrxHlyB04yZq/jW0zvHSIoT7eMGba8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Si6A8syQ;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC72260A262C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC72260A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Si6A8syQ
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14394530ec6so1033970c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164258; x=1795769058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGsUaimTKRgwm19cze5+eu6IryKYQ+oQFYi+323HxWg=;
        b=Si6A8syQscdTAm+t/PwZXgRMdYzyOTEibotcK7OtRRQ3EFTI9ZJ8P9dUwFFz6+DClj
         EjsgrFdfBjDI5xt0YfipbotPsIAVky5oVbAJBCwKBgCC8m7VppB0AG0g1LaRHSqfBwdz
         S5wLaosptpsPrGw416/ZoFhS6uf2ssykJLpMrMePmIK7GaTxZVyzM2gkC8z3+hUs30w0
         MsMRoGU2q5g0p/OAs9QyEUrWHehZjRePp7bEFxl/WxS7aj3erQQECqeQmcmIGO9OwfAL
         rQPv9GmbzARLMeE/qIual+KITxRS78Zx2FYBl+hOobBYueuewQ6QERWb1ENRG1w+qgEn
         hlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164258; x=1795769058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGsUaimTKRgwm19cze5+eu6IryKYQ+oQFYi+323HxWg=;
        b=SL7H3i+aRRtv4bfj3NiIYAe1fX+AQB/3ys7ZEfrrQdzluv2VVHjJKvm4CaSn7Mm+Md
         NPPzmZOgwn5O4k4dJZ32ZJ0VPufZZR6T/XSzFFcauTyJOqZEqyaJ1kL62ECgqakJwdO/
         Ypp9Zs1Ag1wk4S9wQYvpR3n6d3BLqtT15JtL+kpPGoC830FuzbafWHE5zK8eRVlGvEgE
         iKHeqS9Lh738k8lxXRRfAFeR/zL0GhhF3iaA9o82Ttx0hnaF2t9w7pd41joUb4UPqMgh
         NJRQeSE6yRDcZrdTYjsxbKYDTxIXJ2ZN0slWWDRYmC8ScOlKhjzDDxWxJKr+P/NXmxyf
         YP/Q==
X-Forwarded-Encrypted: i=1; AL+hErGYeri9F/kjZMp6L43/0idjnRwApqqGS8zzZbhRv0tXsvBH7rtcQtyG5yN7DZSYtWuUNRU760sU1pzqWUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z83IN1uaZHwuUGPi+4mAJvpymqL9qjuHw1khgZsKvXp5tVnogZ8
	mMU1fu8zsv/mRQv3RFsSsyNYkysTQn8IacFERo6hMhJdTzTf0X1LhAuv
X-Gm-Gg: AYBFou32A1/rYw2/QBXRrgCT+ZzX4io0go9xt/lw+C7elVZAg8q6rB4qE6vREGrBbGi
	mt32fQSviqWPU2xteEraKDbUPxDl5P4iKDVfVCLxPdTNmtvOPWBcTTRSrTE1+5aI8KZ7alQIzPT
	L3Zpw6sf953DUhY2G8YX8f+SAE7ZIPvbr300H5BuHatWeCLwaeMcmaG+reoma0EIHa/zSofJ+uk
	3eEd9OZ8ix8dp8PngwLqqUNZ88pQsjNBbCgaV/C2k3fkkMglsyKyn2bgtL5gb9GD7K8NxVjZefa
	RgnOwi0DrwoXGxJiRYJMYhLX8mtzc+Nfsdfbo3wpP77NU60efQdSyqLTDzuSiTOZZV3C6cYzrEs
	L8r1n8aI9s82bo5+MZUuBboJ5Lq2e2aDZnuxyddB3A06Dp8sCTfbtvPa2bQJKcqM4LLAm/jHRDz
	pVXqzAeaTO0wPM6o3w8xWuFpouzS4pMHDafdwUGZZMeer4BcfkyuQr1JIK+8DQdDpL+UxvOUDsW
	MlewQjc32jOgw0baM6woIpIxC7wiHiMGlXT744gk+7MwEtHYsUJ3d/n2x1pVJx8NkPHfqdogk8N
	Vl51MdnV9W6X0KEff3uJKFdGVG81iZ7ZYZHl5520v8yXbhIOIfS9rCEUUhOqpBSQ+fbmnr04OFG
	w1KxKWBTklYpgQEsePQ==
X-Received: by 2002:a05:7022:7f14:b0:1b5:39fb:c6ba with SMTP id a92af1059eb24-1b5568fe968mr2136164c88.35.1795164258080;
        Fri, 20 Nov 2026 00:44:18 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:17 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:43:56 -0800
Subject: [PATCH v3 05/18] HID: logitech-hidpp: use sysfs_emit() in
 hidpp_ff_range_show()
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-5-ba39242d4336@gmail.com>
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

Formatting the G920 wheel range sysfs output with scnprintf() passes
buffer sizes manually instead of using the standard sysfs helper. Use
sysfs_emit() in hidpp_ff_range_show() to align with current kernel sysfs
conventions.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 19adf5796807..58f7cf84b995 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2729,7 +2729,7 @@ static ssize_t hidpp_ff_range_show(struct device *dev, struct device_attribute *
 	struct hidpp_device *hidpp = hid_get_drvdata(hid);
 	struct g920_data *g920 = hidpp->private_data;
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", g920->range);
+	return sysfs_emit(buf, "%u\n", g920->range);
 }
 
 static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)

-- 
2.56.1.750.gf70dc682cf-goog

