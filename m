Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711339;
	b=jRWkooD1SVYGc/TiVLK23j6DhWcBby02Nucw9DDUMzyQRHpqeugACw7FZB1Y59OPFQpO
	 rQAXDIoB341ATYurvXisqyumIl4WuNbKV07xy+lNQfVhSmCc1wH/75/19LdJaRV1DVaBO
	 JruX9rlzlKxMZzcsBX4lhzi6OA8k54lzR0Sp1/5czFGOULt8NFU6wL47I5lL0JHCo1nz+
	 IahffkGWYyCFe0QQY7tVwTdfUfI3kBCoO+xpfvfpY7Kbt8bBYxLXZ/XL4tSyaHZYnT84w
	 8ikP7vH3TrM2uTUkL93dv5ie/HT5pGIWIbkITEUClM2J8Jwjf2JgwCfSXWU9ffLUHJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yCpwmuq/d8uSHEUa04HTrUhqYayQ1lKiYDKTWrQZ+DU=;
	b=m1u1dtxauFumxC9/aF7i4Bw6w8I65hpb9aHjQC7JWH39eTnGPXdz+BdXGX/3+0+H0P6t
	 rzev44c3mo39Jbxpq71DLzwKIfOIoeA69GTIFT6EmKsBXVrUyEoi+B6uD3nGr3bXJMzN6
	 vCVHGUgVt3a+GLAp1ihDSoJhbNDuoNtIs3GAEFIU7TDfMPft6IOECsCqdb1VBrRYDyxYD
	 4pJBXlyj4JB8zsIC3SDV98X1UCuvfTqkmsAlnn9IozBpUzNw9j31EqBe84cTeDaTYRnKN
	 vrb6qr2BshOBpkATYtQe+X7I3UWnDdZFfri90UkQILp5gBHSzGtHYuRGxWo1euH9yLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bTj1dNCz;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1B5606A6A5
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1B5606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bTj1dNCz
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386d1859e1cso1664675eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711338; x=1796316138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCpwmuq/d8uSHEUa04HTrUhqYayQ1lKiYDKTWrQZ+DU=;
        b=bTj1dNCz0ssGhTkAVAaWGqjNZ/GKyMU52xi2PeTUb5Z1ipMIL1oYZN3rh4hQ2YFwhs
         La10I30Ymj2a5D4MyiQnZ2Nen5Y10L31eWI0sKaQ7d9nXPlgfqUNhUfilrRXi/y2H0oa
         NQRvG+P98elWBH7eZ9EIBkCN2K7YG9Y+A4BQV4cR1C1oL1XiCwu4gYiD0o0nuHLzHLPN
         3Jo5fBQXCRFG7CFou60QtSxlC1jF89FiCthDHMGnuBnBzqw+AvrZGVuI9l62SYElUlta
         57YL/Xbw7ByY4Cx5Q7h+UmxNxyLhw8NXZAJiIoENvlHEddj0DYKyoR/aVST6MQjagGey
         +Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711338; x=1796316138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCpwmuq/d8uSHEUa04HTrUhqYayQ1lKiYDKTWrQZ+DU=;
        b=bSDaznGllqNd9XCHKlKYGydNyp90lgWOinsgdeDlivXFuhOaBzZyxE2m3cGlxNnypJ
         OfvaF9P8kzSVDXI0u9SS4sxHtDpiC7ETZ3mil2545yCP6hjilOoyEKStVh9J+dnceGWo
         7UfG9eUvyX9USeEI+dzRSa7cqJrPYdorktLCs1R7aV7SLfnUSHb+tep7vwkyX7RWc/C0
         qg6rJZ3twfopo8DxokwJlveRS5v5fr21qnrgHnaSLYksFTENKrUo4frr8Gvdl4hx4pcn
         S9uOzjgTb7Bek7YZf8rfLA0f5Qvom+QFAguTyuI+huhXvriBtHRZcN/VIW/WzIKjvfJ3
         g3ZA==
X-Forwarded-Encrypted: i=1; AL+hErGFLgnumOliQ7nvrsr9DnMcme6ZEopEwWSG0mum6ruGKFnVuF1Mc2w8HIDCfM8uHU+0t7rBCnZ10ehHrq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rl4/SrazzD2eQg4jglksRqpNsecD99EEyC4RCGiDGkkoheyIF
	rub/3evLq58Ncl3W/eh7n3YJ9d2Fe4x9AcWVLByybimWR2g5Z6ivBER6
X-Gm-Gg: AZFdTZdKmurJgCN8FyiziXvDwMFlTxD1oaWgFzZWZjvW0sxfENnz+AJfM+bENzs3uxh
	tM4f9kQnoO4CqiIOiMnA9yuEMpbO9A8ZNJyr1za1aFamqLkzff18A9ezUOhGEMpdD1NN2x+9OfA
	rmznJ3avfO1M2UC/c0VpmEcxgmByCTuA1UlTiXlktQS3weyveeqLho33YYkvT45VWmpNAFryvll
	d6oSCY8yGClOByL2614itiiN2zLKceki4DFsw/C4TLEwF8u38lqMsFRj3BUJKue1XhTYOE48MpG
	92pHg0cLjFZ3BkTr+r4U9GQ2v9YqCJy2xcnTJuikdXMQxB4i/zejS5CA8rUnFgqDjJNR8dmGEpB
	zGeWKl8CGsF9mtu75cAs3aAdGgpRhzygj0tw6mydambiCkhrE9re/ew+SY6+QXsK9A3XBkTPGZI
	qyLWAWiJ7ju3WYqnHAgb2nDdIbiP6fWAOg68JZWxkcfbQEcmRt71EqqTtinekXf5Xc+XZGDe1NL
	A7zFxh2/k2IPu3MutGUWZNKYu9cU2vkts5yOom3l4MgJLpaki89TTuvNr4ZTkzlPUlfBEplZ2GR
	mBZ1gyeaYb/7tdYE16Qpd/7JS3xfTq0w+WSHiN0pyudlNUoh/MEd2VUrNUKtCiNUDQ4rZAVUZ2i
	AIo5YRZ/9EiPvmX+kApwY9BSV4/FamMf7+qTjoezxWHlklkktyDdNWEczfBiw8lqjUscPV97V
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr16951672eec.10.1795711337996;
        Thu, 26 Nov 2026 08:42:17 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:17 -0800 (PST)
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
Subject: [PATCH net v6 5/8] ptp: ocp: report disabled SMA inputs as zero Hz
Date: Thu, 26 Nov 2026 08:42:06 -0800
Message-ID: <20261126-timecard-driver-v6-5-ahmadexp@gmail.com>
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

A disabled SMA input has no active signal and should report zero frequency through DPLL. The DPLL core reads the current frequency before applying a new value, so reporting the stale selector frequency can prevent a disabled input from being re-enabled.

Report zero for disabled input pins while leaving output and enabled-input reporting unchanged. This complements the separate initialization fix for preserving disabled state across rebind.

A coding assistant helped check the DPLL get-before-set behavior, develop the regression test and prepare this changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index aa18c5e5eba4..3457c351958d 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5924,6 +5924,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
-- 
2.54.0 (Apple Git-157)

