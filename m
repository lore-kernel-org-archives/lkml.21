Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685490;
	b=sqnxhLl3XDWF1ZBDbEyEyKEuiIEqdZiv4Ml2tyePwM4DiWiplJA5NL1ud/k391h05ari
	 dJtGV0m1CnfyxQQu1vWSmrxAzMf8OXgjGKpxdhItM2ChqTjX9OHYyhK1yd2whT6FMTvTl
	 PwC4h7XTJFkSbgNzNgBAHeSExShI/UPaIncu+KOFHqOWIwdbVY+eDB98oa7peLFbxE68n
	 ufH/XvBLqR9SHQmcnHjK/aUvGj6iCbWxqvJDiOsdRvxy3d7SE3p/5/3I/6comjVaNGzTj
	 5etO9+XWQ+AiSbhXDrL9MxaFGXHkKeVckQwE78s1isatixKqLDVLszwf9h93Tz+ilVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tEF3lWf32TGtz7z26SuXZNu/KAyYjCI+GTjWC6/htvU=;
	b=BpOjNBuxikSCsa/O8dz0sbGq6O6+kkKKhxnrpHG1gh7vFxSR5TtPBxuEbHaVsQPlkUyH
	 it3zyEv/HY26zeDwq9bLnGd//4Zmazd+k2QJD3AjSIs464h9Ka427E/LC0IEMXShcZVpN
	 B6Tgl1SYNepW9QFcCyn9F/+xWwuwKFSBaKJJ5HMbbMTc1leAamufA7aBnCsVueEeAtqqB
	 /MZ9hQSpI1QJD8F9dE9dxY03rcQUJlgKMMgkV7G7g/HF+8imYyZz1A3PvQYLudrwRPxRI
	 EHLD+WnIJcn68KMlfBnYZ4QBguakRxGjsmF81DnXu92/7xkvEbdzS0odUwu4XG9NA9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTfnxS3R;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E63606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E63606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTfnxS3R
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c515319dd89so210448266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685488; x=1796290288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEF3lWf32TGtz7z26SuXZNu/KAyYjCI+GTjWC6/htvU=;
        b=ZTfnxS3RqcyljOoqGUuZmcJzKxU1W1M2D+TJ8SJngsUlVu9lJlpTV/dd1A16PNTHOI
         qw+WwZaAaVDOyNz7AcYUs1yP7pAH782bpynnEyeI+dRiPP9vn9wK0JZPVe1jL3VK5qNV
         bo4US9zxrX4JrGWRRohYuElqe4gra24m0NBMIw3S8lT1mf5UTvsdnDdOSNGHBjwPanyS
         X7k9d5u13F4hvMDN66HfiZQeCnj2KtQdvdo2+/eJgkEnueC9jzKYyMQZylRrie0lT7DC
         0FH9t7wM8Hxwf7HmjlBeVwKpk9U6tlghUmtsD4yc2EfsntQ+Kt1eQ639mX5HHc0bmm/Y
         0cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685488; x=1796290288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEF3lWf32TGtz7z26SuXZNu/KAyYjCI+GTjWC6/htvU=;
        b=YAIbePw/M3clXXqgUN1wj/fqUVUgOhZwofh6KgxGXdF656pJYJ+Jd2PV+EUGWG1C8E
         DFzadDstekF21h3UBqS37/c04O4sl9Mj0Bit8AqLzYWRtsRzIlT3Bq8kbdGEEGn6dU/e
         LsRZkQSWZ87JDou3ycoGw9PFlmFFc+QwQuRvCGzznHOvyr3IAFvma+CYAkiQMwECNHgj
         o519UrcLzy23CO8F7JPKxASZqProlFBB5kCYdOvgf3WAFJSBtAGnifFBz1wwryEgTjS7
         zuQeuItKxgeGU9TAtTOYnlY4lSKspoXv3iD6GtXiYDZ2p9vLa/N7kiWxsTGBNUDCnACR
         8pYQ==
X-Forwarded-Encrypted: i=1; AL+hErG/QBYdLCVp2m//go9AmOd3dbXqNj0WkZy5PI6kaXeRzQoXxn5dCdfOKZzkzGMWoF7gjaGq2WtNN/XgLPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rlGcPxIxZDexJ3aMaanMvWrju2A56KGxL5El1c/eTH41077gV
	dwtSSh8R4NOfUR/5UjMnDzRMwVM8wRWzra17u9AUKpLm6OptEWOQYEzy
X-Gm-Gg: AZFdTZeBqthVn12ik+IHG9tM5Z5QC8keoRX3TfziUzsaZjM6vdwVx5VJpBD4h8j6ltF
	MMDsTdkr2dgmZeOsijSxHcx1Z/RjsxU0CRXEV/YWjlZ3412/etit8ssZ0aGF3ODMccLRJx2Q9dk
	et3930IrYSZBKg1McQGB6m271HsDCaOgKB2ta6S0zxvsLE9+mEi3z0furHlkgkkMWLm7ntOZeyo
	BqslwwNB79N6VUKWz9K20oWvLJgk+obe//EKRlt3ewUAK+gqRDHEvpYtc7Zjl9oJd3SCmEIK65l
	Hk9DycDZm+JsHmizkzAUCpkjGPxPbibSd7H6kj/A/6vnPHjZyT8V6iaNA60tuU/+0anC7tAOLa7
	Ga22iRrg4As837rjc8Xy8FH88rOJjCFjcWvcSHuu2hWEsPTJqsklEMM7dDomg/hlkQAB2bhh0dH
	nSz6/mMm56C+qXFPjUcC3m1zRkqVE2rl8kx1d+5PlqG4kFi3O0KiChWwLbhZCpba9HD4ydx+K4N
	kGKkSKdvxmG12+Vtn+tFwaZrGRR7aaIsJFkLjqoIFMdp2KPZbNuBikoAG7iITjYc/pKTeglnPan
	JR5/mzQ4zFJP+Kohln+WMV8fut8YfwUI0RFAo2SCR5gt61YphMsRIGsffVMKd+RXfEgdNaE=
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id a640c23a62f3a-c513a84d84emr1305389866b.14.1795685488439;
        Thu, 26 Nov 2026 01:31:28 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:28 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 09/18] sparc32,leon: preserve the Linux IRQ14 vector during startup
Date: Thu, 26 Nov 2026 10:30:14 +0100
Message-ID: <20261126093106.1345825-10-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126093106.1345825-1-linmag7@gmail.com>
References: <20261126093106.1345825-1-linmag7@gmail.com>
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

When LEON uses IRQ14 for IPIs, copying the firmware IRQ14 handler
overwrites Linux's IPI vector, including during secondary CPU startup.
Firmware supplies the IPI level through ipi_num. Legacy AMBA discovery
selects the highest free level below 15, IRQ14 on GR-LEON4-ITX.

Skip the firmware save/copy on every LEON CPU, preserving the linked
and patched Linux vector. Preserve the firmware-vector handling used
by other SPARC implementations.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/head_32.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/sparc/kernel/head_32.S b/arch/sparc/kernel/head_32.S
index 97000e9dffd6..6547717aac20 100644
--- a/arch/sparc/kernel/head_32.S
+++ b/arch/sparc/kernel/head_32.S
@@ -148,6 +148,15 @@ already_mapped:
 
 		/* Copy over the Prom's level 14 clock handler. */
 copy_prom_lvl14:
+#ifdef CONFIG_SPARC_LEON
+		/* LEON uses the Linux IRQ14 vector, potentially for IPIs.
+		 * Secondary CPUs also pass here and share the trap table,
+		 * so never replace its vector with the firmware's handler.
+		 */
+		leon_psr_compare %g3
+		be	copy_prom_done
+		 nop
+#endif
 #if 1
 		/* DJHR
 		 * preserve our linked/calculated instructions
-- 
2.43.0

