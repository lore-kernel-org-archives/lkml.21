Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644988;
	b=4+jbkYbcKRlw773AzDHRa55O2R6WzDEurtFbt1bgC2IncabwyvUEn987hNxTZhCva+oE
	 OJqOiiiC3bg/V/TVRDzcy7ym9J5eZhylSlNIaZ2FML/0LCIkRdmLaVEFe9Vz3IIYN7d/q
	 KMLfpJ/q3OoNhGGzByQvJUZMa29V5/iw8Nms4GALSlhObSZEcpe3Axlnfe9LnafCetEEy
	 z+xGt+iuakMcOUJL0GLFT+W4EdbbfqCnNuGznQleMs4+jnHI4nNUQLt976nsp6FXASs+F
	 HOqrCu1kCQvT7h/xFEA2FUc+2QgJJV9Ql72R+1taiNk/vf/IONVqV48emcHfAZUAuXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=JWm3F65cTvbkSUDXl1Y/GIGqkgZqbiVzOvBBoT7EL0A=;
	b=loY6FLEqoNKSCYMtggZnST078QAkxRVs0yFKDXFz/lkv0KxH/jV0Uw0vlpBKG3LUDQN0
	 +8MGjfS4cs64wFVyJ5K/Xu8MitNCkuAS+YXOMDFKioxB5Nnx77UpDvzWmMfFpRqcP+S1R
	 IfhR1zan8iux/PK4VxDOkHWC5sPrsxCg0Ojkte+5YWWohWoJkkcF3EtZhaMlH3Tyi7vCw
	 c0wboJlSa4ynFWvL2XGS/51qZq8PFXJ876qnq6JYVE5JXKOIQ/N+PzPD+7ubclnK5c5e2
	 iGxUTGQmqK/MI/TWaylHoxdmf1SFZTJ2esaykhY7O+pwcmvW0eD0rc41B55Ou0wPS0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AK08crEq;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E27606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E27606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AK08crEq
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so3932914c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795644987; x=1796249787; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWm3F65cTvbkSUDXl1Y/GIGqkgZqbiVzOvBBoT7EL0A=;
        b=AK08crEqNBBrtaJJXY0S/ZfGdOYuGH/xEsV/EJyUJPtrXxziBKkMv6qstV+qiKlbtp
         8/c4ffKg6rHGFZnzmbFi6B23K0X1cj3zkCIxC1DYSHyVkbeETSpP8BWNLojaJoAlGhnA
         vws39xwMZ/O21nfvfDItAcWYsbNdWlLLNsEAEDTJCmd85luMiOgina4V4YJcxGYL3JpE
         Oka44TNFUQVC4UrNmM+/+qrK+MUAHJWc7/nJ8R64Znaw/FkcVnGCLNwXoTPnCVBDFEm8
         vYyft6PNS/PvM6PjytotrLR7TeWHlrMwRmspYydNnhKGm5GokZgJlvZ2Q79ROE9wBFUR
         dFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644987; x=1796249787;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWm3F65cTvbkSUDXl1Y/GIGqkgZqbiVzOvBBoT7EL0A=;
        b=I6xfE2sKHlhfNIuAOsH4NAcbRZ4rjORxvvN0bV1o5p8X/CYUoYpfU0c5lzTFCMGM/9
         qagKuDrxPD7oLx5qJ4qGv3sCk7d5SXegMWKzpt/6cZXWQhm+U0qrOCljnaf8W3Hlb7+k
         5ND4O3UPOqfKnZCBvpeSq2hY18Y9+V86/glKMCohMUMFXoi8MRgddDFASMvOmoQQzlG8
         3/F+zBsI9khj+892kqVnbQBsKoDCujolQt2yZyXJEe7bP5rALrW4wRxy2ajzQuMjA+76
         PbPdnmGJGXIe0x6GNvqwdJLto1CFQQg/VR3VbwMNahTqiC4eA7UZ54Rl0tcai1SqJ5mX
         yM5Q==
X-Forwarded-Encrypted: i=1; AL+hErGjcTS2iO41k36NyjNnh7J49WLrdL0e0zCuUNUs4xHgox1HiKVBfsFWv1bWTmtM8b3FIAFH9VbsvRvZS5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jyG57gvC3ImVxtHZsWPMFxPMrL3Co67j/sXka4MasoPq53DzW
	NYkx041ua78whRqUxZ0KaDUDTOKcGcekKfga8YmWAQiQ+JcpPnuMIVRtxXarwcR7UYT0KjWO5at
	kbg==
X-Received: from dleb17-n1.prod.google.com ([2002:a05:701b:4251:10b0:1a7:f7dd:f258])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a41:b0:1b5:4b48:b9ee
 with SMTP id a92af1059eb24-1b5568c0ec9mr18863247c88.26.1795644986769; Wed, 25
 Nov 2026 14:16:26 -0800 (PST)
Date: Wed, 25 Nov 2026 22:15:36 +0000
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
Message-ID: <20261125221536.1417085-1-elkin@google.com>
Subject: [PATCH wireless] wifi: mac80211: fix use-after-free in ieee80211_rx_h_data()
From: Elkin Cruz <elkin@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In ieee80211_rx_h_data(), tf caches rx->skb->data before calling
pskb_may_pull(). When pskb_may_pull() reallocates rx->skb->head to pull
nonlinear fragments, tf->payload_type, tf->category, and
tf->action_code dereference freed memory.

Ensure pskb_may_pull() succeeds before reading through tf, and derive
tf from rx->skb->data only after pulling.

Fixes: 8a4d32f30d11 ("mac80211: add TDLS channel-switch Rx flow")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 net/mac80211/rx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index a2356cd17691..f97d7f4daa79 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3292,12 +3292,11 @@ ieee80211_rx_h_data(struct ieee80211_rx_data *rx)
 
 	/* directly handle TDLS channel switch requests/responses */
 	if (unlikely(((struct ethhdr *)rx->skb->data)->h_proto ==
-						cpu_to_be16(ETH_P_TDLS))) {
+						cpu_to_be16(ETH_P_TDLS)) &&
+	    pskb_may_pull(rx->skb, offsetof(struct ieee80211_tdls_data, u))) {
 		struct ieee80211_tdls_data *tf = (void *)rx->skb->data;
 
-		if (pskb_may_pull(rx->skb,
-				  offsetof(struct ieee80211_tdls_data, u)) &&
-		    tf->payload_type == WLAN_TDLS_SNAP_RFTYPE &&
+		if (tf->payload_type == WLAN_TDLS_SNAP_RFTYPE &&
 		    tf->category == WLAN_CATEGORY_TDLS &&
 		    (tf->action_code == WLAN_TDLS_CHANNEL_SWITCH_REQUEST ||
 		     tf->action_code == WLAN_TDLS_CHANNEL_SWITCH_RESPONSE)) {
-- 
2.56.1.839.g22a8290db9-goog

