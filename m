Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371108;
	b=Qu4s7Q+hJAs3LaSdWgd6sgKvYrgrjYJNO+92z3MOb7APwSSDD41WAZVQpZ4Bf8r1BS7d
	 geGqJfnBBKv8oPSfzNcOqeXyJtdSo78OZbK/XKqwhgLvi3pSuCIyK9uKJIVivQhkOtI+O
	 PECfb7zOOMvTS4Y9l+rTZHPg/oTaDj8Iv9EVfOHK8m30WbWuwqCuze+RaSabsVpOYW3YK
	 AopQGlrrHdhpWJ6pd5h1S4Ng8bZkYymnL8Fp0ZVd1qhR3SQ1vwNd+5Op35+ZDxda66rWo
	 MiOCzgikRQaXrz7WOL+mrFF4umDXvP0uEkKmzVbbrGofNRLJ1bWzWDFVl+9ocIgY9VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BeVtOudt3OEvEUEKgjiMRbOe+We3cpRPoFjUKgGxA3o=;
	b=0PMS6ygWkTCAGMtSxPlB+Fyt1fitemGngUkmNR+Nz3PuExoZoxPAxLn6EGQCoK0ilgSO
	 +IlXBmG4gXYomxYL+OwLd7jAcOq4d7LdholYHZBO5RuOuFJtgfW2IeJAfMMLRkqioozdR
	 pYEymIbOpymd9yvk2a65MDjoKr5dFbuCKWwDdsuBH6Zjq5n4AiXsG8cxPhpu2DelZqsGw
	 Va2QK2RXXXFkdYiKx0M7mmDeZ5p7u9Q/eMJ487Pl1+600sQxUms47V0xGz3w3JgGhxt80
	 0Sen7JEovCsc6qtRt0m2pxM2ctlmZuv4uANh9aAz3S80/G8nX4yZkDzvnnQcwGqAVQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ShK6iGtX;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0302606A697
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0302606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ShK6iGtX
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5118deebcfso368826066b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371106; x=1795975906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeVtOudt3OEvEUEKgjiMRbOe+We3cpRPoFjUKgGxA3o=;
        b=ShK6iGtXSiPmvcot+l2qbeJRRfK4G/z+RMo/ky2dOzglRkhYNbEAsFcXnyzpX9Gsk5
         qjx8uAxWMS8u4jsAIQ8GIT29BOnb3xCXe9n63dQO57XEhA4jpbnFzr51tdaaoVwjO7yU
         pfnY3rapwejVrp5pq2DoFTIjl4HvQvnkJ2DmYlzh188S5FgC7gfSEPc5IHGUv1Z4Q1UB
         wkKYeZRpPS+VVyzdwB9cHI4nLdvrcumiFHx7JqFw+WPRJRErjcVH+9ioAhEqnGqvwCCT
         IStl/D5UvbXfwAMD0Bk5D4+ULo5P27PvDtl9hkttrgJz87efP4bJY087xtiCrCE353PY
         uYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371106; x=1795975906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeVtOudt3OEvEUEKgjiMRbOe+We3cpRPoFjUKgGxA3o=;
        b=rGrXAwQ/xc5Vn48Mfm9V+KBHLSgT0F37DCck8j48da60/xjTp/LeJjDdQKE5cDdJz2
         fKI2dtJj+PQpfO0DhZhQk/tUTFUxx5u6nEoFBb1CHKH0ovd2vXiXcVLBrU2uHCMK9Hq+
         z3ee7eptCKLkcd66Prw5RzVWVkFWv3JD66pwt5IpToKmaUdPVlNEqZXAtQSQyb3ZN/+J
         gtzFUDg4TAMWzy5esE7Mqj6bW+TLmHfNg7gLfgdclYXQdjGY5M/hu3Q32WZ1xJJbpcf5
         ZgkZnRJQ4/cLErUaVr2Ip4410+kVdrAjlIle/e1WU1rqx/5g9Lwyi4OcgOLopzOkxbw5
         bPfg==
X-Forwarded-Encrypted: i=1; AL+hErGI9U+xbE/HipILpbh5XMfevqYlYv8+uxkubMzK6xrIGz9vdyGXyhhcLrgxJ0C1JulI9v6dJqJQ5zaYe7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LEVm2TpRQecVZFsKA+sp4qK0JsrW5LFEieLDukkNGukPXJHGJ
	EzNIOfeQd7GfZOJEGN9NdQTDdXjKzLIajowAGlxTvQd7rGJ+oDs3XykxXxzwJIhLbA==
X-Gm-Gg: AZFdTZe4t2jWkrvP7zPJ1B1FnbtcUJshUrZLqdNGelEYRoVmMvZdDk0TP+LMsJQpVHH
	nSr1ApYT877IxE0xE0fSUJf05brbuV0npPXJlK0xTecep0IsmzQdg8mhxfqJy9HZ9ZLcALEyCiy
	5Mt2GRCzm0HQ2ujwmkJNSWHotxpVwViXQK0yojOrK/DGYlpKyuw1/iEFxhb9nxTD0FEd1u6DvEW
	J1xdQi1OVR6NSqEELiJutwrdGxx2HXPR/G2HtT+7dcIL+aSXec80NNXxrPG4lKZckvWmHMWNxnf
	p/aDxKyjoLNxOBvZVZtfxGXU6U4G3T7EE0QwnYlCeB8bjklmECNOoOI5BvVS9vvXGfSXXy8bowU
	cLOCsxXzbAq8KuUGv96e4H/52CIUjoRQETXZhc/1FDqlnlmmIuRLKIWgwnFp8GKbFYSwtqnUnq0
	oDxXFNfmJmbk7ZcnhPwDnPy+k24F345ASCHwMdqmp2AqKNCxG1TvthAMXcfCJiBP9Gq/qqIHnwV
	4poWohghDs9lkmeDcwls/BBSN+DyKtTpzxyzxFaW+oIo1PMA4qODVVChoUDh6IRH6IMtgV4H/1L
	ma3QiE4Dw5aWQGl5W8LP+/ZWYodnHWrDr379fcQyqUGQkNmHlU82k55NOCQpGduPABPZwM/cah5
	I7eAi4CreUddEaxPOSYoPDwSiQA9hf6QWKIPKDHFcRU18+O3c6swXlilCcZbg4J3IsqftSbPG/Z
	yhBhuM8omlP1yGOpTJxQGeAdiX8JquxfNy95mlPHdslZyM9rxTv3PNKBad+inaPxrlwi8mTtdLK
	VkbnUvwY95tegWFFFQNOtafrIp9ajdM8z0tA8SaSNUtRAdjCHaHDQUBV/QUWT4V7y11H+r0XbkW
	Kd+NQ1NRy/8Ic7GpRF17/FA7DFGU1K5Vni4wZyU7lhTXwR2wX1l3g3SVWMIPX2rHY4CVb7kl
X-Received: by 2002:a17:907:6091:b0:c51:51f7:c9e3 with SMTP id a640c23a62f3a-c5151f7fd77mr472909966b.34.1795371106268;
        Sun, 22 Nov 2026 10:11:46 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:45 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 3/9] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Sun, 22 Nov 2026 19:11:39 +0100
Message-ID: <20261122181145.1015729-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
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

Nothing shows ar->dp.num_tx_pending, the MSDUs the hardware has not
completed. Print it per radio in soc_dp_stats. Divided into the pending
airtime in a station's aql file, it gives the airtime AQL charges per
MSDU.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb9..ffe1f466aefb6 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -714,6 +714,16 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&soc_stats->tx_err.misc_fail));
 
+	/* Descriptors the hardware has not completed. */
+	len += scnprintf(buf + len, size - len, "\nPending Tx MSDUs:\n");
+	for (i = 0; i < ab->num_radios; i++) {
+		struct ath11k *ar = ab->pdevs[i].ar;
+
+		if (ar)
+			len += scnprintf(buf + len, size - len, "radio%d: %d\n",
+					 i, atomic_read(&ar->dp.num_tx_pending));
+	}
+
 	len += ath11k_debugfs_dump_soc_ring_bp_stats(ab, buf + len, size - len);
 
 	if (len > size)
-- 
2.53.0

