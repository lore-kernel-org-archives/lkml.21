Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288534;
	b=jwvyUqAqY7C8d+1ap2CKx+gC7i2HCDO3sFRHcKJlVC86bQD2VrumurQM7Io7ChipabLw
	 ZBxjqCks1Y1xonx6rZpQe+5K+U8U7RoiMtwEQDeXKvhqPakUSrsl/EpYSfMTZbwcrGLHg
	 DqtqL40xuB1dcMF8DihL8Mkq+pyt3TKwoU1A5SmGjeQgPmkqo0eQedhOJV8isVsnUKyZh
	 INVDepgczo3uuLwbcnmJx9JmETu7GWSI/yvg4dgnnfTvDbe5ylUZ2eNyv7XYmFwnmpwXy
	 6V+PMZIe8+YKrWvuANzduGc2tYcNf/kMj5o6cC2/xpSq9P3P5HZvTKRkP8oNfCxtAMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q4WD7Jk0cw2TjprWNqsQesqn3kn3kUHgcZy5hZWTIA8=;
	b=VvfillN6GtW/M8Aw4pQGGMhOYTvYBiLtu46o1XREJZ4oeGd3vzSMu8RaBptsP+YbtGGF
	 rDgsw6/PGZlOcKGdAPkoB3vlleuEbffPcfrwYKCbOOwiVhN+DEenoLvQPYrfjBGXvPvty
	 5CiF0EUdgSSv2m8mhyhsUSgljssecgyo+q+fKALZW0GAbJHb5/UwHNqrEXVTFkDKvpwH7
	 6CiOit57sWy/zSq7EFiP0sX8431rpto4x3RkXwmin8gK9IPsu26G+9J0HNCZUrkqh1WmW
	 csbp7iWbizIvs+cq5gRT2/t7lhJuwf2hEEnx5i8cr/yvNrsUvlMRzSqJN9h1YEXqA5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biOl1fS7;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F8606A335
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838F8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biOl1fS7
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb61185057so13089015e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288532; x=1795893332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4WD7Jk0cw2TjprWNqsQesqn3kn3kUHgcZy5hZWTIA8=;
        b=biOl1fS7Ss4E+Q1n81nIHaIPbpQwjXpgxrWdtRs8bmZZh8qWbVavgqucuLGq+PX83I
         4qxp9aCsmgpuW4LWaWnp8jy8AHzAnzQOZT93Sro9kj/jElmaZ0cEzKk//F9kGv+5xDod
         k59KBq8HrumEMVnN0Tjgl7LLLlf0/9ytBBCxSTPP8GrtXboATbFG3kvZ9ywPusd4fmW2
         dTVEP++GyYhHkqyCesH0FzFNlsOUE6Ri0fUC5XaI9dzhn2bYlFWyGse3a9CJudGbbtD8
         3eKLuKQny98pl5+A6ODggZ7JtNQe8V412sVCHBmM3br4JuekeSEL5kFDEbc40lCPZjON
         fhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288532; x=1795893332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4WD7Jk0cw2TjprWNqsQesqn3kn3kUHgcZy5hZWTIA8=;
        b=h4llbDtruASrZgqEuo4b0SAso9RhJM54ruVQPzEasUvPDDmn6pnsMfHssmdOBfJGTS
         SfodPNeZ40oZr/M+CB/7YI6V18AP+VHxf17uiZzzuMPoz0sBLJJ9q8SMR3CxAWXL5gpB
         v3JKm9daVX9rRlBdfIkZ+zJu0hO8JzwFpsEiCx8gJI9oSJYHOL6WjR7zxjX0UeQESx4F
         f8scwSRqRLVX04NFtoxH0xR4ouJ7YAhXZ97/mlLeeEaDr+84JTNvmzm3lY5+vVENgtLq
         q0Vw1tf4143eCXmbIVZa7AnOzNi/c/1Y9x7wwRw2tSRT0tNJ/2OUMGbCj6gQ5EHShBLC
         EMzg==
X-Forwarded-Encrypted: i=1; AL+hErGHc9TGHLVqVXmHCQJzs8w3CYH43xhBpnXWPtvhxD99V3dzifGVVNFlbXo1Unm1fFt988JR34XS9ZlJJME=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/rQ3pHN+muQhaDaksQUJGoE6Usu9dF3BzwszUoJx1S4ZN3swU
	YN/PgnSy4bGYbOkNgjXAusFISNwtu0V89eBiPzydPU5l0XXZvOuDvbsi
X-Gm-Gg: AZFdTZdKtwrm9T+b/bB37MO9yqgrEyowjiTnnXI7jn5lZKoPeMVG/OTgvecSgxvYBNz
	paYKE0cqmNEkqbdrrxlGkIHL/jJmLOfDtI7tPBJMFpLCgprsm/YYP/cR2B6fHMlaa5SLqBwFHbA
	4zsc90CJF+BOuECXxu6ehp59bt2f05t1f30WqUAvuGqm4RtTrC3TJJ4vpr0RWsChLq3cVORaSAx
	0kJc3PHd16eIp2JK+jZzVootWSo/4gy3fkY0p3wdcaoduiDnCRNpCdhZboAmxeuK8cHnlQP3zmA
	bQkpt9+1DPeEUSBkNPJhMgAXeH4FjHVWTxfWq6P60JlBf7Ap3Acvt7NpA9VMuwo6E14TfpubQEs
	yOrp2UZt8Ah7KAnDCcaa3mphEp3LtffTcyiK/TOOBcwyKq9Po60JcyhFz9p+199CQm76ePUya1w
	lMusPCmNPcL+Hd9PAPpM4uL+qdOtpV8eNmrAHa+ktiKAxjkeKCKv86/o+fssAsemcfLF/QSu8AA
	GMwaMR9bzj03LYkUpEpMl4kHaTRSml4hpUNlcNpeAhqmAv2TO+ZeNri8kxjKYM6FTZx9g6CU59x
	X2fOgv8vDMjf2BUMmOQ5hoecWX6viMF2XK8=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr175856705e9.14.1795288531829;
        Sat, 21 Nov 2026 11:15:31 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:31 -0800 (PST)
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
Subject: [PATCH rtw-next v4 1/4] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Sat, 21 Nov 2026 20:15:25 +0100
Message-ID: <20261121191528.591334-2-mehmet.fide@gmail.com>
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

After a firmware crash, mac80211 adds the interfaces again without
removing them first. rtw_ops_add_interface() then reinitializes the
reserved page list, and the pages allocated before the crash leak:

unreferenced object 0xffff0000cbe22c60 (size 96):
  comm "hostapd", pid 25545, jiffies 4296463067
  backtrace (crc cbdc21c4):
    kmemleak_alloc+0xcc/0xe4
    __kmalloc_cache_noprof+0x234/0x3bc
    rtw_add_rsvd_page+0x38/0xa8 [rtw88_core]
    rtw_add_rsvd_page_bcn+0x30/0x58 [rtw88_core]
    rtw_ops_add_interface+0x144/0x2cc [rtw88_core]

mac80211 zeroes the driver data of a new and of a removed interface, so
track in struct rtw_vif whether the list was initialized, and free the
old pages when the interface is added again. Until then the pages stay
on the list, so a download before the reconfiguration, from the beacon
update work or a WoWLAN suspend, still finds them.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Suggested-by: Zong-Zhe Yang <kevin_yang@realtek.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v4: keep the pages through the recovery and free them in
        rtw_ops_add_interface() (Zong-Zhe Yang); no port checks
    v3: no RTW_FLAG_RESTARTING test; the page download and the page
        location H2C do nothing while no port is in use (Luka Gejak)
    v2: the beacon update work does nothing while RTW_FLAG_RESTARTING is
        set (Luka Gejak)

 drivers/net/wireless/realtek/rtw88/mac80211.c | 8 +++++++-
 drivers/net/wireless/realtek/rtw88/main.h     | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 3029fbdb288a..b14d7fffb98f 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -166,10 +166,16 @@ static int rtw_ops_add_interface(struct ieee80211_hw *hw,
 	rtwvif->scan_req = NULL;
 	memset(&rtwvif->bfee, 0, sizeof(struct rtw_bfee));
 	rtw_txq_init(rtwdev, vif->txq);
-	INIT_LIST_HEAD(&rtwvif->rsvd_page_list);
 
 	mutex_lock(&rtwdev->mutex);
 
+	if (rtwvif->rsvd_page_inited) {
+		rtw_remove_rsvd_page(rtwdev, rtwvif);
+	} else {
+		INIT_LIST_HEAD(&rtwvif->rsvd_page_list);
+		rtwvif->rsvd_page_inited = true;
+	}
+
 	rtwvif->mac_id = rtw_acquire_macid(rtwdev);
 	if (rtwvif->mac_id >= RTW_MAX_MAC_ID_NUM) {
 		mutex_unlock(&rtwdev->mutex);
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 525f17590adb..5291de0ea38f 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -830,6 +830,7 @@ struct rtw_vif {
 	u8 bssid[ETH_ALEN];
 	u8 port;
 	u8 bcn_ctrl;
+	bool rsvd_page_inited;
 	struct list_head rsvd_page_list;
 	struct ieee80211_tx_queue_params tx_params[IEEE80211_NUM_ACS];
 	const struct rtw_vif_port *conf;
-- 
2.56.0

