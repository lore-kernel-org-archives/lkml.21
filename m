Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702305;
	b=0GLeP/Fmce2payveU/EtwMBS252QASls418zdVrmt5D/PKeafBSczqO7t77xbbQvmdFE
	 7jyzj0sBmn96im2pRrdlX4YNh8YZz7KXP9jHkXvxARvnyexsl1kUTQdy3C5WwwYtVtjFS
	 rtYJVNZfOX+48YQXOwU8g54iWZ5Oeu4NcsQPEIjpi6vKnvNhhM2z3xLkcnVUKY06s1xcl
	 PRXLgsrCo2u7HvqKHCbghaKlLazjnX2VXUxSZfP91gCEUCywXIqo8sMThJB/YOH2rZCdx
	 EQpgk2HHPCNh9jQCRqLM+wU914W9X5vFk9zQFZkcG41xNEvjHBixXQmGEAX60YY+weA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SIPEnBq5swfaGOWjM7OKRb+08GCvFMc6ZKvXcYeopSk=;
	b=AqHHmn4ucHfsekhswnY74dpUISPGFW6C0alMk+NjwGd0OHHjtbDsIVSc6KL1gGEw3Yxm
	 fzWb0puLAUjtnsF0oxyADw3y6MeWMcl598XLXz3z8Yg2vvUjGlNKTKAqamSgpiykk81jj
	 uMu3au3mIy3Cm4eM5WPuUtwxPRKEjZYAFx3B43LGCgsoJk9X0PcZQdygKmcycF4f8SpO4
	 Mmetx8Pj2XtrF0Y5Kp4kOcXwzCVonYGie6vksBenlF916CN45muQw88/EhWa/hBtdkkJd
	 pdAYwwjNyT/gd9gUeP48VvTq/VZSUaai+rY3FHfNPr0ELV17t/HzO3LqK+eSKFsrBkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoFgkRj3;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ACE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9ACE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoFgkRj3
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3866a784546so9612621eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702304; x=1796307104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIPEnBq5swfaGOWjM7OKRb+08GCvFMc6ZKvXcYeopSk=;
        b=xoFgkRj3S0huSnly/WZdCAADdCEjGU57jgkW8vci4qnSORm4mPWdi+J8wFI1uoYAZX
         nM6mwmT68c2D+DkXRfDfW7VKZHXpDKzItFF0y6gEKBRXXG574BUrFs2WetHIi/NEu0Wj
         nlDNHxVMef/kAyfFompzziGA7R58m8KVc/SnHmaqJArK4zcxo6nn39HEt88l+mkN//mD
         UsZdVI1/JDMZFrLYtuAXT4v/LzH+KHKM3Vx3QU+ucsfCD0iqf4auAZQfYDaz+YhDqLR5
         u5aRQ1bhmb2Mat9feuI8HLWBz3GaaeIN8pZR0sJTlgMZv4sUvZchqCHSoIeoOpACphht
         5b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702304; x=1796307104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIPEnBq5swfaGOWjM7OKRb+08GCvFMc6ZKvXcYeopSk=;
        b=ugdl+ICoIiDzCEqPedOoolve8jZSvVkL/wKaqumF49H3k+CsAw/yijuUDAf2KC6pMx
         1Qfo1wHXQNlaq2bsGCf43fnzhIFnNLDmeq/Fba8JOyiljcv6E6Nz0NoiWSFc6Ak2QCCP
         qgADMfkfBiH0z9UXkyfpJ8kLYCJOCw+uJlFU7PUAnZLixnrqMQR0hY63+ov+jVU+rskw
         VF2vnqUv8BciOSBjSYIZJrBL2ntCZmiRqoBfDxXvf0kuQALnP2oxbJb9GAHMSujTUbyL
         cgQAxu2pvpjIdZy8LnHjVCdCPkiq8+RZK1MtV/fHYCB7+PQ1QCnlLDYfjRJ+LBWhiJwr
         Xg/A==
X-Forwarded-Encrypted: i=1; AL+hErFS4pR/X2alTJ8AYHAjM6usNWt6osIk3kUrKCwEuwEjcAnPtg/5HoJb9G4GnA9EOFj4A+mseBYsukDjz84=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EL+QexleawNVRH8pGc1Bxv9YQ0PPMFLOkCwW9eLszAeXT+aGR
	S2K/aN0lvx4S5q8MhGh4+U4BgPgGNWpIIOwg18YZDRWgOwIXBnNZhwif
X-Gm-Gg: AZFdTZfXiWuPlPjsioSyt3hu8ktWXcPoqM1rB5TJWpnB2Vbj7TF1bXaJYNwLSHkRIky
	QbP/I2tZ8qJC09+uUnJef4dKo09QKy8WDrGt66ThAI+VrbYXKYPq56F+39uDpfMKBITZ5yuIZrl
	0xGsGx2wlYtovYqpzAJk/R1CPkYmx2rcM8D8EobBlC35TI6QW5i1xDdW3IH99yj7/3tcJ9r0Ei4
	14BaeaBxcKU5x7kkWPkcQCj2uwFzqpQv/gdYbZMKy4LIKQxeo8nSdMPgQ0icYEC0NCB8TvtfSFF
	JufUS3F1B8l9F9ins+HqBqRgYoCurH3CAklBudeHuBW5CxxHTNqPZVsf+TFZ0f1SQXqkTF0LEcF
	XY7WXdSFfee1jYcRz0wROriILefZPKkaHPWRPc6ur4oyT6Y8DgsUCRZOtAYeDA0tnrnXJJENwpU
	rGONX28WgdqOnqie5xOC2rElqoJr2T3880Goat6PF1FCBehfAIsWtgB/P5yRsVpDgAfcGa25O9N
	vkMxlBQ7c+6INDal3NyGlz/RNKnQANXK6/TfGNa8eP1KRsEcAhIi5QrN3A2mMBGnWN+uTEbdtrO
	M+Ry58ncc63lZhEfPhLthAI1Zohv2Q78WRiSRl2K1f2fbg3n5D/rxhs28b/CxDfiiW6RvTM=
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr23894136eec.5.1795702303786;
        Thu, 26 Nov 2026 06:11:43 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm77037988eec.4.2026.11.26.06.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:11:43 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net/sched: sch_choke: fix skb leak on packet ring wrap
Date: Thu, 26 Nov 2026 23:11:36 +0900
Message-ID: <20261126141137.1261866-1-graypanda.inzag@gmail.com>
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

CHOKe represents an empty ring with q->head == q->tail. When
choke_drop_by_idx() drops a matched packet from the middle of the ring,
it clears q->tab[idx] and decrements sch->q.qlen without reducing
choke_len(q).

Repeated interior drops allow choke_len(q) to reach q->tab_mask while
sch->q.qlen is still below q->limit. Enqueuing another packet then
advances q->tail onto q->head with live skbs still in q->tab.

Once wrapped, choke_dequeue() and choke_reset() see an empty ring,
stalling dequeue and leaking all queued skbs on qdisc reset or deletion.
If sch->q.qlen is still below q->limit after the wrap, subsequent
choke_enqueue() calls also overwrite live q->tab entries in place,
leaking skbs during normal packet processing.

Check choke_len(q) < q->tab_mask in choke_enqueue() to preserve an empty
slot and prevent the ring from wrapping.

An in-house LLM-based analysis tool developed by the authors
assisted in surfacing this bug candidate and drafting the initial notes.
Root-cause analysis, patch code, and reproducer results were manually
reviewed and independently verified by the authors.

Fixes: 45e144339ac5 ("sched: CHOKe flow scheduler")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Tested on net/main in QEMU with a C reproducer that fills a 4,095-packet
CHOKe ring (tab_mask = 4095), triggers one interior matched drop, and
sends one more packet:
  - Before: q->tail wrapped onto q->head, and deleting the qdisc freed
    none of the 4,095 queued skbs (traced via kfree_skb).
  - After: the extra packet hit pdrops, and deleting the qdisc freed all
    4,094 remaining skbs.

 net/sched/sch_choke.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_choke.c b/net/sched/sch_choke.c
index 73d3e673dc7b..92d4f29acf57 100644
--- a/net/sched/sch_choke.c
+++ b/net/sched/sch_choke.c
@@ -268,7 +268,7 @@ static int choke_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	}
 
 	/* Admit new packet */
-	if (sch->q.qlen < q->limit) {
+	if (sch->q.qlen < q->limit && choke_len(q) < q->tab_mask) {
 		q->tab[q->tail] = skb;
 		q->tail = (q->tail + 1) & q->tab_mask;
 		qdisc_qlen_inc(sch);

base-commit: ae8e5ef9fa9eeaf4ee0a9a9bde0fc63023d9b154
-- 
2.43.0

