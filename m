Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115049;
	b=iBS000VCW0SPvjznchxHPJucXv8LWgt6Rp09Lvg3nU1VOpB/sp5J7/bauhiQWR3bcr08
	 9LaQecYLNQq9Cjrku1eF5xPsG9Otb0Yie+QJUWAvaY6YcTSUUFUJl/4/K5zffMaIevwN0
	 uK+MzkjLwkPrjJZwtRNv9cjONt2sGn84Os68SvCXdQLFdn0WahaT3LnJJTIdMSPbzO7xY
	 SbJh+3HmQD9A5OEczpt2Sd6eVW+fWdYZMHBAijzJB/4sag1M6l7rv0H7CQ4mch06aRlf9
	 4bbrN8UCsPv0jdpEaOtJOl6FYFua3zBQa1iPBnE1Smg5ksX0v1RdDgxsEpDIY9fgJeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115049;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
	b=Q0mwXI2DwKEwKndzFZzjNlSx3yxdeRrnT9VBvm+w+u3la+PmicoKFAC82bfHF6WkiEcw
	 +0PytPUxLkTB8lpoXoyLB9AbAuzn+NRH+cJbkRvNOJlJzCD7Oi9tWns8hQrIqIKbJd2gq
	 9ClxgysJ+WItK0pG3dnt239ndGAFMC+M8SFwmuZ7wik1i5Z6fvnXd6DH3U9fTDUpBDtsd
	 NacWpSRY1veE0YodgjlqMMDYVFdJTNXxy717Ps0fogfj9oeLpyGBLBiHehLdcpOfbAT2o
	 OnPOdGnZv2FLPzPQ7oEca9rWR/0YHkaOfjPq+LGb7YcM5VBLHCQ/QB1omSyrKZgTY0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Y/Z044D9";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA44E60A2612
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA44E60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y/Z044D9
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso120071a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115048; x=1795719848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
        b=SIQqo3XEkcrPZOptP0vKImcZ39PED0w9V9KlaVyt7PHv0gaySaAW14YmWdMZJVX32L
         wnL+1rpJPeUFLr+O/YWH9tLUaFWNoUNVhI6SOChMLURiNAJP6t7vCSVyV9hvU8x3p1F3
         mj9FZUo8Wp5BUst6eC6GZAEy9gaB9oKHHKmdAmmxN+nYxkYclugXl6D/v8o7v/7qiFPv
         7WY+KiHTPLEnFTJiZzyJk0IeOod3CVXL0vTTQ/V8VR2nrZpE/aupyaYzXqHz15vYpypM
         2j+oqnFZd41ycp4auVBU5mBV9hOUQfIAV+cCUEUlAtgHnXlqxvTqL8yFvDo+5BF45iZy
         FTCQ==
X-Forwarded-Encrypted: i=1; AL+hErGCmLNgk8XFOUq6m+g/nDC6wKEIj9zobJ3c6H9VokZbdt6S13eQjy9jTw77FTK5Nc+Pw2kM+BqDG7mOqOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ih8CL3FteizVRmFsCcndpe41xpF7hpWIZeeuC5V5GccGspBLc
	ES07hqd8rbCxNmfHUMxsWYBNsYSyj/CbxFLw8qAHrmrUDFXxB4nY4i6xyudvBHe0mSJXy4FYgSD
	qGb0Yw0wtlTvBBTYfUPFsWaMBK3HksiLccq924upx60FrQe+o2b/h/c1NvMNnd4dv8IkSY1ezi9
	kxbeyMtIiiL38gZtxIZ6xDhT5ArzOySG5LGqcUPj/ijWaLuNCZQknx/3kt/nh7psEDEtwb6bGW1
	32XBUzzbiX99PpO46+C4o8R
X-Gm-Gg: AZFdTZeEGhOvQmrGC6a/4+7ug8pm4gnX7nGkcMPqXmI9XgUYuMQnUIzXv4v81cYTgnZ
	qJWy7pLvZBww8tTVHtXA1SR40X90RVBqW8MrvGgqBMoq+F112s+hbmN/Rn58QQRCClOSaMvSqpA
	Wlg/8LcgpNvwUt3Afe/ztmM+kOxKqXOvH7dvbpQHGAFcdYdhDxae+jkjMm8hNo1b5gsit1PV9ZW
	fMqi0C6KZH/vZqai+zDKCfqta8xQi6d4ycGHjrz7Vp+8idNgp9McREtQgu/dhx6gcoHPLLMjheH
	4AScAskbNq5yxN/OAIMPKZIAr4QTbbl90888yEunpcF3ArLkijPfwCnOX9UjR0d/uUkUfIYz81B
	RxRY4h0ONBXQ5/3ZzHq882Hs+2nmKUmguOdbj+Qb9wqDjtvzvFM5IeEAv1GNdlxjE7FKD1dL+6t
	JbVEDJx6CfQghyH0+ngFFddJ0GrnHKM2PNZ98f0M9IgCQ=
X-Received: by 2002:a17:90b:3d92:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b41c8dc8a3mr260314a91.17.1795115047777;
        Thu, 19 Nov 2026 11:04:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d224ba3sm46598a91.1.2026.11.19.11.04.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210ec7cb34so4237066d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115045; x=1795719845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
        b=Y/Z044D9pMBqpKZcu8vYxIg1rJsUT+yCsVdmVoImpOjXdJrq+IRhuxUEW/qzI1GS5m
         HVgncLNXMPbrusbLuM3cLlK7iDNJVik8rMvMwLH23C00ysbAMuWxzsk7+WCHC5btpPYS
         QUp2n501CTe1gLOIvH0x1je02ASfyYUumFBGM=
X-Forwarded-Encrypted: i=1; AL+hErEaKsa5reSx7QevYNtZKkQhM9JoKDN9LRm2/UfYwNClq+prvjog6tsmG8Yc0FWluQTyQt1NlZVlv4sLO7Y=@vger.kernel.org
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr99348785a.14.1795115045212;
        Thu, 19 Nov 2026 11:04:05 -0800 (PST)
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr99340785a.14.1795115044633;
        Thu, 19 Nov 2026 11:04:04 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:03 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v7 1/6] net: dsa: b53: initialize the jumbo frame size register offset
Date: Thu, 19 Nov 2026 11:03:43 -0800
Message-ID: <20261119190348.2317702-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The chip data specifies both the jumbo port mask and frame size register
offsets, but b53_switch_init() only copies the former into the device.
Since the device is zero-initialized, b53_set_jumbo() writes the frame
size to offset zero instead of the chip-specific size register at 0x05
or 0x08.

Copy jumbo_size_reg from the chip data along with jumbo_pm_reg so frame
size updates reach the intended register.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index b7aff5e238e8..1f5776dfaae2 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -3172,6 +3172,7 @@ static int b53_switch_init(struct b53_device *dev)
 			dev->vta_regs[1] = chip->vta_regs[1];
 			dev->vta_regs[2] = chip->vta_regs[2];
 			dev->jumbo_pm_reg = chip->jumbo_pm_reg;
+			dev->jumbo_size_reg = chip->jumbo_size_reg;
 			dev->imp_port = chip->imp_port;
 			dev->num_vlans = chip->vlans;
 			dev->num_arl_bins = chip->arl_bins;
-- 
2.53.0

