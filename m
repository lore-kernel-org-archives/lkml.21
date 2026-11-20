Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202053;
	b=ZkjeouGoODWvLK50YFdYQH/sUttC5Obg+gZbCG9CTInfo2PfTfao0QZUcfZGboIQ+Hk6
	 EqmwrExKUqFpqw/lFV0k162rmAgBEoKnGUQDh1Uqy2Shhg8sbdyr88PtNPr/mMrvKHrQo
	 ky6JHpq0lX+v0sHSJZbRqbbbBegA+D+PAhstLNUFyJsotDHJahPPBHK5lHLTyPRAFvbH0
	 Nb9sorluyfcidLpMkSShfqf7+t8sUu/gm9EofMWI/0QdP9npeLd2LRBmA/1zS+aidqfuV
	 WWMoW8TRMyAq2Wc51FpvDV0ij6ef8eHmcOM6R3zk97+KlQ/kQe8Ttkkd3UayGvVIpKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kH04HZ+g7FuN8rIrCoSeymODfFw+CjKgbXOdba7zXjQ=;
	b=5USDluHhaxxVoRod5l1qPKCsoEGQXOEmiGXVDsQDvhCOWYoDDZotxGXYg3COaahCJm96
	 QV+fFBZAA1GQK2DfzMcQo05h54O/q1YMXHArsImPiaMuv6d0hwK7gIBAj68QQgwq+HvJg
	 Z+zmqcCcx/Jz/CdklLBVQUmsFFHGFu6PZBE/OOlRQtUsLDBJzMOMBDFCWSpDBMjApk47z
	 VdQO7jYG4KYD+HXF1w5kdJ3ovii5WCkRP4ckvEG5Rl4q3EzdSI0KCqazvCkJoM8Y3P69S
	 jmlaYnoMtlV9qNr3/9LcjsV37AmMIvmtUIQUpWZTWpVj4M+uIt8pH8852p4Qpo4AxZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7vfW7+8;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E338960A262E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E338960A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7vfW7+8
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8451a619da7so821091a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202044; x=1795806844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kH04HZ+g7FuN8rIrCoSeymODfFw+CjKgbXOdba7zXjQ=;
        b=C7vfW7+8ov6CR4LH5T798HdG63VmH7oZLjAxE8SMw6Hn7Whr1rXRIwFQsCEiXN2BDm
         pQ63JuuLR3D/sGewSyW7SB6MrEtkjNknnNvPjT3LsSQuGr1U5yJE2Ti5o3f+Sxo2Y1xb
         5vJjr1/k7ih/y+I30ute24tGbiUGOs2QElFq0PtFXwCmGPEyCTxz81tx9KIBScTRR4oj
         ES059hqxcOH8e7BiZjvImBWPOA2w1QJ0U02fC3zsUnTbrrlumg4k1JTCBvu+9K4ItOYc
         qw0A5lIv74B6fBzxG0LurIPVSeLuj6cYWJpd4yiH82q0k653qtWL95Zy/Zm6Q6ZNCCJJ
         BXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202044; x=1795806844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kH04HZ+g7FuN8rIrCoSeymODfFw+CjKgbXOdba7zXjQ=;
        b=a/Kd2JjDcy+g1fe44g5Skbk5+0/qe0aDIjcbITFOvQELpQ8lXjMZ2/zFggPiZ6MAwx
         bMz1VEndEP1mSHZFTSUQV2TiMKaTLKVTXp0hmUS+XbNROPkQxVFZiOPGDmkjyfVYZ6wh
         aXyK6Xt7RYP4vByWyf1WcL8hhrtYs7ZwtacPj6EnZgpeTJzbX8hSYrP1ZKbJs3hUJ4e1
         ndn8NGigW29iK8E0XzoO2kcE5UxIhqWCJZsGaxVpbcSiHxe6Sr1rT8hpPWXepLsUkz5u
         Lk82dp4dGYvk4hsDCpmGxrQmfVhj4RBIhEpBhUgu25Tp4ZEdMyA0z/xnv6FF4cPFlKzf
         FBPw==
X-Forwarded-Encrypted: i=1; AL+hErFD8Yc2NeU3lpcZncJkkqYm9AYTsETDGq7LqtVOrLtsKOiqvAg+1tLPVA/UQ7WyrK5dSdJTLjZ+QsDFJmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QUkGO0Ue62IfwcXT195VUhM9NHrW3/nozZssv+PTa6HMMaXlE
	Lj4vSdfVT1oWIfOnVuHewX/TBUk0KorRnhORK57j4CCYmIVR33gWHXQj
X-Gm-Gg: AYBFou0gvZ3Ut25CMd0eGkcoNI6oXU84DuoFI3kQ95g1T4/lTxC2KJVMMWWSkodbFmd
	16eg/TWtTqJru/rMk173GhtVIhkWHrQHs/TO8Ih+eACQeJfpv2oIPCnvV7SJjumM6p1qrPe92Qm
	uk4mEiyvClKwMMXHHfz5StpG/JoVFX0oMw8l8nZ2vW9AFqGmEAAmCKQmIM0nJ2qINk57Nt6TbNo
	oQhrAH2EYz0cxPOYAOO6IXShzw9GbyxgzX0oiq0qnbFUjjPaW6UOYkh8qOIPCMhzcT85bitCZPH
	ya3V+SeNbsod4PfRcAvPKHnqWL/CDqYL3O2l0YC/oa2qAWecVeS9pxCykhnYjNHeBwM4WB+SK11
	Y+e0CkSdeqFO3hL5q132jWfBTTivyaR7+0R+62hRwmQ5ME/MzKcoBHtFWKkgeayUkj3xIxveGcc
	OaJ+bLRiQ9xlmrhg6Bsxbnzo3RT7FIjK8yt6AQAvdmyQofaH6T16Q7E98fcg1SxSnpSXny4ulzW
	WVDbj9myFyVAKPDwIT2/GLsfSKQGf1aXojXNp9UpSNz9b0EHnC+1lxQxA6eB41vOuRQx4V60nWX
	JZVxZd9qPKNqFxlQO/yxvGrL4SaxKyFdjaClp4vkaylH/6BIYymQnhVo3ht7Pl93DzbgpJ0PYwB
	aURYSKh1tdqoA2tr22w1v/1esdC/9R/ygCuKjeyZytPY+VZO5mSfg2hkfoKSbcnU87CqGBv0Bzj
	ZiGz6RN8m8fWfccjGoDuIx+/cCUei7cRLjniQr74zo/1WSTwlo2nfHzw==
X-Received: by 2002:a05:6830:6816:b0:862:c3f1:634c with SMTP id 46e09a7af769-86315a059cbmr4898655a34.25.1795202043790;
        Fri, 20 Nov 2026 11:14:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:54 -0700
Subject: [PATCH v9 4/9] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-4-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use read_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index def591fc75ce..8c115d20728b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1219,7 +1219,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1250,12 +1251,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = read_poll_timeout_atomic(axi_chan_irq_read, status,
+				       status & DWAXIDMAC_IRQ_SUSPENDED,
+				       2, 40, false, chan);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1263,7 +1261,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

