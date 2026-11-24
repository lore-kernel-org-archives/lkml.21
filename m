Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535128;
	b=0KqMHszAYQyhl3LQvXlo2ziSSsWndco+Xih+N8hrxPoM8WIKmoi9jitUwCCvEkt5Q5ML
	 coAG3ImDQfqappK9RsHJu9VjJxDVgVQPuube0Vi6SbhO/k49YAsoRU2gXvFjhQjIbAmw4
	 f7uSJzcQu9d0ZPUxuIWjQ79LCZLi84+YVZQemwR87i62NJx8syLEY5VcS4Gp12wIXYNfH
	 kDiwdPKNOEYS4bVdyK892mElqTo0kuz/WFIuYVDvuCvr7VgauAVLcFv33Pvq4O+ngPZu8
	 P6xT+C/ZpfUmbhkY+rc9zou7pQiW0vUuKRNWwmHoUWTS+bgODk0P//R8GfaIuZ1474w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3hkJat/Gg3boX44Q1mafJG1F0JYnnq/y7sAswGXXbDI=;
	b=GthUI4iSwMdAoYLkK26o66k1im3BDkRg9HU+/gLccOcrCml3Zrq7gr68IRAkTMXuCucS
	 ZdFkv2n+sdA4uKWShBM+RYVsYbPK9Ec+PwBGcyYw049rpbXuRakE06LYPS0CDMx41s1Hq
	 rBztzNb/aWhCt1jNJ/EH1fIBI6eSOXP3EXM0kO9Xp9Hg6HMMB5E7eu2+h8ZnPlcfmVrw1
	 49Sk+H36gmXYBtNlV7DHgXtIOPTWmZ/BmUvo5nl642AbFbwqm42S3sXxTxzRnmJJ+5uxT
	 ngi7CTKip0sbP7v2ObTsV3vpVDi7D3N/ydvkNMVoW+SrIeIcSdXZyepfcLNB/eqWd8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T08HQVU+;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75671606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75671606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T08HQVU+
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so2086212b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535128; x=1796139928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3hkJat/Gg3boX44Q1mafJG1F0JYnnq/y7sAswGXXbDI=;
        b=T08HQVU+RG0vW7CTZSiFCGrFWeD1QNQWCYFAfRXlUt8EbYsylC69ARNtHNoxccWMgD
         0XjlKPgKy6YFYTO2xeVhl23Czdkzs2g5Gs4osvH3SV5fLBB1heBG7EhNQZ0cFx7h8Bq1
         XgqV7tZGT1QDqN0WU4wXZEUjXOrJBiiaL9EyKV7FvrSHQrIcFNGVHOsMGDrh6Yg5EY1U
         ltbUUwQDEFYLjWxPd3dR8NUujAmPorV+/4c4O806ocsqOL/CUw6EoS1YP9j+wYiTPy1o
         kJLTi7Q/TzRRISTM2ICkPs77NSR1cQjIjGCAYd+YPEv4LbtnYhznhnBmlvXUbn6MZ81q
         GYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535128; x=1796139928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hkJat/Gg3boX44Q1mafJG1F0JYnnq/y7sAswGXXbDI=;
        b=tjTD+Cnmr0iWLYCxoGP4sCyYV82P4hBExSdjiRhourPdQVwvS6CU9P9Mq9ZUgY10+k
         TrRzXW16+W8blRbI1hTJ3q3tefYl9Rx/SB4pcQzkRvwzG0fKwosUlmTfRfxS57BoDhnf
         z7ZLO8lkC93SkRb8nWKsHZ17XS/f/OyayDi2bwv8EUnP1PgzAfdnnvv/H8uLyN39c6Xi
         kdwQtx/zW75LfgvsmbhF++nQZdMBHSdTQdqY1+mOJ8ltHENQUlCK1ql0s1HHopWgZXPp
         SXKOh28kumlEhXLMd3KvZ1Gxi/aABtsEJ0Q/UY8uqd1FS52TqV+2y4Ae8uCELgQOR9u9
         x9lQ==
X-Forwarded-Encrypted: i=1; AL+hErEmz4WaOesQ0G9yGERDcgdehqt78PO+g3sw8bfTEU/+1nh1lH5tvC5oN5Q/pcIWVsAGx48UPn+brMlhkKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z++X19da+QdHEyfZd5dVUB4s26Q31dUmh8F4vWrLeRjnkL87p7E
	GkMjN8sg36xFBX9pn9lS4VU4OadQkDZgdFQJn92PtYEBp5HCtmHz9Qg1WC5eHV+6Yw==
X-Gm-Gg: AZFdTZfEQa67k2UornqblG2Mduofrfh+s9MoPgHOiBP7hoWbWR7HEqHZVsV7RpWBqaY
	cKyFlzlpKsllVreSGjQ+UMISnmgrLzIIHVRdFONfoLHGTw53hUh22djPm95u1XI1fxvuDi178FF
	FR0qOC/cy5x+eSQJNQ4acXEraeC91gaAlTEVPOjwnB9H3+5xw/6pw3sJVxHQu7vnndNKh5/qSoB
	s3y0+Ojh8ZE9F40EaiwUftXyIJv1/pLnEg/TmruChqgv/Ot4XCz5mzJ7KzoxZP2mKdzE6I8GvNR
	IO4ZWonoi+Hlv6pGA+7BkDodq4iQopXrcfeaYA5ephWi5N6+ly336QyPPS4QvSbIF1XSw9KXYLW
	+BMtWiipVm8ZQne6PeeCRfDZMGtugxRx1PAKq5Kzcn+vKSSU9QOZohXUU7yrlntL8qJaI0jDyVi
	pdAuWrXJMvCkBiAGFOs71E6bz1CCaXz/Q3pfy4erSWL8WGeIOCcwPR06jnfImxHLz4GrHM3N8gQ
	ZlZOuumzGdeIXRIBunm4NPP69YNBuQqvkkbMOYmfwwNF6c6ftgLv4D8cn7flB7I6COqfe4p0BGr
	U0lemQt5Igrv2wNzq5z2QlKETY3CzB/jJL/+NLc6D1iGF6jG9sOOoMUw86aIktdTkS4X
X-Received: by 2002:a05:6a00:1f17:b0:8a0:f375:d1c0 with SMTP id d2e1a72fcca58-8c87c57b5fcmr12396223b3a.33.1795535127699;
        Tue, 24 Nov 2026 07:45:27 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:5da8:85f0:b5f6:2eae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f11da2sm7136132b3a.55.2026.11.24.07.45.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 07:45:27 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: Clear the GLINK node after name allocation failure
Date: Tue, 24 Nov 2026 23:45:21 +0800
Message-ID: <confirmed-20261105-37-9a8d5cd59eb0@gmail.com>
X-Mailer: git-send-email 2.50.1
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

If kstrdup_const() fails, qcom_add_glink_subdev() puts the acquired node
reference and returns without adding the subdevice. However, glink->node
remains set, so qcom_remove_glink_subdev() later treats the subdevice as
registered. It attempts to remove an uninitialized list entry and can
also drop the node reference a second time.

Clear glink->node after the error-path put so that the existing guard in
qcom_remove_glink_subdev() skips a subdevice that was never added.

Fixes: 44f4911ab8e6 ("remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/remoteproc/qcom_common.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/remoteproc/qcom_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 5294e327f1587efc917eb01dde59bd1e723c225e..cb3f6f93c6da85010f89244a6991f4d74ae57dc1 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -255,6 +255,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
 	glink->ssr_name = kstrdup_const(ssr_name, GFP_KERNEL);
 	if (!glink->ssr_name) {
 		of_node_put(glink->node);
+		glink->node = NULL;
 		return;
 	}

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
