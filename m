Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509218;
	b=wtR2DPn456XK2htVkQbV5b2CP7/hnTx+d/3MRTQvsWqNrFxVYNZYH68JDXxnBO7KjWnG
	 fSxDdI5TsieijNOjwEzBNQo4+8U11Pa6ecxohIs5qLP5zY15rp7yuba+lnP2a6F9Z4I+y
	 lPS71FuDXbi/5rOc6ynHRbaEnYHKRxjgyi+JVYjKFPlKVy1EnxRDbWHOcKCFGSmNEh5IT
	 onxw+dO8QnZGMjon9TwNRvkLPZzYbN5LngdTknXatFgNnHm50EC3sywreqyv+9ir0QKLO
	 +2JZpXbJ4xhn2vHti/gGGH7nfvwb9dGrdK55JJB4DFS3VRQVSDveqB/n2vwmB/hEb+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IHaPZxvGPPauklr++9jBux27Uh1MCS1CpxGOkczFd/A=;
	b=E5iEgp6frlPgvxq2GnfrB5PCzq+QX0+/lhzi9HXrU3BAFNr0zZQQ51mY22JRsp9lri+D
	 HaAd8Y71WI5glEFzXPlWJnvktIGnBUplcHW86ASy7r29Rnz/0WSutdC0iZOXl5EyTl3j5
	 4EkAwloTaVaKsM7e7247nH68d6k14SUxPWdfi8Fa40Rah+O5m4e6kEa2BRy1qRuop2NMa
	 NYVnEvmYdYAnU2yj4R0IXKNjl3lNjD7ssZ9TWdUz6spShktEFXO2xNFZIdJp7ckHTJkh9
	 aTmPsg548sZUS9cp/XhAagtIM2UEd73G3jkq7D99hENOh4AnF9QAzMNjpJfzmvt4YOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b="bkH3c/n/";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93253606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93253606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=bkH3c/n/
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b546061d58so9537000c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795509217; x=1796114017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHaPZxvGPPauklr++9jBux27Uh1MCS1CpxGOkczFd/A=;
        b=bkH3c/n/jScsSPF0AtfJbwWKG3EGbh3eR9Oq9iW56tUWHAbE05TTA/jlR1Yzn1QKzW
         XVSWmcE95xz1B+mjnPaFbEVRwZqUeV5l7eqy52+L3OQYoNfHS+k5g5sMRwm6NZPd004i
         YVXHAspEaC1j6oJhKgUcSADHuBJFdX6QG34QwaNrkOYXntwP4VITflsxiOKvcGhnZubl
         vVHd/s546Os+2lu8fBGolT1yJP54gDwIQwj31laVTe+Bcwl7ook9mE5KHxJqtJ7xMUpr
         zHW4MSVddUNFrVz2cN1pUzQg9GYnHByCCQt+TqJ+Lff6JMDj+dMOa4zPC7l3blNlWrBs
         TgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509217; x=1796114017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHaPZxvGPPauklr++9jBux27Uh1MCS1CpxGOkczFd/A=;
        b=PFw71gcQCJSYjxW8DXgPlV2eQTi/BeH7pj1RHb3f6ZE3+ah4umwqgqW0aBunQcZAI8
         suE9bA5ggMamwegUMDm/ANjmWeGhliAxt+AN/Iq8bxJ/kTcMiWLcgipf9eCJmNOQ5Hxd
         LrI14vd+ol6fXc5p2lj46Sks5bBWa7HleRh/7Soo1ZPfmWKLmg+DzgA2SV1dJomU83xI
         0uJUc/pykLotzR272Pf4YEpE7gaj0JXYN7xHBhzldTG8VA2KZuKsBzrBaoYP2QCP0Kc+
         e7QybH0Z3905h8ZkE2D0F98N8dy06UJQmjjpZKE5jCrPb1/UbruF02qEWt8e0gsz3Om6
         ETHQ==
X-Forwarded-Encrypted: i=1; AL+hErFgZ5uPzpR278qM2vIPn67uZa/sa/dh2ODLQ3HsCk0gGTAFVrQH1bKiAO5XU4yD2maWmBlzPa8IafWceK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XeqhwNVSPE8794kC5VAwM5Zq8xEoMgLa8bGn3HSQGcAOP/S3a
	qY6w+btLeQO033vDzuc9gPYy3k7Nk8r8dwTW6ZO1Azloy+lS23+y9LACmcL3QbIjqw==
X-Gm-Gg: AZFdTZeo1vaRG0nUPTNxbywadu6+t1Wtd3sGZDMJu6/yRZAmZYqqunvOVgowLR7TlDj
	rtM591WGa9M0pKzfniooXOqbbPQQkj2perv0LJx2GZrsLGWL0v/D4k3KLFADFOzXrQVq+YEp8GH
	xMCKhLrvDgOasBV9kcSOnRnUXHgDKC2SGRN2e+T83NxLJ1Sz0Cf00oZntQEgo6rDGJd6sfHHkvg
	mwlqUZYv0fIBvGKL2owPJqj+U4NxsUspm5l9XVDfvWj+HzKSorG5MiFeCJd+DT78Sw0f+W7n6X8
	XdLej1APly/hziSA+2VRFKvgjyYICgC9Aeo0XwtXBeazjPQG6QbfGWBCCiW6GZtbPDjC3cBTTGz
	vmSr7ZH6MYvn/z1VhDfuySutVKoAoRtI7RZDbgLSRWxjpba7o8C0F1zLSL+B3OJZ0xficofHf4c
	87yqDwcnaZIfJTD1UKtx5I4XleM/rXwgqWGmLntGt3cK5grkuNCiljAH2q5nsDzg9WpLIQ9/XGK
	F4kH/OFChvlAppIHnDS0iHPH1YTxq+vdwoT2QML1zcAaBmEus8w8DXIq4CBRSk4oo29VaDFuoGZ
	hEoTYjLVIOeYXQxQ+12WwmtKtyAKc2h481sjggn80ZNv46cs0fOOLTTAhUyAkxYITAJeqiTHQOx
	FOzzjL3DwwuetSg==
X-Received: by 2002:a05:7022:7f12:b0:1b5:4dff:8b67 with SMTP id a92af1059eb24-1b5568eeba1mr14216791c88.29.1795509216390;
        Tue, 24 Nov 2026 00:33:36 -0800 (PST)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm32784012c88.15.2026.11.24.00.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:33:36 -0800 (PST)
From: Xiang Mei <xmei5@asu.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+3d9e2c65bdd43a254924@syzkaller.appspotmail.com,
	co+0b5d5f4d3472df53@bugs.sh,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH wireless] wifi: cfg80211: don't parse the SNAP header of a too-short A-MSDU subframe
Date: Tue, 24 Nov 2026 01:33:27 -0700
Message-ID: <20261124083327.2037092-1-xmei5@asu.edu>
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

ieee80211_amsdu_to_8023s() bounds a subframe only from above
(subframe_len > remaining), so an associated peer can declare a payload
Length of 0..7, yet ieee80211_get_8023_tunnel_proto() always reads 8
bytes from frame->data. With Length = 6 and payload aa aa 03 00 00 00,
the rfc1042_header match succeeds on the peer's own bytes, and the two
bytes past the frame are copied into h_proto and delivered up the stack.
The frame length sets where they sit in the skb head, so the read is
aimable and repeatable. Injected over mac80211_hwsim (init_on_alloc=0),
the delivered EtherType is stale heap content instead of the declared
0x0006:

  aimed at object offset 410 -> leaked 7372
  aimed at object offset 410 -> leaked 3d31
  aimed at object offset 414 -> leaked 225f
  aimed at object offset 418 -> leaked 7573

With this patch the same frames deliver 0006. syzbot reported the same
read as a KMSAN uninit-value.

Only parse the header when the subframe holds those 8 bytes; a shorter
one keeps the 802.3 length semantics it already gets on a SNAP mismatch.

Cc: stable@vger.kernel.org
Fixes: eaf85ca7fecb ("wireless: add ieee80211_amsdu_to_8023s")
Reported-by: syzbot+3d9e2c65bdd43a254924@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3d9e2c65bdd43a254924
Reported-by: co+0b5d5f4d3472df53@bugs.sh
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 net/wireless/util.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/wireless/util.c b/net/wireless/util.c
index ebb1f6ec7efc..0a0823d1d517 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -1034,7 +1034,9 @@ void ieee80211_amsdu_to_8023s(struct sk_buff *skb, struct sk_buff_head *list,
 		frame->priority = skb->priority;
 
 		if (likely(iftype != NL80211_IFTYPE_MESH_POINT &&
-			   ieee80211_get_8023_tunnel_proto(frame->data, &hdr.eth.h_proto)))
+			   pskb_may_pull(frame, ETH_ALEN + 2) &&
+			   ieee80211_get_8023_tunnel_proto(frame->data,
+							   &hdr.eth.h_proto)))
 			skb_pull(frame, ETH_ALEN + 2);
 
 		memcpy(skb_push(frame, sizeof(hdr.eth)), &hdr.eth, sizeof(hdr.eth));
-- 
2.43.0

