Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448234;
	b=xF1PIy4V8wvWb4lqLvS7vlBdVkCLsRKbs8bWC/F24fCsLoV0DfzL5nVwtcR5PKVK48fb
	 1cB740ev0An2JOkpi5Yj9pS7wxDxQk1vvSpT7/aouLwjxbp4gqJlMEhMRXu0NCvW3VMFH
	 Ru487x5aMbt2pZMjisqr4ovRfcDA54ZvM4F7e+z3lZycuQS4zbvT/xceltqnbz4S+PXkF
	 MsxYSNzhCAbIugljQjsXY/WFyedMT+7okW1DhLjfMkB3Gaf1lQrrtqMDlTASvyRF9crJT
	 SRoJfokwj42A5/FbLT64cy9+fT8VleKA5yeZaMg/LniK1u3noqFLnobyTgc2m9jpysQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rF0mx83XmYPM2qNwRzWvVTGOMjzCPdNgkj+Hi/DwTQk=;
	b=JcT6WAiwdQ1L/JjBPwrg0FkvcI5+mq2ga+MPPJmaq0QaZL6KLCm/Fc3VEi3KrFBNRMuB
	 XQ+lebKuNXkdj0pGJ10mjQfIxUtt+qOG9/9URXdXGqbaqVG9BMIGQug/2Y35muLLpwM2h
	 Pi4AzuJtTIhppIJGy3S5ndzCz13s1CnmxpUl3Po++szUGaC0WXRGs9xkIxtVlNhSF+KtV
	 VRYTv0S2ZE4XJnYHhnWqTMOySA68sJ7gLhOa5SYMJobdaMiVMRGZ0Pa/BGXNusXB4XDVI
	 +hqGBO9pFDBc8j8NCkIM5j/Yjc4N2GWtGt3y0Sd2SqWorYxkUTlv+8BiOvmzXAPbTvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttCI1wx0;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF80606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF80606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttCI1wx0
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b40a522c00so369880a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448233; x=1796053033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rF0mx83XmYPM2qNwRzWvVTGOMjzCPdNgkj+Hi/DwTQk=;
        b=ttCI1wx0aaqMSTE1b4pbgAQXeBS6wuUkYvonNVSXOfd9WYHb5ef37UrQePoPZA6FPK
         drl15Pk9fYg5nM9vcpFPJlthr0SS7aqklu9XFZxuCvYjVoroZA9rBN9tkgo34DfWsjVm
         QDNF2SDfIbrPBnZmxSXSDm54wCfigwB2rkOoVIjzpBlnqmXLn0DnGxLCNWMpL3VhnYtO
         DFHOy6y0cV9jQ69o0jcZtQ2qeChfhsmhoigNsPMbIx1fh1icwwtkWGcRXTAa3S8zmCBy
         spJU1JSA+OTmgk87oDL4Up5uika/3Ke7F59rYaH+FvWnmCdLTwJ2GR8Zt7N5x3ex+l7N
         khBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448233; x=1796053033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rF0mx83XmYPM2qNwRzWvVTGOMjzCPdNgkj+Hi/DwTQk=;
        b=Z/AXW+Vm1KTOYzKTMCco7ePBqjS/m0g7WV3KGwlbeicdAuRNih7a+9O9npzjCAzOpb
         8yVh5Mfcl2llqXBtvv+FGtgbSzU5hVO831AS1kNHCIxEkTObD/7PkomOBTrli0/pUW7c
         OwSIfCkLutMFuDcLvzg7fbSjQ6rDm/Uo/Mi3x14V3juRuESPaoP1rNgs2QGoVkwvhLlc
         7u9sXsYuAk2sVo2dHQdtSzOSidZPO9NUTXVsuVI0VtzWlAEzaWlbaP+dZ8HNtHel6FEK
         237c3O9+xvDCuZT6jPzcwCxTUF4HVhnaQJfstE9qx04br89pVGEc/EbwPGjgDnoLO09U
         jkPw==
X-Forwarded-Encrypted: i=1; AL+hErHpfyYDTHb79O3DImYv/tdfSHgh4yOozW8H9n+cpMvDapaJh12/HhqijFTdNB0wvuLoHtMrdNtj8pPqslg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/apNJNjTwz5MNRUDrchBa5eF7Q5yTOna1IfwkIcfEddWeL+hmv
	OmQ5bG/DU/GDgjlThS67hzSkyMWVu2mYGYir4eoce3hzXNw5aieBks55
X-Gm-Gg: AZFdTZfy6VTsjvO5Wj2GCph6mqtftmmWBCXw02A2UxrlxHnbD8uYDVuMbj6nqVyyvaS
	8Pl4cKKshkPo0ZyTn5LMDiQPk0bUFKugzQHiSqgKGcWpG8D0Jv8qQgmtLTAlG5+9wtA4GwP/X5P
	x5mmrVMmlo7XhcJvCdEtrnuiNx69zfF9rezevakx2HYARXVu5zxQnRXSNHe/i2j9g4c/r5ZkCez
	ARQ5JpIk22869LtVDyXTrQtLazd5iy7ghTSeN+ZiaoQROQr0Z3Lm9K8BjIzhSpjU4QKqhtQfpv/
	VAvK5l655rOnnvF21suRhL12lUzASP3Pu/xF0VqggjJQyw49geEttMY8n4D/E1wqsH/WWmcv4qW
	bxk8hDGcBhhj2DhuXtkgHf/B/lbU6npXM6IZlDzDC+dCqw5Xq858bAcLdkpSfU3NYBCENb3Jf28
	a3Iik8Ufvsqm3w+OP4KtcIvGeQj6rC066Eb3eD8+NmZfxEZB/Yhbzwak0lAhoLFMqmmW+5MLT9o
	jU2cj5fDxIDJQAYR3W09i11z3Y4841o5T8lIEs/0y1pPMhQ4IqyG5etCi4vhXu0krDscepCOs9f
	9GGlJYAIoTLDFak0lQHozLQbCsOeIPt9Qa1R5U+6
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr17701792a91.2.1795448233074;
        Mon, 23 Nov 2026 07:37:13 -0800 (PST)
Received: from gmail.com ([36.112.205.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde797af60dsm4050341a12.29.2026.11.23.07.37.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 07:37:12 -0800 (PST)
From: Ziyu Zhang <ziyuzhang201@gmail.com>
To: ian.ray@gehealthcare.com,
	david@ixit.cz
Cc: clement.perrochaud@nxp.com,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ziyuzhang201@gmail.com,
	baijiaju1990@gmail.com
Subject: Re: [PATCH v2] NFC: nxp-nci: fix deadlock between firmware download and IRQ handler
Date: Mon, 23 Nov 2026 23:36:34 +0800
Message-Id: <20261123153634.66973-1-ziyuzhang201@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <b707c629-97a7-4766-955b-64a2a7626004@ixit.cz>
References: <b707c629-97a7-4766-955b-64a2a7626004@ixit.cz>
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

Hi Ian and David,

Thanks for the patch and review.

For the timeout/late-response race David pointed out, I suggest checking
info->mode at the start of nxp_nci_fw_work(), after taking info_lock.

On timeout, nxp_nci_fw_work_complete() sets the mode to NXP_NCI_MODE_COLD
and releases the firmware while the worker holds info_lock. When the
work queued by a late response runs after this cleanup, the mode check
makes it exit before accessing the released firmware data.

The diff below combines Ian's unlock/wait/relock fix with this additional
check and applies to the original code before v2.

I have not fixed the other two issues yet. I think these would be best addressed in separate
patches.

Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
 drivers/nfc/nxp-nci/firmware.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nfc/nxp-nci/firmware.c b/drivers/nfc/nxp-nci/firmware.c
index a953397..33193fe 100644
--- a/drivers/nfc/nxp-nci/firmware.c
+++ b/drivers/nfc/nxp-nci/firmware.c
@@ -154,8 +154,10 @@ static int nxp_nci_fw_send(struct nxp_nci_info *info)
 		if (fw_info->fw)
 			schedule_work(&fw_info->work);
 	} else {
+		mutex_unlock(&info->info_lock);
 		completion_rc = wait_for_completion_interruptible_timeout(
 			&fw_info->cmd_completion, NXP_NCI_FW_ANSWER_TIMEOUT);
+		mutex_lock(&info->info_lock);
 		if (completion_rc == 0)
 			return -ETIMEDOUT;
 	}
@@ -174,6 +176,9 @@ void nxp_nci_fw_work(struct work_struct *work)
 
 	mutex_lock(&info->info_lock);
 
+	if (info->mode != NXP_NCI_MODE_FW)
+		goto out_unlock;
+
 	r = fw_info->cmd_result;
 	if (r < 0)
 		goto exit_work;
@@ -190,6 +195,7 @@ void nxp_nci_fw_work(struct work_struct *work)
 exit_work:
 	if (r < 0 || fw_info->size == 0)
 		nxp_nci_fw_work_complete(info, r);
+out_unlock:
 	mutex_unlock(&info->info_lock);
 }
 
-- 
2.34.1

