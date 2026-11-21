Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278974;
	b=bIxgrKSySZKhkTAOHDPXNSzR8QkLN1WEy8B+HPmgeCOR27A3IoXAAxSPyF1G7IPygj/0
	 EYvpn1dws2+J+XX86eRq0p7i+5is2HLhyQRg9sy+kH+klZlUZPeB8UF+8Jqs2gXBMA//F
	 pWMb4E99J06Iwtk0EdzSqanqUGe3PSdHottRm/9oEA0rgZPrG/xbJ+qdT9otaHIooMAuF
	 RZJzZH1XnO86EeYV8llxLi/RsZ1c9PTsrHTyKfH9HHV4qaHArFc8bmjUp97w7cQASFPZV
	 EpzTIUCL7SIQN02SBBaGWbjfpUEIgiIzDWv6ZF4v0QgjBUxA50ytGpAja7YiyRAF0EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CN2TDQcri811lkCR+dibSRTuGc/getXYtioaM5I9ehA=;
	b=4/VoMtGq1SBnyz4wETDnYk4QBu5o2Kvcoreay9YKtN4YLGZ6Yv1FUKMjZE58MdBNyljt
	 WEj7rCNk90bVm+GETEYGIJKYJDnBOwuaDRBuC7oFE8J2WXCJ9+6alUVvQ73Yec97ZPZkf
	 PxSS7c8eOVlwCXTwTMvMK/Pt0gjIlbjITRPSIwGmZIyhDj/QgO7DMjJil10wxz6vRqSKm
	 UOiCjN0GYsinkAOl4Jg8S5L5TbpiLZAixYRH5OzYI7VRH8iULmlyOCOeCE5Ebtk9S9lE0
	 IxZMMwe9E45mepq1EQ696l2b/RbPNKmPG3HwXpG7CHxLgfmJGxVBLwsrp25ggNvwKXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3opAT5u;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166F460A262A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166F460A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3opAT5u
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cddc250d815so750445a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278973; x=1795883773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CN2TDQcri811lkCR+dibSRTuGc/getXYtioaM5I9ehA=;
        b=F3opAT5uT5WeMpA6P9ZDThjTkKAhTq/Mnv0NZsfDqtIu0emfdrxSLVpLNN/gaIuX+t
         gMcR963thMg0lWqpESd6MKIkd9xJ1pqbTBeyAmoYoFn9pONNSzC6ksgqxnPgfLHGnX2q
         9d2yuU/Q/BXx7wtUONmetVltMTL2LOK44Tv22Z2QL7DNJyMnbbuVOlEfej733ZP4g7eF
         9101yyJpqRyqldECZOBJkhGsD7Eyl1Ah+ZhOD1Hwzh2iMrVo48n7SaUyJzcW5YVhl5wn
         zJAPhHmIc4L2zC9m/KwG1oDH5FvqS9IJaFxLavNUzqp9J2MiFKu50paDxeMSVnyMGurS
         IcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278973; x=1795883773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CN2TDQcri811lkCR+dibSRTuGc/getXYtioaM5I9ehA=;
        b=m8NC7eN7CQFwHIT9E4zbbo7NSm138lgqGjgRqbmQe05be/e0tnMIiJ8QAu4bgkiOGS
         YKcBdRfmJV/QTLr/Qp6RnvtD3Hka/pvv6I4iFKt+0lzxZo9vIxv12tu+c6CL02D8uxZz
         Wg87OVF3lR5ue/WHzEpxHmWCsAryzBRGBtJviilKc68GpLohv56TE8c0rUMjHsHTH60t
         96s3c8j1ETTNmq5yfc6xlmU/aeCuea6xphNcZ1HqXiuonsTLgUM/pQTmpuSqiEJc+QcA
         kmWE7xLQPWOGsPUOs5Aw1mJ1jPKIQCwfGbKHfMvVhUyZEUVlcsjFQvBZ2tmntIJmAPe3
         kYcQ==
X-Forwarded-Encrypted: i=1; AL+hErEU/TK0fTOXbFMJYwNOc0/9d4ga+R+SezB+BoKCON25635ryfzBYvHwYiXtgC9QLxuAh3rv8CltpdsVSFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xbAj284W9Efx+kCMF6dDJTELVZrl06yqG87Cypc5L/bfgEaer
	+KPDKH51lEoiB3W2U/kmIQYCfdTlSuH1wPSg7yQHvv5bTbhm9ovPCZem
X-Gm-Gg: AZFdTZe7aq7u1jfSUz5FwFkChLzTeq9xSP63M8B6QuixczaFdiWQCCdR47AYigE5+5V
	dQ6D2AVQgBivR9PPt66cC5qzOoaiONyuigCcsdZlqigpKV+7q4Xp7gtcFadwVi5OR8n3iI5xzti
	lCqjKmGvFH9hB7PESAzVtyg9cinH/9vMXqJ3ULWQif8sxwGpRwDbmwG5JdlRvfAub8qNFYAnaPn
	BT77jqEkoALmUdYs6eUgo15aAhHnl+n5Ip5TkEpDF+ppiz3fOfLi1oW7SOycaefWi2kxURQIPn/
	v9rXcvyeJHLRXkdFAHU5gmUZofE6u3VrQId9Ardlmfhp8MfJ6Ju1TGlGPsobEoBYySpC8TB6xEH
	0YBjPIWa4jTN79mfqiGUDceWYUdYwWXK5tayfvkcVPJ50Cu8wJJQP+lx+Q46Ptl8hkSEor/0um1
	YuuqaW+V6j/f0zmHaJCrR4DcvwGfB4UNvWzcd+f5v4SHxilGq2xIHA1J/X1HHjQx9IuQJG3wFE3
	ij2QJbNmBHEWCKlHTjbe09dlVa+txtWV2uUAQp7HQPsSn7NLUt2dLL4PA+QvSkiNwdJB/qpHsIQ
	scPOjlZfLHak/87JbahgRsDuxiBoFPDMSVk8fJxJQvdL+1hb8vGkE1HzcnFN+2Ph82gfwIz2WEW
	CEGZm
X-Received: by 2002:a17:90b:1802:b0:3b0:c11a:9026 with SMTP id 98e67ed59e1d1-3b41c95fa0cmr6410192a91.55.1795278973307;
        Sat, 21 Nov 2026 08:36:13 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm12357403a91.5.2026.11.21.08.36.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 08:36:13 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	Morning Star <alexbestoso@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next 0/3] wifi: rtlwifi: don't mark unencrypted frames as decrypted
Date: Sun, 22 Nov 2026 00:35:44 +0800
Message-ID: <20261121163547.37019-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The SWDEC bit of an rtlwifi receive descriptor is set when a frame still
needs software decryption. It is also clear for a frame that was never
encrypted, so a driver that sets RX_FLAG_DECRYPTED from it alone tells
mac80211 that plaintext was decrypted. mac80211 then accepts an
unprotected unicast data frame although a pairwise key is installed, and
unprotected deauthentication and disassociation frames on a connection
that uses management frame protection.

Patches 1 and 2 set the flag only for a protected frame that is not a
robust management frame in rtl8192ce and rtl8192se, as the newer rtlwifi
chips do, and replace the vendor comment above the test, which no longer
matches. Patch 3 does the same for rtl8192cu, which also set the flag
for protected robust management frames and so skipped their software
decryption and MIC verification. It reads the header only when the URB
holds the frame control field.

The other rtlwifi receive descriptor parsers do not mark plaintext
frames as decrypted. rtl8188ee, rtl8192ee, rtl8723ae, rtl8723be and
rtl8821ae already use the same test. rtlwifi's process_agg_start()
marks only the DELBA frame it builds itself. The usb_rx_hdl hook of
rtl8192cu, whose _rtl_rx_process() sets the flag from SWDEC alone, is
never called.

rtl8192d (rtl8192de/rtl8192du) is intentionally left untouched here:
it checks the cipher reported in the RX descriptor, so unencrypted
frames are not marked as decrypted. However, when a cipher is reported
and SWDEC is clear, it still sets RX_FLAG_DECRYPTED for protected
robust management frames. Ping-Ke, does RTL8192D decrypt those in
hardware (or set SWDEC / report no cipher for them), or does it need a
robust management frame exclusion too?

Zhao Li (3):
  wifi: rtlwifi: rtl8192ce: don't mark unencrypted frames as decrypted
  wifi: rtlwifi: rtl8192se: don't mark unencrypted frames as decrypted
  wifi: rtlwifi: rtl8192cu: don't mark undecrypted frames as decrypted

 .../wireless/realtek/rtlwifi/rtl8192ce/trx.c    | 17 +++++------------
 .../wireless/realtek/rtlwifi/rtl8192cu/trx.c    | 14 ++++++++++----
 .../wireless/realtek/rtlwifi/rtl8192se/trx.c    | 16 +++++-----------
 3 files changed, 20 insertions(+), 27 deletions(-)


base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.56.1

