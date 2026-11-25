Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620156;
	b=2IBsQqKzow2CA3vtqiQ43vHQSk5fMtQNaOxIjbsbNakKv/ahdhdsJFcrMGje4wXjhBBf
	 3Ai/q5ImKlAIcMstuZMxQmQYYxTiCAaKHcwxyfydCRnRThw6qy0991uUPJta0Y9zJwE3/
	 O+CI7ud2dv2yvqTKYJEPbAGX0wFKXX1pMXsuQPYYStOVecrDp8yuqzB+pKZwaVofYcIGx
	 WtFAEPapyCgXS6qrEDPjyCdLgbOoADMTa15Ds0D9unLgw8GLLG6wU2lY8Be/5nQkiF/y6
	 l0zbN/W9xQ4JEbzpkcqTm0Srlu1v6FSZccasIA3EvnCYRkIyZzAwWSvxZe+FetH+qlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m/P+s8e9LEiFl0Qu09s+H0T52nV18YVsV7Iu8lShA6E=;
	b=HNUbha3DGaipoVfjf+on8w2sSaIQuxEwKTZBeyVEtVCi0Szmr1Dk8dn/uXlZBIF1g4HB
	 I1M1uhm/b3mhZ4ruWjJyzeCxfW0GFlUur/hZ0cIto5581sVAfTOPVwmcpaNCPm2Oi4FN+
	 hc+grJjouNK8r5hk0t/VcLrSkq3zui3ZFDe4ZLfXYRfx43mdGzETX+mxvAcdWpjC0/j9o
	 jqDA7CONx3zy+H4qov7kQLpIydyY9Rs4dB1drpuCJCVOUSOdkrMrWxF3IfAW890qJiq7h
	 9Qegp7fe5/SVfuMOecBvF6wUV3JMddY5y9fvfX2ephe2tHcTTBMQFEkispo4Yh6Slkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oK11i/6G";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10720606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10720606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oK11i/6G
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a070781f63so2809088b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620154; x=1796224954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/P+s8e9LEiFl0Qu09s+H0T52nV18YVsV7Iu8lShA6E=;
        b=oK11i/6GApnRKdA/Ui/DZGKRVTnYi1Zt4xvqNPvWKzZs/8Ee2w8INiN14d7atKsL0c
         xzDu4pv2ZJInhd9mE0DuA90UhSHXmP/329jlbZs8ywz87+6Tpej015n99C6altAA9Brc
         kLshRsz+OZROLRaH7pfDc7nILS9aTAuFknbRoHlm2XQytevlcZZoErtyhDd6kWfZQww6
         74ZDvFHW0zpgZtZTeF4l7nD4NDMZb0VLfEYxSWh3LM4u2lzAd7t4P07gL2oS4qfbI2kl
         1vqJbtzuLQ5YEFRd7zQbHzlvOCFvIUsu1JvFyr9P9ay1yiLEgyo0c4i01vtQQb3AXOMg
         oSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620154; x=1796224954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/P+s8e9LEiFl0Qu09s+H0T52nV18YVsV7Iu8lShA6E=;
        b=He+FQA2A++cMVlGQcVI9NMEdPnI3d4NlirPOOca6S9zCLO5eLmr0vvn3zeZJFIr7O2
         n8f8m4R5blCeL/WVJoY4L5dEGfap8wZ74LouLH7t1aGYf+mRWKU1vkepv+b+WyidDDGo
         7YKXVyB/SrMw1Ufhp3tqL2w978/Nov2EPbhB01HLTtBAjWKFNq1f5giMCRUo45vR+FSo
         CtPBucrKHdPkdYpBqCM1gJJiwZNaeJwWUViMDWWA4afhGFiUsCEz1/ieuMFpv0AOv2/x
         Rhg6sBK7OA4sqohBm+owXHSqIaeCYq7q1jIdbzj40Uu61YZ5p5Snd07Et+6UBeWtE6xy
         Lbjw==
X-Forwarded-Encrypted: i=1; AL+hErHvsfiP+NyKX3f4QhRKAmvCS9wHcSaGaNhPpGL3SLdAZYakp3tPyQtBgYtRDguGqX7ptbve6h5vbFXAc1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9S7k/1ydcC1NX/CLKl6PcRgeyHGgtsjpjF5erRrFT1EbPeQMy
	h5aeRdZOovRM0K57WsMUKZqvXSsJHe9uelG2Fu+OL9Ct3AH5vDurSWZA
X-Gm-Gg: AZFdTZdm+43pzlVYenTIeuAIObBIJN6cauEJlK0dXcr7uv2EQyQhQeLrYCsh3v+X/Wp
	5OBtJfpPyhp0CPJgZJzJqtTvsycdMn9Yw+/Ud3m7JPPU0GSSXeAa+fAhZhpHj/oN3F0iwrENqWR
	NEykGZHgaLvHuY3hqD0qz9f1hcgFzGOZ6ZCw4ME8JpzzgFHY/358/zd0fiDpVLIBTU7uXRYqdSg
	kV6M3pQxQLUxSOKS3LqHuZmU251Z91uxSVP/Gzl1hlB13hlDNf7Wgr8io3nq5lIffK8+C7D//Co
	QWr/rnecg5chIUauIIdoUHQMcyZLPgEVLcTDNlOUwNfQ+niAP7fwm36xcUMeFCvzl81MTKsLQ0A
	llt8YwTuyzxW7Z2t40X5XcSUPsMJ5gCSxhgG1VzZ65KW7Yi/OEw2unl/UvJfUi9Z/9/KVjZa8kr
	ig7z8Qx5sFmg918zZ6qYkb+A+JmVcvTuj8WrG4Dv+lq34vk591UFuuBv4yA8wEQzTcDRnxsuucr
	m+HghjUbIBBecZ6MTMRX38tyqnH6P86Gthks20wZD2EqnX8C9llwj7bXlfYc1tHNTFgL/AZrbZ5
	tJgSp6Eor1mblajm812SvQ8G
X-Received: by 2002:a05:6a00:a01:b0:893:4980:630e with SMTP id d2e1a72fcca58-8c87c38b5d7mr14799436b3a.31.1795620153916;
        Wed, 25 Nov 2026 07:22:33 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm9221775b3a.8.2026.11.25.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:22:33 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 1/2] Bluetooth: RFCOMM: Reject listen after socket shutdown
Date: Wed, 25 Nov 2026 23:22:17 +0800
Message-Id: <pm-bluetooth-objects-candidate-0218-followup-v2-88edfec8c72ed860e626-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0218-followup-v2-88edfec8c72ed860e626-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0218-followup-v2-88edfec8c72ed860e626-0@gmail.com>
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

RFCOMM drains a listener's accept queue on its first shutdown. A bound
socket can retain BT_BOUND after shutdown, however, and the listen
state check can admit it as a listener. Release then skips the accept
queue cleanup because sk_shutdown is already set. Queued children can
retain a pointer to the listener after it is freed.

Check sk_shutdown before entering BT_LISTEN. The socket lock serializes
this check with rfcomm_sock_shutdown() setting the flag.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Link: https://lkml.iu.edu/hypermail/linux/kernel/2611.2/24606.html
Cc: stable@vger.kernel.org
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
This patch was written with assistance from Codex (OpenAI).

 net/bluetooth/rfcomm/sock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index 889e45dd5d04e..86a43dc0ab5e3 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -448,7 +448,7 @@ static int rfcomm_sock_listen(struct socket *sock, int backlog)
 
 	lock_sock(sk);
 
-	if (sk->sk_state != BT_BOUND) {
+	if (sk->sk_state != BT_BOUND || sk->sk_shutdown) {
 		err = -EBADFD;
 		goto done;
 	}

