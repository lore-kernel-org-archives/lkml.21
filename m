Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182387;
	b=mcm/y+wqQCCxLQQHNBwpT5uaAQe8aPiint85oXVEduSXUBfBnimxA7LhXJ2MrrToRhrE
	 iFnwv4rGtyG0ZRh1V47kCAalhSmKw8FttJvMsUUbAR+Ms70ej8cS5E6rHFOz2RMUH9CiX
	 iH8kPHjnw65FckxzWNxznkdSYX0Q5rL5vKP/CbSXJinVn6Gh6cXkPPOaYcWBfJbifwRrU
	 LzoVIbzhO0KzEeGEcUuK//+mDkvjtqls8g1YSPIdkg3DJWdLq1sIrVVdzm1Sc6cW4wzGT
	 SlceeB8rFK/eZUtpFBZmyLyCKoimdckRLxQJYp4nRfDAE/SRzP+h6chIej7u9e0gDYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f9dmpvT+qGSbxrdWR6z/QLtIEnkFsfPUirMgFoiDyuk=;
	b=gsGcSh9f0BphTZadEjR+Mr/i1XCA4f0ZlsHdV7BchUEbVAUPp3x6j7tRV7FtBiH/xnCa
	 unoXUu+/jk+RB2/0+lg9QUZTSy15AOvetPBxqW3k4lcnipW7U+p6iiEel4+7MKII3w8AA
	 15AHlIGO7cj7/9o2jxXjw1lVpXq0p004VFPdwixR3v/QeSEFezBdcqwJydOsiV6CBfAOn
	 cmIP9OVT7lGIBQLJmxCNE+Pk7FivTOZ1JZgvGssthznEAUITAHyLcufyvDOOjnT5FCmL2
	 /M0R70NzzZtD5iqCW2upR9DHR3QaILiuJKXQaCZFUIpoCaiVoijsNslhac5OSjvKZXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=As8pCkrk;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D4606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921D4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=As8pCkrk
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3b4944a0eso779425c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182385; x=1795787185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9dmpvT+qGSbxrdWR6z/QLtIEnkFsfPUirMgFoiDyuk=;
        b=As8pCkrkrP3CcZzzIlX1BH313dGvNRI01ybB/haE/GylyaSBv5DLH31PPEhivtLEaQ
         I7BPTlugs1M5cyfHbnakysQZ7Y6o3FNHwp86MMquM1LbPrXK7gZkpUWpf4ydqLreXrpt
         PykTR9AlJMF7Vk+4YDmWL+N05C5W3xrt1NYqEfyaDVo5xMHFl51BaKEMFmyKorYVKRBu
         ydt7NCz4mOJt/VACEJ2e+zAUGGGbPxBqGl4HKnei+8ikt+He1sdpuNDMIyURotl0P2YM
         zcUXOU5s6rSXxVjcIE90SXrGu5gtwgiWH3ILNUPvypE1eauUBIu56O5qLW4BGcUpshY/
         yh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182385; x=1795787185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9dmpvT+qGSbxrdWR6z/QLtIEnkFsfPUirMgFoiDyuk=;
        b=nqQ+9nQxLJxrv2Po0/9HOMSA4HUROTJb107oo3mz0ksIqkln73d1oHWmVnq1HWy0aC
         7EzARNPTouUM6gjPBC6p/9biH8UaOZCwnzGQW1dNLiwt/imf1ivAViJLFRLmiqsRq7Vw
         c2LYPqK/9rRHjQHlfhjb2lhWPIFV0GBBT/Ke3NlNpCpwpiT0EkJJN9C/M7/gYzfT2lza
         n5vXswFA3s4lmf/m/W5UUf/FPAVbVkF/wbL+1EvacJ9XOJtEXjgthOl0rSnbSUyetyQN
         MDlxnF5DPPf9LwQhm2AD6+yVmhGlxhthYMaeyxIUY03XBarIGd5+PwGXdI+EKpNXtjsK
         Kipw==
X-Forwarded-Encrypted: i=1; AL+hErFs9495w5w9FYBcCCQOszFdPuOMhXtvHVeVWNwmYwfLefRv+CAydT2P06lvNONLhSk66ZHA+jvZVcWzXHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YXGdpLaHUso2QrbqxjEdFuNX9au5GLsc783/2foflH5R/rnq9
	ntMdW44lPetWRBOFZMj2/9LrGXgKxnwmPWFwz5XK4X60ya/QiPqsU1gVCia9BRD3
X-Gm-Gg: AYBFou1A7JUhu970xdzlBNFXcjbZgjS2FrUK7kWrjEymoJNAU0vkovW0DbJPZ/mD1Zh
	i6W7RQ4fkPoRyc+g3Jqyz4NysaZz1dz9fqg03+8+ymcCBDs5B/PuczhjqKF5oZrOf7CZY4PCwhx
	xf8a83JtC39fowVTSH/nItPL/EmM7ZLBFeieAYSWr3j/xP7dCmgaelyEHUylb9Uw2CzBvl1yYnG
	H+DHfdTv3yNYqrER9Vqapni4eRsdAYSkyK98y8qaUH5/Pglt++Hmvx8/G6Ln5B6PcVRj/2t/1iY
	VXXCt25HHty5PBe7BiPE8SjhdMJoKuOluiIfh/9ZmZFZnSpFRNRxCpN3/tnlCSzM+C+encBBi8j
	6hUUnzyyhSzbpk9BOUWxNk0vgRfXoGlkb9e5XjctTop66+wG20eNsLoYyqyMrK7gJpGNRHZV5XI
	rIAHVuwC/yiZ+NZPkAfz0lkioyjDFdxcC1VtQTBiESM2+ZF7ryQ1gbfF/8Rzk3VZE8UQBU6Qxnz
	9GNtweG9lolKC7Ys6cdbhaI+p7++/NLIkNMNEKo64pLezuT52kBXK8Aaq8n29SSguIY3g4voyRJ
	RF/hehG0iBdt63wT+d70ibkrW7lJ
X-Received: by 2002:a05:701b:4648:b0:149:1feb:6da4 with SMTP id a92af1059eb24-1b5568f12a5mr2488247c88.32.1795182385283;
        Fri, 20 Nov 2026 05:46:25 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:2204:d735:8fdb:7bc2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm13154456c88.9.2026.11.20.05.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:46:24 -0800 (PST)
From: mdshahid03@gmail.com
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] rtnetlink: fix NULL pointer dereference in rtnl_get_link()
Date: Fri, 20 Nov 2026 19:15:48 +0530
Message-ID: <20261120134548.214126-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The rtnl_get_link() function falls back to the PF_UNSPEC
handler table when no handler table is registered for the
requested protocol.

However, the fallback table can also be NULL,for example
after rtnl_unregister_all(PF_UNSPEC) clears it.

In that cass, dereferencing tab[msgtyp] results in a NULL
pointer dereference.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 net/core/rtnetlink.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index e141340172ce..b552cbf17d76 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -406,6 +406,9 @@ static struct rtnl_link *rtnl_get_link(int protocol, int msgtype)
 	if (!tab)
 		tab = rcu_dereference_rtnl(rtnl_msg_handlers[PF_UNSPEC]);
 
+	if (!tab)
+		return NULL;
+
 	return rcu_dereference_rtnl(tab[msgtype]);
 }
 
-- 
2.43.0

