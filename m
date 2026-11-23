Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452798;
	b=gTmedULMjfLTmu4MbUJCCENS+MlnfyheS3jnxxDnvBJeCWAwiOSAkq2/xK5wqXx+f1SV
	 MqyGA0KuIUd/xCcchWxU0P5qw4UyaA42aOzsoPDuIhV46F2Syu37qdQTc36+HyKoN9PWt
	 b7p5yjCp8opnHJhcTZADvHgti61BcaSlBR9y8jnNKACfkmkSoH/nWt/Sfnckrr+7M3Htv
	 RbWmhnWjGczJMVuXzUt12g1r7DA4K74rxYc8ixOeq1SwHWznJ+P+eo8W+zy2CImeaL15c
	 bhhZ3mCoUj+HN9VpgGj8EW7fRfhBL7I5mq8MgEOM+Ai4XIFOH3Vbpv8Ot8Qe5sd7hZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UoR1p7/PkH8Dz4a5g4MXuD53QAwk1hyRbYHCFm0rXQ0=;
	b=wqSywMwFwFmERYkZ2iYSHbFJ9WxQrVx4IQjlawhPGje3NDuMloyGt3WPxRtOodhQ8zK1
	 ogFwLR+0Mk13dUYJuOlZDXsDA9/tKghyPZUzmG9t9hbMCDJjObJask6vbSLF0SFiIX+Rg
	 wa2WfX88qRQtNvtsmw0lO2lCyxpH4l9A/fuUaY69mdBARHZAsgegQOX0Brh6OmvT2oz74
	 6BXx0b90tPMIiyLrKKndkH35qeHDQDCNT/coEbfUk7AdoXvMnxbHZUgiw2yyF8FD34Lgt
	 lJCYG1pbfewWIU3jGeCPy4Zydn+Ex9OP1LD+/XL6ElpvO2MKWZfuIRFQiBtWYwKHhcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1aDyth2;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5F606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD5F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1aDyth2
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386b8f2f671so652664eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452797; x=1796057597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoR1p7/PkH8Dz4a5g4MXuD53QAwk1hyRbYHCFm0rXQ0=;
        b=l1aDyth2I5Xo1f3VwDGbV6C21nlMgWr37HxyaB4v0JfpCZ1kMgu/zgMpQi/A3AHjha
         yyUWEw6h8jqhrOyoCJaJxh/GLpyvnOmourCIfZWl5/LHPO/45Kxy7XTK6RM0AD+dhMMX
         DxJMP2t4HJIfct3UlOOusVva8AQ4nIDGLU/1jKnlF9uvHNRBbyfIivzR6uTrX5/TIDh8
         IN4UgjYUd/DvdnGUoz31WxNej2BXjPaRAWUQKz0l5mtH5jyVVjOJy1SX0BdSJUlo0j02
         h7MY+EnCwEEhdCEHnY/M06/JcFMth0pVKRZRTaPx55/TGIlQSthxo0APZK24mdQ7ONkZ
         K+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452797; x=1796057597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoR1p7/PkH8Dz4a5g4MXuD53QAwk1hyRbYHCFm0rXQ0=;
        b=NzDyiSOrihpyzmqNMZdBjvyYjU0oqjEeai7qq1D5VtqUfzg/+ryoZYxp3ViPJVbyXM
         7sgjBLEEdVx2sfNE+6uOjto5Zxck+RDplWH4BzmXTtGCo6DMnqvu4l9IbyV1o8Q2TqL5
         WcOG7lDQ6x6RFQdh0eDOmy5NJMifIABXhG5rGF9tFIOEgjbyHwPLkdA2Gtws6DiwQVir
         F8FUbDlvMDTBVm8tx25YDZKlOohNuiTnRAbYhl5mGTSlVD2ZQVnaaYanvIkp7FB8U5O2
         aY0RizamsvAEl1KYQoYROm6XtHRc7ydJsBdu0j9XNIrI0AoTSVm8hUvmk6wem9C3mgzh
         M2fA==
X-Forwarded-Encrypted: i=1; AL+hErErTkKMlVbcXmXgkUGXxkFNtC/TsU9o/hnMdm/7fQyZAwR8f2A5OtN7hJd8HkJHhXN4/2DGpoBijaItzg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jDvO5nxCQ4TOmfUIvT7PR6+jd4cvmfmZObHm7pbCWctUlur9r
	VwlhoMmlGeuU0SbKdf2RURLZJne6gx/MGHvCDEJo8FL597Zk4rbe/tQD
X-Gm-Gg: AZFdTZcpsSRKwwxrcLhS6RXhH+gJzizAqykm8GSOEbCiM2TwETchEaGvQq2JO5IIQDH
	7++uYKhLnxI77oTK1N7Ymimjz6/WgaXuoztwyW53Vpd366IWqcUPKLikXr69xgIzP84CwVKKv+g
	QdkvXGsIWKzrMYUL/vCJIv+k8md0K+7glIXrGOvy97fLyMWCEjJLGYlJvTzBAxoss/FNIZAzhDJ
	h8ezAiuAclr/LwXzoKJs8oLUOiVcKNiLvP5nLHprEswBag2K6e8vOPNF+rSEro0BH9PhCU7DmdJ
	36yu8Son+hprph9tNs4ij/Ysei0xoLGH7Z3Kwv0UackRBkIdG83TRywlKAOK6ykVp4B0cCxvhgZ
	R4bLKNTR8bWxSS/SSqitsNAR/vkeh0bJjqPpfCblFEjiPl+7vMg6+q2IWE2U3TJvVaBm4MtXdHE
	jgBjF8HaRPLrkdhGqLo3PSdLurlt58XGXN5bJOukhPGoWg7U6nXmgcH6I+ENALb/iP5UO2et7BH
	Vp+0DfLzV4QpE3kUXj2RTMoX/MSqHzZR6Ygd42gx7R0dik+g/S09hjl4oUsMgXDbQwp+WMlNliA
	nLwk5EmvvPliP20wYyI3Z1Knw50qt9VHQeiPSPxEkheuSVbi9Kd+cA04fqAG1waylsypAXKvH7/
	QDc0l1haIDBbYTeitdHb+lKzzsnmnZWRgJC2qt7adkvZkKmQsPMke1hMODR1nuy50+eAv1KDpfb
	axNzi1hn4vi5o/H7D3bKT2d5C8z72IX6E/3Z3g9V3DbQ==
X-Received: by 2002:a05:693c:88c4:20b0:386:b070:6f16 with SMTP id 5a478bee46e88-386b0707080mr3556832eec.21.1795452797407;
        Mon, 23 Nov 2026 08:53:17 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47196668eec.5.2026.11.23.08.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:53:16 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yasin Lee <yasin.lee.x@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 3/5] iio: proximity: hx9023s: re-enable interrupts on resume for events
Date: Mon, 23 Nov 2026 22:22:49 +0530
Message-ID: <20261123165255.239490-4-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123165255.239490-1-kapoorarnav43@gmail.com>
References: <20261123165255.239490-1-kapoorarnav43@gmail.com>
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

The chip interrupts are enabled at probe (INTERRUPT_CFG = 0xff in the
register defaults) and stay enabled while only threshold events are in
use. hx9023s_suspend() disables them, but hx9023s_resume() re-enables
them only if the data-ready trigger is enabled. With events enabled and
no buffer running, the interrupts therefore stay off after the first
suspend/resume cycle and no proximity event is reported any more, until
a buffer is started.

Re-enable the interrupts on resume if any event is enabled as well.

Fixes: 60df548277b7 ("iio: proximity: Add driver support for TYHX's HX9023S capacitive proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index 364ad2fd6095..5b43dc9b112e 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -1185,7 +1185,7 @@ static int hx9023s_resume(struct device *dev)
 	struct hx9023s_data *data = iio_priv(dev_get_drvdata(dev));
 
 	guard(mutex)(&data->mutex);
-	if (data->trigger_enabled)
+	if (data->trigger_enabled || data->chan_event)
 		hx9023s_interrupt_enable(data);
 
 	return 0;
-- 
2.53.0

