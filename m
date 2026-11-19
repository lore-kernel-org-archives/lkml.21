Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104115;
	b=3c2k+JmXng/T8jHDABm7T3tFbJFxeNpabLPnlhR9DOTXex83y0x2FyOuDYITNAeewdsx
	 mIOtRKXHJNiOBR1GzGcXsNPXsQQEpMZAuTMfLcQVttCJ8H0itMwsb6M0jMAnJ7/hTUkO+
	 0UCMU2adk6nTTB2e1ShmcAZK9hxFIOkW7TGrzxV9LCoC9EM+kajv9jmw8jUyXav6LClUB
	 F/W9hT6Mr40AhdxWSEszenOMOZ5DQOb3qxg5VqGrE3iGzBWgqT0sqSOexTsX4EMUDXpWR
	 cFBLFmnBzspWtDSX1i7WQA1DCgsJmpqNEQbRzDzW4R22KAEVYp9P1IS3u/7mme+l4Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mYHbWr2Lm9koLQ90cthmFtpM1NIs5yfnk09mZGH6U0A=;
	b=PIhfaccYd7qPm3Qgmg/omRCE51v/yvZMaNBpd6e2/RYN8cu7UoL8DldIToNz05C8dMoK
	 LJXII0n79k1cwCrjoUEIpYApCKGdPJ52v6+NaJQr+MeRw7xNPVRwWrR+wj1D7F9qSOTPo
	 WAm4VTd3fs+hCiB77TjiaikGeZMvY3DFNH9l4MrEfYVp7UPyEQ5K94Cu7+rCuJcoiD42V
	 p09iPhE69EDA0UTjK5NvgEuco6eLferb76nnyj5t4OjY5fkq6ULr86/qEcY0QXen/m/Ub
	 HrC8Hf3o+ufVvPTx4elHL7BI9dRXs+ImFV/VN4AR1akkguJuBrf53bzfSae/V6nm6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzEEcQnO;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAC060A3808
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAC060A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzEEcQnO
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b335eeb340so21738197b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104115; x=1795708915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYHbWr2Lm9koLQ90cthmFtpM1NIs5yfnk09mZGH6U0A=;
        b=HzEEcQnOI31sexECRROkUGPEd4VFZeHrnhrS1/ASuq+7bKJ9WQfd9w/kiUwOlycBsg
         wJdkJYzZ3tHSASmimq882ku6AewZUZFAqAYCBYPuY50exnlqlDsXv7BWngotcbdNeY//
         XiD5uFBC2q4FbfuhSW7fLBCfl8wnIJI6BqZGeHJDpidp6J9KSlhBcs9i9/35Qk+tMQWQ
         kLI+tJhyuA2jdifpcJLJYFzFPY6GuJumc4wvNy9IInlS/0ERr5Kc3fi5xBxua01/ogvr
         ZGPi3nj17R//hagWaXpS390EdUytkSh17ylN/cSm+ARmwR42YUNcLH63mRoX/RGu6DHW
         EGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104115; x=1795708915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYHbWr2Lm9koLQ90cthmFtpM1NIs5yfnk09mZGH6U0A=;
        b=12afbaWhs8WfIHdHTsU9r80PftUGK5RcswJ7JjSfXt3W8dsz6Vk9WYXVX9hyOSiQNW
         Bx9Whop2NT7E6Igmhbi1wCCnHaGGoFlYNW8Q//91HqmAQkX/wW3dHTr+A2NJ4JPrJ7EN
         tuYfAXvsgXv++RuvMG8kiVEjONzNsL28sAI0tyJiL4rw8t5seKzJQCu2+Yfw8Avb9psn
         KAL8ofKz/yvYATp8l6X/GGje845k2347DeNhcfh/HtHgXokXX+cMIK1Ur7b4w4kl00vq
         mMEQoRQ1+7m3OF/ccQ8+wGNKNCLq62P/4/M7O7N0dMHUTTigPHORI39/rY803+7HKW/V
         Pqdw==
X-Forwarded-Encrypted: i=1; AL+hErEB/mosOinrjEmZU0lxw7F9UcxMvPn5lmRj0W+VlEvgIto1AwplcCVaeb+xphgE/Uee0MEqRx+RfVZWD84=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h4049W9tjXWHJ+1UdNfv52UwexbzQfjCX+KyQ+fObzHTcwV5j
	nhaf+bh8aoDCSEM6cfiKl09PYlS4tCpSQnUcKoszkzBOYvMDtuP/U6B8
X-Gm-Gg: AZFdTZcCHP3DlmD33+43vCxcErrozFXmBe/rBgIv70bGU9QLAEVoIWbSw8sOGV06bBJ
	QGxwKyat01YpjrxsOBDgFo5f4gkERGNYgAH+5NLDaPtcQfPQhbxfQyBTZw7puJXWpU5dLM113XR
	JEyGhHqLpp2M+OMWSet0ggoJKTdXJ1LHn6fJh3O70/dA9RY03kwP9u9AZ6GeoSGkoewYEVQ7k2w
	DIZPrA0udROT7cNlrxovFUmYGQr9aT8zpgpgy7KNLrKOepqFpIuP/ICfWSPdtYItKijW0uF2Oo3
	YCJVNDSj4ViBHkPEvQoSkIxWbT9g/oqL0RfCFzgC28hBZLMB1qfIFi6D1wOnL2zbiczSJV3Nx23
	nR4aYlxMPZbqvrvGXWzl8QiXMNn2LhJnfz9V7Jt3XSe935Yu5cVvm4+loUvg9nO1UD8YuufEQe7
	FEHkTl+jD4xSga8iSTVJlDwh9zs/4GQ8ZC+AS8axmfx0EaudOqwdv6OIMFYBiAJDWms02rdOK2/
	jYpwGKGsmLDIAP1+hJyBwzsZeVF1sTsZLNJQ5ZPeEtRYhEDWGjDS8DPRL+WOfeaWJ9D211oad3N
	onyCGxEpvnaI/itG2Ddg5X3Zu5B3VA3k5JNJgJM4qfsKt3rHCliRIs336MjWX47j5Rv+WyCI+Fi
	LTO0Vbu5Ah9cS1S7wGufsruF/t8SzBieVTgDwu17zkKfx5J0Io/CfbQEUX/JY6SyQ4cVXw8cRJ8
	eGAjT+jCb+3xVfgG8V7mnuGj9Gwgj38r/ZYhe29Ajgw8VYrTvN7KIaY2p5L+NNfelp3Alsnodd
X-Received: by 2002:a05:690c:650b:b0:8b3:2d65:2c83 with SMTP id 00721157ae682-8b520435671mr866647b3.17.1795104114474;
        Thu, 19 Nov 2026 08:01:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:01 -0700
Subject: [PATCH v8 6/9] dmaengine: dw-axi-dmac: retain descriptors until
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-6-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
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

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Reported-by: Wang YuWei <1973615295@qq.com>
Link: https://lore.kernel.org/r/tencent_C00D995A9F70206DFD1330DCB1222EEBCB07@qq.com/
Reported-by: Mitch Barnett <mitch@accuratesound.ca>
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

