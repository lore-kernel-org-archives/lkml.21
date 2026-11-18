Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038050;
	b=MNUCYb84bI6obDxFa+XkZv9SUmtBsyxkq7lD5OR6wWWo90ZGtg3/B2TwzYem6J5+vRRp
	 Jq4OkIAUnB4F9g7z0TDdqaCH+8HfMJ2u1z2gOwe5Tl3fct1bBgy51A3zGOOsm9I6Z3GSh
	 zMrvBeUDiECCRekV5D1jyBTDSdxH3QZ5T6mKnw/ciblJIHeUgg/6CUXBht1/c4pc3bRD7
	 HcUfTJjnZfu3lTElaHtKRzV0KLHac7mVlRs2W5itzpg72+fRGWreHTIzc4matu72nJVGH
	 iFawr9h8U0xwyERZwWSqtDW/U2UzpO1rr8UHCW/u4iRWzMh/OrDjxo6nH7ExtnOCVYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V2TQ5JY/IVs2S8RR8BAhrV4k+I9Ja4L1F05T35wN/6Q=;
	b=0uoMAZme/hDVvaFFbdZtwJjm9uhJGPW/iGfw1fHjqlk2O6QP/kQBbKQM8PJ0EDwBIpUk
	 sQXMJMGDRCCdYt6LMu+apMMyld/9NMYnQ/STvZ3yy4FDqqHAs0oSJA/mjz3nw6mXzaB8S
	 aEjFKUvDwo09uu5BQkQ/mi++9jX91IIkPgJC7mvq6YRdalCmpj/kJmcT1mqnZWAYUuCMh
	 xMwfTe/hJWi9Os/qz5YTJOnRkEuWAUDfVHjAP5IoY/0B8WUxwEgfO/fIzoExEwHLvWlc6
	 mQ5WatURfb34u9cAmteBFNCk/+zd+6JKcFHTlubYwOrGOf0ryPSAPL1dZH3knn2EUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DI2ipGih;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB6460A2602
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB6460A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DI2ipGih
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1409392f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038048; x=1795642848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2TQ5JY/IVs2S8RR8BAhrV4k+I9Ja4L1F05T35wN/6Q=;
        b=DI2ipGihzKUnw6brGZ9xOhfNlRwZoulxhgMzsO9ryTrcOdGTVaGbnap1xEwsdopKlu
         YMJPkP1lC0Uw5rl0zcRNqirw8k77Vg7ktcrH7p/0T7vmkQc4hduR+mEZdUdzF2H8ck9T
         M6p1vE05xiNnY0b1dk0U5tjnT6qukT+ypkBtMJrDzXfsAWN3kmmWRfKM3har0mEjRtsX
         gwUVC68/JnGg+oX6cOOAfrcbsVa6TiovRQ0U5N5dXPX/qBjV05+Y+W0ekrEuDHafij2k
         bb7MLWFG2LNf0RfWv04AIzD4sVyetrNSKsREbD9jaRerJUyIXJTwzQjWU7SG3KAGLdRd
         KvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038048; x=1795642848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2TQ5JY/IVs2S8RR8BAhrV4k+I9Ja4L1F05T35wN/6Q=;
        b=qzI7KbPsSetma2W13pbiaSyW8YT15cBUfCCm5807dQ9e43FnPAG3JYqsxYkWHAPlP3
         UC3bjZ01KBQDWDVjbQWMy+6zdV34g1HlTzM0mVQJPXzCi3qCqnJWqvzuWDMk3PcdUuSo
         rNMiR8kw8vZQhJfN3LFudHluXVm5d50ofayBxFmtjUEEklKKmCWlWGrv4wYV5wTRb/oi
         ZTf3JAMnqm/JzxnF7L7kFKbs1bvwOtabOkMeM/8z6Ymaiz6EcxtlwuhR9cvb1osEsZhJ
         SdJHBBau7P1QnrnyWWl0Sgf1rqcqShLUfpMfYQR/Vij2jZ0BiNP1MM8z2Sh/ifSnCEvU
         tVBg==
X-Forwarded-Encrypted: i=1; AL+hErErPZra+nn5PMTTdPtAWIN32pP9FRM22WZ6Tl6OtuOugEltCP8A3i+BWPZvWucv3eyBsheDecK2w567vuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wEDpQ4mk34nnwXdCqtvb15aoCTsbZiiAusaeNEh2ROqiNuL+a
	QR4A4WJIsZjGrPb+m1/V8fUdT5MPkDESx032a5r6XDu6jhH2bdeHhAv4t+ZnVJ5uJks=
X-Gm-Gg: AZFdTZeDzKvXOcHKGiNfdT3wiLPG4epHgiMo0KlxRe/gJHel4Io5GGF3LFfm05/OREW
	zLXi7vJscDpzELUfMbpC9RG2/NaF/TJdguPc7sJbalplWgKiAv2Bu6WLssnakXL0HcndBCHoOtR
	ZZ+yGUjzFPimsbMWXDRASkD5vGlWV633Ailo9y6HDQL19OwHr6dk8SbR4KkNxqASZQOaV1Vg0v2
	BtaGqxZhlUedIlgxzYeifixnMnyxqa7n8fmo1i9Ok9q+9/l1tPhcDaGk/YmRa4S1mcUcjUtieKW
	hmjSAsq2/uXsEOQQig4cGCHl2LwWOXOU785j5yaiPU3QkH3qpVFU6Ic8xxP3sWlDH1LyyrLh39Q
	40i35OA0JUDGeFX8AcONqoc0TSR+JpEEiB0Dt9hyzpZRbUP4faXAGTChtR93ZsOTgOvjJ99nbDn
	X293kQAnvLJDpuel+3DqKIR8jv0QdoTAUehZ+3BwKWh7eObWgwvPeLGI60ZA1ovs/9HQiE0aLb1
	n7ANdn2b3bpgA0FbdQBVU+e91+tOid8vTGtByfAoVPdzScwvRdVUS8dt4irW5i+WCqe57pEhf59
	zU9KZ9WjdK/YkOP8MLEGinkj2voWKXEY5d8oVVKH83hQ5aHbZ/TuWv1jpfWsj2JbguXXvKuXQCQ
	4tY7dvfGOWKMqoJ+rf5z9X/ypJJvOaQ7VB/nCS3r7foz0Z24=
X-Received: by 2002:a5d:5f42:0:b0:4a7:9630:7b4c with SMTP id ffacd0b85a97d-4a796308123mr6018312f8f.47.1795038048353;
        Wed, 18 Nov 2026 13:40:48 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm6361300f8f.19.2026.11.18.13.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:40:47 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] jffs2: reschedule between the data CRC checks of an inode
Date: Wed, 18 Nov 2026 21:40:45 +0000
Message-ID: <20261118214045.107562-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118214045.107562-1-orgads@gmail.com>
References: <20261118214045.107562-1-orgads@gmail.com>
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

The first read of an inode checks the data CRC of each of its unchecked
nodes, all in one call. On an Octeon board with an 8-bit NOR, a
46.6 MB file takes 13.8 s of kernel time there. Without kernel
preemption, nothing else ran on that CPU in the meantime: an RT
watchdog thread missed its deadline and the board rebooted. With
this, the lookup takes as long, but the watchdog, the per-CPU
workqueue and the other tasks of that CPU keep running.

jffs2_get_inode_nodes() already reschedules per node while it reads
the headers; do the same before each data check.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 fs/jffs2/readinode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 18a47b432..bfee9e57f 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -39,6 +39,13 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 
 	BUG_ON(tn->csize == 0);
 
+	/*
+	 * A large inode has thousands of data nodes to check on its first
+	 * read, and a slow flash takes seconds over them; give the CPU
+	 * away between nodes.
+	 */
+	cond_resched();
+
 	/* Calculate how many bytes were already checked */
 	ofs = ref_offset(ref) + sizeof(struct jffs2_raw_inode);
 	len = tn->csize;
-- 
2.53.0

