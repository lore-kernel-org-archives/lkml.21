Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174293;
	b=vj2Vpa4bDaXmx3AAbOiqaeYC9FO/UbeP0sV0t1HXwNhTDmp3JHJp12xqjfi8uUlmGyuT
	 2BteMwdl4kaYSccmU8ERATwJZDXTQY/HmwD3FNhNwwqp4Z9dEXIux55ytvPhfAch9D8um
	 fQo+3J1QxvSxFoS+P6DHde7R56boQL5mD1MCNdjO9Z3pvqLRUKndWk+ZgJMvImCoFPeot
	 gGjT/QE33E25H6YDaiQz5V1R+dk16xK4F7ldVyxfWfGFTpHUkelHuySr2Xf0S2p0dLf+9
	 o7HhfKtNBWWhNswjQBwzUepTct0uOMFCZ9kWtzMNQNhnpXVLLx4RijEehnecLZjPAYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RN3fElosL6X7ynaHhJ7HJN7Tql6O3iPIcev01utN+6w=;
	b=alFH6w25IAFD+cV+D8i91bZPv6Ro0tk+YM21EmNaUbSkE4oVyVVSLixlHrvZKfdzHUi+
	 1ZmYa6Ja8V98wbvRMKaSo2qKxPTcXSQ6JVU3zR9YsevNkHsxQHFefU43IBTZ/nUrp2sez
	 oPHK/YMNzkYucuM2f+4rjczPsee0pQi1GSn9jmm6W6RrvLUwKGw9qcybtif+4Yzq0MuvR
	 T4SlLPD1L/DKs9CocrJSStTnC/UPfGn88NUvZF+TwofzHICiyShGe/z8r6yJpaT174Wdj
	 URq/vccYdKK9uYOKQnFokdco49MVecl4FSYZCPlsbI7VU6j8GyJ5F753poMgdA04LPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AUgbvX/T";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE0760A2613
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE0760A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AUgbvX/T
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40319bdso983028eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174292; x=1795779092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RN3fElosL6X7ynaHhJ7HJN7Tql6O3iPIcev01utN+6w=;
        b=AUgbvX/TSS6tNw5+3KDU1/WIJKHjpbQMy9cnQ5YXRAaHrxpna5Zp6ZKGsAcscmH/2T
         0bs7z8iT87lW7QPiSWjT9wYFnKd0tP5IBzh0nPHoiC+j4Q1bTmiAt42xpsL303WQNo1o
         HATFaGB2+Y2prXnXdWrlnGI8a/S9vAlWyMs6+y+bb/xuS5pd5mPeS4fUBN4E5RM8Ba7n
         OmjDIoDQoMPdPDehkjxtXstmqU1s+kYVXEHKb1MTKzQh1x5qScoiYIVErpo0R5MyO71Q
         2nEeNiNfSaJISUhDU19Pm1e6vnFie5ISSiXudl+SGRTIkQsYa0abCU63FJYPw8hWcrRf
         k9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174292; x=1795779092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RN3fElosL6X7ynaHhJ7HJN7Tql6O3iPIcev01utN+6w=;
        b=NbkagDVmFA7k1pMEATh9WRWYlxpWj1i4DRao5yGazUzvkDdKSyQqsxG+AUZgEU5C2m
         AnybCSQ1hMak4vfa65fgVyaY89111877XQh6ieXsSOGr143yc2CySuqUM6Bvd67AhTyH
         X3OvceTtAsU7kHAjku4B0iIfCYPc9rIv7iAlUi3wzdw64R2Lr/hIzE6lgV1MP+RaoMbt
         2mwuxP5QoQc3dW8XEesSaGwnZkSytBVUrnESQGQIKVDTVAwAtyfxqvueeBgvyK3vvqaa
         tUHbF6C/2wutpzk3uDxPqA8rIrgHHBqbpX0C9IybTx8Z/BaoEhNlHMKmUX71B8YJJoOx
         /sSA==
X-Forwarded-Encrypted: i=1; AL+hErF5YQWcx6poEhglB9NKqRtELRX9kBKeyOOQbZksAYP8tI31hnERIsi9K3MBOAa+5wDw3pioH5KlNqzsIwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dnjFufMrcw68p9teTT0SwfMnLX6y0u6TlZjKtQV+GzOs0DSPz
	jbJ8sj+UU+aPQbIKEVImKlGMzsopOhY4JIDAgEuL6vMdPHpiW8KXKmMlTbWHTlh1ux0=
X-Gm-Gg: AZFdTZf3Jy7ckQOAy/Vo9hwg/xya6A0YPKlxdAH1g/fHh1TMe3D67eBvCE7N0g6QzZB
	9Y/uVjseaDGfvCr91kdUSHimbSmTEEFDY++ook/SB8ebUeWMSygQUR85iolLNPZAOPzDbReOMwb
	bYwBToId9Xd23A6DV8MQMeDkIVB1nOo2RvnashkLiDhLlTMS6JE6C1UP4Rf5tQqD64J05BhPqg6
	0li9RhdSZe3eDFfuVa6tJhA2wfiviiv6nxptPZ0aW2jJHC2cW8OdW2BMER2MqICuq/aQebTvEdT
	0gW9mFBlei5Z/v21HcEZca5dewCZrKcaUhRXQID/K05fPTLXZ+8aMiHUHx96ALxQLH9LHG5CDC1
	t4aj07mICVFCXTWQ0KkGKqbIeaOxIqvfjUKT4Z3NGrG51racFZIhBN+SVGePssxuw5rZhwRQBTg
	x221RLjXJ9HWxnNdO0RMEV3NWHyJjzDzaU6J1jkddvxW3kpfobuzPQO8R4HUpz5AX5OGSII75+9
	i+x+0U/xCSLsRCot+n8ccn70nZ5fir8v/npSMYyxVbmbReK9gRd1H3whUU7FBz9j1hPW9wAnHD1
	pVi7fmRkwWuBRrW8yj0nmxobbIzNCtdNcgutzDgqUF9RDUZoOah91omX/Jvk+MTcWcvCBKCDCVO
	A0WpggcJ8ZYXOF7Btg1cSs0N/jGPj7YAwfgLUjI6m8Ppi
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr1725380eec.37.1795174292223;
        Fri, 20 Nov 2026 03:31:32 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:31 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session for QoS null frames
Date: Fri, 20 Nov 2026 19:31:10 +0800
Message-ID: <20261120113116.153232-2-hjf3108@gmail.com>
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

rtl_tx_status() starts a TX BA session for any QoS null data frames,
so these polls start a session even though they do not carry data.
That costs an ADDBA exchange.

Check ieee80211_is_data_present() instead, so only frames that carry
data start a BA session.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rc.c b/drivers/net/wireless/realtek/rtlwifi/rc.c
index dcfaa98198..f475f1b8a9 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rc.c
@@ -216,7 +216,7 @@ static void rtl_tx_status(void *ppriv,
 	__le16 fc = rtl_get_fc(skb);
 	struct rtl_sta_info *sta_entry;
 
-	if (!priv_sta || !ieee80211_is_data(fc))
+	if (!priv_sta || !ieee80211_is_data_present(fc))
 		return;
 
 	if (rtl_is_special_data(mac->hw, skb, true, true))
-- 
2.53.0

