Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055368;
	b=u9t8UngziMfH8pFuCBpjuX1skx7KSDIuyqjdslB+XRKZ1jfIjljJr8kLPJxUw6yIRmPQ
	 YK5rNLjMQ1xk/WvR8z2339k6b0Xs/rSUZ19HYXYdm2y1D1sBWuwcPgYmI8m/Kl341NYlV
	 plplyIr6tpP0GIfMk4ncp1pU4IMLG2/lpV8v57+34E97x0T6jic+oTKRpyPKgPRO1wIas
	 JscHermNxNqbfmCkO3RhVcix2zaWG+p0Yz1eWDxoM68OCn07FB1PwSNYhrgMVVmjuvXCh
	 CMJgOz7E88LUZoUA9EzTviOs2/YGD++viMRwf03r/0ZlW5TP2x3gt+mOBp/6v+l6SeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C3K0E2vNrzLhMfNcPaWTZ4EGNNKVe3QGEsiFAnE9hUA=;
	b=V3ojRHhH/lHsDzy4Msl98/9sJl4QZQgW87pkQO70APlnT5LG7oiSmQ4FJyw4hmPmP8eB
	 rgl/JOHAgjV/mprtrKm0LBZigYRRtQMDxDZr4s0T5AVX2m3r4e5t00+rEPE75GlVBlAkR
	 sZ2g7O8RSN1zbLVusDBkuidB29H9Xr1cz88PY7whbZXNQtIvX1wpnQGdzrEN5OtUsAuEe
	 WfQ/slxTP7vZwsNBrOeizpiC03yBhC0PxkJDyj8z2tjCCZSiXt9e6lFZ+RyS/hpCWu838
	 P6nP9VMbU58FbYiOpQSBVUIUpKxCGI4M4QUKueV4y9KYmaKchrKphsGeOkMzPhSBFTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfkO1mZZ;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A8606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102A8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfkO1mZZ
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so3041067eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055366; x=1795660166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3K0E2vNrzLhMfNcPaWTZ4EGNNKVe3QGEsiFAnE9hUA=;
        b=hfkO1mZZ/vfSVEhMG8cg64y1lwb1AfkeHi11N20zxxDaPgnVnAFBH+n1Zsrt5HGnH5
         uYqCZ3hYtJITao6yK5H3aekaW1/42+V+jW+j6tXzKLWNFCKe6CVvEDgAy6yWH8BjFM4D
         BrYruSStdYXcpkFi+0Pr8Q76rmMGEv/8d75NiBbr6pL1rsJWdbYZJWqoNCe2/MHqt0xQ
         0MTAv0/9uY46bLu8qB4qLmwE0F92BhnhgkCYtXxXN4Db/rf9Ob0oGV5r/qqW0qOYCphC
         mOt8P3zA4lYfGO5hsFMumh7fsKBMcFn2eoLPawnH9XbBysyTI6wvLtAmnuKRVuNx3zvQ
         WBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055366; x=1795660166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3K0E2vNrzLhMfNcPaWTZ4EGNNKVe3QGEsiFAnE9hUA=;
        b=bNjCLqBw78LZplgITEXFnPI6r/eJDbCQvfkoDQKmWHm3iPt27lYRfLGx+UpMEs9jz5
         XwK/VlavkW+zekFQ+NSDEn6mixaVxFz9dKjTkiw4dUws1Yfizigt48S0oUrSPnfoOhy5
         FnpjG3Eye6ZTZQq3Yipk47TXZzqDH3TS0JWj5XTZu4zhcyFx/mo510O4MpVkq2vzI0Ay
         7OAgfZ5zNLB0Ch/8kmAtROlYGkBLYbuksJfuaShlaWKDJTy0y1O4pev1n3VAqo2Bukzu
         bVZVrY+CyT1IqeVLpyLXNu3VXr9EV3wTYxreMyrSCxonBck/4YRX1CUvop0PpL59xCZ/
         uI4Q==
X-Forwarded-Encrypted: i=1; AL+hErFPYXEFRAzjR2bjFWDGO7S1oeO5wuqZfAohMpD8JfFmov/4jDSEipqV/v8Ss2c8O5zKkn0P4wdTgAQeBVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9XCNfvFOarIgcQH/Um1SRmGwkJOoeyVuPhawUMMBXCa/l7XdT
	jg1BRTAfss+x5a680i7bOHZ2qdYT0pI0eACbi6yrz2exg4s8SfB9Z54U
X-Gm-Gg: AZFdTZe3czIINlxzQa4eYLH0YK3TymKZ/mjz0zE5QyVc/rwq0wz+S93vJX+6I/jfBJK
	LiDkRbG2JMsFRY1j6Q5idU0aAoDdn2wwsJF7hQTb9EQDAfNutxn4Z1jXbX+x4ahiXP9kbuh97vz
	wLkP2GwFffBXZovBnZjd/TYC+PO3UtEgDU6XWyTdnCOWW0V9Aq/YY/FLsh93koUqttUWNp1T6U/
	uSozEkBRNXZ8Rfa9Cl6NeSNh7V/RxnKiXIH3idpe6mGUVZNJ5IYGPLe44vJuskInwRC0rFAntUZ
	02+//t4dAgj/TcULUbYvASDFwlAh/H6DboF++W3htBO/HnkoArbjwsJvgqEaLTmcpY/qzr3Jgj+
	+tJCYoX7+AxR5Vbk/x73ARQeFVwT7ej4908mbM/N9meIdX75QZvzzrv9BIhHizRO4KiTA05A7zO
	w7cCmqGT6pWmJNPFS3t0CP7E5MXbpANg6axT1lBzunFQjRvwTnyAxMGornEuetmKH6JP6fZhOug
	6o8/dfsPa6cO3msfHKhtbcmfgNqIyvcP0tM/q9rwsDGVIObVOowMTsqhaNaU+kw1b5As800cbL5
	4G4QDsdIQODNwFLqIbhOa0oV0k2TBpQI3SZnN01aAx47bLPXlKjej2+CPTTuLW57M8jOLGmBvfN
	Ap8ERsYv/Vsq6VL18lF8TPfM3NjLLeTjCq35PmHBz
X-Received: by 2002:a05:7301:fd84:b0:384:7a8f:3bc1 with SMTP id 5a478bee46e88-3847a8f4f1cmr130310eec.17.1795055365946;
        Wed, 18 Nov 2026 18:29:25 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm13193964eec.24.2026.11.18.18.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:29:25 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jeff.hugo@oss.qualcomm.com,
	ogabbay@kernel.org
Cc: carl.vanderlip@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jacek.lawrynowicz@linux.intel.com
Subject: [PATCH v2] accel/qaic: drain the control workqueue before the device is freed
Date: Thu, 19 Nov 2026 10:29:19 +0800
Message-Id: <20261119022919.1493567-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118072448.1259909-1-shunsheng1218@gmail.com>
References: <20261118072448.1259909-1-shunsheng1218@gmail.com>
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

qaic_pci_remove() tears the MHI controller down and destroys the DRM
device, but nothing drains qdev->cntl_wq.  qdev itself is allocated with
devm_kzalloc_flex() and is freed as soon as the PCI device is unbound,
while cntl_wq is a DRM-managed resource that survives until the last
open file drops its reference to the DRM device.

resp_work is queued from qaic_mhi_dl_xfer_cb() and resp_worker()
dereferences qdev, so a work item that is still queued, or still
running, when the driver instance goes away touches freed memory.

mhi_power_down() moves the controller to the shutdown state, disables
the interrupt and flushes the state worker that destroys the channel
devices, and mhi_unregister_controller() removes the controller, so no
data event can reach qaic_mhi_dl_xfer_cb() once
qaic_mhi_free_controller() has returned.  Flushing the workqueue after
it therefore covers every work item that can still be queued.

Fixes: 22ec9a3b73dd ("accel/qaic: Leverage DRM managed APIs to release resources")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4, CONFIG_DRM_ACCEL=y and
CONFIG_DRM_ACCEL_QAIC=m.  No hardware was available, so the removal path was
not exercised and no race injection was run.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.

Changes in v2:
 - Correct Fixes: to 22ec9a3b73dd, the commit that moved the device release
   to DRM managed resources.  No code change.
---
 drivers/accel/qaic/qaic_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 90c0d31e414a..c4c3f450e67b 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -625,6 +625,15 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 
 	qaic_dev_reset_clean_local_state(qdev);
 	qaic_mhi_free_controller(qdev->mhi_cntrl, link_up);
+
+	/*
+	 * The control channel is gone, so nothing can queue resp_work any
+	 * more.  Drain it before qdev is freed: the workqueue belongs to the
+	 * DRM device and may outlive this driver instance, and resp_worker()
+	 * dereferences qdev.
+	 */
+	flush_workqueue(qdev->cntl_wq);
+
 	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
 }
 
-- 
2.34.1

