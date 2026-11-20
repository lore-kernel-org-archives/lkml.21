Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202688;
	b=0QlfE+lhqthYbd67ezoIC++6otIQIoXSd44nEwq9KUWrqffkxKiDwLOMIP83L0N7oPlm
	 gy+zFUavwjT2FoHuiCrfXfwryRvF+NVyMxi4JzYJJPZg/P8O9e0Rc1TF5IIGvhY1wIYvX
	 RzO8tsdOutqrANOxDNDZE4jRsBfRwchRSUFUbs743mcAc0AMh4FKBlNDfjwwtx1csMalJ
	 fXAjHJ0w0PiTiOvp2Islop0hohTeL7l94GtPatEUWajrmy8BRulVHS3YvU2W/pnY489TZ
	 5HMGVs1pKdpLVEL3kju9OZVNqW9PIWR5+5CUlpMKZUb+s1UO25VtE8uWzVlQUdTsSRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=q/fv2Bmd9wBtLji1WNEQDEdz1uwjcCB1ddxM9BJCZv8=;
	b=2Xj/zgRIyzDPoAne8qL1D5hoWAlD2ca1Vz8o5yaLSWT9uTMj7UBH20Sug1T8l8K/XnVu
	 YCwmtxOar2xK7dKOyVkZB3iH5oY44jah3M9Q33ien0zRrQ0OPD2TyCGWseWNi054Yvtsz
	 FKNEli3pk9+vVN4e1D4hsRO58tSNAiGNMJ1d45LqJ0FC7VtsYnv+SMUPO61Wii2Xx0vb0
	 eNPSH7Lqd1wPNAmvXq8ECzi/4vh1X6AyR0kruYv4jdEv6Pyn8IfbhWYn0kBXbxJLo5RBN
	 6z9GEMAnHGz7GWJV2nlQFjabNLboVQwlua2cdmE2j4lF5qyNqtQcH0p/oLdTCOS0uMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MVQEkLVA;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F0606A6FB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816F0606A6FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MVQEkLVA
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso3166214eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202687; x=1795807487; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/fv2Bmd9wBtLji1WNEQDEdz1uwjcCB1ddxM9BJCZv8=;
        b=MVQEkLVASWzcLctXvL7AYtV7m61aTNFb1XD+C73MtdPXsPbfveVmK9PYVGoB94QN0e
         USSioJInTnHaM+vpQnrbiL9BPZuKzCE/+b9T7Pjg2Dahq/raakDfk2kUiaTlV8ShfG08
         8Rh+GUhK0eS+yiAoG1sd+Jf7JwRY6G4pGNOa6Ly0QKtaxbK/1SmRlyb48VLbM7KCvLCT
         FQjjhbqq1M/+2OQA9tB9G53AbTbYMjmyDLwyQmE84UyY3V2yPtqc5CBAu6uvVtvDoTFr
         U+O/E1z/1kMBFXwjCsC8Ei1P3gmd558P3nu4W5oR3jEEHCT64RbOnkhhdkur9zF0/Zxw
         mxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202687; x=1795807487;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/fv2Bmd9wBtLji1WNEQDEdz1uwjcCB1ddxM9BJCZv8=;
        b=MTn1QVWAJMDdKgRKB0Nx3GVXEnyoTrCs/3NCgAd1v6FYFHrWI8AbKQ0P9Ji/PU/7O0
         XZe80v3EaxeZmEWwhdTRWal8VU92msSlJme8rgdwbx6pxy6IXXnGLXj0iYJiFCRquCm5
         cahLy2Pd5UZQ5/b4bwLkrDU+agHSNR5p5xRqItBM9GqBf9XGsj4HwMqbeaHyHjnswWBP
         3zMbexc2B+I/fdn/rg2mwYtLKvlQShWlcS9IEr4c1IPBrGCzzBpTAmHUooImB4qdEdCJ
         6AQxp4/fL1P1g18m6RMXz7U5S2eQTd2YI1pFDGt7FW1vLyK8Nwj0HjzaR+az61hPguQL
         QRfA==
X-Forwarded-Encrypted: i=1; AL+hErGcpI5e4Gln4dY/Si47IgI4li71F/CnFjKi2WLo4FMcdfrNAYu6V5/Zh2pSc3DwCtZrGRtAnJeZ6NBDr9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nI3wA9E+kKtnQYIVO/MjCCVh9X435FPn/8uPkaBgCerynDb9G
	6UZdUreVF0j9uJGNtY1mFwP8jsVALzOQgZxfI3cczPkM8LXRIqrZfMoMd3TSZWoVOu2jVdWDWnW
	lLg==
X-Received: from dyx8.prod.google.com ([2002:a05:693c:8208:b0:36c:a092:ca28])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ce11:b0:384:fe97:8ccc
 with SMTP id 5a478bee46e88-3856fb58443mr4028219eec.29.1795202686267; Fri, 20
 Nov 2026 11:24:46 -0800 (PST)
Date: Fri, 20 Nov 2026 19:24:32 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192432.2873409-1-elkin@google.com>
Subject: [PATCH] media: amlogic: c3-mipi-csi2: clear csi->src_pad on error in enable_streams()
From: Elkin Cruz <elkin@google.com>
To: Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

When media_pad_remote_pad_unique() fails in c3_mipi_csi_enable_streams(),
csi->src_pad is left holding an ERR_PTR() value. Subsequent calls such
as c3_mipi_csi_disable_streams() can then dereference the poisoned
struct member.

Reset csi->src_pad to NULL before returning -EPIPE.

Fixes: b63ef604a28d ("media: platform: Add C3 MIPI CSI-2 driver")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index b5e59e810e13..c261daef15b3 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -426,6 +426,7 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
 	csi->src_pad = media_pad_remote_pad_unique(sink_pad);
 	if (IS_ERR(csi->src_pad)) {
 		dev_dbg(csi->dev, "Failed to get source pad for MIPI CSI-2\n");
+		csi->src_pad = NULL;
 		return -EPIPE;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

