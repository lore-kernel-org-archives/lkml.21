Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005622;
	b=S5R6ewQcW0bP783aDtqoPwOirh4N2SECXtPFHscHUz+6DGrGm5cp4EzDRSP3/vxs3YfQ
	 LTOpNYSzZ9JUHXt8sNvM6W4RNlhCR7c+rIMhpfUWdj78OAJotSG9AHRVzUjjykuH0yC4t
	 eoCME3pBjWyyQBbUcDgyBJrbedlA8Z1Enw+xWwgu8CMRzZJBbHYWZJyK9gmcgIthOwfv5
	 1Sah1vg6gFkFA74P5pMCRd3XyXFPEL0K34NbjDa8Fk0l1B8o3ErVm2VwYCd3EE3eHJQnO
	 lH1FOXdNYjRcJryk9uKMeobVIN6trsQpYFcV/I/0VvOIrntZMmFgd52ViM5cCRt0+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jmq7Af/sM0RcMj+9tuc6VMNoq5IrrSVjtEHnLJaumaY=;
	b=ia0DKTdDkAGREQhlVCXxLSy6Z2/EKa3f4b+53cdkou6/3R+wRoBF0BRWpraZACn/Q09I
	 OGyEGVfGXZmwPmITZJO1FeF5WHZJyu/0J9McqauZkuHHTpkpXSqfBAneXyI9YfAccmGaK
	 a6+GIuLfuub/tnFNkOAKyQATYdV15hujv0NJHTv+OsOSnKHqkrfPi1N6yRKT8D8Th5Uom
	 tjYR9MQgthj7Fmn6dbSvc17T9ORICRhS26EBIZ9Fqr/oEtPNqmgZa2+fmLSybyMHiMBVH
	 C9ZSE+od4zRpVOe41BNJL9feSlN4GUorP4sX7a+Rj79LqySFD7pi+N93P0OtXOuqPqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p49ssens;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBCC606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBCC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p49ssens
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so518369a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005621; x=1795610421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmq7Af/sM0RcMj+9tuc6VMNoq5IrrSVjtEHnLJaumaY=;
        b=p49ssensfNeolb6Ih8IzXirPrigVla/RaZ6YMNBkNmOJ1WnxeYsjKRHCEk3DJ+xfri
         NjkF/f/XmkQtpAFHNLVPyNBsFwJ0SvlYr3W9hdEy1lBDfIKbGKwg8zzxQM6ZjJmujwrn
         UK2nk9/rHDbN+QgBxht8vdrPlmX+7MljZ+5vlp19cqr7/Z+HzV+wsfXdK4SQMND7xhHx
         4erVtxtbbWg01ScivNolsL2hSyDo5LLUbVjV5a2RvDaIZJE8Tv5ckPXTJnQSmXIJ6L4T
         AGPlKP2qUFcG+9ghK803ZXbC6Hkg8t0JCPaXwWY1oT6OmIacKRoVGEsyK63Iey1Nu1qm
         uUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005621; x=1795610421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmq7Af/sM0RcMj+9tuc6VMNoq5IrrSVjtEHnLJaumaY=;
        b=pjsbd8cDHw+gLqhmtjeyxKvb7sJdS+2RXzReTMF1LHn7NF10yjWmd4DrnvBwRAuQjE
         RnaGRv2EVJ7Hxj2tPpjo61itmaqaSkUhW1Ddu6pOSBDug5Zj8CoUq2ZzgTmvIfr9AzZp
         Uf0UPoLN6a0gUDCINEJn0PkhzD9KcYTBYQ9SExtWMTv1eSQcNYOj3s2xtWR3ZRQ9HlvM
         QvKp4rb4qRh+QdGdf5vMFMf/ZOIFmQSLPaz6NqsnsEeBSom2Q8GoOV1Xdlyef2MubqxI
         yel+B3/cIsJRCXs2lOJg9MjyBqMt8l/VfYv+5uOLgCwN8BiIunhEIawSmVMj7kGb8xpO
         Uyng==
X-Forwarded-Encrypted: i=1; AL+hErFRFYj8kbnQ939wLAqUfJqxbh+C4cDCaokc2mtcqSPt9pjks4RLhY0oLdAkzsRGi3/ZfSXEkoRuXGjwu78=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cHQ2s4pYfjGy2ogNYmS/+w9n0sQI7USgsxkqKysxUwAXcn927
	024UU9rqH8FOf0nvGuJhXsTPZebRN5hQhUzubvZfg2cPeHyDLLlbnJPSzxZiXhFFznE=
X-Gm-Gg: AZFdTZc+tCd1rmR2+rbyBSYLblZsGcpu1p+H7nthKaIdq5+qkvLem+5eNJXYeybi84X
	+YxoiBi3adEHxrmgQ4nP2/BDQ376ht7k/AgrmVaz2PEQ+NDHtxTQ/65e5XvfklhxSQPRWEhkyuD
	sU0aM3Ftch47eBFmOhwRVLbOovPivRLPqmI9uxJ+FYOP2wj/dbzKHnB+sH+JEcPk7da4EVOqY+w
	QnhTkftQCwMtZmCBatGCxG6OFx/BGhdEbSPABKPTC1V7KSe7Sw9RMkDmSOENrCNNf3PKkYMgYuV
	hbQvoS8NiP1hT+WIYwERVxH9lDvdqu3VJAEYTcnpieGyJJzOr5VZD1qh69uTLCa39j/zGZQbGIk
	GNyqaniJpbbpVhkkOWB+ZT1uG0p5m85NwpvKtlsBX0J7ADL/h0CqscuK8nHxykfZE0Afi1mb9Nq
	QNkCe3SEQo2qY/2jwlavHB/joVHktrsi+igRwPbrC9mAULMPX3HrwR7Cp5O8KTdDspBjYv8B+Ny
	iQnpMlgSBFnp+bUw103RrYh/vi850absUO7u5fo5MoipLzlAWThTusdINkrpvJuSi/BrfphnNd7
	iwM1Dhw/JW7TtVPzVXfbrf9aDmuLYRFcmwvjVZPEPoViw7eZIAYMbGVxiVPCmblX8RPNLFNp8uV
	JUOTV/ezclWFemUHA+8SSIGwrfgKuwPTPUjOIbw==
X-Received: by 2002:a17:90b:5848:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b3d063dbcbmr1675099a91.2.1795005621132;
        Wed, 18 Nov 2026 04:40:21 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm4257980a91.10.2026.11.18.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:20 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v8 1/4] usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
Date: Wed, 18 Nov 2026 21:40:02 +0900
Message-ID: <20261118124005.2428068-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
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

bot_send_bad_status() and bot_send_status() run from endpoint completion
callbacks - bot_send_bad_status() via usbg_data_write_cmpl()'s cleanup
path, and both of them via bot_read_compl() after a BOT read.  Those
callbacks are called with interrupts disabled and must not sleep, but both
functions queue the status or drain request with GFP_KERNEL, which can.

Queue with GFP_ATOMIC, like the other usb_ep_queue() calls reached from the
same callbacks (bot_enqueue_sense_code() and bot_err_compl()).

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a27..12e2b20e33b921 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -139,7 +139,7 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 		req->complete = bot_err_compl;
 		req->context = cmd;
 		req->buf = fu->cmd[0].buf;
-		usb_ep_queue(ep, req, GFP_KERNEL);
+		usb_ep_queue(ep, req, GFP_ATOMIC);
 	} else {
 		bot_enqueue_sense_code(fu, cmd);
 	}
@@ -167,7 +167,7 @@ static int bot_send_status(struct usbg_cmd *cmd, bool moved_data)
 		csw->Status = US_BULK_STAT_OK;
 		fu->bot_status.req->context = cmd;
 
-		ret = usb_ep_queue(fu->ep_in, fu->bot_status.req, GFP_KERNEL);
+		ret = usb_ep_queue(fu->ep_in, fu->bot_status.req, GFP_ATOMIC);
 		if (ret)
 			pr_err("%s(%d) ERR: %d\n", __func__, __LINE__, ret);
 	} else {
-- 
2.43.0

