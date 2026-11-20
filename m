Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165349;
	b=3eylgpUjqE89XHHdFLpEfT3CJyuc4qQf/ltj9FzYgWjNGtShn+YWDZPL1LWBCrx/+9WC
	 Bmwep7XMAMS7Z1BpJEu+yRtCf9FEjcvQDccXOgPQO8meaqzz8oqP+uLUa6fj7g5I3rBk6
	 yK8WUkJgq/XZLzqbISFaxry0+mOvPWlmz0RJAdka45yXmRTNBM9S3uXdtU4oLXekW0Suc
	 KbQpHE4nZNxQaE8LjUAem+TfhqNIYQn9hRFyOlMTFP5Ln5B2yo49/TV6Xp4lA/n/bZg5u
	 KWmzFHHd2MEKIRtghL62Q2rkxE6hYag3XAKXJOpTDvP5o6zptC7h3YQGmDWRmN5BTIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sstSKZPjJIvDzML4RMXfOohuz8+NeyvnKtf4ffPAtS4=;
	b=GcO7HJZ/0Z21fVnwQSTMWk0ajDUZPsXgTR1mDPJ/oHmiSTsf4OxG/Qcz/iOZXzFnNkLn
	 hCiMduMO9Sn72OPAo4LjrTvN4IbENl+ynzrOxIho2bnoyGbHhhsQpT5oun+r0hVKsRaHY
	 4UkPRmRRZQBQYw4CgxgJTu1XJq5TNHTu7flzoccMtTy9zKPrLiUVjgmNPzR93/4c68YkW
	 b6R3Ogr2/LbOCQ2PthZQgdLQZKFuPnURdvDGWzMyX5XznoK/W0dUpjWbVp29Wb1YLYDup
	 jPju4jsSOJM59iHHiGQxr6wANIOacGaGUqMqX4+qnVLMhbnkVhs1syZjwK9rl1Vd73A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=ZKxeh8h6;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAE606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97EAE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=ZKxeh8h6
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2f04b676219so1489635ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795165348; x=1795770148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sstSKZPjJIvDzML4RMXfOohuz8+NeyvnKtf4ffPAtS4=;
        b=ZKxeh8h6lj0/0p+RkL7y+f9VogVjUM0o2KUt/rqf+eRO72cxaezImmqKY3kWIfpNfd
         SNFNQk3pLH4bTAOM7Y4Vf+3i/5oLKzBiDtRZZcMAEWPGNo2By+Heb+5VnfsCRnWgA4hn
         MvkPUqG/5tkjHDUorhb9EoI2H436coP5IdLRYGmp+GEtIlB4OvkOBTIMZSwi8Pf7mO+p
         IqiSBwrD2IPxcnRmH5bHYniPMVckrb+k/c+1GF+6yPL26csVBYmwGkpSO7RB7wS3gBdD
         CGWMoSRwq6Exng5CjcS9Gzyu65uYl2k8Y6lYYgr2pm978JoVAXGl35sh7cbZlR15AD7E
         cAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165348; x=1795770148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sstSKZPjJIvDzML4RMXfOohuz8+NeyvnKtf4ffPAtS4=;
        b=VByOc0McnoW1/xX9Ftl9mRMWXfk+KwNuByuV6xWT17rpoN/0pOsm98DyAUVMZmm16j
         ce4BwdMNoH4R29v+aEKkO009ekZ1NlJWHrT1wbJNCN7qBXuLv5kLB23BD9ooKIwCkjoe
         mskVqPC+jy/11JcB/7P7Uj4iIRQ/MhNT9kFprfKmM95MuJI/TbKc9iYTNci7Dv5tpB/z
         cw8Ey7rBqYEi8B7Db1M9HWxyIBfYvNCs4tiPXySU63GNY+V6bi6PgD9/i58Gsuke50Po
         vKvYE3fCXeAEOQdbrMUsDC9juvkiU2/WbYSLMbZVAHdwPXXe9tKG8Gl/PmzsorvShxuC
         33LQ==
X-Forwarded-Encrypted: i=1; AL+hErETlyRKoy6jcvGplPVsnLs9P1Xeq0ArM9o7cVMDQOh6UFLV1patofcSKzOsssgen42ibEArVnRTKVSWBBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eTRqzwiDgbgVeB85qHmxghEM7FAICkwO5TJm5QhS2mYV6xOXf
	bfoQdeuwyUK+I6pVZFPZmGRLLAAndGOyJVPI7Yc/1K5KHzUMVSwBhVlP2kWV1CCHn7Vok4+VNBF
	OhUK2m55bsvtbtNHP0voI/8r+h+5C6uODYNCZDw2yPulGFsy71Y4Z
X-Gm-Gg: AZFdTZcFoYAV1CszRgcDMYhv1ZXaeyqIC+Uk+18o/HOXfCFxI9on3bZq1aG4sa0+z55
	YXWEf83/QfOYFv+SLbv76z2aOrxBphmstsFkgIODo8X4OHOTNMfuKNGGOkgsSulzzujyl9v9lSF
	BIx/2qraHsXKx+TtOuCMo4Mz7EKILF5CChIlF8fLze6RsKo4lhoQ+NWSPB/e71cvgCjbeSxPAke
	OsGZsSEbwIUiyVLDS+LBG43azUqa+3J17ZcEJPVc6xEY0Ic2PHaNbOMXSiO4AKjme6zyXUXNBSw
	bp/HjNn+QnJdbkcqXuNQc+7XhGM6jclMoGoBacou3JoVfrqkxSS3QUjrwWF8LkZO8BtAN26Xo7m
	aE3kHtPKPNr6D/BbnR/sbP+mPHKk=
X-Received: by 2002:a17:902:db08:b0:2ef:dff3:47e7 with SMTP id d9443c01a7336-2f03f170f5amr26755775ad.33.1795165347902;
        Fri, 20 Nov 2026 01:02:27 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2f04ed97b5bsm74025ad.22.2026.11.20.01.02.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 01:02:27 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrii Tereshchenko <opensource@andrii.net>,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm: iptfs: make room before copying a continuation in reassembly
Date: Fri, 20 Nov 2026 01:02:21 -0800
Message-ID: <70d0cc8d-e2ff-4293-a416-eaf2705a0b9c@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

When iptfs_reassem_cont() cannot share a continuation's data as page
frags, it linearizes the in-progress skb and copies the data in with
skb_put(). The tailroom for that copy is never checked.

An in-progress skb started by iptfs_pskb_add_frags() has only the inner
IP header in its linear area; the rest of the first piece is attached
as page frags. Linearizing it with skb_linearize() grows the head only
by what the frags need plus 128 bytes, so the following
skb_put(newskb, copylen) runs past the end as soon as copylen is larger
than that slack, and the kernel panics in softirq.

The copy path is taken whenever a continuation cannot be shared: the
outer skb has a frag_list, has a kmalloc'd head with linear data, has a
different pp_recycle, or the in-progress skb has used up MAX_SKB_FRAGS.
So it is enough for the first piece of an inner packet to arrive in a
shareable outer skb and the next piece in one that is not.

Commit 0b352f83cabf ("xfrm: iptfs: fix skb_put() panic on non-linear
skb during reassembly") added the skb_linearize() on the assumption
that the in-progress skb was allocated with room for the whole inner
packet. That holds for skbs from iptfs_pskb_extract_seq() but not for
those from iptfs_pskb_add_frags(). The netdev AI review of "xfrm: iptfs:
fix runt reassembly panic from short inner tot_len" asked about this
missing check, and it was left for a follow-up.

Piyus Kedia reported the same overrun and posted a fix that bounds the
copy by the tailroom and abandons the reassembly when it does not fit.
That stops the panic, but the inner packet, which is valid, is lost.
Making room delivers it.

Make room before linearizing, in one reallocation, for the frag data
that skb_linearize() pulls in and for the rest of the inner packet, so
that skb_linearize() itself allocates nothing; abandon the reassembly
and count XfrmInBufferError if that fails. Sizing for ipremain rather
than copylen means later copies of the same packet need no further
expansion. The room is measured as end minus tail, because
skb_tailroom() is 0 for the non-linear skb. The reallocation is
__GFP_NOWARN: a peer chooses how large it is, and its failure is
handled.

  skbuff: skb_over_panic: ... len:2884 put:1442 ... end:0x6c0 dev:eth1
  kernel BUG at net/core/skbuff.c:215!
  CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted 7.4.0-rc3 #1
  Call Trace:
   <IRQ>
   skb_put.cold+0x1f/0x1f
   iptfs_reassem_cont+0x242/0x760
   iptfs_input_ordered+0x382/0x3e0
   iptfs_input+0x24d/0x630
   xfrm_input+0x12a5/0x29f0
   xfrm4_esp_rcv+0x4d/0x90
   ip_protocol_deliver_rcu+0x1d2/0x1e0
   ip_local_deliver_finish+0x13c/0x210
   ip_local_deliver+0xf9/0x1d0

An AI code review found this. It reproduces without fault injection on
unmodified kernels: on v7.4-rc3 when a packet socket on the receiver
clones every second ESP packet, as ESP input gives each cloned packet a
kmalloc'd head, and at ipsec commit f0e68014f4ac ("xfrm: hold migrated
states through rollback") in a selftest written for it. With this patch
both run clean, and failslab on the new allocation only drops the
packet. No selftest in the tree covers IP-TFS. xfrm_iptfs.o builds
without warnings with W=1 under allmodconfig and allyesconfig.

The analysis and the patch were produced with an AI coding assistant
and reviewed by the submitter.

Fixes: 5f2b6a909574 ("xfrm: iptfs: add skb-fragment sharing code")
Fixes: 0b352f83cabf ("xfrm: iptfs: fix skb_put() panic on non-linear skb during reassembly")
Reported-by: Piyus Kedia <piyus@iiitd.ac.in>
Closes: https://lore.kernel.org/all/20261119142308.3272570-1-piyus@iiitd.ac.in/
Link: https://lore.kernel.org/all/20260908224855.1591147-1-kuba@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
I sent this privately to the IPsec maintainers and security@kernel.org
on 2026-11-20, before I had seen Piyus Kedia's patch. Changed since:
the credit to him and the paragraph comparing the two fixes, the
subject of the runt fix, the build sentence, and the stable address.
The code is the same.

On ipsec master with Piyus Kedia's patch, the selftest no longer panics
but fails: one of its two inner packets is delivered. With this patch
both are. The selftest is not posted, as
Documentation/process/security-bugs.rst asks for a bug found with AI;
the IPsec maintainers have it.

More fixes for the IP-TFS receive path follow as a separate series.

 net/xfrm/xfrm_iptfs.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa8a9..9c8943991260 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -909,7 +909,18 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
 	    iptfs_skb_can_add_frags(newskb, fragwalk, data, copylen)) {
 		iptfs_skb_add_frags(newskb, fragwalk, data, copylen);
 	} else {
-		if (skb_linearize(newskb)) {
+		/* A newskb started by iptfs_pskb_add_frags() holds only the
+		 * inner IP header in its linear area. Make room, in one
+		 * reallocation, for the frag data that linearizing pulls in
+		 * and for the rest of the inner packet.
+		 */
+		int room = skb_end_pointer(newskb) - skb_tail_pointer(newskb);
+		int need = (int)(newskb->data_len + ipremain) - room;
+
+		if ((need > 0 &&
+		     pskb_expand_head(newskb, 0, need,
+				      GFP_ATOMIC | __GFP_NOWARN)) ||
+		    skb_linearize(newskb)) {
 			XFRM_INC_STATS(xs_net(xtfs->x),
 				       LINUX_MIB_XFRMINBUFFERERROR);
 			goto abandon;

base-commit: f0e68014f4ac1653b2980ab76744f4dfdffdbac5
-- 
2.53.0

