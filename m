Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290605;
	b=EDzJeuq49APjBoWm4YbWQwaUXp26dc0ea+YSZD6qvUS9rkHwxhc7x+ikqwsQZ0LW8ibp
	 rGiYoD+u7duDRdBf1c4yYTX3xPE2Fqf3QCBrJ9dLLUdgeZ8oC753lOFfIlcG8XyyPpdya
	 1cIMEu9Xy69G5MdBAB4PBeXCXHRFxTipAMfVn2bWEODJ4XhJmIhd9usScc+N3VecwyjlW
	 cMCWnL8ufWuw1w79u5y0wNt8nwsGN1wcg5JSJ2JrBP+s28UG/+2zbIlS8im3HNmrMMdve
	 wTqLFcR2+TCnHr2qTeMgNrv3TkA0i2NJXaq51L5npgSPS1IuMs8g2xFJ5ClJWJfrzrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N1ILjrfOvivQ9e4CltHPCcP/m7QhraXB8+5+5LIR19I=;
	b=eLM82czcFFuaXmwzeWbzZkXxFmVaDPceLkEAnGgv5OLKKhR2jGqwoS9lxhpWMRiKdTdR
	 25a0KFlVtw95mqD7VyvPJ/t4+xrG9AYVeEGl2qKDQ3aVtKAj81Q9QAWzkku5QNNtZ4vMq
	 F65GS8khiwQUgH1U0phehc9HS0scelc+B00OAnEkdV75qM+IznI1lPlchg7EmYt9fAHbe
	 to6WuHc0Cee8Ce1HTbL/9KqNt9XGLn9DHorezhoNPWgCrvV/SZKDzueFoi53o+9wWgpGT
	 zyXbrP/Fb4DXhjSvn7t+iyQFCeHx3NkwaCirqgsD7lEiT74y5wl623OMpgVJy1MspNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kFKBAb4s;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1F606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D1F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kFKBAb4s
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso14998575e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290603; x=1795895403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1ILjrfOvivQ9e4CltHPCcP/m7QhraXB8+5+5LIR19I=;
        b=kFKBAb4ssO+Rp3hQt6Nei/xj+qLxlRImVk+6cB97NKoebo/rfqd4aTD8QP8R2WDHok
         Ld2/BUqWl9uq8yQ+XC1q4wkGaaL9W4aQXSFuyaC5B7GtDTKjK+hbdSJ7GUglEYT1rj32
         e86VhJv1js/oKqtdGyKSMoeFEnLRfXGSITzlNMwup2Gk8D6FW9xDCjJRtngLSK4bqSpU
         wOTQtZWmxfBLgOx+qBTlbAdlXTMj2rnqfkhTJT9pjP5k2pS8Pd3y3CCI8UQ0I9JEoVma
         q6JGE+N5KeJnE2QE2Y1wrTGxqDpJccDhEfdGZYDwm/qy0Mgc45j3apjKZB18IrZ1c2aM
         /88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290603; x=1795895403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1ILjrfOvivQ9e4CltHPCcP/m7QhraXB8+5+5LIR19I=;
        b=VFRAAkTw5QKHXGUdBWq7YqSDVCshMp8xY075cfVwkWofhYMR99/R7f9phOA3OYuWfd
         MH3J9hL6kNcOeSpvDcBdV4nnKx2WYo3Q8uEHlLNB/gpiySiJxE6ZZNfuVhccFGmqzoPW
         StKq8tbHlpRaudRP6g8+FHAzw9HCNGfQtNTSGXS8+TL4TVe2dVRDSwp2zAqfcbtBNqh8
         h0yyhSALvuKNT8iFzMszCcMS9xJhQ6XEXrapFFjA1FdrKvX+SlbveFLPUWWgjb+5l80n
         W71WLycZIACO6OapBwxOkWu2Z9/8Dr8Zx4g7udVEX6R+VdcOMs4miDN16h+iLIY6tI5u
         RxxQ==
X-Forwarded-Encrypted: i=1; AL+hErEYV/lZI6s55DHX7lQ4303DGBoxEKUelxQF5CUm+JeRiit412m1yFR3ZvPk3MevXtlfloqmpYCymJ5onsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dNbomWc/N6wHwj0cU9nmoGm+B99jhERhlodk0W2LYtBuOB/5k
	1H+ZPt9LaJJxQ/CVPZbrqf2vMWRRBhIQwle38UywNuF8ZrHUPdXHTIPd
X-Gm-Gg: AZFdTZfMvjm3qkUHpdDMfOrLqYnEzeFN0touS0J/ZgIKzbclP02aDhu8zpWRR9wjwa5
	FwXdKRw4y4a0Tou3dJt9/D2MKjtKvZKSDXv4DbHr5gcFXHK39uLPUXqls5+nu/8wrQLj77qxcrp
	Lq9SJvpy9vrgpBry/IyEnh/XkKWoBt1BeRY9YKtw991p6GGckKKbwq+8FnG9ba9zuSTuzL+lm5q
	VGXD4uzUB0QzwEZOJwysuVDsREBCwegDH4PiB5Md5YDw92DY6MCmLG1JzaS5cf6HEDlauMdnjP2
	dT9YdieWcDJtImKBwaKDZkdE+Sik56Iu5/VMeZ8RZ9BLvmmh9JMDTun+G3YO9fB/d4mMvHI9R8M
	APkF7hohFLkU21LWwD1mmVIsZc+lYV+lILOZ/xhH4iVRhxR3KqioDF1Ujm57hS9CxGAT4+a0Z4p
	/buX7sf++Ujwlfwu2WDe48aIfeRIbKaxH3VSQzrR0l+27iiiLuVDL9hSv1W169yOconHwzpqFiH
	nZ1JQSeKiF3hL3bj1oHst6aR9XhikCM0UzcKesQ6CLlZR8EdwdzqrQhpwdufsSufnjxpxySMLH+
	rz2IBEfQ1h4WVWOFzgX2FdkEkABFd5fdOqdSqlm6BnbZ/8VwCaCmljhzTD0=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr149032465e9.26.1795290603440;
        Sat, 21 Nov 2026 11:50:03 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:50:03 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 3/3] wifi: ath10k: add firmware feature bit to force passive scan on 5 GHz
Date: Sat, 21 Nov 2026 20:49:39 +0100
Message-ID: <20261121194939.3647400-4-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121194939.3647400-1-morf3089@gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com>
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

On SDM660 (WCN3990), no 5 GHz BSS is ever found when 5 GHz channels
are scanned actively. Marking the channels passive makes them show up.
2.4 GHz is unaffected.

Add ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ; when set by firmware-N.bin,
mark every 5 GHz channel passive in the WMI channel list. Since no
probe requests are sent on 5 GHz with the bit set, hidden 5 GHz
networks are not discovered, and the flag applies to the whole channel
list, so it should only be set for firmware used in station mode.

Tested on SDM660 (WCN3990).

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6272e0f62..6ce819e06 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -817,6 +817,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
 	[ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] = "no-chan-stat-event",
 	[ATH10K_FW_FEATURE_NO_QUIET_MODE] = "no-quiet-mode",
+	[ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ] = "passive-scan-5ghz",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 5dd21f063..482195d28 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -846,6 +846,11 @@ enum ath10k_fw_features {
 	 */
 	ATH10K_FW_FEATURE_NO_QUIET_MODE = 24,
 
+	/* Firmware does not tune the radio during active scan on 5 GHz
+	 * channels, all 5 GHz channels must be scanned passively.
+	 */
+	ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ = 25,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d..7710310dd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3448,6 +3448,11 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 			passive = channel->flags & IEEE80211_CHAN_NO_IR;
 			ch->passive = passive;
 
+			if (channel->band == NL80211_BAND_5GHZ &&
+			    test_bit(ATH10K_FW_FEATURE_PASSIVE_SCAN_5GHZ,
+				     ar->running_fw->fw_file.fw_features))
+				ch->passive = true;
+
 			/* the firmware is ignoring the "radar" flag of the
 			 * channel and is scanning actively using Probe Requests
 			 * on "Radar detection"/DFS channels which are not
-- 
2.56.1

