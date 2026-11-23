Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441308;
	b=iNAKSkGTLT7+bUAN0P8cPT1H+f8XS+xDuWOtX8NLIh+f6LEGlb6WHQIJi65QbP2BscmG
	 ZdJ3UlRMm8gikQffdT6ds1e+jTkg6e6QopwBdOTmrOcWAR8Ld6PSUfxfWO9LuoS3rQomp
	 GqiOm9XVM4LBA/sTRNiWG9WEvbRf8fAIZZf8kBcGKZCH9I3ZpBgjgarxA6V4jLnMWb66c
	 3p3NmNFqopcYtj1+UGcvZjm3BeVk5v1zSs34BWz95I/O1v7Ja+K6+d74b4D+9XaAUcgL+
	 AA5YZ0RZOCpamsqEHYxrioKARjwI/j8LpDbPjqwzkgaghggpULKLVcVOYWxO3noJtmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nwwBBeDfE3bOmk9i9h8bqwu9NkavUmtOUddaayOfYs8=;
	b=TipiC/bsFa/BUCT96BuCHnGKyfkAHTg9ujgNKvsDNxP+bCE03Otq4PE0BaNxGlRhbB47
	 yxwOfv22xKM+jEZL1c4lmT38PyhHHfLl45qT1TYQxqEM2nn7dtp1IjEmJaM2Fh/H8bBiS
	 0Du1h6MsjPTS0f5XQeoQ89zL0xyFK42zgPXzm1r/Q1pWQDBrzwqFMDm4HRTd8IUzSlBkP
	 wozYt50FDegNLtUMKGUxg2iO+IU4C1cQT0XS7N3itGu9DUx88YkM9HTLDeqr6tkH+F2bF
	 9ePqYD88dlqBb0V4gYscMDdJmuj+sM7EGO/rM0qIk2jfSxwpSCGc+lOMZ8a4n69cYZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=fVmopC5A;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C09B606B51A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C09B606B51A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=fVmopC5A
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso4377788a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441307; x=1796046107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwwBBeDfE3bOmk9i9h8bqwu9NkavUmtOUddaayOfYs8=;
        b=fVmopC5Azv7G2zqhIkMkG48pulMJ8nqmwqWT8jou9lPde0nGHp+eKYvDALdohtChZz
         /+jUzZe+/Hjh9+F1OVnCJfjglbpb6Z8YaP7v3VTTkDZdiAGXYCwB2UcCIU+3S5y+B5+6
         bQn5rsWQLq3anrPZ8EWMKlm846VCCGLVTrzRdLZk902bGjNuPmNIg5JF4rx56YB8bemh
         a0wz2+S+paEVRLyGrsdXUNjRPH7VJlWBnuxXxm6CxciV9C5vX0BYJRk9YQb+7LS/kZ5k
         GTxANncZECW4Rde+hpp76PjixjaCIkz6frcjxAkY0Syx0EzfhTmeuxzBfY9ITNoj91X5
         bOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441307; x=1796046107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwwBBeDfE3bOmk9i9h8bqwu9NkavUmtOUddaayOfYs8=;
        b=NqcD3J5FpkjRgMbp2+59gbmGiUp/GF1271Md5bVd7RXP9WRWCOHzlboQ0/v7uA/6yP
         EohGkfAeUfuVwIE+MHFGBIYeT8h1pzwttstex3TsuiBzMvhwqpOKkItNVKkuP0jFA9cO
         z48Wk97kKxJUlPH4/U4JhVkx/FlcHCg1UpkuIaxvem1xFmMIccYYSRGm5g1kw7tSjR3d
         /qyDXvfeEyVkHWz0QORpamqyWDrAw+otkPt7aKaMviaVHxp91w0e5Hb3Nbc5NAoSOXmL
         UuNtehR9+CaBgFRIJH+klPoD8bqjyKqv0hyaxJTxgvb97rA8OFRnBN3lb6Zrd3kkZEVH
         zBUg==
X-Forwarded-Encrypted: i=1; AL+hErEIFKU3Z9gAVfK2s6y8pDL0o1DhNUH/nvpDzaBvy+1b6rIRhPjTDK3ug6su+cX/dgDY4IcNGy3FwJwv6Z4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lw+Nx2qHg7s+IDQR6mtAwbptkU067TWbjbDElrbRggyidN9ex
	Txab3FJdevYX8krlZOhWJ2rr3VCoK9m3HHvTOa2Ns1cT9P+N/nt9gl6vYiOABApkuA==
X-Gm-Gg: AZFdTZePBG2Z+NsE1YFXAZ21x3F84t5nINm0Nkxbu31IoxeQSKnrCi3Bt7S/+UZ4XMg
	VmsLLLgZOXG60KAQtAKnZM+dbDm502qIPvaDDjqoVbsYE+MAaN+vHPmzKbPSzeBsyhB2xn1y/hr
	VGSmwQgM3PAJ2MespNXTCTas1hjk+rj9ZKMwJ2EXnqgGF8RJwesjzglltPeXzUpcZSYfJEI5Zpc
	royGutJYoMBKZ8zPeZKu6ySJWodH2SAjphwI7l1UVyI9OKvmB3dtuPqwtLV93YuocpmiiFYsj0d
	sYy0a1aMOEDE1586MrW/gXUTmmJtQvtGzkuG7iVTEF5atCvuU3SLr1xmb2IICTZEBT18g+tE2si
	I1CDo75oJD24xqyoRbQtccWeOP8/6VJflqRsdjLsm4iwci2dFkJ3abGXoXx9aG+hw9DlgEDcj8K
	81J7t5x6yEwJXOYo+rdqI4QxdBLiD9EHUW5u2miEuX/Tb6TNwn7VmKcAy/l7I2hRCLqI13u1qq4
	NrSXjn185p5cePAvrn8R1hq65rlGf7UGRAFuFfi+8oHeK6ISJPsMnDpmJTSCn1E4XDLp/eL5BxW
	2VhqZwcR7N7L84PI5367IqBZJ/vKAc89PAvvW/+Skb0mPNrn0r8wwet4jl/+xkLMOHyIpeLounG
	j24aYogB81Y2C2ZTrCXkPCeDm0K2+5PkQQYeA8w2GbA2uDST0Z6IGRK70mjE1t0zZmx5j+KwxBL
	ZJrqzjXLvbRiVZKLBtXFNfIBskJNRnANNMKGtznAC0MSuk371h9BYw8AhzQ/PWz28wgWGbCl+b0
	RZZxNMaaK/MEq0b07aLOBeFrGjVMbCqxaplVVSWAOloCVWWsox5q6a8GrfsLNyRXdp/86TAplDV
	AActS8jYHVI0qAEI1GtE828Xi4XBk67I9vStUGGRjffbAs8g1LvdG4+/ZrvPE/+evm26y4etgjY
	nI9tGjen74rM+PgPcSHc=
X-Received: by 2002:a05:6402:13d2:b0:6b7:e902:5e23 with SMTP id 4fb4d7f45d1cf-6ba37ea6d00mr8878197a12.33.1795441306709;
        Mon, 23 Nov 2026 05:41:46 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:46 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 08/10] wifi: ath11k: take the refill buffer lock without a second BH disable
Date: Mon, 23 Nov 2026 14:41:35 +0100
Message-ID: <20261123134137.718575-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
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

The REO reap and the refill take the buffer table lock of the refill
ring once per frame with spin_lock_bh(), inside their hold of the ring
lock, which they take with spin_lock_bh() and which keeps bottom halves
off for the whole loop. Each unlock then goes through
__local_bh_enable_ip() for nothing: in a profile of bridged uplink at
900 Mbit/s (IPQ8074, one run) the instruction after that call in
ath11k_dp_rxbufs_replenish() takes 0.43 % of all samples and the one in
ath11k_dp_process_rx() 0.13 %, and __local_bh_enable_ip() itself 1.23 %
from all its callers.

Take the table lock with spin_lock() in these two loops and in the
refill's error path, which all run under the ring lock. The other holders
of the table lock still disable bottom halves themselves, and none takes
it from hard interrupt context.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index ff09463d829f..dd5bc35581f7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -513,9 +513,10 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 				goto fail_free_skb;
 		}
 
-		spin_lock_bh(&rx_ring->bufs_lock);
+		/* bottom halves are off with the ring lock */
+		spin_lock(&rx_ring->bufs_lock);
 		buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skb);
-		spin_unlock_bh(&rx_ring->bufs_lock);
+		spin_unlock(&rx_ring->bufs_lock);
 		if (buf_id <= 0)
 			goto fail_dma_unmap;
 
@@ -540,9 +541,9 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 
 fail_idr_remove:
-	spin_lock_bh(&rx_ring->bufs_lock);
+	spin_lock(&rx_ring->bufs_lock);
 	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
-	spin_unlock_bh(&rx_ring->bufs_lock);
+	spin_unlock(&rx_ring->bufs_lock);
 fail_dma_unmap:
 	if (!rx_ring->page_pool)
 		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
@@ -3071,17 +3072,18 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		ar = ab->pdevs[mac_id].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
-		spin_lock_bh(&rx_ring->bufs_lock);
+		/* bottom halves are off with the ring lock */
+		spin_lock(&rx_ring->bufs_lock);
 		msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "frame rx with invalid buf_id %d\n",
 				    buf_id);
-			spin_unlock_bh(&rx_ring->bufs_lock);
+			spin_unlock(&rx_ring->bufs_lock);
 			continue;
 		}
 
 		ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
-		spin_unlock_bh(&rx_ring->bufs_lock);
+		spin_unlock(&rx_ring->bufs_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
 		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
-- 
2.53.0

