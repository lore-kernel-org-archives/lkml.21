Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422390;
	b=XrLdIO0yOkN3cdab12ZPQM89SJT6P6fvnlSlSBnyEkDaqyrVoPNdpc27nG6vcObatYZT
	 k8+vXtfhFxwI543u2GVvuILXwNFea8j6RnSyjq9IWnEIfN1+1jyHl8T92GOBge62l4Lsm
	 6VsGYaO3su1a8laF5kOWjS6OVXL0k+ZxTmbXZOZ2bWEKapJQj4qTTqSF1e7AEScOICHeA
	 RDQFyLvjNVYy0wdT01Yx8RpTKYrFfmH4IE6Y+tVZT/w6DCol6WrYRTwFAI/tQbUvS1zL9
	 PMUSUZSsMiRXmoXsqz0FfbjIDgXkAwJvNQVCGoGMuX0cRRvZ5kbTcS1Rr4UiMNTnDwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7udVJwhYhiZkorajfCLaajaBwSVEsWpW464G07q84Aw=;
	b=lfRw4miBqc1yJCoYbKh72Hn/ADfPPwJnbrctAVeqqWBsg8D2HsJeISJi+pR6trdIY+Jm
	 y5piJgZFB4WISP5SsUeonHSeie44Df4t0vfDwQT112plQCf3iawZdMlDIz5lxQYx9X/wU
	 ppY5VLGksg70Mme4Jzpn5h7QR+9CThbwm18qLtsZcem/pB0B2b5LIccFOgbEZYxRF49wO
	 yEfsHU+05XIp83JAMLUI1t6umJjYpsUojrdL3H6EWSpmNtO79bXtOg/H4mMMa5/cFkiNy
	 QmueLwPvRMGf7AL1UxoBqMUGWVjf21FGdu//Q0NS5FoRmYgLITMs4RcbRymg/VLesyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmXsRc34;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230C606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1230C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmXsRc34
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1440246b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795422389; x=1796027189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7udVJwhYhiZkorajfCLaajaBwSVEsWpW464G07q84Aw=;
        b=XmXsRc34f6Bc9KBidlioBOHmKWsw+Xk2ORPllNKtQKuczraQZvtgcDIOAWsb9rmLeE
         lu0GGK34HkSZybONTHg9EJhyUbbNRDnz2BZIWVconcEUgmi3+hPUca6r1e+N9wElwhkf
         k5Kw4YIaJyK/W+JK5NxJBiz0DY8Go0OVsuzeBgXL6zVh5CvNeFN9DG8r05B5BUne+xmf
         lthZnzKlWaYezCoEFXl0siBMcgaLGk0AZ9TfnirLEsEijy42kfgHC93ip9jp734y3aOE
         8KwL4AO7vbhaZUF8TZnI0Rp4plIRVnHuIZVWt6U82uki5+Nov9xTDA0tDRxxVK7fS5Mu
         Thjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795422389; x=1796027189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7udVJwhYhiZkorajfCLaajaBwSVEsWpW464G07q84Aw=;
        b=adXMt34AzEqdpoUcQ0ljZVT1Ix1nPvkAd28N8tK4mbROJZud5CSLdiGmzuXhNxm/Zh
         Ou4TvW7B323fvmCuqDhPEfMPchHS3lvCT6iL4z+3hBrl1eXDM0RxHrxlCwJ0HUf4/F2a
         oKz29lc5lRcmkHl76MAOJniy4/CzXDYkvEtuWQvAthU/qCZl3RhPsDcUDCWSpOeYNeqi
         UOjR/5UJes5VhlqIrCT0jS+buKRPNYhC5ECufCCWfg0t6sjpwZRTDz1SrSb54omIJiyM
         OnIuZ6ai9UpS4StEyQ3H7Z2Bl/WdJ7Ke0ovyoCTjlZ/Y/N9s/2/pL36zAeKYmGQfvUWz
         Nz7Q==
X-Forwarded-Encrypted: i=1; AL+hErFhhlKfkHhxhfYdSsaBxXQ3frwfOSnMd+72KYW8+4BqqNr4JO24Qq67IKLlICfUaaQAMl1Jj7ZI6m1FawE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O5sYgc9tqwhQs7P60b7Kf1lC1oSq3PZhSHRV+l6A2p0NC7Ue2
	e2vyALuYp1tOyjsnmGrF3gO1LvYKR00rTlUchGKEmWwclELiMKu0Qo76
X-Gm-Gg: AZFdTZfWL0WjFiECZbZ/zhrRWB7ti2YZHO+TqBTi8Jrc4u45zSPKT6gO+6JR/DLQ6NK
	MlwXx3nUEG1MBCh6DvbktKfShVnIGZl5xO/tAIJ7toKYB+L/J1ThanMdVXmscvrv/lG3f8hExDa
	FPTMx9E9gXxOxB19TX4J8GN2ZVpD/dBImCblpd3t9xo9UFYgvL8TBLjp/uVvi0hOKYFPgxSPIxe
	jQYREFOKDgM0ARr4HUvyJEUUCw6FhixaOfRY7gLmqBLIS49e99Gz8MV2qdC49RGqGLocvnQTHe/
	XVcD+BX7FKg3JR6jNIWzMMtovH0JQBPTjugZBK71FWfwmCAjE14y86eGDdvt52raOiXrtVRW1Ke
	OLZa3kkepljedbcD3z3C6ziDGPYrNDCS+68quyKgt7Pc/mglEdxy26DarLc9rUhdLUy5IKhsY4L
	48ZVY7AveMMQuLOmxgy7Y/7toV3nCWfmigCNmwhOTJdY0tfC/gQ/ontkzSVLO6uGDnr7KFWoIGX
	BNZQIRRttdNujFOEbmdgS84VP85BDEtlEyVCu+39iPtUwDHcBzuh0iRbAlj0f22pIeqiN0iiT5k
	cjWz9SxAx5AXbb6OaLm4kX2Mg0D8JPCsPfLohc6xHYDXV98u8i3V7h9Pn8+9iPLvOa8=
X-Received: by 2002:a05:6a00:2e15:b0:89f:ed3b:df97 with SMTP id d2e1a72fcca58-8c87d5169bdmr8978938b3a.51.1795422389280;
        Mon, 23 Nov 2026 00:26:29 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f571sm4953714b3a.34.2026.11.23.00.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:26:28 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] sctp: pick the AUTH key by the data chunk type that is sent
Date: Mon, 23 Nov 2026 17:26:25 +0900
Message-ID: <179542222978.3276016.1235014191109840927@gmail.com>
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

sctp_datamsg_from_user() takes the chunk key only when the peer asked
to authenticate DATA, but with stream interleaving the message is sent
as I-DATA chunks, and _sctp_make_chunk() marks those for AUTH when the
peer asked for I-DATA. If the peer lists I-DATA but not DATA, the chunk
has auth set and no key, and bundling the AUTH chunk dereferences it:

  KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
  RIP: 0010:sctp_packet_append_chunk (net/sctp/output.c:264)
  Call Trace:
   <TASK>
   sctp_packet_transmit_chunk (net/sctp/output.c:189)
   sctp_outq_flush (net/sctp/outqueue.c:1112 net/sctp/outqueue.c:1218)
   sctp_do_sm (net/sctp/sm_sideeffect.c:1826)
   sctp_primitive_SEND (net/sctp/primitive.c:163)
   sctp_sendmsg_to_asoc (net/sctp/socket.c:1919)
   sctp_sendmsg (net/sctp/socket.c:2086)
   __sys_sendto (net/socket.c:2283)

In the opposite case, DATA listed and I-DATA not, the chunks carry a
key but no AUTH, and room for an AUTH chunk is reserved for nothing.

Ask about the chunk type that will actually be built.

Fixes: 0c3f6f655487 ("sctp: implement make_datafrag for sctp_stream_interleave")
Reported-by: Sashiko AI review <netdev-bot+sashiko@kernel.org>
Closes: https://lore.kernel.org/netdev/179540440300.3135.8565987128928534228@kernel.org/
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The Sashiko review of our earlier SCTP report pointed this out. We
reproduced it with a test that enables AUTH and interleaving on both
ends of a loopback association and has the listener ask for AUTH on
I-DATA only: the first send() oopses. The test also works as an
unprivileged user in its own user and network namespace, where
net.sctp.auth_enable and net.sctp.intl_enable can be set.

The patch was written with LLM assistance; we reviewed and tested it.
With it, the test runs clean.

 net/sctp/chunk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/sctp/chunk.c b/net/sctp/chunk.c
index 5b889e89e9f2..0ed251421cda 100644
--- a/net/sctp/chunk.c
+++ b/net/sctp/chunk.c
@@ -183,7 +183,8 @@ struct sctp_datamsg *sctp_datamsg_from_user(struct sctp_association *asoc,
 	 * we need to account for bundling of the AUTH chunks along with
 	 * DATA.
 	 */
-	if (sctp_auth_send_cid(SCTP_CID_DATA, asoc)) {
+	if (sctp_auth_send_cid(asoc->peer.intl_capable ? SCTP_CID_I_DATA :
+							 SCTP_CID_DATA, asoc)) {
 		const struct sctp_hmac *hmac_desc =
 			sctp_auth_asoc_get_hmac(asoc);
 
-- 
2.43.0

