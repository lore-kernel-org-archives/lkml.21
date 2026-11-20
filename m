Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139797;
	b=mStPN3Bpd/Z5HlpjX2caIL8yk8/JDM4C5XrusSWHhc/x9mfNOXt+qQu95sY5tOrENQ62
	 9dEP/T9dNGvsWPUL4pbchsvpPmb9lMVHRvp5RS3CQWd+y4ekU/6aoanzv9Oci/SQa3lZw
	 Mw9b5MatqmcC5t5Fx0J/ynlldnkDn0utN6u7kUnh6K5wM6M/nwrU9cT152hsgGb8+BMBA
	 ijbeOaAfMsSLb8EmfibbDoTIJUEoqS6kagrIY9qmNPnczuyh6673seOin7xPNNrfe+wQD
	 hyLuKkPDy9eOwNAlUMb5GLx7HVX+KvEuwLkEx8maVKl1S/PuddJlyO9sSu4PwoL/1iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0nJf8L3tIJBmX+R7S/jUXKB76L6mBngZYfpLb90wRRE=;
	b=mAMsZHKe/b4zejlGQLy8xMP/5YlnjN3sGZJOUK2yYdB3xYnF0XWfWRdyG3SnhMGcI4Vg
	 gQCObKUwnqWBLtWATacAysqHuQQNatyqrlaHzsNR9NJTFHr5ol26vueEOHWAdE9xi1qV5
	 LV81XXYyzEhJCPRZJy8G4zVKP3tIF44KcfBzk/4hFB/dvbCZNXYImWxS2iHW9PZVFScEc
	 52k9W0o6v8Din0igYOsr2KnCTfnfiBwLNwMHzc+exJcWwIUOlGMyBQGroa69lKQlgz6gD
	 DkSnIYHdnIOsKFxR5zqyF+mFQD1GqWyqBu70atCD4lFHSKPekYlnD+jrfJHchv144+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rb9kfD6Y;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E73606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E73606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rb9kfD6Y
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso378017a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139797; x=1795744597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nJf8L3tIJBmX+R7S/jUXKB76L6mBngZYfpLb90wRRE=;
        b=Rb9kfD6YIfUAjjigDfbnqPUIKwU28FWkocDOdKnz97ISOHW9jZus+Er5Li8j/v0iod
         V1Q1c6RII03/85lPwZYQ3FdKaMb8luL8vV7P6AtV4KjmekEokXQLVRi67gTtVRxs686W
         KYYjoQgvYVio9vBd/XryY9GCIDil4Ph5V1EYW30Z6l9819TGD68PPN734nU4c6w6c/Xv
         zXyhwHIGsraMnrAb7Zpjl0ApaYA+AHL2TKJwqVPJC+PdrHV3JR5km0KaDmu+rx1oJrr/
         XgUXSC2jtrwrAufRhYlXGilAjgQE5lDb+qQM/e7LyJ/00ddRO5p8+uAOagCQp0MOIiu2
         2nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139797; x=1795744597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nJf8L3tIJBmX+R7S/jUXKB76L6mBngZYfpLb90wRRE=;
        b=EgRl5PRcT6jUl4LUq8Fv1FXmYL79hTEm1SdFPv7D3f+WtDLZ3HiYfmR45ALDuRpPiZ
         jyMR/f7EDjMUeJytdznlihszzmra2aqGEY+1un2z84uQYdZdjjBYqv37NwR/pLc+7AjZ
         YHR6Jfg313SKZ21PtNXLeDP0f+ZLadbi3aJdN14aWqB7qBwpCOsJoKgwp5HLaCv8OO63
         kKTDfNuCQiTBTMF9lz76eHe4Us3QFrZjozCTo7MWBmjvCeJvRPLfiDMth8+P+mB0/K0r
         krWi6xT0znSkju3xumncxsGB2PvMxb5FM7kF2vD0gn9KNCCl/1adw+eg0ps4BTwAQSbc
         JENw==
X-Forwarded-Encrypted: i=1; AL+hErGW+sZLkHRchqNFRsSpIfa8KNWsBs7SUMMMrfT77rdK4f3xrslRAbbqsG5buBi+dR1g0NA7mWXdj/cKx7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QBDN54Z5Q7Eo7XZCqVWmm9ExPI6KAV+fq6ZTgPA9Gc4Njjl7I
	ISl/50FTYyDOGLMz0yznzu/7uY85Y9QSzQb0CraxHXAJSvREyi5aWphz
X-Gm-Gg: AZFdTZcX7TxZXgBOGWsm35JfHszWxfHb9ujBzITM8pUFdZE3CxFDPdaeHn5Rc0YLaMY
	gLm+ZBzROFGqgR830Dmj9c+RwvE9t8YZ/eyaZvNFyp2sBTg3Eie/GhLpxUjMG9bDK9/pEnGV6Gg
	ZSOW65KTJMJ1Sif1F/w7t6AELCCElbwh7rxHOL/avhbUrDfpYCbzClG29/rkrb+FPZwwx8bVD2+
	DEEz8L+H00kiFU8E+ae+hNSZfswXf0MwpbBP3uYOvDi+lwyQYx+bDcnFwgNcRx/ZMcqXmGDzqtD
	safaN31hWLmvbTTRbXMI7LKpJZW9QsoBtJiG0Ee68gbZizGxdLDXt/X/z3giZspQGG+tlLJMCS5
	5+dnQYNIL9+N5nnEXKwEZ8SdTDrpAWwKFcL+bNZ/wNYiCKxLE5TYPlFQllQ7qewJwMBY0d4Qjx0
	Y8QBbTul3rIyNdjX17MF/y09966+5k2Vrl1zO1KSQNgEcjrYe3SIsNuJIgiK59qbzuQlnvaHr/e
	yXHwOVFZcNwRT6nu2Ur562yL5oIKNkJoyNG4bk8NvWZvJpSK9Y8RZ9uVAMobWO0oSXOuQQAEfo3
	e5AMgNm4EhXOmOBN+5rOWqInTU2p/zVxWRG2oF8xOSkc0+t3X4g=
X-Received: by 2002:a17:90b:3f43:b0:3b4:1621:ba74 with SMTP id 98e67ed59e1d1-3b41c8fe3a5mr1269349a91.17.1795139796615;
        Thu, 19 Nov 2026 17:56:36 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:36 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v7 5/6] net: wwan: t7xx: complete NAPI on the not-started RX poll early return
Date: Fri, 20 Nov 2026 09:55:55 +0800
Message-ID: <20261120015556.131547-6-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120015556.131547-1-tim770802@gmail.com>
References: <20261120015556.131547-1-tim770802@gmail.com>
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

When the RX queue is not started, t7xx_dpmaif_napi_rx_poll() returns 0
without calling napi_complete_done(). A poll that returns less than the
budget must complete the NAPI itself, so NAPI_STATE_SCHED stays set:
every later napi_schedule() from t7xx_dpmaif_irq_rx_done() is a no-op
and leaks the runtime PM reference it just took, no further RX poll
runs on that queue, and a later napi_synchronize() in
t7xx_ccmni_disable_napi() does not return.

This early return is taken after t7xx_dpmaif_rx_stop() clears
que_started, for example on the modem exception path.

Call napi_complete_done() before returning.

Fixes: 5545b7b9f294 ("net: wwan: t7xx: Add NAPI support")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index 77770869d575..a7d6289415b1 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -848,6 +848,7 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 		atomic_set(&rxq->rx_processing, 0);
 		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
 		dev_err(rxq->dpmaif_ctrl->dev, "Work RXQ: %d has not been started\n", rxq->index);
+		napi_complete_done(napi, work_done);
 		return work_done;
 	}
 
-- 
2.43.0

