Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099384;
	b=NtFBmunijyz3g3YWP0FS7zfqGeCqcYzWTs6Y8MyY5y48HYGiTuVVxI5/euFW9kK/mJZ/
	 CUWQWdV5l2Y6Yj/I7/Gay9/gQMw4tUHqmbMLJcdcmQLzt/Fa22TLZUlTkk7TOLW7Nvz7p
	 bbT2F2g6bqwqKU0hMkPIuU6+kyGS5M1LC3ATcHsN4SE1FlsP9ozbrgbdnn6WSUAIDvuP3
	 UljddhYGcFkZkJ3kbYEBhSSo4s0bReXPdtAXperZ8OA72It170eof/f6aFRgLVbBqHOC5
	 S4lBiHTcMAri59S+TY0lQnN3kdaPqx2XaCBrZICsWkKUTuD51annUBZ7y2fi5Es+xNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yMnm3lNFGLXAd5e5gWSUcJSwva9ZjNGfsEDi2TEd7zA=;
	b=4E7F+DRuiFznELHoZ1S+zQs0D7AAdB3XgBJbgFml6FRP0moVClHEJKEo/BSi4r2hTAOw
	 Tq+qIbVzclcKvMlILpppF3b01INTUaRwVlOhhlZIx+HaPKSoIPZTwsO0el2yY9ybYBeRV
	 pQGpTTeLCHsFNv10xQ/Jj7Nzzkyw2MuFLeBsHWupZgQk8g1v1kTzxZkVqY9jLAzqYUiuC
	 b8/tsVKiPXjPZkYHFMzM+rh4TPrq4Iya/jZoRMnwjKLiPRasPcI/jIp060vHcNvFG8lMq
	 bW2I/+X391mCsVOAC+XIAdVg4Fc9v24dDS/FyWxxdYjyb+yQSyyofhAkCVYdizlCusQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvLP2+8Y;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698A606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B698A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvLP2+8Y
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36dbde64409so3971091eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099383; x=1795704183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMnm3lNFGLXAd5e5gWSUcJSwva9ZjNGfsEDi2TEd7zA=;
        b=cvLP2+8YSQPyvgyp72ru7K5jomnG3ckow53vlYIopcr1w8uivHenFD5EQkKokdAiOe
         M2PCTTJaxuckK5644Q3s9KKxruSHxV/63pQmXLhv5AWtnvzJn8dWUi9xyIXL0ocRakwg
         NCRXPscmKacvufThd9DoLwTEG8Z7+Zx7mtoMWA1Q9ftXkUCHVXTvWYuAwily2x2PNub+
         IjgilAoZj8X+SuMWG0s4CQTFA+McmPArwRlrCC6erNxHnS7IypnzGPEhbIe85lEkNCyx
         t+q7GMLcYHYr4WLaq8e0dmXFKGqYQPusYU5uipHES82vnlYQv3BEaRAMQ193t2S7eqCI
         5Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099383; x=1795704183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMnm3lNFGLXAd5e5gWSUcJSwva9ZjNGfsEDi2TEd7zA=;
        b=UUPiGrzqpDjhjB6tesdDx/sj5sjk9VTGaGUQmM+GbURy66haT30WC15hg3aAVvH9JF
         GhO7PdGhDA+GYjUMhZWYRhhIAnnTl4n3Y2ctkLb2xPXPWU1qsyBzznNws9It5m3JTZhL
         DvSxynByM2QvcCwnhiNdsxHdgliAa6vDAOhzbbtW3CvDHczUb4ulnFyTmi9x5o2d3Cje
         YX6e31rmtUBTA+4CxL7NFJSk/n1zkYjpgEgbI5sLjlY2cjcQzY1TlRy86RnnZpjO1swU
         Ficmg/R5bUtFW+u3rY7p/dUJBc3Zk0Delkej4jjIxowOsCxXVwoaM2jTwetvNZ45Uxe1
         4ufw==
X-Forwarded-Encrypted: i=1; AL+hErGsMKLPQvrtyH/FY3vVSJOyeGP5CiVsG2FeBru3/LoGbZIpBYy8eYzYMzgAKRSxxovpgNwNgAVHfFL8HtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DjJT/0aBPINCx6IKLvbY9ezZ6d7oFqFTKtggX8jYatNMOG5mg
	+kWAca+pNNAVINnMwTu3XP5A4By4Bn2O0Pk/hivi6MJW0Y3S6YNtwGhw
X-Gm-Gg: AZFdTZfbi/e0JUbGlm/QLGMpBmdNACqCNPMlfEPo5u49u+4sPYJPJBjNB02eVdqDArc
	HX1g6lv33wJ/TE7vNtbRO2mAlBcY3S71/eSb5ngK8HeTdEs3gSykaDCZMm+Dw0pOQlDye55Fa36
	sXBHuBTWgYRcZubP+swVzUVcHlZfNIOrGpFu/SuY0GWLmU/JQme5w0lSNWGICPzNgr78HiDu4Um
	AUJ00fUNI5/NGA8nFcCdagKwBsbqcQmxhpxM0i040p3DIEdPQTYIEu+4/7qR4bItzfmgeS8KNHE
	/yAHX5JFwnUcW/8spHqRqDDMmXvMuIzra4dPUaMuihvPt+HOps9DilT1YiL0DKYCCQ9BIzmX5TF
	bO1Nzb7d4pIsqiOsyzxDl6pAig/CD/d/vGkMGJsIO7y2D/We90vbyFqeT2fgekZjF4DmbFcTRpd
	GTtUoEuq4a84xEhKdkfIs1JtyeR7v0gt57TRLJoeyujErZhEyYDHW5THcxT/FL8oKoYpI3uV9nx
	VDCsAbxctT1jnTzVO5MqcUmUKMq2Lz3aF6/LcyGJha9IOE52fGwocLiE9oH3qoHc1Ny5ZcI+hiT
	qmJAAzvEdh8Kr0X99bJx8ly1z2W4SbcsoNn2Fc/xiK6rjHfXag==
X-Received: by 2002:a05:7300:7314:b0:375:c5e1:931d with SMTP id 5a478bee46e88-38280c2e5fbmr7589924eec.25.1795099382820;
        Thu, 19 Nov 2026 06:43:02 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:43:02 -0800 (PST)
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
Subject: [PATCH net v3 3/4] tun: clamp zero-copy copylen to remaining payload length
Date: Thu, 19 Nov 2026 23:42:38 +0900
Message-ID: <20261119144241.360238-4-graypanda.inzag@gmail.com>
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

tun_get_user() also derives copylen from hdr_len or GOODCOPY_LEN
without bounding it to len after removing the virtio header. A
padded header can make a short frame cross vhost-net's zero-copy
threshold. tun_alloc_skb() then reserves more linear packet data than
zerocopy_sg_from_iter() copies, and the uncopied tail can be delivered
to the network stack.

Limit copylen to len before the NAPI fragments and skb allocation
branches. The requested copy length then cannot exceed the supplied
payload. The normal skb-building path is unchanged.

This matching tun issue was noted during review of the tap zero-copy
fix. An AI coding assistant helped prepare the /dev/net/tun
reproducer. In x86-64 QEMU/vhost-net, a 14-byte input produced a
128-byte frame with a nonzero uncopied tail. The patched kernel
delivered 14 bytes, completed 300 repeated short sends, and still
selected zero-copy for a later 400-byte frame.

Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Fixes: 0690899b4d45 ("tun: experimental zero copy tx support")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/net/tun.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dcec7311e601..76486cde21e4 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1850,6 +1850,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		 * The rest of the buffer is mapped from userspace.
 		 */
 		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
+		copylen = min_t(size_t, copylen, len);
 		linear = copylen;
 		iov_iter_advance(&i, copylen);
 		if (iov_iter_npages(&i, INT_MAX) <= MAX_SKB_FRAGS)
-- 
2.43.0

