Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645186;
	b=39HE2oNsoOhaOI/AFZuIC01FLtqmWpYSyVNbSM54YCBCbuifDTtC2V7YNkmnrSD2aMf5
	 xVz2/1QoMUxShYyViE78KV65IExYnydCdh/6uGRNPRXQluWF03kjvrFbgiIaHXbzGC0fx
	 STBdIV851LzBFgtI+XdyXHbdc4YPBsloBhgWp7prDK77hDS6/ITz1Ini1p+wtY4RPbrfH
	 FQe2Xe7540NXFT5CMKOG8e8j1ZyvuiVZwdxADcM/vRQwU5VBx09FIeGdhbprdpU4/NWyS
	 kSefGmPXHaykOz8HuzyVvWr1GhwRhwfEG5+kXzo9AmTpMVIDMjiFnJygPIBa8usDjRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8qhBQZeyr54Cjg+V6vaROasttcE0+Xu/EBT3l5pruz8=;
	b=3CikW06udabydhQ0XV2kWE4Td9FwsJjnYT4tl5YUlfIig2SjSdKbjD0QsUDLbtRxe0LH
	 ijcvOJO4LMf9KXyA3YPe0OnJbkGPHDU+AFflrshODgrvAUykHi8FZOhr3FmLA1vnDaxbM
	 a9DRRCti9GJBeAJrpvBQo9KjZebr+DZFuVZfMLRdFFOTLanIra/j0DlDRKrEMKd+eZSvV
	 8HjozoQXqY1dwutjyWXRSt3YZdIVs9w9TOq4CrYDku8qqJvA/B/uhHD5+4fWxJbTog9Qq
	 AfgeZwCiH5mfGjhsXAVyLcH9rISzcy7dvlmGS8PNMmJocZMp6nZI5pHqpBZNp1HvEWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aXmyti0o;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4802606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4802606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aXmyti0o
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6648702eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645185; x=1796249985; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qhBQZeyr54Cjg+V6vaROasttcE0+Xu/EBT3l5pruz8=;
        b=aXmyti0oUhoeiQiWqCYLjKDi5NUwqcrxTSJE2pwBcKbticJsKT1Z2AZ9zVQ7kAj3co
         AOseJ670N2yeIgUMaXKkDKxAtI8HeRbSGVLSpi7J5c3zn8xEsxYWXE39kHBkIM49I4FO
         NJj3JyyCKHCGdz4yaklt80wonMjYZajZnDhQ4WTFh8HsgXk1nM9sotWxky8iWZ/HVNW/
         GLy9sXOQd5eLeDGE+BMznmwr1AH3xn5XyUPcoqHpqm6tHDdH3WlXmI5WzLpM/Umn6mFY
         X7hU4q1mjb9nCdFaa2w6EHQwnjGj4JCHVRedRPlnNrhW7kfRoBu9pyjRJH3q1L6y/tFE
         tNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645185; x=1796249985;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qhBQZeyr54Cjg+V6vaROasttcE0+Xu/EBT3l5pruz8=;
        b=P8w3QvV/dAPb2R2REnMsTE0pKokFwG5EQjhuu30QprmKYZ9gvz9ClSZV+oD6XO40LH
         66WKLjCrqoNVSV6RFk8riWO6Q1y30RYY8ofhWoPS+OPaFz6ClWyLPoU5wDjbvz0enfbW
         NvRBsGxmsGidpGpOOAxZ1JDs7+mbHbHechvd2Xc+pKuGIkltKeXTVtiqNaMHbmBxVERl
         d+nFkBczDW6TA+TlAPwuDXBs1/PccLi6Ws0JWr7zBV3lWFn1rIuQ7MnKsNYK46r5hKB7
         lOB+PfOopkkGjKlBHoy6NKWPSb/X7J9V2bzfnZaB0qk/jRwSz7rAYkf2TfL1uSHpyggy
         RZWg==
X-Forwarded-Encrypted: i=1; AL+hErFO4LM3Ht4XfvnnPVIzUKnQIC99IreN+FeybZfthZPekFmRAi6jTJxnbsl2V9Woou+eEE5Af9sHd1k21F4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u3rN+7mNMhvw4zzN1HzIj3t4TjxaajeI6JoetTsdmzJBkQ1tI
	9/K/LU3CyyT5oKx5AnPNA84vis6ewuzQR1zS+i+WImwaztwY85XcT2Sltm0NFPsTU7j47AjxnxN
	BVg==
X-Received: from dycnr11-n1.prod.google.com ([2002:a05:7300:e9cb:10b0:383:7f56:69a1])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8956:20b0:36f:551:2bd5
 with SMTP id 5a478bee46e88-38570846826mr18757502eec.32.1795645184533; Wed, 25
 Nov 2026 14:19:44 -0800 (PST)
Date: Wed, 25 Nov 2026 22:19:21 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221921.1425747-1-elkin@google.com>
Subject: [PATCH] scsi: fcoe: Fix use-after-free after pskb_may_pull() in fcoe_rcv()
From: Elkin Cruz <elkin@google.com>
To: Hannes Reinecke <hare@suse.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In fcoe_rcv(), eh = eth_hdr(skb) is cached before pskb_may_pull(). If
pskb_may_pull() reallocates skb->head, eh is left pointing to freed
memory when validating eh->h_dest against the FC frame header.

Re-evaluate eh = eth_hdr(skb) after pskb_may_pull() succeeds.

Fixes: 0ee31cb5df4b ("[SCSI] fcoe: Fix broken NPIV with correction to MAC validation")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/scsi/fcoe/fcoe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index a2cf65fac297..23d6b9893793 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -1365,6 +1365,8 @@ static int fcoe_rcv(struct sk_buff *skb, struct net_device *netdev,
 		     !pskb_may_pull(skb, FCOE_HEADER_LEN)))
 		goto err;
 
+	eh = eth_hdr(skb);
+
 	skb_set_transport_header(skb, sizeof(struct fcoe_hdr));
 	fh = (struct fc_frame_header *) skb_transport_header(skb);
 
-- 
2.56.1.839.g22a8290db9-goog

