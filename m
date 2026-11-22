Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352973;
	b=QYzqQJk4RKUmsbk1TRJtlUJNJN2Yx6Sw39kB+nrm9gWcn798ZwiMT5qWYsPa5p+cOwk5
	 yk4EaNAJ5UCUse72AKxHbldNrns60G02r4XTVRR6m156UXBtvPdGrBa/PJjvR4auUbSOj
	 Wvw+VzGT93XiGvUyvreMeWa+3+aqIFQCXV0wZnb6ao3vauAVGvBoitQbOYHRje4N2idDV
	 6zJ236wqoIZqDfuWn919WIVvMuJxLxJ2lw+3beL5U1symQqVEbuuu/mv5N4k3/L+Qm7+z
	 DcokE7XfRbj8ohUZ++L6Xo0vuOTHHGLAZGi55v3Ob6LKwxdoce7LS0otAhRp0oSVzsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RzpIstdBZ9UDJfuYE6dfOAxjKSqfqUAZ2HY3EqITTgs=;
	b=BjRgCOJpUa2MYBWcsqZoQXeJQyt0sWUX+1CU+S3hcNGWnftgPLuqi9tBbJ+xqh4sUmRk
	 5pp3i4gUKb0YkLoT9lk//pFGAUMxl/cWPyWkNqh77t7QIfnX0wDrBL2E2KgulwgxQhcCe
	 4ccmhHQGDat3J9Aqz5HuQapMeVpPs0VvIOJIxSzsUN+w2ORoB1z5pK0Lt+8I5kFVVXeGt
	 eaK4yu978pVdBC52IA5FkQnF7pamjeaERvFgt+3D4NkdB1b8+8cWcLT2NUad8UiRqyHEj
	 7VZYVgpyAGHB/Q9u9NObwqmYTF7YG3geMsIcJkr41p2NhqXr2d/34s5s3jkjQ4t4Sug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=MBHsBXIC;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0140D606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0140D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=MBHsBXIC
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93f22a8515eso229122385a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795352971; x=1795957771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzpIstdBZ9UDJfuYE6dfOAxjKSqfqUAZ2HY3EqITTgs=;
        b=MBHsBXICbT8BlEv0yDM7XwzbTPGn6nEjJ5Lr6/jEN7Idx8IEwVcvHzt6LuH81lbUf4
         08gMXHFWKaHxX2nJkRth2kBP06H88YOLg0kJ4yn56CcFd8bigAxProJrvuIQcp3vZJlo
         53iCiB+/8v8GQL59tfKOFwuSba17kvijRsNcjJLjjV+B95WS+gA0chCHHqgt4qkFDmxT
         psrtokARgfp2TCDFqSuPoz51QgY7DvP+unNf1PSFqLsuLdOgI2rhJrSgjoGlnimN0lIZ
         gVC1IDFJ0ORML/UE8+czAN37rFRqfq94gWFTl/csrsCeTpQrb9TOvKCBqq0VINHbqBw+
         UB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795352971; x=1795957771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzpIstdBZ9UDJfuYE6dfOAxjKSqfqUAZ2HY3EqITTgs=;
        b=uVmcJF+LniCQi7WJyNL6gWNbI7u+LS/YvoBlhUi0enQrP1wL9hRfXTN9DVw3a+AGSl
         KixQx4SVEFubhTPV6h/EH6HgD8HY5MPp6WoMtzVQdr8vc0lNfsUKgxvRfrwT4syjUJWL
         mYnUhrSMBWuz8MBgXbbBFoCERQAATnQoi9aIJWV6H4lXVgTmDqgWSXnj6ckk3d3a4K8u
         wrGhGfs0H51VcBQkjtJaF9pnUdqHiUjC3VKNXsufaLdhYQyYVj+3hC9zpQ6hJNqKc4Il
         sd5L5Qi87bI9DKMPb8CbAPOsdT1ycGg9s8tNwpTSm7GLPzGO4qOa5vWwcipYVVqBuOFa
         lKZQ==
X-Forwarded-Encrypted: i=1; AL+hErHvd6sIQl3FYJhYJzgENXF6+OqeHkPJm142CiLP7MXyFKxLYpmpVgTGcqTJ1fmVVFDRGNRe3OI0pk/tK9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FgR5x8moHcK6v24u8R6qHK8ISqiEkKpuv1rJKByFpryKC7WWa
	J7nxpRTsnaUJBfY/1D8CXKVknfs+mPUvlY90cZBQCbZVhQJXiVGKK1/UvlR86+CjaV8bFVdgbEs
	p8fcK/n7vlZ9nXzKDaiat8CeXREAfKML6t2MHWUTY82cNMoIkBhHo
X-Gm-Gg: AZFdTZc37TW8R52x6c6QEJ9x2RxxZ5Bh6h5ZDNjwpJs2QDemwm2Fy5FtNPNNNW5/16S
	ER0nM0oIaWK1vQqgIEcLLbdXwCxYOpr090RA9LUUkyBg9toixGEW0qHMhGrelGdclw7Q8m1AvPY
	TTq3WiZOvKfY+Sa2N0rAe5ndkhTm4gviqZ0eL09i2jDADxTAqh0nxBYcBM4Rn2BeBP8DSm/jsO/
	R1Z67CqwLt4cwD7rcKxQMv/sJF4oaqkJ5eU8qoAfmPXAUAnu2jhmSAz83NZdfZa8tB90L63I2wI
	z79g8zoj8eX3ySd87A5HO3Oy4yFrxTyeXFm8+HHa82HM5RzGSMkMz/f/3BqfUdxPxkAJy8PEiz4
	K24dGNsm8WTGLwreMBDFiejr3Mqo=
X-Received: by 2002:a05:620a:6607:b0:949:3c50:134 with SMTP id af79cd13be357-949ba9a178amr1410279285a.33.1795352971591;
        Sun, 22 Nov 2026 05:09:31 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb3a8486sm45588885a.14.2026.11.22.05.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 05:09:31 -0800 (PST)
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
	Willem de Bruijn <willemb@google.com>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrii Tereshchenko <opensource@andrii.net>,
	stable@vger.kernel.org
Subject: [PATCH ipsec v2] xfrm: iptfs: make room before copying a continuation in reassembly
Date: Sun, 22 Nov 2026 05:09:25 -0800
Message-ID: <e417c7f2-eaee-4fb0-b365-65cd521efd6b@mid.andrii.net>
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

When iptfs_reassem_cont() cannot share a continuation as page frags, it
linearizes the in-progress skb and copies the data in with skb_put(),
without checking the tailroom. An skb started by iptfs_pskb_add_frags()
has little room after linearizing, so a larger continuation panics the
kernel in softirq:

  skbuff: skb_over_panic: ... len:2884 put:1442 ... end:0x6c0 dev:eth1
  kernel BUG at net/core/skbuff.c:215!
  Call Trace:
   <IRQ>
   skb_put.cold+0x1f/0x1f
   iptfs_reassem_cont+0x242/0x760
   iptfs_input_ordered+0x382/0x3e0
   iptfs_input+0x24d/0x630
   xfrm_input+0x12a5/0x29f0

After linearizing, grow the head if the rest of the inner packet does
not fit, and abandon the reassembly if that fails.

Made with an AI coding assistant, reviewed by the submitter.

Fixes: 5f2b6a909574 ("xfrm: iptfs: add skb-fragment sharing code")
Fixes: 0b352f83cabf ("xfrm: iptfs: fix skb_put() panic on non-linear skb during reassembly")
Reported-by: Piyus Kedia <piyus@iiitd.ac.in>
Closes: https://lore.kernel.org/all/20261119142308.3272570-1-piyus@iiitd.ac.in/
Link: https://lore.kernel.org/all/20260908224855.1591147-1-kuba@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
v2:
- skb_linearize() first, then pskb_expand_head() only if the tailroom is
  still short, as Fernando Fernandez Mancera suggested. Regular traffic
  never took the second allocation in my tests.
- shorter changelog.
v1: https://lore.kernel.org/all/70d0cc8d-e2ff-4293-a416-eaf2705a0b9c@mid.andrii.net/

The netdev AI review of the runt fix flagged this copy (Link:). Piyus
Kedia's patch for the same overrun drops the valid inner packet; this
one delivers it.

Tested on v7.4-rc3 and ipsec master: the panic reproduces without fault
injection and is gone with this patch, failslab on either allocation
only drops the packet, and W=1 and sparse are clean. The selftest is
with the IPsec maintainers, as security-bugs.rst asks.

 net/xfrm/xfrm_iptfs.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa8a97..e9b4d23468022 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -909,7 +909,15 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
 	    iptfs_skb_can_add_frags(newskb, fragwalk, data, copylen)) {
 		iptfs_skb_add_frags(newskb, fragwalk, data, copylen);
 	} else {
-		if (skb_linearize(newskb)) {
+		/* A newskb started by iptfs_pskb_add_frags() has little
+		 * tailroom after linearizing. Make room for the rest of
+		 * the inner packet before copying.
+		 */
+		if (skb_linearize(newskb) ||
+		    (skb_tailroom(newskb) < ipremain &&
+		     pskb_expand_head(newskb, 0,
+				      ipremain - skb_tailroom(newskb),
+				      GFP_ATOMIC | __GFP_NOWARN))) {
 			XFRM_INC_STATS(xs_net(xtfs->x),
 				       LINUX_MIB_XFRMINBUFFERERROR);
 			goto abandon;

base-commit: f0e68014f4ac1653b2980ab76744f4dfdffdbac5
-- 
2.53.0

