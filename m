Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174295;
	b=jVD0DOybZOiWvfCyn/HEsKGWaPHpgr0l36J+7iuGDdWLyz6flkDU/t0Zc8LkfdQGYeU1
	 hJZoSzG2XbdPmfTKVW7jNk3MrXGOoFHd50peCIAmnJb6I+TblA+eVKmZgCMTI/rIZuYCk
	 /JRM5HoIpgJ+J1lt7997QjDqfRzmprauxMyv3wF9m7TkznnZtdquapTduFYu8XwUBcmIV
	 TJ9gjRZeIwWAZcqjVISeB/zJTBK0hzsRmwY8BL5ZBBdtyRUEmalmdYSMJj1mI6CGFJ607
	 lho5BKUMg+wHVg9FPovYhkVwZa5e1CV/g19ofD5dGzDfYUNY6EfLMHymvsV8pIqzebA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hkxoyXqRzjUlQ2y1QbIjQVZOtcd8DMCdNL7Rr20ynWY=;
	b=n7Wv8q+jHvKtWOqIZbaF3Wl6LmXIx2Hayd/2WuEM0rs+8bn945UJtu5mMq+gTEycLyTd
	 uS6jVBxxk8ijwrqX+uLB2tPioCZNh6c6pItwUuG6+VRd9Uz3pTF9CnBgOPCxKqnEL8bn8
	 GNlJGNVy1nxHF5RpUptBYQ0CwcZq7In4hpqqJWWb+BoCQLRSIiE9xSQMKAGAoFC6M+i6i
	 xY0EA1UselS650dTvW+r9jad6YS22IyJE3uS1OW/Fx6vRJzGDiouvqcaVMRMuUJ6QSD/V
	 ehLfBQxLqNQ98OHvrndu3PWp6BnxBjFkMtl2V7PLTiBo29hss8KBNyPRYylCo0O75Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQzVyEyb;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1819D60A2629
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1819D60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQzVyEyb
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385d8a00598so682354eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174294; x=1795779094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hkxoyXqRzjUlQ2y1QbIjQVZOtcd8DMCdNL7Rr20ynWY=;
        b=KQzVyEybiqhhL7+5IqQj3S+P06TJgP8piKos39pF4jM7SgVW8syh4mfLbt/9KV8z5P
         fm5WWTpJt5Ly/E9pPKfvE/FX4iNBIPg1K00JcXSh8Agb3MxNHmwnbvmet4Z6+gCHelmn
         5N6M7QPPPkHns4KIdHTiP5Ri0Wo5pMST1U+EZqqS88Yp/fmXywbaktxv7kKkVl1rZb97
         +1E68B47qqZJZesj2AXjq8IZz77ZQD2iXARyFAxBJ6V2sDYxeT5EiCqOTNgvgV32ZYMm
         SDZuV87I5p1a4aMevKH1J9I/9spGWrYRwuDDCGfObAHTPWslxw1Y4jxwbKuE9aiqZMK5
         ExKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174294; x=1795779094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hkxoyXqRzjUlQ2y1QbIjQVZOtcd8DMCdNL7Rr20ynWY=;
        b=dx+W+pXGua4NRj/fTLIY6IA/gikIHqePnPkLtzMZ3xgMJ9tdmcMrOa/LrHsfVDUWcZ
         UMO4w816NqJoLHrL3B2Y7XdQvSrBwDEulO/gdsacIEw4soZXl2zC40dNbxD8sSReSs3t
         +yoAaeMtGnQn/Xl2Eu/Q2JRgJsp+5b8jLrtTLluQ+drBg6lyLA7qHPYG214fbppA+xXD
         xL1oP2IUPCn56RZxSOaexdsF1pAFLPDW0MQarX0ZSxqZuCis7HpB/vo//o1tPxM0LZml
         XvxQ00HBtaMH6F7gl31OF6vyg5C0cQ8eIlVNZ45urKutP3A6u4tyV+HFWvHodF5cVmIm
         815g==
X-Forwarded-Encrypted: i=1; AL+hErF7dfIzv9ajETiVdIJMoCZud7PFYJwV7etNcfGKYq4FK7N1iLwsWg35w12Y3XcOElJ2R+6Nm5TUAqopjlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+85KL1i1NrWyiCU2py7W6fHxtn1eR70H7vlctlYAceO+V8eZ5j
	ewKG56EjqOg9J+t/FPfKxjztV6BZ01zNZCFeUUv4hKpfjqA60KkXkhDg
X-Gm-Gg: AZFdTZfhoR8oA7dKVXhftRJkdgl702wEbaKIyRV5bH5ycapO1EYQeXTcViuiz5FWolG
	eDqo0HJQAPHh80lPGX1TC9nkY8wGHwrkj1R8qb0dWekgAIXIIAF251PfL50qtPH9rzxd/sEmp+G
	GXloZ7te74FhBKRrXXGb2Sy5/h1ICi5tDOmv15qFkxYS3YqlnZgw0mNm6apSjHBmlUKa+5mc52K
	j8hqUlKOlB3MefiYEek2Kk+4w6KZruxCwoF9NrY0QzKDnj7c1NpLMJAemDGRnaULtOYUfTV654X
	oTRs1h5F7zJafm6YyKjtJBY08wkDrQxXYHD5snOWEkCGICXiw7uyn2hgh6LamgtA9Mz22FyFD92
	1czXwA2mOewJoF/wzOY4CcGtACgGCLkmxXTOiKGrbcmug8921DnlE1U7JpI/tRGOuFaOq4Cpmbx
	sQjLKKsUtb2MyqN6XKs+iirHeMFItF3smcT1IlMHoqJylQc3EV0p2IbMTIxO2Z930yjlrbomZpe
	blAXUm0Di5b1y2GNmtGJWqVTJZPIYjp8zm7TYNn5hPI1+9/6VOKsqtzdMrMrAKzgsjkvxCiblVO
	1nSELk1DEaW3sD/3nqOx6vN6Bsp/wx/qOf8EBOqVkh4k3CYJwM6ojVYHuKB2UYjyO0sP7WeIVx2
	wWIk000xetTxHB4MNl38AkYIVTPgcxbciHjS6dq83HAsL
X-Received: by 2002:a05:7301:d587:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3856f25884emr2124360eec.11.1795174294252;
        Fri, 20 Nov 2026 03:31:34 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:33 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 2/5] wifi: rtlwifi: rtl8192d: report no signal for frames without PHY status
Date: Fri, 20 Nov 2026 19:31:11 +0800
Message-ID: <20261120113116.153232-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120113116.153232-1-hjf3108@gmail.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
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

Only the first frame of an A-MPDU comes with the PHY status.
This makes mac80211 report the correct value when queried from iw.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
index 9f9a344920..58f7ad4027 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
@@ -425,6 +425,8 @@ bool rtl92d_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *stats,
 						     stats->rx_bufshift);
 		_rtl92d_translate_rx_signal_stuff(hw, skb, stats, pdesc,
 						  p_drvinfo);
+	} else {
+		rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 	}
 	/*rx_status->qual = stats->signal; */
 	rx_status->signal = stats->recvsignalpower + 10;
-- 
2.53.0

