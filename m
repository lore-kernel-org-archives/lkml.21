Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288535;
	b=T0D9IT2WRlnqNs7l6EKCtjIg+oGI0z+uwgfhSuViRjGCZSMAPPPBICds1jHguFD/O1hf
	 53tWCV+8xeSR7Ll3udXRfZyfEbcE0tl/x6xB3O7CaoXN1sgVJiA14CVbGHwhdsLlOYU+1
	 DOxAbr6HiQyppcr4FvPNQzotuOE31+nUL7jNf4KYls/z22NYkmIKh9lHOcuOep9QaWTRX
	 fyjFmnOu0f7ljzs95dQkAW+B7jidW/1gfEJAiidf5wk671aPHWtT7tZK91wqrN4WFTj21
	 5h8kWBlhs5Qi7oMXd+ofwLcDkfE2jvK27nVxb7JF3j1euiiF/Dg8ygtN3N8WtjvKeuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1MzlxWZ/HAVpCFDFba1QK3LkoPsdLsMp3kiTEvRHveE=;
	b=QucyKseIBYz1KbcKHRhBBlcDedyzmUUbaAx8SA1+/fEYLZly4qeZuFjVD6xaXF1lK2vP
	 dSgysrmiD8ppMu139t4HFKIL4H2HhZPpcbJyn70cgQ8qzGOXZiNpJ2BppIQG5XMTnva1Q
	 ZVUu23FsWrDwcXBmKCNzgh/6U+TlYctiBCVRj/lt/Nk8JNDbmrDAVTSvsU+Tvt/xlHX3e
	 pv9CVCSTYnOF7MTgG/xpej0IhbhE22qg4aMtUfEN/x6ryekxMzArbJ1HqSB4/51llV6m6
	 II9lxHryo3XH1OA6DiXtPOri6SH29gau794RliGBrFXnlwebOBCqb627XCmIhapyxmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnS8tiTp;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8727E606A680
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8727E606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnS8tiTp
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1224041f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288534; x=1795893334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MzlxWZ/HAVpCFDFba1QK3LkoPsdLsMp3kiTEvRHveE=;
        b=lnS8tiTpfPE4dg0mYKrGYfssEFamQPEGLAoyzR2JCXE6irosUmmvDQcJk0vhNZLTq1
         zb9kA1PEZcM9leahj1092Xidib2F+jgcY2p4mswjKZzsDBnzvEL+dOW/f6dNDsAWpS3b
         7yqDIW8vWZbDqOYyKAWko1800sdI1u5x3dVilXLSy2CxbP6MJilPj3iv0hmnYQttxPw8
         OjjaNaVZSi9AyXhcM4eEvEIEjLdSEXufmKwvDgbCmkBwJSz1Wn9ncHyRUwJ6eClq9XDF
         SuY5+pgLD1LdGPu16AeNAKv+hDTYO+W5VLPEt/iccQnEt6iun/es4JZ1UsBmz+2ys8yb
         q4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288534; x=1795893334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MzlxWZ/HAVpCFDFba1QK3LkoPsdLsMp3kiTEvRHveE=;
        b=25bwzmIJJLtza/Ln2tZQ2nI48GEgn8zrFHyjp4eonlvc2FvGU7pjd2mP9jX86s8Dv7
         vIrE/vmoz2m8h5csmXAC+VwEVLh5zOoh9VgpGkSLgxxb+4v+if9XioKsA8H8Wlcmc58s
         tEc8Ba3jkyUuift/18G/GpvuRpd2jLRNOn29TTX+1MFDt7ABTL0D2y4RQ76usJhRXOt9
         Bh2wB1bi6AhSAtFXBD9b8BQjHA0Vn+t3GpdKp6AF97aFngrWmLWxWW4pUOvLs2MHBhY7
         Bm228xDveokK2eQWXgc6LE4teFQsA1qhha3kzN5Y/FZqDapEENEbzKDpIA77uylw4Wm8
         ZyYQ==
X-Forwarded-Encrypted: i=1; AL+hErEPeHF14UlRhYoPKk9eMhv4l97q+NcTLYJ8JGjLQPgZBHxrLmIkQRE4rKh5GFBo3UrofmeG7ug7giYtrRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hOKA1udSMpgE7TGt6oFSMitER7NNuKUDx7mLcQwQENAlqFGKI
	7j0iuxPoNQmSp7x/lDTEY/NrtwPN1rK0TYcSlN4lk5F1sQIoWrleyv0s
X-Gm-Gg: AZFdTZcE7z0HaNjetwVDGJeAoFmTae/Fh/9iifU05syn+afJw6aVWBrJWgQu0a63vht
	p0xMlcP1+61n3sTxJ7q6Umrk/nlyvCFgjT1HKpO/m+Kvu10WkvhIPLLLXYhFMwKiPjbbnRJl2hl
	zuU+y5GNy4Gnasq7uU+M9d4RBxZjtH2hs4YdFcFgKx6p3maV0piulYpbsqRVr+qB6jVC49MLNKl
	FhuhElc/wdSLpEwTYqKc1qgcQkiCmv6R2zjwcn3mqGA3RasCwEkrWfDCf/v8GEsyMvIhBBAPiUY
	YiB5gJq78X5jYCqjC/26BazAoX4G+Vgl3RZwUD24RKXo0CaixX60eZB1IvcWbIq29hESDKICKUj
	azUGHcGl/5EhhM7yobXg4KmsGBjodpq4LlPRjYDmPyPoOU+u082WlddSDnRgBXg89ll+21RIkp/
	Ycplnr6nbFOCrrtzOcuHtThDAj8tPHPJhXGNJ0xZOxMhLyhcZVAXse7cV0xhmmS9/Hs4mohofKO
	zPq837T6/2v27ulo71utLhH5ByRmRPhDhIWpnkZrYgCBJ+CVBxuW6UvwXu0//Z5be1Dofs4tbOd
	imasOdvKQJVsy8ZOIM8oMI53d6NO2wjvawI=
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr158434805e9.6.1795288533611;
        Sat, 21 Nov 2026 11:15:33 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:33 -0800 (PST)
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
Subject: [PATCH rtw-next v4 3/4] wifi: rtw88: do not drop stations when collecting them for an iteration
Date: Sat, 21 Nov 2026 20:15:27 +0100
Message-ID: <20261121191528.591334-4-mehmet.fide@gmail.com>
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

rtw_iterate_stas() allocates an entry with GFP_ATOMIC for each station
it collects, and skips the station when that fails. Once the firmware
recovery resets the stations through it (next patch), a skipped station
keeps its TX queues on rtwdev->txqs, and rtw_txq_init() later
reinitializes a list node that is still linked.

Link the stations through a list node in struct rtw_sta_info instead.
All callers hold rtwdev->mutex and no iterator collects again, so one
node per station is enough.

Skip stations without si->vif. A station moved back from ASSOC to AUTH
has gone through rtw_sta_remove() but is still found by the atomic
iterator, and mac80211 can free it without calling the driver before
the iterator runs.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/4EE3D95E-988D-4514-9849-9546CD49D8E9@linux.dev/
Fixes: 78d5bf925f30 ("wifi: rtw88: iterate over vif/sta list non-atomically")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v4: skip stations without si->vif (Luka Gejak)
    v3: new (Luka Gejak)

 drivers/net/wireless/realtek/rtw88/main.h |  1 +
 drivers/net/wireless/realtek/rtw88/util.c | 23 +++++++----------------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 5291de0ea38f..2830a5a57d61 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -792,6 +792,7 @@ struct rtw_sta_info {
 	struct cfg80211_bitrate_mask *mask;
 
 	struct work_struct rc_work;
+	struct list_head iter_list;
 };
 
 enum rtw_bfee_role {
diff --git a/drivers/net/wireless/realtek/rtw88/util.c b/drivers/net/wireless/realtek/rtw88/util.c
index fcd6eb1ab32a..8ade002426b9 100644
--- a/drivers/net/wireless/realtek/rtw88/util.c
+++ b/drivers/net/wireless/realtek/rtw88/util.c
@@ -107,11 +107,6 @@ void rtw_desc_to_mcsrate(u16 rate, u8 *mcs, u8 *nss)
 	}
 }
 
-struct rtw_stas_entry {
-	struct list_head list;
-	struct ieee80211_sta *sta;
-};
-
 struct rtw_iter_stas_data {
 	struct rtw_dev *rtwdev;
 	struct list_head list;
@@ -119,15 +114,13 @@ struct rtw_iter_stas_data {
 
 static void rtw_collect_sta_iter(void *data, struct ieee80211_sta *sta)
 {
+	struct rtw_sta_info *si = (struct rtw_sta_info *)sta->drv_priv;
 	struct rtw_iter_stas_data *iter_stas = data;
-	struct rtw_stas_entry *stas_entry;
 
-	stas_entry = kmalloc_obj(*stas_entry, GFP_ATOMIC);
-	if (!stas_entry)
+	if (!si->vif)
 		return;
 
-	stas_entry->sta = sta;
-	list_add_tail(&stas_entry->list, &iter_stas->list);
+	list_add_tail(&si->iter_list, &iter_stas->list);
 }
 
 void rtw_iterate_stas(struct rtw_dev *rtwdev,
@@ -136,7 +129,7 @@ void rtw_iterate_stas(struct rtw_dev *rtwdev,
 		      void *data)
 {
 	struct rtw_iter_stas_data iter_data;
-	struct rtw_stas_entry *sta_entry, *tmp;
+	struct rtw_sta_info *si, *tmp;
 
 	/* &rtwdev->mutex makes sure no stations can be removed between
 	 * collecting the stations and iterating over them.
@@ -149,11 +142,9 @@ void rtw_iterate_stas(struct rtw_dev *rtwdev,
 	ieee80211_iterate_stations_atomic(rtwdev->hw, rtw_collect_sta_iter,
 					  &iter_data);
 
-	list_for_each_entry_safe(sta_entry, tmp, &iter_data.list,
-				 list) {
-		list_del_init(&sta_entry->list);
-		iterator(data, sta_entry->sta);
-		kfree(sta_entry);
+	list_for_each_entry_safe(si, tmp, &iter_data.list, iter_list) {
+		list_del_init(&si->iter_list);
+		iterator(data, si->sta);
 	}
 }
 
-- 
2.56.0

