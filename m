Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288536;
	b=cLkGWQQNrejVb2jlz/bR59azFrTTKjU6e8eOYNSr/iZTXwLe9Q1IyAazIN12CrsdMBO5
	 qEyEgC7hbdnolacoEfm/0givqRzOW+L6CSHv4rcaxwMgvV+LDSLN1sve2JZ9U9EEBd6y1
	 cfNy5uhOUIffmKdmt+0DCEiJP+eDL8y/PEl2+Tm5Rly08EfziYTP01Mr/ZtvCsImdzq19
	 CAxyMAo6alxG3wZMQ/Kx9H0fHqSN7Ix6hQ2ATShpVYnsunLV1/Ls2/pVbb+zGo8jogo3K
	 4H4V99ulK1yJIopl1kDmN4DpeQ8AM3FzvA7Tx6vWAoaWfKkUm1L58GLh9atFdsYKJ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U2ZE1yTZzCnv0IKZ1SiFuOw4VA0ene+ckPv8Qr9Bs4w=;
	b=Ys5hziT9+rPk1upHhd41iL2B/ce4/YsPM4Yo1gDwO5wb78hKFkzfMj8UjFVln2i9APeo
	 UejzNlMu5Uf4CcGh7xhzztxSGL11/Go2XefEkeTT6xe5mdXSqeDm/5vkgBAACAJ+PX3PT
	 z3P4GVCUbVQWLYFph0fgcp4LjojayntPi+HDOjHflJbA6dbBZMfJBtI8+WuKkpPnCOiTp
	 6rwk9GmEGXKP+nGgG4yeYphslbWZDkhgV99RFv1ScK4BQr7kuCYTk4UHpDhZigK70NWsj
	 Fbg9SBF5fc1sg/oupdNhRimuJcaM0+hPdepsqJGy7eSGH8uczS+ExyNRqifFIRhi1Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjrpbuO9;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EEA606A6A6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47EEA606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjrpbuO9
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so1851632f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288535; x=1795893335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2ZE1yTZzCnv0IKZ1SiFuOw4VA0ene+ckPv8Qr9Bs4w=;
        b=RjrpbuO9LfQQVEVt7AF835DeE1+ARdOtynFb8MYNw/26nh+7kmxhzSPi145lWPKXdf
         SLS/WF5Eu1m8FbuavdFg+RDiqgduT8nlI1KGwklkn8dVeM9cyUQXrOlOiq0UyVjx2Hco
         iIMfTh1dvmspaW7suIkBX73ayqa8LBPx49jWSziBZnoKljIvQ8pkjAz1jvh340BDMx7/
         2oKxQL4vAqwLHeFiH0DFdyVY8qM26G6ikclY0IdEUu6r9iOUoIc7Bp7N4ImFB0L3tIr5
         Bbt7lSBQQaiIerThUzKYs5EP2AHFJHyp7kDtMAm+wJ4XPJRo9i7tdYd4q6kmtq6yFHeF
         K9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288535; x=1795893335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2ZE1yTZzCnv0IKZ1SiFuOw4VA0ene+ckPv8Qr9Bs4w=;
        b=CYjCCK7yqQjnVefxhHHm5qA23KQ4O31nXIa5KnD6QUdVwoMDb/IGMT2ajjubdNQuhD
         zdoE+ZCPqw8mD789UcSegPE5nlHflJyUNMx6/ixR5h3Yy4Lij/Bx8xyAmONYk45Br/eO
         ncBAwlKnqbGA13IuU798cwv6sY8s8ZLbnCzmioc9mdnyXKZxvnFuS9X75ANV6zchTCa+
         gtAeCLSLiAZ8r7fFMKxGPNpNlHiwxq+HnLQd0tNGwP8EMA37op2Hln19Dhw9ybF7D4L0
         t3eCLkeBWgMGbqjjow7bdED1BZeW3IywZCg0RIoEHhvn1QlBcFcs0JXAc3QlIzXNzFlr
         bCIA==
X-Forwarded-Encrypted: i=1; AL+hErFRGxVus4rLbYNtTjWQPgyJTFslJYTyJOj9gqQz1Bccxi+OtHn/HxMSkwfjtCZrz2vaYhg3Sxv9gn23NHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3UN20f7ZcH3Gsk6ncGfMWCwChOYS1Kso7sl4HvIQ+CT4//dyO
	GDOGrUsUpfuWApoKhyDc5m9l+rSM4cabtPVmDXV86p4D/fcf77D3UEtL
X-Gm-Gg: AZFdTZeGKAY3j2QhE/+ZVgsb0THLnkEvtam3nkUSK8MLZl6/acf74jGn3iSNLiOpzpK
	oY1ubr8HH0miwyWFgCs67wmhOuCLdMvOLgY/Gu1T3Qs/baC9J6HYYNUymBq+iuhfb3zq1ZgTawJ
	TVEaiHaJISd28AHNwe8VP8er5GWTtI7GlPWrHnzQvOoMVXTwvpdBHkECElX82FYRE2Qf5+f1bDj
	nGLHCbE2ZsZyQv2bit69ZeG1Dex7+wMqqBK7bkUOQEwy5CiyCjXL26x5W7bVfWrF+BYmcum2PEI
	OoaBpIzI7WlHBp9JRYpFgniovUGb3brRLAePIVhLMWMq93dr+YOnNCvxjGw9Dm06yVbg2E7syEz
	AAeWrPni/ZRflkyr71WgVwNvdQwDCD/Jk8xkCIijX4slc+VuMlxbM6HnzGbPrDtMbPj4CBO5s3G
	o3GYEHnWTmTjVhhWPfmLQr4tRhN7WYUUCXdlD5g0rWsdWfF3aRRudXfZPd9mp5RD2Ai9LSLriRG
	8RlNt+DaGubbGSsHb4SN9OEOym5mmWNSjr8/ZCxs47dVqPoYGHtX8BLxL7nJ4FPPyPZKfkbGrFc
	4hNUbLL+GlXDZp6kHrL6AM7bFeBDNXtFcF0=
X-Received: by 2002:a05:600c:1d29:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4bb88804d4dmr162931285e9.7.1795288534610;
        Sat, 21 Nov 2026 11:15:34 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:34 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v4 4/4] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Sat, 21 Nov 2026 20:15:28 +0100
Message-ID: <20261121191528.591334-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121191528.591334-1-mehmet.fide@gmail.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recovery after a firmware crash removes the driver state of every
station with rtw_sta_remove(), called from an atomic station iterator.
rtw_sta_remove() cancels the rate work of the station with
cancel_work_sync(), which can sleep. With a station associated:

BUG: sleeping function called from invalid context at kernel/workqueue.c:4722
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 14, name: kworker/u16:1
RCU nest depth: 1, expected: 0
Workqueue: phy35 rtw_fw_recovery_work [rtw88_core]
Call trace:
 __might_resched+0x13c/0x1f0
 __might_sleep+0x48/0x7c
 __cancel_work_sync+0xa8/0xb4
 cancel_work_sync+0x14/0x20
 rtw_sta_remove+0x34/0x10c [rtw88_core]
 rtw_reset_sta_iter+0x20/0x48 [rtw88_core]
 ieee80211_iterate_stations_atomic+0x80/0x144 [mac80211]
 rtw_fw_recovery_work+0x1dc/0x2b8 [rtw88_core]

Use rtw_iterate_stas(), which collects the stations under RCU and calls
the iterator after it. The recovery holds the driver mutex it asks for.

Fixes: bcafcb959a57 ("wifi: rtw88: use work to update rate to avoid RCU warning")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---

Notes:
    v4: no change
    v3: no change
    v2: Reviewed-by Luka Gejak, no change

 drivers/net/wireless/realtek/rtw88/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 564cddf0bfed..98a7741ccd0a 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -669,7 +669,7 @@ static void __fw_recovery_work(struct rtw_dev *rtwdev)
 	WARN(1, "firmware crash, start reset and recover\n");
 
 	rtw_iterate_keys_atomic(rtwdev, NULL, rtw_reset_key_iter, rtwdev);
-	rtw_iterate_stas_atomic(rtwdev, rtw_reset_sta_iter, rtwdev);
+	rtw_iterate_stas(rtwdev, rtw_reset_sta_iter, rtwdev);
 	rtw_iterate_vifs_atomic(rtwdev, rtw_reset_vif_iter, rtwdev);
 	bitmap_zero(rtwdev->hw_port, RTW_PORT_NUM);
 	rtw_enter_ips(rtwdev);
-- 
2.56.0

