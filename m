Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943950;
	b=BOe8Hl+Hq3zwafCOLkTUYN1NRKzm1GOWfC+9Lm4pMQGLUk+MCHJlqk7wRWVvIZMBoESU
	 mBwpNS3ImEhONVGlzV7chGuQyii7Qr2USZ73eYRumbEg+bkzVf0obqur2pnzLD6fC9WbW
	 AHYHT+1IDwkcSenPlgHDfLYc0aXaUsmmJga55bKpA1OOd0gJlTVpT9KMPau3T2QeYuGY/
	 5atJHSui/JbrPdoXLRRagExwkVoIAO61T9K1vcxvIH3CdDKtXUqmDgC9WAx/9XdnBVYH5
	 6FiSicwcgzeLdpyf21KT3vciXKyjIvFlBOcOmrjxHO0uThqdrdiX6pQhA3M359dRs0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
	b=G9IUIK9Ec6zLYMU+DwifF3WA2cgatiKP5NpF7f/BPpXfqHdzy9TX2acdF/A+xtd9wX3b
	 qmcfAlqkigDZMDQyXuHYOTJRRD88Klq3VGDGkheyyNWzNEH+i9tFKtXoqf21Yc+9q1Eor
	 JUrQvCKQTKd41D9JLXUUmchW1+BI5q94ySE736tZ+iS8j0PFGHoT0N781zIxD8/guyXCL
	 0hvymeDXikEUX4Dy0JINtUxrxqlV/2jn486Fb37IRnr7tg7MHNdF7XDnFaO1RgFp/Ea31
	 u9V8oy9tj9s/vWFZvgecKwFk2GzBd1CStKDcLyEdqMB3gEw6FnvT3Urg1e/XCb+vdSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7rU9mx9;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965CF606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965CF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7rU9mx9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37071c0f42aso451364eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943949; x=1795548749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=l7rU9mx9esX/eI1IaDJbA5n/H7+jLp3L/sXmkp3A/y4wj3ouiDun6uGM83b/7CMfi0
         wrlTCn4p/0BK33O7WVg7wug8WXBOd95fWGOMupWRnJGiFnh8JuJjbdO2gRo281Pzwb2K
         a7iKbFxRWnA1D5CxP0lEZnt/aZrNnxQ4WWlWRHe20qlKAjfX2kPQwoVxAhS+Xr4lxygr
         y836kjL+4ZLL+sxTtvYdJMIVQdj3EdSNd+ungXdbas8FNzmJn4ZDsJji+CouuMvVmlRa
         D9030Uy+YNJcKTP0/JZ3XrDVCKOvJAqUoH8tq5mpbJcdK5OuNSyTgv/TVCIdA7VRTSt7
         Em6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943949; x=1795548749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=ubFTHyKZ95jrQfSPVTE/YaGwb7uvg+CjwY6Ti+4NkxppLAD9wR+I1lc7SGKSCRcyGc
         f+uRYS4+gAaDkZsf6vMIDNukWmKJbXVmQORQaAzW7KrmQArODRW0OMfWnPRojPX34gFj
         PgmBMtlUuukVmMHcQSIZ5XCavx0Hfi+DNk+O6DFtzZoTI4RpNNM8x1hgTh1vPdeet6Ys
         HfVMCGzG9AQWkLUH19X/MNXQmjqG3FBPlKAe7SL0RH/6AR77iRCPeAhEcQWws9QkLguz
         g+R3UIjisTJHt0DfLh6CSfJMMmagMoQAroN+8NNHoN4tOwdCbXzB8a9PYsWKKnvSYxOD
         odnw==
X-Forwarded-Encrypted: i=1; AL+hErFyzppmXNDAn4vTDm7S8OGs1G0kWMeCcaQTQNU++Ek4FHZEqFmTjIhgVOzJPX7KirKKrXI8f5C70WMwZTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Z6m+XnmwGw5If8LdlCpSicehf1YnJoQpMQqzgBLjYZvEpf/9
	Uzy9m+x+C9/9IoDwRQ33TGbZ+Fj0hi1zHAvSwFj4P9acuqDf6kGJiDrP
X-Gm-Gg: AZFdTZdcw3qJYiSS3RCxaiDSL16j4RawKn28VDHlXrVV74Nok4m/nBgt6iMt/MKTcjZ
	+x6EOwLUUvMFar5jk79Mf2PsOlcxFemKn+f869S7n4cG7AgsNctQcQxamdMDruDdHPoQwGxeZnl
	TzrReHxi14Z2l+xx1UitscehYb7LOF2uK1C165NB4Ln8nuoAFDzNnfc8px6sFFdJ68tKfnUPBnD
	N7khOq+bOR8mT1+RmGX6t1qBd/vSMoANHVvU76Tem55hFnatDEa2dGfEshu4RiBbGrCRztzUGcW
	ivnFfFqM9IObR0sURgk4pTujgM91JUxiK6gIXf6GERig7SSzq5o1nScWepRN63oN3DWrMR5PzW9
	ROysz4/lG5ow9r7QGAAZZXtGGN2j26uOoOWGhT0yWNuGynC0mJSx1hJlg2ynba2+DI06pTc5X/C
	6VfJwInIx4nvUgntxqrhgCaXB1bxZFGRsrJpE0I1vXMHDF14dBAnMTPMGAaFgKte1Ll96FPuBdK
	AzWqFhcWeCQNoZ/bhzr6YvCmzi8A/ZrvBh7VV2FdmToc52/h0UeMULQCEFAkgJcQ/yC2u67Qie1
	tQWPZ/RLu6cRim2K93IeVC5CpqOtiw==
X-Received: by 2002:a05:7300:f408:b0:369:f035:661 with SMTP id 5a478bee46e88-38280a3c1f8mr420676eec.15.1794943948629;
        Tue, 17 Nov 2026 11:32:28 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:28 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v3 01/10] net: au1000: recycle RX descriptors on allocation failure
Date: Tue, 17 Nov 2026 11:32:14 -0800
Message-ID: <20261117193223.2795612-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

An skb allocation failure retries the same completed descriptor forever
in hard IRQ context. Return the buffer to DMA and advance the ring even
when the packet must be dropped.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 8682323d693f..cd25248f4e3a 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -788,7 +788,7 @@ static int au1000_rx(struct net_device *dev)
 			skb = netdev_alloc_skb(dev, frmlen + 2);
 			if (!skb) {
 				dev->stats.rx_dropped++;
-				continue;
+				goto next;
 			}
 			skb_reserve(skb, 2);	/* 16 byte IP header align */
 			skb_copy_to_linear_data(skb,
@@ -820,6 +820,7 @@ static int au1000_rx(struct net_device *dev)
 				pr_cont("\n");
 			}
 		}
+next:
 		prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;
 		aup->rx_head = (aup->rx_head + 1) & (NUM_RX_DMA - 1);
 		wmb(); /* drain writebuffer */
-- 
2.53.0

