Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696939;
	b=ubZGEIkGcBbshPr+NnFeTHeGB3ds3wL530jdOGx18q66QI4F8Aa0aeyM5VuB8s+AJ2Yh
	 qn+S86CW/rbkj/39Mtdz4UzbChYqlaRbKWjPqA9Ouu25ge2mf6v1SmZYXuVTjATBuFvsU
	 mDjHtuTEQ7KYTXCsgJN29eDFRkv+HigU3A2i0c32bNwtf867MM4547IFXeymh9TJiNabq
	 3YbbhqnTjkjDYAcxqNMA1GBzKXV+PtzHdw82gvVGCvTCHULdQ8+iR4n7hpzQZ+gqdEiVe
	 poCSB4Cm4RQVIbZcspkmICL5bj0v8e9+pXw8aswdkhzxyBNVf55xPfCYnLjwM9nGQqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=buMeQQDfJsDcXVlRtFz7hMPHQNqj9L9yHfXuPxjS13o=;
	b=AKCoKfvgkGfGEiQPTxT1q6BrrOuu8a9MlFaor27RftCirWlHyBHloMa6HxNM9lb/KhMz
	 3HPmi8ABgS1wK1USFDGkrXp2QWve3p5kUyG+60yVrQJyXTI4phpi5HHBU++7/YXiqkPB3
	 k0jWMqiNRGBVOxNVUbtRPc0fAVvRNezhZ7QiIbppR+LbkZIQaTMGPkFYfyfUekS142mnY
	 EMSaUF15wFAqjfaWA/zJKnvRwgz17og15TiSCnQE2jQYL+/nmHnMDciMHc4b3MyOuCOCv
	 PyUVLUw/BJZVAWgijLwMB6TZKFltcMI2nl31ug8n92y4CeoN18a8+lQvPvrnb1MxI6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=OL0iv+DM;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF35D606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF35D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=OL0iv+DM
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so58421525e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1795696937; x=1796301737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=buMeQQDfJsDcXVlRtFz7hMPHQNqj9L9yHfXuPxjS13o=;
        b=OL0iv+DMJtRYNrKRLTgwyzvZiNBVu+BWNFIAfYe+IKgR0EZaoGmpN3LiYHfjG+tVMP
         jSe/aO5M7YDNLxTllDcGo3AvlABhGT2r3CmP3GaYqHf7/9O1T292d9sFhMlyZtOvCWjA
         YhLwEuOz176lrq7NvXEDNZqECY1LbeJGdSp7sRhu6XsbCOap1KtJBEJw6ckl90DtiuUO
         Ajn66NTPyTYn/7bBkivQ8az3R1aNAjhBOlZS3mVbhRyxdC1pm2mXdTuz/w11LXrxmsoa
         f/Wiqp2vGnSpDCOzYGdf2h9SEqtuLrwE5BLqfVd1QmpKmvxg1grJ1/2Jp2GhyjKJwo/c
         NZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696937; x=1796301737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buMeQQDfJsDcXVlRtFz7hMPHQNqj9L9yHfXuPxjS13o=;
        b=kYPAPupPAx3iGSoHc8epZ3bWa257YrHaVjfdQ95T5X/2+3gPtBOgGjfb2DHVA3fCDE
         ghclw+PC662a5tPWvwt8Nlbwxa+K+PPnw33Z6gsB2hadw9Yx6xrp7E6nH8O2ROTuEgn6
         lypEehuCF4HK+y4SI8Flzxk/rKb5xlg2CldGYk/ei7oO8vQM3NrvpSDeflwgsee9+MG5
         Tii0P3N93ZnhiqD9Ro/Qup11fd1tXMxuwLNDrJ/MvAYnFcvDzo4hr1y69jqG1jJw147H
         B733XrWda4qTnAosOk5Iat1RHpxM/VxW5BaUNRi/cXSv69odIiHmCkd1HXXZ+MdXAoMo
         DBuw==
X-Forwarded-Encrypted: i=1; AL+hErGV/sODNIy5xQAJonWGDHBg+IkMn/RCuyw1SGIcsMI+21YZnr/rY2t1saG8/dJ3TI7GM7dcLmHndU92QSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DjexQ/pqTZdvDAQHc0cyPEmzasY8sqrMxZ1JRpfKdh3hsk0LD
	xEWDc7cjPqFmZUk6WNKPizHjHq6d714916G2PuHpeuPxG/Go6CW2btR+muS83lNLxaY=
X-Gm-Gg: AZFdTZdS0pOo6GCjOLaUk3fqXxMyke98YrfIzI/H2TELROI71cvFZRknxXXhBJjsirF
	H1Nvc7bByP5jhK/Nv+1JmAy3N9AMNrF5EQAIaq7g1/WdSKv0MCQeyr2zacVA912VMIU8qaWsc5T
	yImLznh3LBeVoZEUhkv7C8wTkbIxg6OeZxkve9ON1ANpr1blZ5BSDMpTeneiNECi3+gPzTWkeOX
	P/Nu1psDDPO9lodyUiMZM2K63TNZC7Z9vJtImw/p8zDZrhvoFxl/zyedTqjNh/e/v4KCrt3JbAQ
	6KcxUkz+Bk9uj8Pgfpg731oyemYZjHCBiiY70xYEZryuumsTlQKImtJREZksi6WRxKUU8GlfWeu
	binqfwfUer0Uchu2duWe2oBH/lQcuz2LfuyxUVtg0a86eyDEUVz6fJGpy1LYhODB8E40jSroODE
	ESd4zsiSM0R7Jk5oCtXZEQ87uMkK97wxrfQ+U1LhyltR+s4D5eZmzBLgM4WEPnjSTbU6PXhSQL8
	puMdViSJElzAIGgJQ5lJJqaVs+af8YkelOjqW7KPnIvCfPNZWDMsIex0PfhpU8gYQmzzJQGMogb
	1kihQDExrtvtB0uYIpXMaj1FhtSUKxukBc6unxniUPBdGema1vD0XScRGYtkxohLmP/Iag==
X-Received: by 2002:a05:600c:64c8:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb88819be1mr398470945e9.16.1795696936947;
        Thu, 26 Nov 2026 04:42:16 -0800 (PST)
Received: from JureBuildPC (46-150-36-237.static.telemach.net. [46.150.36.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm577708965e9.8.2026.11.26.04.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:42:16 -0800 (PST)
From: Jure Rebernik <jure.rebernik@luxonis.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: konrad.dybcio@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com,
	val@packett.cool,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jure Rebernik <jure.rebernik@luxonis.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] remoteproc: qcom: pas: Request stop before tearing down GLINK and SMD
Date: Thu, 26 Nov 2026 13:42:07 +0100
Message-ID: <20261126124207.2665762-1-jure.rebernik@luxonis.com>
X-Mailer: git-send-email 2.56.0
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

On QCS8550, a crash of the ADSP that the host reports, for example
through the remoteproc debugfs crash file, can reset the whole SoC
instead of restarting the ADSP. On two QCS8550-based boards, crashing
the ADSP about 4.5 seconds after it had started reset the SoC in 19 of
42 tries. The system stopped right after the recovery started, nothing
more was logged, and the SoC was reset 6 to 7 seconds later.

Since commit 0ea50486978f ("remoteproc: qcom: q6v5: Request shutdown if
crash is triggered host-side"), qcom_q6v5_request_stop() sets the SMP2P
stop bit also for a crash that the host reports. It is called from
qcom_pas_stop(), which runs after rproc_stop() has stopped all
subdevices, so the GLINK and SMD edges to the DSP are already gone. The
QCS8550 ADSP firmware treats the stop bit as a fatal error and runs its
error handler without those links.

Request the stop from a new subdevice that is added before sysmon, so
that it stops after sysmon and before SMD and GLINK. The firmware then
handles the stop request while its edges are still registered. Crashes
that the firmware reports and graceful stops that sysmon completed are
not affected, as qcom_q6v5_request_stop() still skips the request for
them. The call in qcom_pas_stop() stays for a stop without subdevices.

With this change, none of 104 host-reported crashes on the same boards
reset the SoC, 24 of them CDSP crashes.

The problem was found and this change was written with the help of an
AI coding assistant. The change was tested on QCS8550 hardware, and I
reviewed it and the test results.

Fixes: 0ea50486978f ("remoteproc: qcom: q6v5: Request shutdown if crash is triggered host-side")
Cc: stable@vger.kernel.org
Signed-off-by: Jure Rebernik <jure.rebernik@luxonis.com>
---

Notes:
    Changes in v2:
    - Shorten the changelog and move the test details and the tool-use
      note below the --- (Val Packett).
    - Rebase on rproc-next f39ba58941ef. No code changes.
    
    v1: https://lore.kernel.org/r/20261109175752.793130-1-jure.rebernik@luxonis.com
    
    Testing: Luxonis OAK4-S boards (QCS8550) with a kernel based on v7.2.6,
    which has 0ea50486978f as stable commit 0dc9e289bbb5. Crashes were
    triggered through the debugfs crash file. Without this patch, 19 of 42
    ADSP crashes 4.5 s after start reset the SoC. With it, none of 104 did:
    40 ADSP crashes at 4.5 s, 20 at 4 to 15 s, 20 while the ADSP was
    streaming IMU sensor data, and 24 CDSP crashes. A crash that the
    firmware reports could not be injected.
    
    On v1, Val noted that a subdevice for the stop reads a bit oddly. The
    alternative is a hook in the remoteproc core that runs before
    rproc_stop() stops the subdevices. That changes the core for every
    driver, so I kept the change in the PAS driver, but I'm happy to rework
    it if you prefer the core hook.
    
    qcom_q6v5_adsp and qcom_q6v5_mss also call qcom_q6v5_request_stop()
    from their .stop callbacks, after the subdevices have stopped, and
    qcom_q6v5_wcss does when requires_force_stop is set. I have no hardware
    for them and left them unchanged.
    
    Built for arm64 (defconfig, drivers/remoteproc/, W=1) on rproc-next
    f39ba58941ef, without warnings. Not done: sparse and runtime tests with
    lockdep and the other debug options.
    
    Tool use: Claude Code (Anthropic) ran the investigation and the tests
    on our boards, found the ordering problem, and wrote the code and the
    changelog. Its first fix skipped the stop request for a crashed DSP; I
    asked for the request to be sent before the teardown instead, which is
    this patch. I reviewed the code and the results.

 drivers/remoteproc/qcom_q6v5_pas.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 57a111a0d7..ddbffe45d9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,7 @@ struct qcom_pas {
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_rproc_pdm pdm_subdev;
+	struct rproc_subdev stop_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 	struct platform_device *bam_dmux;
@@ -429,6 +430,14 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 }
 
+static void qcom_pas_stop_subdev(struct rproc_subdev *subdev, bool crashed)
+{
+	struct qcom_pas *pas = container_of(subdev, struct qcom_pas, stop_subdev);
+
+	if (qcom_q6v5_request_stop(&pas->q6v5, pas->sysmon) == -ETIMEDOUT)
+		dev_err(pas->dev, "timed out on wait\n");
+}
+
 static int qcom_pas_stop(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -1012,6 +1021,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	qcom_add_glink_subdev(rproc, &pas->glink_subdev, desc->ssr_name);
 	qcom_add_smd_subdev(rproc, &pas->smd_subdev);
 	qcom_add_pdm_subdev(rproc, &pas->pdm_subdev);
+
+	/*
+	 * Subdevices stop in the reverse order of addition. Request the stop
+	 * after sysmon has asked for a graceful shutdown and before smd and
+	 * glink are torn down.
+	 */
+	pas->stop_subdev.stop = qcom_pas_stop_subdev;
+	rproc_add_subdev(rproc, &pas->stop_subdev);
+
 	pas->sysmon = qcom_add_sysmon_subdev(rproc, desc->sysmon_name, desc->ssctl_id);
 	if (IS_ERR(pas->sysmon)) {
 		ret = PTR_ERR(pas->sysmon);
@@ -1049,6 +1067,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
 deinit_remove_pdm_smd_glink:
+	rproc_remove_subdev(rproc, &pas->stop_subdev);
 	qcom_remove_pdm_subdev(rproc, &pas->pdm_subdev);
 	qcom_remove_smd_subdev(rproc, &pas->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &pas->glink_subdev);
@@ -1081,6 +1100,7 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	qcom_remove_sysmon_subdev(pas->sysmon);
 	qcom_remove_smd_subdev(pas->rproc, &pas->smd_subdev);
 	qcom_remove_pdm_subdev(pas->rproc, &pas->pdm_subdev);
+	rproc_remove_subdev(pas->rproc, &pas->stop_subdev);
 	qcom_remove_ssr_subdev(pas->rproc, &pas->ssr_subdev);
 	qcom_pas_pds_detach(pas, pas->proxy_pds, pas->proxy_pd_count);
 	device_init_wakeup(pas->dev, false);

base-commit: f39ba58941efa63e6c7d10d53d183d6077524bdb
-- 
2.56.0

