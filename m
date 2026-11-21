Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222572;
	b=E9Lslck8AJLtodmVgEiIT06cO9VvWvqd1voMBYx1iF3muLb/iTaoJADvE40NlZQZn53q
	 /i5Gc5spmTdxjHfJEajsBulga4zNNcLFfwwiX39P1SKcDgXo0X+h3ZEbMRQjvpppgl/1h
	 g2uzlHNzzY4Tuvm9RcvftUfQCA0kADOVcYHxShy7AgwaPJH/C/onE6FPbeLc8ANBIchjw
	 7MYiwsuP1Z2kmlC961WI4cNC0TdXYRK/vnRebOuKqz+3gkLoy1MUxGsFSSuY+7facdmW+
	 HTMC6txKN6JEY/aBYPyg41y+gggG5LhkQMkLACZvEkcptfKzi7EgK2IJj4FktH+3Avw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=i3GTOPnQyWclBIu+6MA2Oe59A19a3zhTv3uiRFaf8C0=;
	b=lqqqH768XAPRClA8OhK19BeaBU1d37LvoeuJ608wlDTosA8nLU6zFUZubBaM331gdMKe
	 6wNcqj6QztxuDtaPbVJ7NLUDZtqulMqxPG+fgoXbBzw9ikut7Y9DaYmsBRS52IvvUywH8
	 0lS8qn6t2Y/keSrTb7/SMgh0HZj46sDKQSV5A99mmCy8k+bdaGgwsd5jKIBapJPH5Ildo
	 NEIuJWwu3OjXF7yTy10SSz9QkA2qPC4VghSJzirb0zaHBDCd+a/6USv/UB+gcEYWPFbAN
	 xCTCGi7e4k94QnLhc17NfXCRxzJU53WAU/N1MpF/6d0mQ/Dob1kI7e8U3xDYswpt4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofGMIfmj;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936F5606A691
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 936F5606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofGMIfmj
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso15419385e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222567; x=1795827367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i3GTOPnQyWclBIu+6MA2Oe59A19a3zhTv3uiRFaf8C0=;
        b=ofGMIfmjUmPZDpbiK6zzZMK5vFaD59tJ4YjxAYXxfl+KJD+gDOdi0nIWE0DDLYzNPV
         NSpufJVrv1sdgw/vRTDF8nkZ5Qg42Lfw0TxabFiDMmhTaD3/tFkPGKnDindJHhv6+thi
         Rt+50uQUnNYolC3Rpj/0VvgeXe3p0nK6MmOYK3bHcGVoTDFC5v2BGfKFabtqnuRaFNog
         7nkJhKDchbITOleWddiXZWAC7aRJC/qc8DqfjmCH99H+TSiinqLsDKCvoaDPLUqykw0B
         KCwlK4+nBTVzCxX3d9uS+xWfQyAY+uhuLZ2RLiXwKH608nOKEmEq7m2f3xZJqgMELpbb
         UVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222567; x=1795827367;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i3GTOPnQyWclBIu+6MA2Oe59A19a3zhTv3uiRFaf8C0=;
        b=Iii0gCqiZFQpBD3xK1C2cKHkW97P8CMnJPaniNo2P1Lwpf/Pdz64z7NgKhP69wfviI
         j9uA0ZPVLJVogSasO03/5MpUNuza0b1aoay//f+e9ZZit/XHpER1FZPnxIvjxHs/MuoG
         xXC+4cYbp4mcAL4CR98GPzCrtnJD2GmEGNbjrHnbewSiV56m0Bdr7OMpfzcnwxXTTmsA
         I0hJibxk8B9CJJpjLb1vmBOvgQNbaqfOO1UfvLk/dq09arNWgqawY8ThieVjZ2N8OGkM
         AuQ6fmnJamF7goCA7R2nferHFcc/5JEOZU+jH1uvnVFS8s1YVIueJNC5RYoqFjsKios9
         Noqw==
X-Forwarded-Encrypted: i=1; AL+hErF66ZFZyl7PmPiMkLInySN9cCyCYJYzsDi8V30e8+qh/HJ4ZX8T4b1Vapq9j6QSRWviVKZfMDhvRsOCirw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y4ery2QTeYWdBjJF2SPXc0hAIxRtkEgKTjy1ZB0b/bPyekL3u
	/c16xEwrWsBIrZNo7f4eoR8EXMGq+yHqGQMmzOr38sQciqnOufklvkif
X-Gm-Gg: AYBFou0OiIQ8bDEMFggkh5R24nc0Y+Xg5yY9ZYcyAVdmEqwsFEop6K7/2Ast8Vb7Dni
	9wFcxC0W6bjfOuVRsYYu5PBtb8WeTq4J83qBv1TT4EBGp3MGqeCdbZjnZ9AOMVDhm4bL+PX5qFc
	S3E49c3sotFqam5VB+38P6AiQGfZmHczb4rfP7GBdDn/jB8qAj/GWUM26BzPErtVaO44TNzIK8a
	On5ZpT0MM9vCFaKAhqxqn7Z4j0w6uPtPTwAI+f+NRy8XvWQfdcZn1BRbBi55Q4FFNUgkHIx8h3r
	zsul63aPPSTQRm5nYu52g47XQMmuVVZo+odg/RiwSA5YA3KmtpUuutem4odmnHzUqSEV/iwSKFx
	xmZwoJXUQ/ldMFio3bEeTcLwFqIeJgfd6SpVNorDpslBVc3mgDVZw2+JWdiYHY4ypvvCK8Nak2Y
	Veuf1enhwNSnI0j177u/rAYX7TgAw+VsvYULrs/iXkZBQox8RAwp1UjqDQtKpVJ1C72T03ImUQa
	5vxJSXRzfuxxPPDgChKwLWHqNK5cJDgq9qAGqr2vTbhKqJDg3iR8HEP6KKkInqbgaUiZdxpbgz/
	vRmyH7ME/1Z0oWhYO7lpzAKpMdqbSXjxhOKwTnmV9VEcV6x/5oxjPUHmC1pZL414gJFiXA9CIEm
	URG4G
X-Received: by 2002:a05:600c:8184:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb8881e969mr101042085e9.28.1795222567564;
        Fri, 20 Nov 2026 16:56:07 -0800 (PST)
Received: from [192.168.1.15] ([185.69.144.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm152290885e9.5.2026.11.20.16.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:56:07 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 21 Nov 2026 00:56:02 +0000
Subject: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
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
Message-Id: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxG4asgz0SqDerQqyAGEn5ad0hQDAgJc
 XdSOn7DewcZssLoVR2UsalpigVcVxQ+Q3zD6VhM8pAns7CzmdnFtKzZJ+cRRogENNxSSeaMSfd
 71/V/2+q/CMvvQed5Abh+Od5wAAAA
X-Change-ID: 20261121-sp11-noturbo-becde22ce314
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Dhruva Gole <d-gole@ti.com>
Cc: Haipeng Lin <jimmie.lin@gmail.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795222566; l=2027;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=zMtLMtQ+dyPR6vWexg5Efr75uQzulLUBjfV4ysHWXLI=;
 b=/0FvWqPNrFnVvgEwryZLXaamwpG38yrLu4Qie4Ux5eNj5z8zCxsJo8BFsvWf6INyW31eItzll
 jyRFhEZ4DfrCE7Lnvk3W36ChLSg6Ia9sphAiI9nIjeD6SMTLbxVZlRk
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

If the firmware reports a sustained frequency of 0, every OPP is marked
as turbo. With boost disabled, cpufreq then has no usable frequencies and
fails to create a policy for the domain.

The Surface Pro 11 (X1P64100) CPUCP firmware does this for the two
clusters that have a core fused off.

Treat 0 as "not provided" and don't mark any OPPs as turbo.

Fixes: a897575e79d7 ("firmware: arm_scmi: Add support for marking certain frequencies as turbo")
Cc: stable@vger.kernel.org
Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
From decompiling the CPUCP firmware: it reports as sustained the first
LUT entry rated for exactly the cluster's fused core count, or 0 if
there is none. On X1P64100, clusters 1 and 2 have 3 cores but only
4-core LUT entries, so they get 0. X1E80100 reports non-zero values and
is unaffected.
---
 drivers/firmware/arm_scmi/perf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 0116ffb2b279..d4394984a0f5 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -879,8 +879,13 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
 		else
 			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
 
-		/* All OPPs above the sustained frequency are treated as turbo */
-		data.turbo = freq > dom->sustained_freq_khz * 1000UL;
+		/*
+		 * All OPPs above the sustained frequency are treated as turbo.
+		 * A sustained frequency of 0 means the firmware didn't provide
+		 * one, so don't mark anything as turbo in that case.
+		 */
+		data.turbo = dom->sustained_freq_khz &&
+			     freq > dom->sustained_freq_khz * 1000UL;
 
 		data.level = dom->opp[idx].perf;
 		data.freq = freq;

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261121-sp11-noturbo-becde22ce314

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

