Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597586;
	b=xJxJJWk3Vu8cAQpoIuD9jh2O3thbftx56vNDVUHM49lgtOI6h0tAcPl2yEga9UNwLn2V
	 faT1g411I/kI9vj2iK8IfYDfdUG+Nn/sIYFtj8yq1DQFL7paELG7xO/gqsxcJ3uJ7QWlf
	 jDDs78dEv/knsLygbCy1gg6Qurnwkb02ZZNs3RV+f29kWf4FrfZz5SjsUaWD9f5B1UBMV
	 OvRd1SJQmcbeZrDBWyhwX5m9B+JmxGVwz35DnZt8ZYYup1ccaW6oYF8F6Lt69KXzwXQa0
	 BE/Em3lumJQcapu8GaJ6XfNKKBvkCVSqLGDHdfmEUlW1kkmjX3nmNwMGVEYwYCk3IrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4LMXwRmfFOK9uVD3FtaSaYbnUZEWWNH1s5i6mBQwiM8=;
	b=XXpxXv5ygpyvw+NlWwHqJlQxnwLsXECaR7C9eQMg8LS+fV3xh7ECus/Y9A4wJeL3Gl+A
	 Hc1v57fxH5dWx39cRjW5MxSzeAd/DQp3SI1g9El1V0UyVIO7ULKyxH/Gr/y/ED6ZBv2l7
	 JrR75EYnfhUnvkOPjJ8zlDo8kSsabzvg5anFzE0J7myd/fyWyEMeifAvUBGA/3acD/PgF
	 lu8Z3VRexlz3PIhAiTMEYKlhavM8XhX5Cf/XYXtS0GAlCM/lcQPQdvgqSLn8xvimrVmSn
	 6RyL4sF8K//JqBb1IjEQ77w9thv4iswGpEnhMEGGy8gtekbFwJE/NGb9N2OvGadOqmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6AHOlWg;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8F4606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E8F4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6AHOlWg
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so3991251b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795597584; x=1796202384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LMXwRmfFOK9uVD3FtaSaYbnUZEWWNH1s5i6mBQwiM8=;
        b=s6AHOlWg2deWPUzAakdw2WBvpzEOnyC6kV1RVAXCpfRiplizozLW0AemyEbz2q87Px
         K3ZJbR8X+UVugfncmx7+v3bQZb0458Ma0CokgggfClzEQdZ5F36+KZvnv6jO8RtLB79q
         05EI6CvXj/KWNnYm7BbjriU7sbs/ebB9UglBFMBK9YNnjIzNFTsoHWfzDjQhcsEsOmiA
         vZhBijjCrT/dNni8aHWh/9K1iZ2kIspcGPev+0yVLUd47Sw2kbP9ODjzTMvXqs0sMB9t
         BxSsyJ5UHOgSrtcf4TnLbf/WGXOELhN7a42y7fVKfG2rQ2qHY7OfjPkH4E48lpkycLu8
         rKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597584; x=1796202384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LMXwRmfFOK9uVD3FtaSaYbnUZEWWNH1s5i6mBQwiM8=;
        b=0+xK8ErAIILcAJLsgToOHGsPlHWDnWOaSXX3Ch/vXCmWf+Q7eNqC3iAJd6k5uoGSj9
         eAV72thzAzIVvpT69mG+Ta1pPxxoVRdXjChq0eTn8RgsbudYtxKWo3Th4cDO3yjxcuEC
         5Nq2b2qavkGI7YEJUNa5RWB/ol1xXkrjL2B16inJoH4Vs55+nf0LllRLnnmgry3qQus2
         CkP3Wn8IDxVHNJArfN793y37Bo1mstBllKj+B9AyQcybOZyIZIQiQiVAFsYuQhK3Wz6M
         aJw+gEUXaKvfOrBlPHTEjICMg5m8I9dFuiJxMKKFXTpIahxLHkGxz0A7YBvqL6URWiE4
         t7KQ==
X-Forwarded-Encrypted: i=1; AL+hErFHJ2r5nIlIsKeTR6OJ0M4fe4SVoAeycQhrBAVjmvRRQjumPhx60fm8pKntCUL6mKIBcuFwtEZkEHBketY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gK0DOjk/A83rnXZUmHJCKWPBfMUvR58+TLKYrPuAaV13BzzyW
	dGOJRwRUZvW/+Apv2vqia0EopbWR7SSTMqlOh/BdHhnoXL6+ho6w36Q=
X-Gm-Gg: AZFdTZeiP85DXznE6LwzOY5z9NO/IH783+opaYiOl5nv2BQt5XSkcjR3NXMj2J4ru+9
	zL0yw7lz2cgpYCFAt1U3HR7+S/tdq08LacEWeffBtdEg5tSBGkod4dT47s0cImZQKeOal0SBKo+
	lm5NC7qQXk7QNdL+el2f+4KCVnlUKC27/Ez5URKtFWo7/5x+MV+Fq0KjtX3xL4ipSRXrAYjJ2+f
	KXZDkoY/NoAFtaRLSjRNb7ZCzi/375BTY4TvXA1I+mCzKVjUXXCOwPIk29E7qhkTz8dhvR/S1C0
	U0XUoMsXREUzwEVBPV1Cx6bRFpwsI9jzIyr5WRf3MyoDyTBKnWTjh5F0+9OWaQbG8Dpp12220+w
	07Ufy7ZIjjz4TJM1fEiPqEVtRIM0lakRzhfc57/4jgY+HSceXRZxTCo6vmpKEDlFJgR8xc22+L2
	rIOCOrQM0pKmnyEe1XA+RNJCogthXtpJQNK1Y+JMMO8OFEeByKi+K2McJxBNMHwGMQp5dCpPyP6
	GdsLm+2AxBPGkb7OmF15YKfLdgwaYlsGB8hRYsBVbKPt720dDBmFsrFiQRYuWMSvAm7OhBOxFcZ
	4IWvtKDYyQtG2KK3gtO0YjE5t+zOSWQPdg4JwCs8HS3EaozlHf996dSh3/kIYBaHwLYE
X-Received: by 2002:a05:6a00:2295:b0:881:b7d0:8dd5 with SMTP id d2e1a72fcca58-8c87bfa5502mr14791566b3a.32.1795597584300;
        Wed, 25 Nov 2026 01:06:24 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:44a2:4377:d176:9ad1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c228sm8468090b3a.10.2026.11.25.01.06.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 01:06:23 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: wil6210: fix BSS reference leak on unsupported EDMG config
Date: Wed, 25 Nov 2026 17:06:18 +0800
Message-ID: <rc-b1-20261110-vc-35-5e6ef2ea7917@gmail.com>
X-Mailer: git-send-email 2.50.1
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

wil_cfg80211_connect() takes a reference on the target BSS with
cfg80211_get_bss() and drops it with cfg80211_put_bss() at the out
label. Every error path after the lookup jumps there, except the one
for wil_get_wmi_edmg_channel(): when the requested EDMG bandwidth
configuration or channel bitmap is not supported, the function returns
directly and the BSS reference is never dropped.

Each such connect request leaks one reference, so the BSS entry is
never freed, even after it expires from the scan list.

Jump to the out label instead, like the other error paths.

Fixes: 9abe3e306ecc ("wil6210: Add EDMG channel support")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_WIL6210=m, CONFIG_CFG80211=m, CONFIG_COMPILE_TEST=y; baseline and patched cfg80211.o, no new warnings.
No hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

The path needs a connect request (CAP_NET_ADMIN) with an EDMG config the driver rejects, to a BSS already in the scan table.

 drivers/net/wireless/ath/wil6210/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wil6210/cfg80211.c b/drivers/net/wireless/ath/wil6210/cfg80211.c
index bf060281c9a2..0d256f313511 100644
--- a/drivers/net/wireless/ath/wil6210/cfg80211.c
+++ b/drivers/net/wireless/ath/wil6210/cfg80211.c
@@ -1356,7 +1356,7 @@ static int wil_cfg80211_connect(struct wiphy *wiphy,
 	rc = wil_get_wmi_edmg_channel(wil, sme->edmg.bw_config,
 				      sme->edmg.channels, &conn.edmg_channel);
 	if (rc < 0)
-		return rc;
+		goto out;
 
 	ether_addr_copy(conn.bssid, bss->bssid);
 	ether_addr_copy(conn.dst_mac, bss->bssid);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.50.1 (Apple Git-155)

