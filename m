Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881816;
	b=qiX/U0hCFDq+lPHhlz0XFyr4A/uLpX2RIBkBTJB9Fviq8o5d4cjRGxRq4p7Gy98ntZ9e
	 0aoNV5+8NYxKwgUZGrPH7IWg/cFJxipS6ojlMI/xIAEOcck/vsz6X8AD5052NpcU+L71P
	 lEJSkcHdo7gXKBbhkjNThtxkh/XjbfxFp4yzeEVcIjr9g9vViyjHadEYFTPQ2u6O2wdF4
	 f/zh3XvY0SB2qTHgD3hW251gRAryQB2EgfbhfjT/tk9fYhwPQNNQShtB9+ZwK1nmGL7rk
	 Udl3ua7nU78bU1d/egPeGsKT+iwBrBPpX/9PfxBqyc6Vm6/Cct4Ddn+tJq6seSBQGFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
	b=b0YTDX179/86gbKx0BA2NJgl18md4cokASkLSsidEAUAVd2DrzpiQW9BCwtthrC2KTkW
	 wKUGA4agQ6+ZAvhvcOIAXdbDoPpxQnJ0K0Qwv1Fnd/jdG13rXzZzc0Vgq/GTs2NL8FM/H
	 gvZIu05WmCjMSY0xiQfFT27q9omtd4kM7A5sLbGbtiurmlfu75cQf98g3yPbbzTAgg8nc
	 NA0mVVnqjzMt6cRhhiBxs+ZzZL4cksPjEafDmRk51RAlIzRGPmKTmKFKqwcv3WXDQifvv
	 uBXAI3lb0jbVFiUuawTVV/rkrqrQmN6Rjqg4nBX+EOQOVzdrfz4z/36G1M8hO/iRK6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ilMK2C9g;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962CD606A683
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962CD606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ilMK2C9g
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4322d310e7so533640066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881815; x=1796486615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
        b=ilMK2C9g6rVfiATl44chV9H2FKBnw7kDzk3HUGnproo1R0/aoXT9dTPOEKxIScwtdv
         TNIPJXxBERRUjJX0qX4ahuBDyDxpD12YKWEcY4VQPzVaekB50PZLbT2OegJIAs/rRDRL
         V7TDVEsj0amXEzUmjRIBZWW7XSYiywn3MHBInd3S6+SSzMNws9rCG0219GUwLdOj7eIr
         5gmPIcCVPQhQFmKzOh2Rtc2zD9L1dyM2LPRAxJfXe1VUSH/kP9ZUBCayAaiM8nkdzz6g
         VnVOVkCD2Fc7mcsWq5GBmXPatO5cs7Ek95sziKpkwUYTnVLBH0w5uSPvphbEAxXlFss3
         CQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881815; x=1796486615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
        b=HMKuEEwb/w1bMQN/ywpAzP2tOXYuEMSVwg40AANQn6mwutYKgJ0pulj5PsW3kmhbsp
         zGNfFDkSdNX10tk5IfnTLDRIgplnIGvoAmINYH7PiZ/bc1D3/0w6bp4KwKFlvyiXZ8Fw
         tYvCeGhd3oCLblP/GBVZr43V1I7xEVWyftb4duwLEvrDGD9eahS4eb0z4Rxb/zPBKpaj
         6YHwzlgOGfFGw/df2m1bLSW6lBOA4YqBqHK1MhHkFBWDGQdps+UWM+3v8+WXjREhnUpX
         vxTFSANlf/nIDdsPjfwbKVWFMV6sleu7iLT0sYrpc/5XYNgf3Udjy6L57L5fkx8XIil+
         XxVQ==
X-Forwarded-Encrypted: i=1; AL+hErG2SSNsn1ERxe4QVuLwo1gitAkUH1Q32rWxf/AOcj2zkmvjR2ufVcrTq58goJXcUrjrITnxHxj1ORQoa88=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rUHDGodK4vzx9KPsJNGEAAzpRlnIy645KrCwcsM/7bY6MnYEt
	jS1d4K1l/W5f7ymKWfV67lTdc71yK5NCHyHwscqAVSw3Iuwu6e+IWPCN8N+vxBpXqA==
X-Gm-Gg: AZFdTZfudhDkel7OoIjrkRFVKHFVzUUctlU5Dt9n/WYZXRlshhL4ynJz47+q3EzScsY
	7bA2esT1ONuuApuIu47Al40EduHKqqZ1OVXIExpVFq0gFtYc9VomMy8Cv9lJlpQ/M/jgRjL0gkL
	ra0wkshyx9tDXOZ8xMdGl1T7dbLgjiFXRj7soPCGPr1RDn8Nk6HnDtjCnG/IKdXFNjm2jbOd6uj
	PKWCREZywxCbHlXOGBtsqT0Ub3D0nu3+3+zocAW9FwGc0UZv5e8jfGgTpmLqYc0rTpEOce1/bO/
	FzDvZzcdLs4pqIsxm8XRuNYbTdr362iiv0ubcLGq5Y8lEfUGYnjmKunXOKT9UWuwZXjPKlKRuD0
	jqvELpskutEkuaaZFpq+1dvUVEosN5TxweZJi84UhcNJJqDIxo07dxF7awNX9HwhINeL25ahepo
	111makLPRDgjJgD6YGMgZ5OvCIAa+AI9SmmcMJqABBtKc6lIB5aWxf1RFhMAtE+0bDfZRtTqaXD
	2ZSHUKNYXASva8wCPym2L7qy+3ortEg2+Z/rAxtLIUwSdPsijA2/8G7iV+Em4O1XTR8rr+m14T/
	u5yKTkHaNtOWpWgcXnryEcYvitFKyYZ2RPjZ0k1wH2Lxdvg/SSuiquYlcc9tUMF0XBI6mzoCbxX
	uoJTi5uCacbHuY7OwuIiNAH3qLIpFvXeTPK7opLn4QgX/EcZOCFlLv2jItUZ0PguU9L9gN93Iip
	2wX4lissahsgJZ8PATLTbz8gc1fNgWEAfMfGVi6MhsQgbNwOes49628yAYz+y6AC4sYBe0imzTy
	CqntLSehPKtuesEISi7ASHHr0fbKhm61NAMtmXUD9xmirFT4mVX/EMPF0A+V8nAej2oCqJOpPUa
	6aFNkI2Mk2PsWQ==
X-Received: by 2002:a17:906:bcfb:b0:c40:b59:1b with SMTP id a640c23a62f3a-c513aca41b9mr1650900866b.44.1795881814994;
        Sat, 28 Nov 2026 08:03:34 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:33 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 2/7] wifi: mac80211: use the ampdu argument of ieee80211_calc_expected_tx_airtime()
Date: Sat, 28 Nov 2026 17:03:30 +0100
Message-ID: <20261128160335.1815537-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
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

Since ieee80211_rate_expected_tx_airtime() was split out,
ieee80211_calc_expected_tx_airtime() passes true to it and ignores its
own ampdu argument. ieee80211_tx_dequeue() passes false for a frame on
the VO queue, which AQL is then charged as part of an A-MPDU: its PHY
overhead is divided by 2 to 64 instead of charged in full.

Pass ampdu on.

Found by an LLM review (Claude) of the airtime code.

Fixes: 094dc1619cb0 ("wifi: mac80211: factor out part of ieee80211_calc_expected_tx_airtime")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New.

 net/mac80211/airtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index 55bc451d4a9d..d3b911fb711a 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -843,7 +843,7 @@ u32 ieee80211_calc_expected_tx_airtime(struct ieee80211_hw *hw,
 		u32 duration;
 
 		duration = ieee80211_rate_expected_tx_airtime(hw, tx_rate, ri,
-							      band, true, len);
+							      band, ampdu, len);
 		duration /= 1024;
 
 		return max_t(u32, duration, 4);
-- 
2.53.0

