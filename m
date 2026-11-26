Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711338;
	b=lrQXDe8kn8EPlR2yw36qEv2IgblaT6Oldw78sHwIpwPvIebqzrrh5qB7+vpJt4bEuuW2
	 NZ8/HfWV7yzBtrqiRIkslxXijiKTRg4ixkUe6eIavnooWzf8W8Nd4BEiiSb4Q4ZskR2Rz
	 1KdT/qe+O565MvdzzqJ0c7qukzw3rCmn99E6v3GMgj2e10ni6WhOAT2eYynkMiniP0w8Y
	 EjMt37+E9gNbHx9/BgzP7hZa/TdiZ6Ia4kzc53mEakH3ZwjRYfmBP5gk0wW0RNuDH5i6C
	 hWh5s2w+d/uWFkq80Hq/x0DOAZh8u8fWhBU4FOQI7mhMe+eaBsB+k0ZWzeOvL9KQnzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lx2XW05sNsax0knyU8En50M1XVGGdhuFvjhh6fj5imM=;
	b=Q7cpMeikCCUVNsqA5FuHYr8dOaAcib4UAVOG65sgqXcsA8TGNCwTz4fdk9aQGlnZtyM8
	 RP2T3iQHHTeXoxMLOT1DSCOHp4mYUWlsPhjpmOjVTfmc3awqRylD/gkXwq7E1jAbduk1n
	 9vA6jAuZWx0LdBetq8wpHP3hG40PLibTzAOdEEWXxQAWdZ+KzNqxqZ4eQQaSwzjwAr8dx
	 49mLxBuFAexMx5Ed5WW4CXGSSt0Xnyipfa0PUK9sIe4s9ucJvh4S9YAgrGLto8Mqrh3nZ
	 eWkGp8x/pNLOpNVqnldofpdB457Zs/VoWp2AB5vNkye90Z5PzTyHEkDavAmxa1YjNtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W3RiZCwq;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AFE606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AFE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W3RiZCwq
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so3301343eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711337; x=1796316137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx2XW05sNsax0knyU8En50M1XVGGdhuFvjhh6fj5imM=;
        b=W3RiZCwqyIIGFxFrxZwgvvoL2HNehEDD1ZGr2dUTjBFL7vmuFK8eCdKnl5Rax5iqUv
         GtSoOWAehV6JMdtkCNeqI5J7h0mzA7yBR8tQvBOux27xzI4coJ6o7qtw2ySJmW5iciRr
         AONNhf20W3ze5rcuHZoOaPwyuDhx/ik17LuSNRWXyBMAQjsa4D0mr5DWRUITp8vlABWa
         SjbVhEFpU4qTsa0czvbaHve8O3MT6KfoOsSFJOMNO3AxfXlM4OwerBSL2/33+qjJGJHa
         GL1PaW9/avySgo43BbmYEzR/las4ZHqLURkjSR0UYmYzX12iPJfQH9e0o0fbBYilAqkU
         kdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711337; x=1796316137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lx2XW05sNsax0knyU8En50M1XVGGdhuFvjhh6fj5imM=;
        b=bQbU3lnMv/Wf/SFOh4aJLF/zveBaKSKp3YbhSxre9GbRiJ5mu7FwbA5QHDWyFH6eIB
         FdahmTO6LSPz8ASYavWyj5Pab06VHEUKqkVdUPduis5rjUoam4JbcLSK+wYEIa1w0b5Q
         g6sZ2tcuAHv5LNivOrAWXE2K9J1VR6VAdk7zg/b3plNL4udIG6OC+ieE1spIs56nVFdD
         LmB2MagJFVHbAJqAtmtLPp5iJSy1KTTKBzReGf9qJaotfPkXHpvhObVdLW5lwBFpVHTA
         NtDcpjcMsrqhLct4y8niZUd5AyTqrK0sW3PTvLgNXbAwxpX75VBZ3uPZDy6IIyMBoi3R
         zMSA==
X-Forwarded-Encrypted: i=1; AL+hErGAO2kXSjau1EV721HmG1cU0ebga1bVP64msb5RxqQ0b32wtR2tMBmjKKjIygn1JEqnupWqZXz1P2DesR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nh5j3qGFW4Oornu5dxcwh81a8/6ZY4R9+6f48GHV0fEnjo75w
	VKFDzw2Dd8zJYldjuTSeHchPOwU8vDwmNLUJdA1dUyjvusWHuBKSyj5/
X-Gm-Gg: AZFdTZce6X0mXYcLqTrB8diuxkmAmRwBHqWZsVGMkd01DMBLvtT7hI7Wmee+LLKO+7l
	uHULAaW8XkOMAbICYYoavexWtyYl8tuuVvJ4x1Z1q/MraBFbl2CqV2d5jrEiuPwkRIJ93QQELb2
	73QQTshpfAt4nUGAYplkHE/JCnPTsuwuoo4jlIEnupZTID4UQuA2/mv8LCLguTJEnrR2rN/Kd1W
	dDoLxWJe5M2PhJ+z8vhHL6jNsNo5Hqtej8uU7VXOpmzOWEYQD5/gxAnidJU5soTG/dfn7uEQGaC
	BJslA0Gri/HPM+ZlcMGgTGQHUC8sk1r4gl2x+CW0D4/gwEvUI6WpiimbOC4g/POaKo149tl+lza
	t+MszMpOfp3JoMmL5z8w0QmXFXDuvcF7RjQVFbthjD/sceEAH/CEFmY8yW5p7Tj/loybN3urL/Y
	JU6SR/N5j5WJwxLC1t1yzLUJZ6wdgpI+IDf0S3nI7SDIL4UMiuJXgOI+4+sHzmB5nKI1dfBmh7i
	8k39zlAQmo/HnFc/xuv0efQ3hdy+YQh0cXe2hNTPkwVnULcExYsOBRLQK68arRu4TD/hLND+uU5
	yVfQEUHu16dA21owKkP7OlHmFScfyvVj4lIGixxJaapOsSPVBLHS/IasSFLn+eGdPLdh1alsQjd
	zykDVE1KXOlHq31t2z+U5OV/UklQS62bWqNTH2C5FHPaqyuoj4LtudG3rcABdckmdkIE0L9jP
X-Received: by 2002:a05:7301:240a:b0:386:cd71:b714 with SMTP id 5a478bee46e88-386cd71ce89mr6748394eec.35.1795711336672;
        Thu, 26 Nov 2026 08:42:16 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:16 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 4/8] ptp: ocp: restore disabled SMA inputs when binding
Date: Thu, 26 Nov 2026 08:42:05 -0800
Message-ID: <20261126-timecard-driver-v6-4-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

From: ahmadexp <ahmadexp@gmail.com>

The SMA disable state is stored in software and is lost when the driver is unbound. The hardware selector may therefore route an input after a rebind even though userspace had disabled it.

Apply the disabled state during SMA initialization so the hardware mux and software state agree after binding. This fix is independent of DPLL reporting.

A coding assistant helped validate the rebind behavior and prepare the source-derived regression test and changelog.

Fixes: b2c4f0ac53f3 ("ptp: ocp: Add ability to disable input selectors.")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 284908c6abc2..aa18c5e5eba4 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2932,6 +2932,14 @@ ptp_ocp_sma_fb_init(struct ptp_ocp *bp)
 		reg = ioread32(&bp->sma_map1->gpio2);
 		bp->sma[2].mode = reg & BIT(15) ? SMA_MODE_OUT : SMA_MODE_IN;
 		bp->sma[3].mode = reg & BIT(31) ? SMA_MODE_OUT : SMA_MODE_IN;
+
+		for (i = 0; i < OCP_SMA_NUM; i++) {
+			reg = ptp_ocp_sma_fb_get(bp, i + 1);
+			bp->sma[i].disabled = !(reg & SMA_ENABLE);
+			/* Both buffers disabled: report None. */
+			if (bp->sma[i].disabled)
+				bp->sma[i].mode = SMA_MODE_IN;
+		}
 	}
 }
 
-- 
2.54.0 (Apple Git-157)

