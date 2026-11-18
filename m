Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005625;
	b=VPVw24xIdZquXuWUML5DPr9NAIbfH26U3ZJbiAL4pdZWeMzlghIBnr0PozU3Qfb6AJAf
	 6jPsOF4noXHweC7wWYSpKM7rbe3QIyA+Hsn8ktcyWNB7Ld0ZnkmCJzPGQmUYxh8+5w/D/
	 mMLsjjVq7M1A/euerhvRKcDaO3vyurDs0eWGgIc+BxW2PDh0/sOcwvTS+NlpbDmSW7Nly
	 sGakf6imvBns9m6TTmaB8gx9p5bqhDOCrWipLHCsDc76bRBFwAK9G0u76Ei4b1s2rEw9A
	 YusBySnafvZ+TR/vf052PEswwZaUmep2Sg6WxvkCYzjiRLBcDLcJyElaW5Kl3cBAnDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7pJ96I8CCGvOS56AX9pgEAEbaQ1usEuN94BGKUJKVPo=;
	b=GRs7XOOuIPk9DcO7+MPzUGgpW9vvsIxTty+fVf8/H4EAyyGzls5AoWJywuxncaIA8I2r
	 wQQv+Pmiu6nDV1KdHaTiBM13leVEkzWsbFn0hlwYjoO4WMis69eiYyHXglYYP5iC9Yn+I
	 wjXKucliBPXkEEMaLnd9uHnsEXwW3NI+X3dDA/rVG44PJ/ZqRiAhJGpS51gQHFlpwtzjo
	 SpAo6Vg0T4PC1zA3vrUhf6j105teRU+IlVUfg22nr6qyoTU1tgHjB0hrkBNi2teqebRvH
	 AAnxxslhOuBLhyolCf1lAAzgOFt80UyyzHDwGyVUtKIHHqN43VZa/5Jf/x+qMF2zk5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QYuCHNu8;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9186606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9186606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QYuCHNu8
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3b3c072eeso512010a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005624; x=1795610424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7pJ96I8CCGvOS56AX9pgEAEbaQ1usEuN94BGKUJKVPo=;
        b=QYuCHNu8QiyJp2MmNEq84pI0sM6uyoM03JyUTwEf3p9qB0jGDLOjhNGToBsEVByldX
         Mueu575ttpUYhaEDvPC2u2xhTahftneuoIh7ORw2GCegd4CVy/iGP0v1QPoW49WXCa/0
         BYRb/8pMzvEG1N3th1yKnxl/mVa7G9lF4IU6HqtVveX+bRwVxJVdW8Qa3f13KQ0N15ok
         n7N8BEGML5RYFPICQrFPESxVHejYefI7vPzxR+J7Ct3LszSIv0FwxIRPxqNMchLjLzgO
         wVAP6gUr6Wkyq+snL5d7+igxRnS/XIikZrwrwg7FEmqpU8RKemBOCFo2x4MlKX3McsVt
         g7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005624; x=1795610424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7pJ96I8CCGvOS56AX9pgEAEbaQ1usEuN94BGKUJKVPo=;
        b=gC3ofs9gt4A6gofXBbTXiwoMbjxHO8BgMlVAb2YBqwRkFWnagk37eyf5Zv1H1bEJD2
         aXXm44z+LjEGnOJHFBXC4PgTPnk/JlRzaufRBwI0eBR7aMo6aqTx96xUDXrVJ/vw32wR
         kd5cPkTtFMYo7/wKjNX1mQw9ES35kTGP70J1J3jA8Zkmg6MnDCNZLOTUxCH29psr3Mfs
         uHtR1zw3FpnTecoKD/R0NDALtXTrbtKZJ2LWnTBMj6Z0fzulvxwxt3JljsKodipLvFdt
         KI8ppsHqv5IATOpilJwXQpto3ZYv0hsJslbdb68/jkKfEldEadYSFq7AL9lJoHbPUFSy
         uQ1g==
X-Forwarded-Encrypted: i=1; AL+hErGYrPnZJX9+qNRwKlUW8CNACCeNPzbI8BrkarnBT+BJ5/gJb8oxKhAUwIdBdFjiXKlqUZXZqu2chqjXfrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sCxto5wQCKpqQr2mAXlpe85NO9ytG9j/VnADH/bSCysvr/aS+
	mAIJp8m5dPLyWAOGMbXINh5EIjTKgqdFzaDg16CoE4dYhSLkpDZWrfzHsl8H9T+pH4bLfbfJszl
	kexVt
X-Gm-Gg: AZFdTZdvOFjpk5v3b15C7vCVPx43s853noRRRlDWymPdSFuZXtul1Z4nwvpREN1uabt
	0P+NdbqbWGpX0NoWtCeICUySOGF6cYDdpGVnpn7jxzjHTwusEVM2js8nUxfuMTb78T/oc7NMV/Z
	uctACdysmtZFopJnsDKmWZbtgqq2OvMajIvotojuoMwGGCUb/dibVVzWfZfsqKAUW27IWuLPGcq
	pJ0bx5ZCI2nQ3feGX8ODeq8LWJspelEg1QCjTiux7a670Ua+Pu6pzxm5patqawOVHY+qbXaDIPZ
	mVhmEaxei/I2hpf3R4Wcbt+wMd3NraYuLsYokm6jJKqCeLMXLdopi3NAfAuBcO/c4DtObROxisF
	RnWsrdLh+lmlncPezEApcOEhSXZ/qAkURYNMnnBBrdHqXBVApOzD2s5Zipc0S4jhD1hDE/OkdDp
	tUTRmI8LOFsbf2Vwoh87ZIYkECR07kSEd8Hg1owmtEOBCLXfMjLQQoMvSYfJY+i2c6/CirBNAR6
	7u6TE2kSEhtNp3zBPSx0wO3ATVyOIVkHJ/MeoERpr4HJZqaNX8i+/nN0dh3IRpOrnO8J2zpm8Xj
	/jVUJ1dqeGR1gfOis8fBz6I4Y4JQNsEb+YTp1hL0KF2stV+4da4BLskHLSnflgAX9Yju1BCSO6V
	noTPekwQjwHjapdqlOG3PN1AdUqLNjfdbpJxKmw==
X-Received: by 2002:a17:90b:4c8a:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b3d07d80admr2483888a91.44.1795005624070;
        Wed, 18 Nov 2026 04:40:24 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm4257980a91.10.2026.11.18.04.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:23 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v8 2/4] usb: gadget: f_tcm: zero the CBW buffer the status path sends
Date: Wed, 18 Nov 2026 21:40:03 +0900
Message-ID: <20261118124005.2428068-3-yhlee@isslab.korea.ac.kr>
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

bot_prepare_reqs() allocates fu->cmd[0].buf with kmalloc(), one endpoint
maxpacket in size, and the only thing ever written into it is the 31-byte
CBW the host sends.  The rest is never initialised.

When a command is rejected before its data stage, bot_send_bad_status()
points the status request at that same buffer and queues it to the IN
endpoint for a read, and bot_err_compl() re-queues it until the length the
host declared in the CBW is satisfied.  So the host gets the buffer's
contents back, a maxpacket at a time, for as long a transfer as it asked
for, and whatever lies past the CBW it never wrote.

Allocate it with kzalloc().

On a dummy_hcd gadget with a 512-byte bulk maxpacket, a rejected IN
command declaring 4096 bytes returns 4096 bytes to the host, of which 72
are non-zero and begin with the previous CBW's "USBC" signature.  The
part no CBW ever writes read back as zero there, both before and after
this patch, so what that buffer held beforehand was not observed; what
the test does show is that the host is handed a buffer it only ever
wrote 31 bytes of.

Hui Peng's multi-driver fix of 2026-09-19 zeroed this buffer too; the
reviewer asked for it to be split per driver and it was not applied.

Link: https://lore.kernel.org/all/20260919223521.3890508-1-benquike@gmail.com/
Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 12e2b20e33b921..f2e7a9ad77809a 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -330,7 +330,7 @@ static int bot_prepare_reqs(struct f_uas *fu)
 	fu->bot_status.req->complete = bot_status_complete;
 	fu->bot_status.csw.Signature = cpu_to_le32(US_BULK_CS_SIGN);
 
-	fu->cmd[0].buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
+	fu->cmd[0].buf = kzalloc(fu->ep_out->maxpacket, GFP_KERNEL);
 	if (!fu->cmd[0].buf)
 		goto err_buf;
 
-- 
2.43.0

