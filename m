Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024446;
	b=f1AjkTaPzucLqAbivyPozuk+ov8utd/5M5Pk9nqOynxQ8MYwMs7df1LAcF5yu8n+VKHp
	 CQ5bx0N96nRoNWXKCpFoj7LzvX3hUKsaHJnTZDUnxXe+CArDRaRAuF3cxyHbScehJo76B
	 GBPCukpYdCKP7arTf/eaIQO/Fsoqu048aPD+dCx0pMqu7rX8eKaXqw9wrWX0DXCRIZdOv
	 PZ8ekz/DxTNh0QYetAtIog7vI7Lf3xdxwT5RIxV0Xzv0Hy6cKf+1J78Xii+JOu+SeAZhs
	 KhBAdac9w44XIV7zJ6n07Gg7o83JxxNcYzRbA6OVX9NG0bsmn0MDjXzaoyJydEPr5iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QqweH0pYyIm/pZwPzk7IcmA/lXOB2dIrOde0Tai0CcU=;
	b=TRAuIFhFWqJaxhE+bOK6r1MTj+6UfUfkzCoI/B3urBjmOqu2IECHLL3qxsctq/JYraKm
	 2lFQljhgW1GLF7FxRFifY0FeMxq51ybxfN+nsWpkoK6igG8HV8EEEseUFgIRhtZcCArBC
	 +uIKweTeqxejlMx7wdGg/vqd0hAyUnGzvXM0X8o2tac8x92qPHb1Pe45e28ckwPSe86AR
	 FQsAnDYknMqQfXX9jD9bYxQ2VT3fT1wgRhsjmrK+hviKLI4afalCIMg0udOC5rMwoJoG6
	 1DFrd1geew6sPhJeMLW4Wf/4CHUuwYG0J4RMv44T/Xpr37gOWD0KCo7YgPAeyXpMGbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPmfWjhF;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF35606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF35606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPmfWjhF
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-382666ea434so91627eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024445; x=1795629245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqweH0pYyIm/pZwPzk7IcmA/lXOB2dIrOde0Tai0CcU=;
        b=nPmfWjhFSXKVsOedyCpWGxiT0bmkvZTBxQAIoH3WOGQ+Tkpav5ZboHgU8H7zmbfgK2
         oI+BGSsLQDxb4KMhZDuvQGVWTISfprhkwTCgbs9EqjqELWCn+GYEkHK8B4jpo0seRq/7
         Lo52EaLrsc1kkTbyXs15jn9zbI+x6kVfNxsZuG3E18VGqPSN3kN7EzRUAU7UGVN8NmGW
         8z1Tq6YnQo6vsY+PRUdTswyX6WEonDwPD7kF6ibHYWMoHY9VHxTOuFcQ6jxfZ9+0Sien
         +D6AX0Ts7YOfA0zFuRP2DXyP3tDrCkyn0a9SRuUEYSG/W5pITNRbv7FBcNp43LyQiYRC
         6CGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024445; x=1795629245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqweH0pYyIm/pZwPzk7IcmA/lXOB2dIrOde0Tai0CcU=;
        b=YGjpUq7EOgmaJMgQzmiJS32G2gCEBAZsnWVXvuywSxb3UORqlWKoqs42SP5FqzPLqg
         82hLbISqgVLsqbqZCfrsWYLvd0V3S0iTi8A9Qr+Nqnm3aTuzLFIuTUIFqoVx3ncgTP1L
         ckXb9joTbz49q9FiK86fOijNGnOXECsAZpbkMPmdE8ok1u1bx//Ucrl2YIQcK0PUKVTR
         0FgMkRd+Q8I2IAWK/qGxQweQiJrM1s2UtITLKeIrJJ6pmz6bNQ5SxTY/cT1s1PMVz5Ja
         qZKQCicuHSMK9xGCOBj5bfRRnU8tUmdHjyQvw9OfiSpg1TRFv3blG9NtfAbQtqiOAANJ
         nHyg==
X-Forwarded-Encrypted: i=1; AL+hErGC1KuoS3aCChkz6p5u2aRcNSS4DcfUOVhx+y4POXVbEWnWjtZNyJbhlZ3quMuFJT1vsREvDlUoaOPuEy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jyMGS3TjNnrkM9codeckAIzVbeQNM5Y2/ei8Lt1RiH10BeUj1
	kjJzUBD7rvdR6UoFVfib6AOKnKUC93hT8pjt3Tvi5eWCaIK6DKm9Cz82
X-Gm-Gg: AZFdTZdD5TQo5TOC4CVaMZuMHXTsExj8p69IfKjBAqH6yTO2knVEFtC3Q094NdVDfQ5
	AhfeaCXcFNSKuxDwNNhQliB14xm8z/QsL6fS+Xj2ZyfeUpx4yRiphkjcB8Uhmv0uca6QFOp4Q3k
	jB3laeQcDLWnknDEJkDdTL13FnQT8vidEELWEd7MmXMSvSQSFqlj7NP5/yY7BTuk/SbeBPLs+lj
	zXNCW+xv7wLk36ueZz4wpTec2N2Bu/EIgEb+7d3poY0GerUf38IhwdFoOAh1h+gY3T+sc2MLqOn
	EQN2cutx3DAsRXDUz62jtRw1135aPB7KqOPcPOELdsObXHnFgz6w18zWQqoEuwKa2XRfT4pGPgj
	DdSmvXscQ4JuB2Shx8BvFc04htmDvDQL99Z7/3+IN2XMgkcKAsGX0M86D3pkcos5b6YVi6AfJd1
	CoFwr2Qs1FlL0LTDcqrEr7moFvQfAi2G4Dn/7XERq8xf8L32IXRdobOhXQXl0NcKwxwLYfOPXtH
	HXaQ8H9SLOownL/4CIzjSDSyYxlIdFip3W++wFMcBxgehczcQ3OlryE9KuywofVRShDVZxybP03
	ZK811o9DV4W8pWJZaQFXh9d0xGEvuTlY49APCqQ2Ev7PDIpZCVZFzQ==
X-Received: by 2002:a05:7300:c595:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3827f98fedbmr5064472eec.1.1795024444661;
        Wed, 18 Nov 2026 09:54:04 -0800 (PST)
Received: from localhost.localdomain ([38.254.175.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm10352900eec.24.2026.11.18.09.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:54:04 -0800 (PST)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: quic_akdwived@quicinc.com,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] remoteproc: qcom_q6v5_mss: Fix off-by-one error in regulator error cleanup
Date: Wed, 18 Nov 2026 23:23:54 +0530
Message-Id: <20261118175354.42351-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

In q6v5_regulator_enable(), when any operation fails for regulator at
index 'i', the error cleanup path unconditionally calls
regulator_disable() starting from index 'i'. However, regulator 'i'
was never successfully enabled at this point, resulting in an
unbalanced disable.

There are three distinct failure points:
- regulator_set_voltage() failure: voltage was never set, load was
never set, regulator was never enabled.
- regulator_set_load() failure: voltage was set, but regulator was
never enabled.
- regulator_enable() failure: voltage and load were set, but
regulator was never enabled.

Fix this by introducing three separate error labels to handle each
failure point correctly. For the failing regulator at index 'i',
only reset the resources that were actually configured, without
calling regulator_disable(). Then roll back all previously enabled
regulators using 'i--' in the for loop initializer to skip the
never-enabled regulator.

Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and active regulators.")
Cc: stable@vger.kernel.org
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Resend, rebased on next-20261117, no code changes. Reviewed by Dmitry
on Aug 18. Original posting:
https://lore.kernel.org/r/20260710194638.1502-1-saileshnandanavanam@gmail.com
 drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index dd052a62b858..692cbdece318 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -313,7 +313,7 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
 				dev_err(qproc->dev,
 					"Failed to request voltage for %d.\n",
 						i);
-				goto err;
+				goto err_set_voltage;
 			}
 		}
 
@@ -323,20 +323,26 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
 			if (ret < 0) {
 				dev_err(qproc->dev,
 					"Failed to set regulator mode\n");
-				goto err;
+				goto err_set_load;
 			}
 		}
 
 		ret = regulator_enable(regs[i].reg);
 		if (ret) {
 			dev_err(qproc->dev, "Regulator enable failed\n");
-			goto err;
+			goto err_enable;
 		}
 	}
 
 	return 0;
-err:
-	for (; i >= 0; i--) {
+err_enable:
+	if (regs[i].uA > 0)
+		regulator_set_load(regs[i].reg, 0);
+err_set_load:
+	if (regs[i].uV > 0)
+		regulator_set_voltage(regs[i].reg, 0, INT_MAX);
+err_set_voltage:
+	for (i--; i >= 0; i--) {
 		if (regs[i].uV > 0)
 			regulator_set_voltage(regs[i].reg, 0, INT_MAX);
 
-- 
2.34.1

