Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774969;
	b=fbuFgMAQ4/XnQqADc3mrw355H9Rn4+mFZkP6omHriFr1r1O86hVRue1bYjol8KZh6NC9
	 nC3D404P6bj7yMyZu9AgLDfwm2PwAt92h3Q3MKLf++CwKNT2PymGiVkp1OSZCh1M/tLeS
	 g7wtYkbehVpW7YPZl8/XDayKVdotFbotmAwvYTo0y9xemZUCnLXG2sIHfBYdpvqRB0tK/
	 1Td9SaMw/6pfHAmXaSMmlrjN/tS9ShbfFE+TW2nLYx1BjVB3lAP7lZOnCp3B34kE8yJkt
	 eTs2c5tk2dJfz/vriJl8ZUd26qbgXGm2sds2UBxIiutHRJxWXQOjflOuP9aBA0MNL7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8jZKLvyVFU/3fMfQszx3S+AK4kpCDpBdmM0K1CgiX8=;
	b=hP0hk6+7G6DEN41UfhR/PirRS+0hR7qi9mZyzfaMQex+hmOVHFzH1lrIJRhjHIVm5XeX
	 4yL7y5B0CIMhWbx3OUoyVfqCvWD0M/QLa7TGKqGfCyDn/RLSvLR3NHP2CH+xjxiay9Aiz
	 gS36+EunDaNexF0+SKo0zf/FvZ0/sUf2Al9OHdefsFcw5KVb1KvIgoVAQWZsTMss8qJyp
	 gzU/A6oXwb9USZw0M1jPSXuuS6Y/UVho4AVBQs236SsRmU98l5fDnmz7vRng1iALtGBIl
	 ImjJ0Dgj+OBeYYGBpNjg2Z/wuSvBPQb2zcErZ8JtS2ewF6gs1t/hMuVP5iwwuJt0nlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUfprVmi;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED17606A6BF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED17606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUfprVmi
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso10653492a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774967; x=1796379767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8jZKLvyVFU/3fMfQszx3S+AK4kpCDpBdmM0K1CgiX8=;
        b=iUfprVmi1p2iZpSWamAre+Ca+1GLQ/sm48kJML9FIQ3AZbFfn9jwnrSf9AmcH21p9/
         wVigRP6lTz7WJi7gw/Su/ldnTrvtUSjIAIVEJ+BvJTPt0FPwVhDaGM1LuXt1njMDmcv3
         aFskoRgHNMaqMVg1R+5xrNRJg/8X4qh89yRySLGt09Hd/L9UtHj6JoVOE1GQWhdqHXam
         KVgDDgteoMjw0gIf+9asFXlcgBEbpNN+klZcLXRVWZaCF8AJ/fE/pyNVPk6oiDWPJd7W
         GxssRG0SVOvp7BgXaXHbwWVs3RP/UbkOMZa3U9LksCubGHx8MD8nkrtg4QAJfOQytS/I
         yCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774967; x=1796379767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8jZKLvyVFU/3fMfQszx3S+AK4kpCDpBdmM0K1CgiX8=;
        b=z3VhfPlPfHgydBmNz8HjnCcViPuAfV84rujacJ9fqCj/DNh3Zwm4UzL0rQ/QPzSUhW
         Ie1j2hfJxZonrQRSDX3xfNj0XsB1YKp6ZxasGNafnmTGTjTwp8oAWRPQIm2P28JzSivB
         FdzGjtOVDuqAfTehsvcPjAlk/6k9imvun0JWmf1hwEl0izlcSd+3eRnTtFZ+zoDXiBLU
         ydEpp6D56deAakpgp6JKflzVGISsxB00Ukx8QUjPiOmWClViWTG/ntCLhyc8fRISWF0v
         ICEg8vmBtdijmEB2IJRbqC3iD/Km6wooLOHR5JVpxsUkr0DmfhxKVoLZKjzjkBoNC0bh
         G+5Q==
X-Forwarded-Encrypted: i=1; AL+hErFheGLZqXa2Q732zHMAnXVEQPpuBssfaMMWHQUu5F9TXxQVq0HI64Yd9x/W8qNAnX+bU6z5I4tOVfg2quQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gmJ9KQKOokaHlEsPeQmJfRieTymxHawPsq3oY4EU9HVTUFUE4
	NqlpeQeM71DWwvRGNQ2m2LQJ9ggfynllJjnV2w0GpuL5SKlnDS8dazfI
X-Gm-Gg: AZFdTZd6TXZncRBc8exi52lVuxRAzqSL60ZhyFHPM9uFaTfNfxUFlo/7o0HBt+AUPMR
	1gUJMEr3G2Zon0TnHCZu6U4x8NvP3hNuXkzMaDP0PQ/iy8OnVnV525FK/OMEqSaS4lFBhkEESSe
	wYDOoG681VJSGClOry38LXSstP41fZENy49SHvBiWXq3SoC/4ERujHLzuk6dWBjuE4dxz9Gr1AJ
	Rqs6+GDHb9I2Ke6c2lLubJqSiIwvy0+u76OZQoHarPnBtuTTGh5HVvWmYbeYbv0XNVtjY3FEitJ
	GENdoGPejHtRRhqCHJihIcCXdxCRuTy/5qRd8KnzgjAcgkvHQOa/+uFAeKS0zUJo/rrajKMHUzg
	Wow55zb/hHmWNqCB4ODwVmNw1JJRnMHvKPsTVxGHE3w6/Ahtf/Ul18DdR55fwrmkO5OxoMZv2I9
	c0YpTLfuQ0VqzuOsRAth69p/+QdRC3x9LYr5ccSl3rqBqL/sR4mwi1xDZgAalPgXexmp5wxSozn
	GhkkjlVpY/Irxze2OMpqKKDjQYJFHzDQ+qLa74uNmbS6gAVNf6rwXPnm36UtfwHbAdJL9PIl0ZU
	ObQNupN+MkNl7ViL/ZIe23fawR+ubsUxfVmPMiZL5EZYqbC9
X-Received: by 2002:a05:6402:1d4c:b0:6b9:c43d:893 with SMTP id 4fb4d7f45d1cf-6ba37ee46b3mr18117759a12.35.1795774966892;
        Fri, 27 Nov 2026 02:22:46 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm10886407a12.9.2026.11.27.02.22.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:46 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/2] wireguard: peer: free packets left on the receive queue on removal
Date: Fri, 27 Nov 2026 12:22:42 +0200
Message-ID: <20261127102243.49405-2-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127102243.49405-1-apasichnik9@gmail.com>
References: <20261127102243.49405-1-apasichnik9@gmail.com>
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

peer_remove_after_dead() flushes the crypt workqueue and then disables
the peer's NAPI. Once a disable is pending, __napi_poll() completes the
instance after the poll returns even if it used its whole budget, so a
peer removed while more than one budget of decrypted packets waits on
rx_queue keeps the rest there. Each entry holds a keypair and a peer
reference, so the peer is never released; the WARN_ON in rcu_release()
that checks for leftovers is never reached either.

Free what is left on rx_queue once the NAPI is gone and nothing reads
the queue any more. tx_queue needs no such step: transmit_packet_work
drains it without a budget, and its entries keep the peer alive until
then.

Hit on a single-CPU MIPS router (Realtek RTL8196E) in everyday use as a
WireGuard gateway, then reproduced with the WireGuard selftest VM (x86
KVM): remove a peer while a UDP flood keeps its receive queue busy,
re-add it, bring the session back up, repeat, then run the selftest's
created/destroyed object check. With 1 vCPU the unpatched kernel leaks a
peer and its keypair in 25-40% of such removals ("wg0: Peer 11: merely
created"); with this patch, 0 in 210. The next patch adds the loop to
netns.sh.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 drivers/net/wireguard/peer.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a93..6bafe5724 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -91,6 +91,19 @@ static void peer_make_dead(struct wg_peer *peer)
 	/* The caller must now synchronize_net() for this to take effect. */
 }
 
+/* Each receive queue entry holds a keypair and a peer reference. */
+static void peer_purge_rx_queue(struct wg_peer *peer)
+{
+	struct sk_buff *skb;
+
+	while ((skb = wg_prev_queue_peek(&peer->rx_queue)) != NULL) {
+		wg_prev_queue_drop_peeked(&peer->rx_queue);
+		wg_noise_keypair_put(PACKET_CB(skb)->keypair, false);
+		wg_peer_put(peer);
+		dev_kfree_skb(skb);
+	}
+}
+
 static void peer_remove_after_dead(struct wg_peer *peer)
 {
 	WARN_ON(!peer->is_dead);
@@ -108,8 +121,9 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	/* The transition between packet encryption/decryption queues isn't
 	 * guarded by is_dead, but each reference's life is strictly bounded by
 	 * two generations: once for parallel crypto and once for serial
-	 * ingestion, so we can simply flush twice, and be sure that we no
-	 * longer have references inside these queues.
+	 * ingestion, so we can simply flush twice, and be sure that no crypto
+	 * worker still holds a packet of this peer. The per-peer queues may
+	 * still hold packets after that; see below.
 	 */
 
 	/* a) For encrypt/decrypt. */
@@ -122,6 +136,13 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
+	/* A NAPI that is being disabled completes after the poll in progress,
+	 * even if that poll used its whole budget, so rx_queue may still hold
+	 * packets, and nothing reads it any more. tx_queue is left alone: a
+	 * transmit_packet_work queued during the second flush may still be
+	 * draining it, and its entries keep the peer alive until it has.
+	 */
+	peer_purge_rx_queue(peer);
 
 	/* Ensure any workstructs we own (like transmit_handshake_work or
 	 * clear_peer_work) no longer are in use.
-- 
2.43.0

