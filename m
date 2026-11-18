Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015849;
	b=L3pzykADEOo4p8Bj7nLrefy++TPKgzhQVeQUP0nB25mGDWVVIEhSobWVem82Pw9uzyTQ
	 EN28y1bL036gNNAbZa8VH0zE0CtmiiQB+BqqpYUvUtfX13QML3seF8iRvLiCs9upnVJ44
	 mSF9sK9XAfo7/0VzbTqyEUxA2iLYw7DA0UmgK+jrF+NEgNSaWUplMm/FZyLF161AGf25O
	 k3AeA3z3doJZR8E29juaUbYQdJO/z7Os+n7p30id6f6RDwKA/ZjXQpax3XVc7grWAaj+9
	 5iNRB7zArIMqAb7AmK5KGhwULgIDT1ZT5TaO/wnVNJ9raGo/FAqoEms8//BgvEv41Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=;
	b=kKu58aIjYU1gpnzsIE6wIPh+qTR3LqI8WhJM8gUsA7MYDKSc8rc/bN1s5VpCbEevlDL3
	 +4TTY0gItC+VMimpkR3zXqt0s0+uEXgI60tfOd5z2FEwA0iaqNHTv6+Tm6YA8ZLCNPUib
	 cd9uZzXMIY/qVEm9hFUiD0h+aEQs2LAUeWNcg20g/W4PzNigXLALjGh+W5pafRCgbd2UD
	 DojvtFJlTe+SBLvMvrmteAiB8Vb6Hm969Q02yS6DraYMsaWpNHXE3aQCid7y6uo7FOkNX
	 AqSRAUbSZ6pq7AP2yjDh1kBL40++p3ig1YyeYJrZZ/w/xdNwj6LPgTCNBYN99292hpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=coRyIDaM;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE500606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE500606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=coRyIDaM
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-380b40319bdso1755028eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015848; x=1795620648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=;
        b=coRyIDaMOQEFVbLhQ1on5tKKR/VGPQUOYduGk91znhHifaYLMi5eQlgPpyvE9XbfO8
         /7bXVF3SjPkBWyEfqc8A+DyDvf3MT5zpceYvRherOdYjb3kZYJjzjWRJq2Whdb2BjG2C
         eG2mGvKd/C06IrnNGyPey/8P+aQujQRZ0r4MYliul53hr6fB2dg7OEER1WD/1xe+Nqr/
         gBMCaP7xjg/bwRt6vVARSjNSkkxk4qeMdrvgGSXAX28/B5UbzkEXwmBc6VsCM5xbzs8N
         dHQqXz7D2u6MyKUtY0VJoD5TTWGwEcO8v426PFMsn1sRQ2oHdALcTQzcr5ddvt4CQ//9
         qZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015848; x=1795620648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=;
        b=xzKop/WFufSCdXHbhCWOhrBlYRlOwobpp1ZUZmllD0wuq/48gA7Wu3f8YDZ3xT0fCi
         c1ZpdteJ6z7Hp2fILQoAqIvbv4ml9HMvhQmyb3QHGhovKufYw2WUnkJax/ROKLdMqZG5
         UJg+FPibZdHCaKO4kmbN2inFZTNlL2redcCcLlYDugMzXG7wQ5PmwNBmiLPzk1PYRvHy
         XX4r2066XiqNu+BdqbhgWPIf23jKLYubWLurF9sgYILaufrcbN0/h528hn/39TKSHD2J
         VCUz/40xmyNQLmZyhV8ptwoXCmH/TLHra7/FFAGX3cmiSfBhzoDv5nV2Xf3fyrj6ppxE
         O/Gg==
X-Forwarded-Encrypted: i=1; AL+hErFQFQEKl2Y0buCbCh/A/G6KPw00M9jk4nx+yYKELW1++/tMdr0eap6VLu3tTqQghmeoiS82Yv+b5npMZC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QH4s91XEb3ST5YG4dCFGbH4axjyE/kdONnLYUZRclqbAbJv3d
	RC1xFaoIhyuU25/EhVIxXYDK2D+YykCIKhdxkqSDvPbKBikm5wZKYOgU
X-Gm-Gg: AZFdTZdMZQtXsGjLwYkCsGRudXo7WxKIqaaQmdPqkzs30y5u4G5k6zY32FkeJFHBCK8
	FXHwYUT/F+SkVMTar3dQRILIRFJs3l15GHKH3E0lcfD1WwiAmUMFUlwi+OtVigXLzNmA3vDsKKP
	rOI64WOGgX1aJVxzRYrZoCG8/VAdnJ1TyJ9F09cid7jN0odbSSPie1hzu15b6I/rZg/23km23aB
	IbFpc658hFzT4/JRixuXGaBO+KV9JgVhCQ1XOW2hOs6AoGiGWccINWLlK8C/f18fZrSn6TsxJEJ
	VEAdu/kTXMjjaxB1WXeNX4KSYEgh7XkXdXUguEJwwXkkwI6VfwQ7MNNOxwsxZ7AuLJ9NcuY/89Y
	pHqO+zHU9Cw5dtwmji39qQuNiv7K9Oe3pEMXBNAhzPBS5k3iZyARfu3Wr10WFyFvYcskAok5Ldy
	bJl6nQWykkfwFz7L6Lw2WV4uIFIdpc4NzX2xQKF+nEjAqg+9HxEERbpryYb19lPf62j+YPalyRr
	59YqjSVj1HjCvVZt1rZZ2gTztaA3CzgkyFB8I2ZkNb9pCSUQXwImOTumlBaLnFFeHQxFY+m3+s1
	yNv7OdiZZi4C+NlruvPyESasWgsEI+oHsF7dvI2msK23IsPpolTDWdxgiQs=
X-Received: by 2002:a05:693c:69c7:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-3827f98a2d4mr2357647eec.8.1795015847374;
        Wed, 18 Nov 2026 07:30:47 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:46 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current 3/3] wifi: ath11k: keep the regulatory info store on a SERVICE_READY_EXT error
Date: Wed, 18 Nov 2026 23:29:42 +0800
Message-ID: <20261118152942.62838-4-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118152942.62838-1-enderaoelyther@gmail.com>
References: <20261118152942.62838-1-enderaoelyther@gmail.com>
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

ab->reg_info_store lives as long as the device. The first
SERVICE_READY_EXT event allocates it, every later firmware start reuses
it, the regulatory events keep the rules of each radio in it, and
ath11k_reg_free() frees it together with those rules when the device is
freed.

Commit 64828f091c7d ("wifi: ath11k: fix reg_info_store leak in
ath11k_service_ready_ext_event()") frees the store and clears the
pointer on the SERVICE_READY_EXT error path. When the event fails after
a firmware restart, that leaks the rules the store holds and leaves the
store NULL while the radios stay registered with mac80211:
ath11k_reg_handle_chan_list() then writes through the NULL pointer, and
the 6 GHz paths of ath11k_mac_op_add_interface(),
ath11k_mac_parse_tx_pwr_env() and ath11k_mac_op_sta_state() read
through it. The leak that commit addressed, a store allocated by a
first start that later fails, no longer needs it: ath11k_core_free()
frees the regulatory state on every teardown path.

Do not free the store on the error path.

AI assistance was used.

Fixes: 64828f091c7d ("wifi: ath11k: fix reg_info_store leak in ath11k_service_ready_ext_event()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in QEMU with KASAN, using a test module
that runs a SERVICE_READY_EXT and a regulatory event on a synthetic
device and then restarts it with a failing SERVICE_READY_EXT: without
this change the store pointer is cleared; with the series applied the
store keeps the country code and the rule count of the first start.

No new W=1, sparse or smatch warnings.

 drivers/net/wireless/ath/ath11k/wmi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e..bbca275a8289 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5136,15 +5136,6 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 
 err:
 	kfree(svc_rdy_ext.mac_phy_caps);
-
-	/*
-	 * During TLV iteration the WMI_TAG_SOC_HAL_REG_CAPABILITIES
-	 * handler may have allocated ab->reg_info_store, so free it
-	 * on error to avoid a memory leak
-	 */
-	kfree(ab->reg_info_store);
-	ab->reg_info_store = NULL;
-
 	ath11k_wmi_free_dbring_caps(ab);
 	return ret;
 }
-- 
2.56.1

