Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099375;
	b=F7x3mNAx2ScEGFKu4tRjpTAVDC7aG5lYJvO59FnoLotpiZiHxZkI/sDqRTn9sl5SYSSv
	 Id88O1hsNVloSAQO4+iJfywi7ln/UP6wRfG4juUfQ2kgwsRmm0FvGhZqNjJQ0plXycu70
	 F48f8QVyvwUjkB04eFi3L13JbZaE9WawetcVMiNjsYAgbouMwxthFnSfCV8F9qE2awTkh
	 uajO/YY+lMuY0lwROkFSJfaYwHZRAm9g/cvVccXNq/mThLW5UTArWx5/+Jj3l6NPHGEKQ
	 TWhYy0bhPieFehd+sYBAne+dZJlDGKHD1ppbMvZewca4jEVrW5IJwg/9avCivJbFHCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=52+JnzHR7Q9S8eHgTb67S23dwF/n03+ylGtQP9LSPX4=;
	b=GRwUZqnxbjOjBxqtzMN/BP2DGAzn0z4J+YQhD7iaj+DWrPPigL/0kkPuP8+Y4Y3dvGFB
	 TbYq2b3ZV7gb/ZfCI6yviMi50DRLyGYPkD9Ru1biWuoXeKBxh4USAxTqNGpmjm6xxoc1N
	 3bBELKrAqwFwo5YGey/kleumVgB8Z2SIUi56DSOyYuNHi6WQOOLWgyZTm0xnsM30Uevrb
	 sq3fedg3LGfflO5GjaHP7F7rz4eyvIB6RC3ebbrpAGhuadmfbAjNoASamk8bpGpcbJZQr
	 uaGB6pzmfrx/ZvZZ1wTgGQS3Rf3KJRATNx1qOziyXzsN+q4zFvTNYmpvCtdffz80uKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1G4GBKn;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FFD60A263B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FFD60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1G4GBKn
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so6149891eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099375; x=1795704175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52+JnzHR7Q9S8eHgTb67S23dwF/n03+ylGtQP9LSPX4=;
        b=M1G4GBKnnz8x5UyDeEAaQ7PbQtG7pv+APg53+J8nIDZc9JIvywGhxFKegufqSmm4ud
         oKhn2LLj3rBsRmoTiHCc6Y8wTteldNMdmsrVi8DvLX4Q2mfe5rHrchWuqHSUeXNVf953
         gLiyYcavyQXq7NBaworc16ImcWRkVUFitUdBv2IRtB/V10HKasv7TELTdU0/0pOzdrmb
         p9Kjcf7Mk/4Ib12b2OlZI7LFbomYpCz7C79h7gkK7HUYV0+CFfCNpt0pDSCskqkh2GTz
         CTalF1BdhY3cCTRbdhWSoXea8TviMdNEKQnBeAXznKxGRO+sNem7UgeEC6WV+Mj05n++
         A6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099375; x=1795704175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52+JnzHR7Q9S8eHgTb67S23dwF/n03+ylGtQP9LSPX4=;
        b=sFwpmBpJ+XWBfcYhrPCGDQY1Kxsox79vqryjDx7eIQPtx0R0Jzw0mUdvbZ8VykAtBo
         pkJ+BAhjcM4aI0TqRHbRpwDzBOr+5EVlgz4UzjkNkeSeexLhxiy3b9s/figghJ1TE6sF
         Yqiwm5iC7LvlJi0aZV3ePwSTGWaV9vUaZO/+3C8KiAzvjJmxrtriR0SFC9qMBDk0Emtk
         zg3z9matkeNQpvsi/MnGlBla1ByRW1ipiLHB1dcVDBMIlMHGhjbX+9l/u4/gLSBC+ii0
         ZuLKEIhkGT0Ys9MsYp8TnU72bakHrn2YLSxASRFG91eRoF+2Q44yR5TMi8Ypyj0Z4+Pb
         s95w==
X-Forwarded-Encrypted: i=1; AL+hErHACG2gVokumyhq0OUCV4cZ1HzCUtf3vosz6yPJfEWR56J3qZ15KaUK5I1Rp95FE1XsIuJL+1haWiSxw2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o55Iv8833RUzsnDgHrODZefiCbm9Ktmco8jaXpuBObSixHtzY
	01c9div3C8wEcgIh/5sxh+gjRrL4xNMpYExu5RJxc6cdrM7S3JYm0hrNIMt0mLWD
X-Gm-Gg: AZFdTZexkXNVHHcausWmeLJLtQYAMmPpUnFJXfuGZ4q2ODnzTAgYivUNGqa0jhBp+LF
	bXaWwMMqOBUcDMN0IrKCiZtq0ERgtrMkS6GduLrYY5gteQmjmGUyf/VFvMqcnGW8UwczlQFftWt
	PZf+Kg6VqkBZmP1Af2f6Svz9+1zN3h/9gZ0EWDcIiX6EA52u8sRMNbc3OKKFOL1VgYzqNl/6ohU
	JAKFb8gXKZqY+XMhl8TsVBmw0UyyPXsKu8tBGJPjOPPWyO20yaHvFwrClxE/4Bc2Ts/jEJKcvse
	ZQrGpHiipPl/HGB8xJV4eOJ40DxcPdX1y/L2iiqX2PDQ6UQysZwH87cIOKlN2bWcve3R+mAy3Qp
	nwqVSlJDYrJNIcbRr33jkxJ7vwb1e8czBaJN9aBUGc2C7U1q4cqG0wQAvcCApqBkz+vXVdOMumS
	R99ncp8goDN3jvKXteAecWL797FTHEJK56Gf9H+bPWmkuPcNgFrpUca/k2w3RgloZbsvjUdsYqQ
	TaEHhCaZHTa6QjhNzHvhJGlkg7M2mz3M3BVWEB3iQPlk0onnulvg5ZATm/GU7p4Ri2V3DcBJOiT
	5L/XDKCsLowexupf1yaz1btg/YWicwh+Ld0f2S36BSyc6yZWrA==
X-Received: by 2002:a05:7300:271e:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3827fe755c8mr6031110eec.14.1795099374635;
        Thu, 19 Nov 2026 06:42:54 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:42:54 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 1/4] net: tun_vnet: validate hdr_len after skipping header padding
Date: Thu, 19 Nov 2026 23:42:36 +0900
Message-ID: <20261119144241.360238-2-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144241.360238-1-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

__tun_vnet_hdr_get() checks hdr_len against iov_iter_count(from) before
advancing past the configured virtio header padding. With a 512-byte
header and a 14-byte Ethernet frame, hdr_len=256 passes because the
iterator still includes header padding. After the advance, only
14 bytes remain. tun_get_user() and tap_get_user() can then reserve a
linear skb area larger than the frame and transmit uncopied bytes.

Advance past the padding before comparing hdr_len with the remaining
payload. Both callers return immediately on error and discard their
iterator, so the cursor position on -EINVAL is not observable by them.

The problem was identified during review of the tap zero-copy fix and
reproduced with vhost-net in an x86-64 QEMU guest: a 14-byte input
produced a 256-byte frame on both tun and tap. After the change, both
drivers reject that input with -EINVAL. The new tun and tap selftests
pass on the patched kernel.

Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Fixes: 2506251e81d1 ("tun: Decouple vnet handling")
Fixes: 6a53fc5a8770 ("tap: Use tun's vnet-related code")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/net/tun_vnet.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
index f4c652b1fa44..0b9622891681 100644
--- a/drivers/net/tun_vnet.h
+++ b/drivers/net/tun_vnet.h
@@ -138,11 +138,10 @@ static inline int __tun_vnet_hdr_get(int sz, unsigned int flags,
 		hdr->hdr_len = cpu_to_tun_vnet16(flags, hdr_len);
 	}
 
+	iov_iter_advance(from, sz - parsed_size);
 	if (hdr_len > iov_iter_count(from))
 		return -EINVAL;
 
-	iov_iter_advance(from, sz - parsed_size);
-
 	return hdr_len;
 }
 
-- 
2.43.0

