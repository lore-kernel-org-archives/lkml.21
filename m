Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874799;
	b=RHfkRMnwYr6dM9W+avSa4z5QtiDEZmJPd7Pym8Xk64ZN4zWGHBfaauym5LKBflQjolc2
	 UtLnch8+7VUrpZFMmS9uSXUSQhbUNZB2fMIJ7sAeoaOouwEQmh2UwMw0imrpVOP/zLWAY
	 KHPD7V9SaoDYsJarImiH4Plt5KDPpMv1oLdG+u4nGLvhAqg87COKLjkvb64Jrta83QJuX
	 G0+YCfqxyB0KOnMK86+H8L988/VxYDC7JNVUt3ndPKgQq/WVQk1w2/3RSOBWD+MikDEG2
	 6KbbTMh9U0kh0HNXFtlQPSlf1svfBMudIZWT0bhOLilffmtbpxon0DcwTxhBz59Fi6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kNbT+zjxASw3wxSoXIcEpE9FcJ74Cmx170fazyS3CUA=;
	b=ynChd/vnUzYFV2B9CZ4iute4oPEzVHeFQCpspAq6Y4Iyi4VLrbI9p5N8iZuuzzRpdaYd
	 jQAmXriIOZ2zLyUI5RZcoVpblbOKVIqx0q6havsowsRmmbZlivn+0AnhQvxt1Q1OHycON
	 aKmwbPoxdIKQooYUTXHA1I7FYZexHpb8F6bdARmJvG/bEHYTdYi0SPQhjlvD8UOLBS5ib
	 19D/IUx0ELGvZgXFVbiyaY3S0TnRMbTYYVivgrrXe+gmXtJgpxaZ8ia5WXEjCLQxTiqrc
	 RjWOPWh2EUB5E5xchhakwx72eLOJx3/QhvC1GoMLW5B5A7QjiB6tA1gc+yngYsVEVGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AzqXoagq;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C603606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C603606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AzqXoagq
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-949680e6d83so818479985a.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795874798; x=1796479598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNbT+zjxASw3wxSoXIcEpE9FcJ74Cmx170fazyS3CUA=;
        b=AzqXoagqf1kGZd26duBK/SD2F3C9ge/EaCa9HZv+UHmJws7ASCbLp2ohWSPXLQ+Z2m
         nCvaJAbOkV994bA9cotqxypk+6d8G1eVvbHy06G8Ettpmcm9c5VwCbTaK6ojjX0aSYbQ
         PcVUUDgCRsEDNmXvAXdEXqio1xq0ZX1W4FUecNwUkoHXFLYSalSqzH1tzJ+7G0mErQKd
         MmGkxb4mLjytf46DnRLuEaV0+Ds6wF4LGjRMnBSmFe8fJKLYZ9XHAds/HVjWPwM9bSDO
         gJ4HDIydnV6eJQby97NZ6lcxFC0HcssDH8prCpr8vYxfJ3Z28WuB9SKHR5EHioQvS5Lt
         ZseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874798; x=1796479598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNbT+zjxASw3wxSoXIcEpE9FcJ74Cmx170fazyS3CUA=;
        b=N3azPwYRu+Vmi7WoomfHcK3PYRYWPs5VZ8C15dj3ts1nxG0FRyxDyjii8AbWljVD4/
         CN/WJ6lD2o8p+SDQrK/ub6OgCg89XDG4olmUzJ5P1MepMt/WVlvfb6JrhXiHzlUeqrF9
         TK5dkdP0xlGAkvtJnBMl1u9zzH7RDdEDBeoo2m3e/z3KT4uKYRcjvSNsCDqVQhswfsr0
         ophoLrYWNPcUcA28BoBh/wtItfpBQvtRhk6ceoxXMZWHQvnPJ4pbFcXcoY4fWrhWK5zT
         IYjTSYYuBdR0Xk6bmjAHvJoD3cmOr2xEUUq+UGIznCxzUjWsveCSLxvA4/H6DJjQ7+o/
         1FTw==
X-Forwarded-Encrypted: i=1; AL+hErFxs8pUfefdD+E5LGZDLspEFtWYiWZaFppbovbl8DoCJca7KCM5EfnP4NaSGfVBu/iWtOXW+enYoJdv0l4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k5U3f990fYS9hq19o+iTDZ9Kl8aHb9AGRXdDb0S47uXD3XYC9
	TDKNOsGjVmLTiX1xZGPTpcthyhCYFKCn+lRUReeXDq+kQbnCWPpsa2e8
X-Gm-Gg: AZFdTZei+8LafcXOhMeq4vduN85WLSjK4moVz5ESxAlHEPGp34y1DrBYHQ0GpWrbNFF
	ijYmLR3aC1nDF/wL5Nkcul1KgbLtBvbxpHVY3Qi5AT2KGN1aXJb+Hp6rv6YQhhuRHSb6YTPaqyo
	fnRKGjWAL4gBufMiDD0cwSGLmYuIWWm9HowgWloCnRqG9s1vKbwWQqHmzsJJaUQVCk870hHr49b
	udZ08MKc9QowfFCrQbKg5rxf0+QOwxkzzzTXheaSIrfO9Thb1wd5EZwtQc8rdgOSzkhvhYJevcy
	FRjKtMfFwUliiV9wCyeA9US8Nd2Ad+H76V4j6XpZowZVGhh+10CZzz8y/jVRUXX2nin8dXHXyDE
	6A1atkJ5b8y8NijNgl2tqg2NTXwA6YmVi9J3ZGqhYhz7RLd9+PE8E4WL64K4MxkaomhVjVga/kM
	oCyWsan4F1uoQPp0EdCmMk2PJ2dF6eBQ0M+gpcBmaV0zPfZGAT3z+dPbmXoo/ptv4/QKJotQUFn
	cNTcktNTR27iIuhCAbIjiY3HK5ishNo40w+teXJSMlHXLltwJTekoFO82LJM+vLluqQ5G0d1ghB
	gj5f/KCRzPu05Xgm2c6GaB3eaHYJLiFanhK2LmC5/4PI0H2Q3rDTr1BvVlgyTimye2tY0c9HYnp
	UaEZu
X-Received: by 2002:a05:620a:8386:b0:945:d22a:e82 with SMTP id af79cd13be357-949ba96e395mr5213510385a.27.1795874798442;
        Sat, 28 Nov 2026 06:06:38 -0800 (PST)
Received: from localhost ([138.197.109.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949c555faf9sm1975055585a.0.2026.11.28.06.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:06:38 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Nikolai Dokutovich <ndokutovich@gmail.com>
Subject: [PATCH] nsfs: fix the ns_id_req kernel-doc prose
Date: Sat, 28 Nov 2026 17:06:35 +0300
Message-ID: <20261128140636.41-1-ndokutovich@gmail.com>
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

The paragraphs describing struct ns_id_req were copied from struct
mnt_id_req: they mention statns(2), which does not exist, and a @param
member that struct ns_id_req does not have, and they describe the
listns(2) cursor as a mount ID although listns() lists namespace IDs.

The member descriptions were fixed earlier; describe the cursor that
actually exists.

Fixes: 76b6f5dfb3fd ("nstree: add listns()")
Signed-off-by: Nikolai Dokutovich <ndokutovich@gmail.com>
---
 include/uapi/linux/nsfs.h | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/uapi/linux/nsfs.h b/include/uapi/linux/nsfs.h
index e5909266ec3f..0e7013d20d1f 100644
--- a/include/uapi/linux/nsfs.h
+++ b/include/uapi/linux/nsfs.h
@@ -97,16 +97,13 @@ enum ns_type {
  * struct ns_id_req - namespace ID request structure
  * @size: size of this structure
  * @spare: reserved for future use
- * @ns_id: last namespace ID
- * @ns_type: bit mask of namespace types to include
+ * @ns_id: last listed namespace ID (or 0 to start at the beginning)
+ * @ns_type: bit mask of enum ns_type values to include (or 0 for all)
  * @spare2: reserved for future use
- * @user_ns_id: filter on this user namespace ID (or 0)
+ * @user_ns_id: owning user namespace ID to filter on (or 0 for all, or
+ *              LISTNS_CURRENT_USER for the caller's user namespace)
  *
- * Structure for passing namespace ID and miscellaneous parameters to
- * statns(2) and listns(2).
- *
- * For statns(2) @param represents the request mask.
- * For listns(2) @param represents the last listed mount id (or zero).
+ * Structure for passing parameters to listns(2).
  */
 struct ns_id_req {
 	__u32 size;
-- 
2.43.0

