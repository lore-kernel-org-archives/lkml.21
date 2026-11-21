Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302476;
	b=YMFLKsgpDgBp9QjKN3fPLAwyi8w7l9RQV95VVAsoyHnCMLs64wgNGkOFNCeBCLEefZld
	 9zZlE1BuDja+J9dYeum//F5L5kLStI8WJnfmiB4UXZ3L77ZPGW2V/rQqfrk2eLMZ8PyuQ
	 UtY5xHcv2yTaazbEcP4o3cCONKltcz+0xKAnphxiL/jeMr2frHmZYD4+JaNnWwJOBAn+l
	 7wsV7lDA8ZFma2d53gqnKrZ5g9zmWFeXKNUKiLsK1VLd3KjqBLN0g7b3PqS0WhPi9qepO
	 3zASg2A9YEva0YZlig5i9ehGPgNaWfc4vLZbzZkpx88K0N23I3t2OYJYcAxJKtkmLVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s88wbEfs1LyrsI8Y5Ny0Pr/96EyRBnxWAeHAPxpjPjY=;
	b=cx0+7q9voX1iG0Z+Ym2ZZf8Vvg+JVqPGwcdyhZh3oy8ilp/THUeO1ZtjuPqQ6SF6WOmY
	 5KHOTrtNiJpvjEEUIJZ0N0QUmdZ/RuAivt08GqDbFYJAVaHCcyq03t1vrmBxQrwPplnr3
	 C32L4g87r53/lFfPxDl8VpQeRvGKwDvar04S4LIstKRlD/xAvDaOP/5vDQCQlrkBf4lSe
	 LnYRcUI/EvQ2kJI5GATN+mjhOLrxTuppfAerkTRmHHxjq9xX9m9CuHSgvyIwja+cpodfg
	 2J1iSI1aj5/iOwwtHJ1inNeUzmHt831l1LmW+cpaJWBurZ207QtQSXb+l9cNZmqRY/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=UXsXM8VU;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F39460A3803
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F39460A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=UXsXM8VU
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so337990766b.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302474; x=1795907274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s88wbEfs1LyrsI8Y5Ny0Pr/96EyRBnxWAeHAPxpjPjY=;
        b=UXsXM8VUxKGW99RINHuFf7j8UKpu+ylu5fmYvOWf8Api27Hx8/jxc3tK0a268TsKTv
         62N3C6BGhJBREMSW5Mc22tx58eaeWDD6YJc+e/iO/u1SoGqF0825XqGBOIirAyCPZssB
         JxgxQfdB+0gReyZkQmPM6oY+XLU8Pr3iIpGfKxdgaKWnTkGHUI2MZabNGFQCgDK83Ovx
         1cAMenaxZaMx45dQ9xGQ+3XTHk/bUo+onKlscg0oV7jE0PvGo4HBPAGCfXwMLTjsWnYv
         tVP1CAQqwNT1afmJXpXQXJTcyr1jLVh6nI+zLUdgmXXU9uZ2cOfGBcUADaj71SZt9xb2
         w9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302474; x=1795907274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s88wbEfs1LyrsI8Y5Ny0Pr/96EyRBnxWAeHAPxpjPjY=;
        b=aa1v8AP+3/9eBl6hGKaxpnbazujzeec1qzdA5UY340/rHb6xzJrt5rwMZ/5LPqVnnI
         IWTM3FfusTkNBXSlRSqqG82RupyEBaT4/NXzIMuNKhrPSH7+ZpDjkmG97XRzOT1DN+Qx
         HUxR4hUp2Ta4FW3s8pUIsh5rHh8cXQZvQNmVxbELz8EbLrBTU1na93AHCletqR+vGfg7
         TYetVc1plH+P3U6Ga4tzsKE4VjWq8XXpjFE2lBwwfuDX1qC0QoaJVjleSYn5iFyNO9Gj
         bMpadAUD3BgiB1TsHZ6jPIZswG+DFlIYfne7TPqdU5V3qlbQrgxSv3TAvOq05gs7JveG
         Uv+A==
X-Forwarded-Encrypted: i=1; AL+hErGbDrE5Iw0B/axVsbFsRMO7gCvnNb/3FQ4MtaepYSn/yzehixzo9/U+xRoCnnAmiKUsG0lxPNTxncWXb4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TpkYEiiGtzHVrsbsPKYdLaymMRbH3CFcYm4UGjiPY3FhD1lFS
	6NUnkcfuT2MNx2RpQBFK9fz2Ot+07K4K2s6qWGAKBW63nS8XBP754DWyLOCOrvo1ng==
X-Gm-Gg: AZFdTZdHtQ3tgaAckB9Z7qTxs6KdI/7RXsc2dgjXwOtlu6NU33kX43dTxLyoaxb1qW8
	2ydUpD12JWIUi1/5EQMCJkKSejE+QPYxmCUw3ERzuk3hLsn2sHam6yUYhXoyWxEyimsKT1Za93O
	VkYcgZsv9Lmc9QFMnx5tIznFDSxCGN6Iafa2lXd5SrVtLB4ZK8kNWK0IBgPKt3dNZsUKNOW1yUQ
	n10EhEDSvb1joIpDdznptZCdrDCJZlIWcmGT8HSqfVEHSOwfDw2Sdh1VrjRX4yHT4wCJeovuQE+
	eZWiZcR/JMFIt4PW7BahR7YSnh1zleNXfIDVtoCXzfbiAwQSCM9dMRRpTlXORiEBTpS/Og5Ii7Y
	UP5+xBigFDHbEspZEa5D8xtYfRpNTrrshN5XEnF5RU4vI2w7U8I4NreW9Cy5w2V4piAstneBCdx
	vnbbyx4U10T34Ivk8ikTPdVQy1/1CbkHeLu4DCzagdpSQqVVj6yR50QNdgANRPniSssv3N5f2Gn
	Yh79Md+ZEzxmN/9PhSjVPrmEqLzusp4VgNs4XhpEH8tHRiRWCyE4MdAIR0mBmH+AmPYiJ8Eo0jl
	sWMVQZNl1ADKooDLgKt6WCIQG9pVE7AxF9ZgPtchEE8Ah5LAgsc9dCjZ2h4MYa/J7GzyuT3P0n/
	38z2WH1O8ajMfe8pAz/ATX9Sz1/3zUTbNsJHGy0EaGMd150RHkVKyf/k/wkdOUdr5D9XQozrSJB
	RoqHvkYQwpwKPJVII0vUYUDZTnSnDcQyS4NmNhjFKEUUm29AwqoogeDk15EVIek6LNQDiaLDZpJ
	M9K1Pq46GlaKkcw98Ir5ux4lpeo5S4AU8P1DI0slFv0B7bKK436pakMOpbbAAPsTFVnXLptf5kp
	aphTnToaYwlOgZWh0/MDG1NtxpZqtUgYA+TWmLLFD4ddRg1RsuwE/1DmUVjQ7q7zoyJwHzcAF28
	=
X-Received: by 2002:a17:906:f5a9:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c513aadb0femr716344166b.44.1795302473838;
        Sat, 21 Nov 2026 15:07:53 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:53 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 11/13] wifi: ath11k: free the queued QMI events when the QMI service is torn down
Date: Sun, 22 Nov 2026 00:07:29 +0100
Message-ID: <20261121230731.1206043-12-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
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

ath11k_qmi_deinit_service() releases the QMI handle, cancels the event
work and destroys its workqueue, but frees no event still on
qmi->event_list. Releasing the handle reports the exit of every server
it knew, so ath11k_qmi_ops_del_server() queues a SERVER_EXIT event there
on every removal with a known server, and the event work stops early
once ATH11K_FLAG_UNREGISTERING is set and leaves the rest of the list.
These events are leaked.

Free the events left on the list once the handle is released and the
work is cancelled, when nothing can add or take one any more.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/qmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 3ce7c4e5c51c..4a3837958e01 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3361,9 +3361,18 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 
 void ath11k_qmi_deinit_service(struct ath11k_base *ab)
 {
+	struct ath11k_qmi_driver_event *event, *tmp;
+
 	qmi_handle_release(&ab->qmi.handle);
 	cancel_work_sync(&ab->qmi.event_work);
 	destroy_workqueue(ab->qmi.event_wq);
+
+	/* The handle is released and the work gone: free what is left */
+	list_for_each_entry_safe(event, tmp, &ab->qmi.event_list, list) {
+		list_del(&event->list);
+		kfree(event);
+	}
+
 	ath11k_qmi_m3_free(ab);
 	ath11k_qmi_free_target_mem_chunk(ab);
 }
-- 
2.53.0

