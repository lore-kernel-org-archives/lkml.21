Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054339;
	b=MWcTrwtOc0NtYXYB/i3n5gJYDFoKr5W8UN3pEpYfKC/boWV9MtyUcBBh1rNv7wnk36LR
	 XOv4L7WPkVCV67xDRIkehm4Mlkwuaaeg6WzgCmZHy+gwRpp2Yi6ssoFbnfivWmAiOcf8M
	 MnhxfI02cffZyEdDJ1tw3Cf9eeSI+CBFgpKAg5kRUO7C2ydrKRmP7x4HhfcUWg5KL3pmd
	 pyOheiBqwjOnbYDug3Ja1ASZey/F2RE2isVvd+1Gh+yGKndWFcwRIJD8MvwQcQNYWitAo
	 PxnC/16cgGPpFSwV4ezlnBep02fee673oZPVsgVuiAKpVyF35eML14bCC/tsmXC2pmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=98L6SeBW9Xu1WCjW5oRLiTnE9je2fHVlHISx7sl7zSg=;
	b=W32w/IKZDRuo4RfdVPY1zLSVjLYNfAOD/S5Dv43845MSSNEbFitf9jtCAmyyEGj5M6yQ
	 bRIrzcfu2Ch3pPwfB6ewkl+BFEi+3CME0dq4Fc5/6rAy2+8MbvWOOw89dPEhekCn+yExk
	 V5fK4rdVKhQiwWTKYP04w0aYn1IKASQG7wdl7DYk75ksmV8uhn6NRuMRdqhj4k6d54i7E
	 lLB99OWMggbKfuvNddXMcDbH19fWOQlTJG4srHCrJv4JjErKOLf8fq6GWw3oX5xTu08gt
	 OClV4BQvsJWjd48cx8Tng13cJwPDAdS2qORECksDrwrCqbTjR2LXHZ8lSrpnryoXedw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZFGc5BA;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7D3606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7D3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZFGc5BA
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso825174a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795054338; x=1795659138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98L6SeBW9Xu1WCjW5oRLiTnE9je2fHVlHISx7sl7zSg=;
        b=pZFGc5BAH3Jl7l67LPPUl9lySwrpMJ0YBguR3WGls+Q2tGEz+qTDZyBGmFZkSZaYch
         8RGCvN2qUuhilgR5G9bq0LjpawpOw66m3DbIMbZs6kj7fYtjavljlIdllUjJYRNzzKiu
         p/k2z8w5aTBM62z3IDPn4cG0WC+SxVYZOPmiFwkxmX/iqhLweRJsYJTG5tjIihJfk8iP
         cOhD6OrNFD0pqJFcYZ9gKdTkZpy6bWjYAOn62C2rQqMdLkJirI5D4GpbGvOSHP8izrj8
         +kWnzkBOtLVrz3t/njLweF4exDyfswWB9k4V8kgTOvjkqqBEdC67pRPH2I5ri1pQ3x9K
         H68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795054338; x=1795659138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98L6SeBW9Xu1WCjW5oRLiTnE9je2fHVlHISx7sl7zSg=;
        b=Q4/sXkYi94S9e8vL239x422KrqC0gn9bU18Sz5vRJ5yv7D60g0k6r7PFdWqwwofdsS
         GMEoPpqr8KPlIUvleYSqehyXh4WP7C91jufYMwFZK02S+zSbA4a6wCW8/rw3e81qXUU/
         HFMa+P+EaKRKTkCdEXu3ASY8aSgLQRdXM3w6kb0NIGXZNo/ch9Gj5lC0lxF6J7iGusEz
         2qPHTsrStSp/rEnw3kZA2J8YMw+dW96zKGG3VmKIh6plbohNzMS2G1zuvn1wIdsLXZsS
         O6TEWTqCOGzOqrGtSpTJ4f2la86afl5gQ3QsifsNOnBLj19N0A16lC33Pbm0HEqotSQ9
         D+GA==
X-Forwarded-Encrypted: i=1; AL+hErHrv/G7Rq0Ke7nemn/038g4G3F261t3kJscJn2foucYCPh5LHaV2SnGlL2ZCdyK8V2y2FIOG2QVOyyy1/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g6XYzxvXRbPP7MOL8YlRUA5V/WvbS0cnQaFpP/5WGEvhFPYFH
	qqRz6QafLbKWca39Te2JW8a7zn8D1ajl9HzERQYLsSb4fiB4za/f10zG
X-Gm-Gg: AZFdTZd0rf6pskGN+n8sWNPBTCAAHjN6MOp7Mc/jkol6fXK/0Cq/21fvevQrA+FzWZs
	pvoiaK12cqxPOjFP0vukVtl55y+6VqS3sgAuQYOhtG1AJ8I32X0klZxo9AkRzspr0vVqpQz7ICt
	EYaxV8rWxYxW5WKANF0RT3z4zyapAOblRbor7FbJqKUm1LUI+RPi5bm/979eI7g+stwRaNC+8tP
	XOTqtMXgtzrnF90Pxosk2e3ojWkrZF5LlhBRMdLUqv4HYI5RbE1VLcXOfbNOXJ6LVH/TG7dvfEM
	oaIAP7y0kACPS3C6ZGbxAl1JUtfFTKOK5oMYSyJ6dUhL8hMUX02HXWu3PqI5irQp9A/oIuUt5AB
	JaF20fQidCILTOfi8k5End716xUVDmFaQ9swBiUlqUnIFYNNiwzLfkxctBvQIbnApXIrlKEXRJ1
	AMTC6Ua6gg3JOcF5h4Kgenm8LDJaPEGK1pa/Bm3qY8cjk0KNr1MmkpHtpGG/idHB6AcfO9mEr9d
	KS+lIBHQlVd49LumGKkzzchjECw1zTH7IQ7B1/2wpJ2BBuj6pJJFzauWesKDKgNputI98CaROwy
	dUDyovXblad2kjscgVBL9irTyeL2
X-Received: by 2002:a17:90b:4b:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3b3d07e0eaamr3908102a91.54.1795054338315;
        Wed, 18 Nov 2026 18:12:18 -0800 (PST)
Received: from spidy ([2401:4900:7b35:a853:53a1:3682:dac8:6bee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4059715b3sm17242a91.14.2026.11.18.18.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:12:17 -0800 (PST)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	syzbot+0cd6f4783442ac67b56d@syzkaller.appspotmail.com
Cc: Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Gowtham S Bhushan <gowtham398gs@gmail.com>
Subject: [PATCH v2] rxrpc: Fix slab-out-of-bounds write in rxrpc_send_ACK() during PMTUD probing
Date: Thu, 19 Nov 2026 07:42:02 +0530
Message-ID: <20261119021202.525077-1-gowtham398gs@gmail.com>
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

When rxrpc initializes Path MTU Discovery (PMTUD) parameters for a peer,
it computes the usable payload size as peer->if_mtu - peer->hdrsize. If
an interface has an MTU smaller than the transport header size (such as a
virtual interface configured with MTU 0), this unsigned subtraction
underflows to a value near UINT_MAX.

As a result, peer->pmtud_bad and peer->pmtud_trial become excessively
large. When rxrpc_send_ACK() builds a padded RXRPC_ACK_PING packet for
PMTUD probing, it appends PAGE_SIZE zero-page entries to call->local->kvec
inside a loop until len reaches probe_mtu. Because nr_kv is not checked
against the fixed 47-element capacity of call->local->kvec, nr_kv advances
past index 46 and triggers a KASAN slab-out-of-bounds write past the
1584-byte struct rxrpc_local object in the kmalloc-2k cache.

Fix this by guarding the subtraction against unsigned underflow when
peer->if_mtu <= peer->hdrsize, clamping pmtud_good, pmtud_bad, and
pmtud_trial to the usable payload limit, and only enabling pmtud_pending
when the link supports more than the minimum floor.
Additionally, ensure the padding loop in rxrpc_send_ACK() checks
nr_kv < ARRAY_SIZE(call->local->kvec) before writing to the array.

Reported-by: syzbot+0cd6f4783442ac67b56d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0cd6f4783442ac67b56d
Fixes: eeaedc5449d9 ("rxrpc: Implement path-MTU probing using padded PING ACKs (RFC8899)")

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>

---
Changes in v2:
- Derive peer->pmtud_bad from max_mtu rather than RXRPC_JUMBO(1) so jumbo
  DATA frames remain enabled.
- Cap max_mtu to the local->kvec payload limit so large legitimate MTUs
  cannot overflow local->kvec.
- Keep peer->pmtud_good at 500 and move variable declarations to the top of
  rxrpc_assess_MTU_size().
- Fix probe_mtu spelling in comments and clarify the PMTUD binary-search
  mechanism in the commit message.

v1-Link: https://lore.kernel.org/netdev/20261111144846.838278-1-gowtham398gs@gmail.com/
---
 net/rxrpc/output.c      | 12 +++++++++++-
 net/rxrpc/peer_object.c | 21 ++++++++++++++++++---
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index 88cad087f13b..a9d083076a16 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -325,9 +325,19 @@ void rxrpc_send_ACK(struct rxrpc_call *call, u8 ack_reason,
 	if (why == rxrpc_propose_ack_ping_for_mtu_probe) {
 		size_t probe_mtu = call->peer->pmtud_trial + sizeof(struct rxrpc_wire_header);
 
+		/*
+		 * skip padding if the base ACK packets already meets/exceeds probe_mtu
+		 */
+
 		if (len > probe_mtu)
 			goto skip;
-		while (len < probe_mtu) {
+		/*
+		 * pad the probe packet with zero pages up to probe_mtu,
+		 * ensuring we never write past the fixed capacity of
+		 * local->kvec.
+		 */
+
+		while (len < probe_mtu && nr_kv < ARRAY_SIZE(call->local->kvec)) {
 			size_t part = umin(probe_mtu - len, PAGE_SIZE);
 
 			kv[nr_kv].iov_base = page_address(ZERO_PAGE(0));
diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
index fa9a406e1168..32b75a7617f9 100644
--- a/net/rxrpc/peer_object.c
+++ b/net/rxrpc/peer_object.c
@@ -156,6 +156,8 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
 	struct rtable *rt;
 	struct flowi fl;
 	struct flowi4 *fl4 = &fl.u.ip4;
+	unsigned int max_mtu, kvec_limit;
+
 #ifdef CONFIG_AF_RXRPC_IPV6
 	struct flowi6 *fl6 = &fl.u.ip6;
 #endif
@@ -207,11 +209,24 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
 	peer->tx_seg_max = dst->dev->gso_max_segs;
 	dst_release(dst);
 
-	peer->max_data		= umin(RXRPC_JUMBO(1), peer->if_mtu - peer->hdrsize);
+	/*
+	 * Avoid unsigned underflow if the interface MTU is smaller than the
+	 * transport header size (e.g., on virtual interfaces with MTU 0).
+	 * Also cap the PMTUD upper bound to what local->kvec can hold when
+	 * padding probes with PAGE_SIZE zero pages (3 header/SACK/trailer
+	 * kvecs are reserved before the zero-page padding loop).
+	 */
+
+	max_mtu = peer->if_mtu > peer->hdrsize ? peer->if_mtu - peer->hdrsize : 0;
+	kvec_limit = (ARRAY_SIZE(local->kvec) - 3) * PAGE_SIZE -
+		     sizeof(struct rxrpc_wire_header);
+	max_mtu = umin(max_mtu, kvec_limit);
+
+	peer->max_data		= umin(RXRPC_JUMBO(1), max_mtu);
 	peer->pmtud_good	= 500;
-	peer->pmtud_bad		= peer->if_mtu - peer->hdrsize + 1;
+	peer->pmtud_bad		= max_mtu + 1;
 	peer->pmtud_trial	= umin(peer->max_data, peer->pmtud_bad - 1);
-	peer->pmtud_pending	= true;
+	peer->pmtud_pending	= max_mtu > peer->pmtud_good;
 
 	_leave(" [if_mtu %u]", peer->if_mtu);
 }
-- 
2.56.0

