Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670128;
	b=R89Aj/83ATswZvkBt6winTl0EXAl6h3gICJs5jo99D1Vh6Mjv4DmcaM4vFPjiZ2X0+la
	 QSCRyK34CQQ3ypnRhgGdo24Ck0zdlUeJrYryPL54CxNAZ3Nap8VPqLvcb6NfWrVzmH4nn
	 gVTmFtMWmluK8jf3D8nODMOKDk7E6y5qA+mA5xAPsYC4+rU1eamO0EZrAbk6jMI9vFlEb
	 YU5qLJtk8jcKvB5dABY5BJ1YPmSvXxPxidP2WTDkTjFOipRCEtiL5ZP7I1QNFBumysI5c
	 8wsfmU5eWcrwR8uncynPQnXOi1M/e7wjCZnMawjbmcS5cRZXjcZ7DuJi0EBF84zkBXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qsM5RJY4ssSc6XEZK9/kRUVmdgCpjgjWKidI/l+cEZA=;
	b=wbrnvAAXZ/BkxMZsXPrpb2Eb1IWUuWrdyrxvBiNtGNtq9tiiWmFUcSIv0Jh7nODLEk2b
	 Nt4GERn3Bezf07/dABVXoz+c2FxtQhAP6RmqSAyTh3Rgy0fokwNgv2i6mrbBhI3+J03eJ
	 rgWLyA1vODPvtB54brHE0C2v/T69UG0hNjvQ8+ZkuBQsH/snmLELJrJdx4Jz3vPtzz3Tn
	 fQap1PL7p20ooc+9zQmni6pNe5LMUgWP9XY2eBW+PxfACYtt2J/ffEElT8CKVbdU8lusE
	 ziGYp2thSQJLq0K/gd1Atko4C9xMk/iS/h/nrN8jrC/qyHPzQz8jEiUY7jd68Q4OoZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anPSe+SS;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E8606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1E8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anPSe+SS
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so2888054b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670127; x=1796274927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsM5RJY4ssSc6XEZK9/kRUVmdgCpjgjWKidI/l+cEZA=;
        b=anPSe+SSJbPa+iVGCzFWsJegDk9HcIXXjcbEXj3+ReLi4sWHyF7gmMhyyfJvyTL1nO
         q4W35BEAX7OXUCoP3eMRthxOGqHfuX+Wt/GTFG7WtTtrk98EMEDfXporL7Ow/a+xMq6O
         ptcJOsVfb7FTIfyuCo8tWbjXoSrEg3t8FdXqxY4N8MuZia96ESLYJJ4pStjOTvMvtr0Q
         zxqYgKNbZt2PaeXehBjM04kMZH1TA6cyThvTE5zXj5k0xW/uiu3m2QKFOJHApWl83H52
         bbCHVGiDW3P9RCaS7fm4/usI5PM5FprWUyEGcZi97CTml3AuG2pmV6V7xrZ9zyFmgsG2
         X/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670127; x=1796274927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsM5RJY4ssSc6XEZK9/kRUVmdgCpjgjWKidI/l+cEZA=;
        b=iMD87iRynQpv2wqZfqEzCdrEDSnJtxpQM4U1KMPAxUvYKSgfxQwYpvKB+yyqYSytso
         VdsUL1+ctjPM1JiLg/+0hoUTkOFx3uSROoDReVftbOhQUYzzh6ViZC180uvcRzANAUV3
         miV3cEpgS1YhNN47K+vVdCTDOeLiWqzH9DBCexmam2IlNNm6Bp5KJ54tVLR4TbgMoVft
         ytyXW3KUqFNIInBgZ4G9PC5cTtoZPrEBg27dyFpvcbN6Tgstzy/9eLns8/GiTuu7kZkc
         rHdH+3qfaZ7gYU/CGN22lLwMoSeQcgkA6hlVWPQKmrLO/vl81BP7f1T/RRkEVOnSVs95
         nVsg==
X-Forwarded-Encrypted: i=1; AL+hErHgKV6JqngJ6dFsFOZ3RO3ZZabBXFewTpPDF5Y+bGqdxu1g7KZhr75uXN/GLLpnUF4zU9LUbQW1EzQ1QFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bXmhC3DKXpXAkwNki4te3dSMhhv1STai44bMUWK/+cvjlPpLt
	lrOG2HOsrFpewucWeHEcRmfoMM05MWxDMnyn19T3M7UfgEZWlmrar3BU
X-Gm-Gg: AZFdTZeE1WM/7hvQM7JoP/tMDCQVCiQ7jaLgooCR/UMGYmOk3akzKKoG7BYd1lyYSL/
	mdvaIfLgq/FJpsIVO9uMV/mHZMhTBgN/rt8kvvRfzZ+iFHV566Z0VeFeAglDDQziSU5w6D9DwVy
	FoxWUnZd7EVUYQC+m5aywKkyVt3rm3KLjSp3IzEQ1+wJqqOqu9qIz8KxL04OtNL/t+3RADYwZpT
	GqJ28K2H4uTeSQ2hzGzve8WziSMHbdc/pugaOa1uv3DWfwy5OhT40aLcyCDIJLmpcTYgIbL13cS
	X/h2FcllGDhqV+JtmBWZfZoRlau28sU+ViiUc+ViI4KyAFj2tpCFtsyFphRmS25FrygapOPYF0k
	OscAySbnG1Mx8XThcHtl1OE5CPzFi/ZncPTNHFJ0dw7DFY6rSHpbt1LVZpxR2+DMMSqIimuaz0O
	egM2W7G3GS+QZAk0gYrFr2NCVBGTU9nA5Ysm/M1NRHPlWs69Olcv9Gh+HYr5PH5ACCifVF+ERLK
	HgPElpUzkeFQjyB4p2UztkiZAQLaIW4BB23CtdA6ChqvaK81yi5Mii7qMKShN2ktuP3GF8QJpWO
	D2Fu68QyJkF4P9zrsJzEtTHo8HML6bSyOv88PF5D1zJq9w8f7w==
X-Received: by 2002:a05:6a21:4eb2:b0:3e8:b7fd:6280 with SMTP id adf61e73a8af0-4014d85fbbbmr22187564637.27.1795670127244;
        Wed, 25 Nov 2026 21:15:27 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm10179820b3a.8.2026.11.25.21.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:15:26 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: vireshk@kernel.org,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linusw@kernel.org
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 1/4] ata: pata_arasan_cf: add missing newline to warning
Date: Wed, 25 Nov 2026 23:15:20 -0600
Message-ID: <20261126051523.14431-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126051523.14431-1-artem122novak@gmail.com>
References: <20261126051523.14431-1-artem122novak@gmail.com>
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

Terminate the clock-rate failure warning with a newline so that
subsequent kernel messages are properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/ata/pata_arasan_cf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 12f1324461d1..0b3e4e63b66d 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -318,7 +318,7 @@ static int cf_init(struct arasan_cf_dev *acdev)
 
 	ret = clk_set_rate(acdev->clk, 166000000);
 	if (ret) {
-		dev_warn(acdev->host->dev, "clock set rate failed");
+		dev_warn(acdev->host->dev, "clock set rate failed\n");
 		clk_disable_unprepare(acdev->clk);
 		return ret;
 	}
-- 
2.56.1

