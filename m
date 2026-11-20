Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202057;
	b=ApD5st4S+MKl6LWVX+peqQO4zCLbks/+IPf/YyiegzT6L3gfux993TCrLgzF+QUrq1ue
	 gnD3ovWQ3UJwU2CiOdPULxPVNe0MeGjfBN6eWC1kx5AnQgmgqmFC8P6q1QC7RXRCudwrK
	 eeA7hCgcQ7JTFMhDCRWqul2HXyPbhIcjW7wjB1Mk8OdjHZR5Spj+eeoWHPnq4Py6C7zWi
	 26i8/7rAc+FeY184toly+/vSOOexn09MSKHwj9WfVza38Ta64C4NNZ5Ul7FNrL87PHOox
	 JEZhKDaP0wvufEEOUvVIMMCg6sPe5u2d6L3iwTGz4blhvnuRhLYRLYHtU9k0oNy7wqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eAKYaySrSQHr6pJJw0QDlSkZ3hLgQhrVNe7eEGIicUs=;
	b=uIUkwgPx32+AdA6xf+z5xHUIhpnKR95spTC2Tb1I8pvbCeIEk4imHl4PA2UedC0O4wj4
	 KGJx3+Ek0KA9pM2mZiwHjsFF3wOo4yP0idtuwWGiy45qB8vCMlLy4Boh+wNRjTsuujc0H
	 kBZQGQgNsDVHmS0bcLG5N+MmLCEguBd7HR00qxdJFLqikaatGMBP5n9cY2h3qbIRrawr4
	 4uh3UMbh33QXBISWrM3ActXnYlM1b9qul+yMnWl03ZS3DQJVLo8PwOWJBoug/CPij7v5U
	 KurRkK5BxmwhbPRJj8vfOWCR498ZcpoaaDVVlvfoNBQcsO+QlCdanKdIEJLI22IysXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnMgl2Cu;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1BF60A263E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1BF60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnMgl2Cu
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-862b3a39d0dso707931a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202046; x=1795806846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAKYaySrSQHr6pJJw0QDlSkZ3hLgQhrVNe7eEGIicUs=;
        b=cnMgl2CuU+LJjonclnZ/k9to9GbpGYULFct/bYc5Bl5bKnK7C+PA71CLfOkHxpwS+V
         V2x5oRqU6XhvDyMurKvd3MmE/WJzduLTgR17QjdK39Y/o/LUniBHRWm5GjPuJm8Hw+y1
         k3+8EBrwsg6Fa2ScrItarXSLP8nmn0U/fnT60b+O9wgP9ty1FFOlATKQrRmR644mjSEZ
         JccUQ46RHOIfdpQoXi9cYyfPAstkzTCH4XGC2+Xabp7Ccg4qzOwR6r2T08cq3MY8jwQ9
         /Xpo0M2cMPNnv/uHKfrdvodSmVVqWIjmL7kzgEspXEsL2G5fTNozOOQjtBxFPqEVMawN
         yZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202046; x=1795806846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAKYaySrSQHr6pJJw0QDlSkZ3hLgQhrVNe7eEGIicUs=;
        b=kYWZD9X0GT7EymUwLY9Yy5CdxRksBzd0TylL3h8RjMkv3MggbxSyYPjxlAz8UYLYRt
         aoB4jvWaIwJ3K/GSVuxmTib1u/Zj9eYAWkwOTFGGe7lh91CAsmtcWtL85Yb8z4DAcyM8
         6Np/1AlUOeWvJiQqd5ibnlqZLgwx9pWxFlbv3ScVY8zIE2QuRo2owudN2bSif4HZaDsX
         /o+w0t04P0rpM9kmbgTeJV1Rg91Kyxbq03P6aPg/bA1ZQ1QuGAMS550DxdqOUmOKOQ4+
         rWs5zHh7Wi0Rdh/2djtjh2ovRGoT8TALiaGWYp4ZcHnmA1U+MpLk482oUJVZEwSMdHg2
         7vwA==
X-Forwarded-Encrypted: i=1; AL+hErFJqGU25RVi8Uk3ly3vLSlDVgEMPSUpStseTLU0xIjn575SSIekoj0yiq8cUo5k/qm8+U2x9tdR4gJY318=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Z5WlV+38czTaWM9xJgDeNKN6ycVpIh44AkMVYRJADv2gjcTs
	vBwEXeU9mW/rcfgz79DC15BMgt8Bi1CPE0mwCpxgJcasJH6UZ3Zul9Uh
X-Gm-Gg: AYBFou1OVuvQwZMGiKjPQs8h0BhsTu7TrVa1C6Nj64kaoyQk7Fo2wzmDOk6W3uOdnuP
	JqniXKlLh/qMkrte/2gFiNemCfcuQXHcoNbunhv0uWLriPv5T7Pq+xrkzLsINjfSqCck94eaq6a
	6600agWntuaa9Dsex54CDtZcAwHIHZdHOngFFBCSxLIp0MgchAVlzAtReRvd+BFe8OtSz4iwCaS
	5dd8mkC54RJG+thd8xHgDS+vD80D9fbquC/T/jriXHNPzfYv5kvDtvsCrGR6m7WSWgzt9OI22J8
	VyY7fMmg6N7RRFV3jKuc64QEP8NLBqbMNLebT2CuWrQeOrg63AJpiyjGtwEqiWZrDIT/6a2uOl8
	r2Jb07wocFUGINItBYStOP2X1Ok9Pt2jUlp0rtxtK6bSGeZtwTVug19Gx8kohlZo77PRu2IDppY
	rld1pWDYGbJ6wJJR43J13grqxpoB8ML425vwQ2GlMVbeq1tl6RUJpVImsePncPJG6pcWw/foHHK
	fLq8jNclotmHKChocPvISNLcx7k3mFQpoN67M2RWVMmtGC1QOdbgENWN2tbcYpDlyObNzlSirhw
	+PDQts/saynXK0xfT1UWzCoP02adf93nTvvVwkL7ViPhExnqAj9ThpfjHRSeqQDvsg/i/hdPoKb
	wbk36/PA6OLZCE8oncNmqsEbnaZKyq9g3T8u/hDcI685XjbuUaZGlAWbQQoKHssz7Hu1hcwfBRB
	EfD49fS1e/Ovrq8aljRmb+2fbM1IBzdLu0ltfk+rjs/N+kwy2EQK3P
X-Received: by 2002:a05:6830:681c:b0:81f:6e05:c1aa with SMTP id 46e09a7af769-863159c5575mr4569187a34.18.1795202045739;
        Fri, 20 Nov 2026 11:14:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:56 -0700
Subject: [PATCH v9 6/9] dmaengine: dw-axi-dmac: retain descriptors until
 callbacks drain
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-6-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Wang YuWei <1973615295@qq.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

Termination frees every descriptor while a pending period callback can
still refer to one through vc->cyclic. An executing callback has already
cleared that pointer, but still receives a pointer to the descriptor's
tx_result and can use it after termination frees the descriptor.

An error interrupt can also move the cyclic descriptor to desc_completed
before termination. Looking only at the head of desc_issued therefore
does not cover every pending cyclic callback.

Use vchan_terminate_all() after stopping the channel to clear the pending
alias and move the collected descriptors to desc_terminated. The existing
synchronize callback drains the tasklet before reclaiming that list.
Descriptors already detached onto the tasklet's private completed list
remain owned by the tasklet. Repeated termination preserves the retired
list, including when called from a completion callback.

Descriptors that a client has prepared but not submitted remain available
for submission. Channel resource release still reclaims any left unused.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Reported-by: Wang YuWei <1973615295@qq.com>
Link: https://lore.kernel.org/r/tencent_C00D995A9F70206DFD1330DCB1222EEBCB07@qq.com/
Reported-by: Mitch Barnett <mitch@accuratesound.ca>
Link: https://lore.kernel.org/r/YT6PR01MB63707769A78186335441B06879D87F2@YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM/
Cc: Wang YuWei <1973615295@qq.com>
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 99b648d4ca76..2547f9596ae6 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1202,7 +1202,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	int ret;
-	LIST_HEAD(head);
 
 	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
 		bool enabled;
@@ -1219,7 +1218,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 		if (chan->direction == DMA_MEM_TO_DEV)
 			dw_axi_dma_set_byte_halfword(chan, false);
 
-		vchan_get_all_descriptors(&chan->vc, &head);
+		vchan_terminate_all(&chan->vc);
 
 		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 		chan->desc = NULL;
@@ -1234,8 +1233,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 		return ret;
 	}
 
-	vchan_dma_desc_free_list(&chan->vc, &head);
-
 	dev_vdbg(dmaengine_chan_dev(dchan), "terminated: %s\n", axi_chan_name(chan));
 
 	return 0;

-- 
2.53.0

