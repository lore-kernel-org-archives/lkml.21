Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406946;
	b=PbF1BNd52zVOC59Oi8wR/FCrLY9Xd0WA69OejYkkiyV6sqamMOJDbZPXWQhPN65JNhGy
	 Uxs3ngzlXgrr7Z8mwoPl+o972g/RaZWgwUJ+tBFnufpR23ud4rL3hUISSC5k97vss6NyQ
	 hUiwBPYWlYb7Y8qeC/HZWaKNSblj1YEBMIwe7YBFp2g+lwh5OGFOWY5D7Jmp5eBwmMgdd
	 sLYw5/tBMJ85aIC15JZLjjzhBEnuCjs4XYat9yA/uoRP5MZ56OHvgj7F7w+Qo7UbM17bw
	 hIucBJWoZRarSxfIfp7Q5k74HopI4cZHxIQRD0CwdqvygAuVUvVzime57D5hf04Pn1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BtiPrcBfsD5mFuSC2CFNcDeCfcErC12Atx3v0TnNNw8=;
	b=lVUblfPIPc2bJc6gLPkhAz7DWvh0+N9tWcFz1JpTySf3RN/tqS8XNZ6TPbH21liz74JX
	 Tj/cZXDc99ZySKlxcdQDX7nOfYcp/kpgbn2j95gC+5fN7tkftXbsener0LeOjs2vpzmd7
	 eSHsVL/5N9EXkiGjPnp3ZjFdveIbCIlI3Rx4GwxCjbAdQE6vocEc0IxXVZVz4ZJcLBOQo
	 A8KlOgRAr1+/z6aXiSsdtmBoZWoXrtaHUQLiRX+Vx24x2X2NSGOA2b+O+9iErti3AHAD5
	 Y2MpFTluyDgRL9B/WfY8xgXM5I4nGJp4vxK4u1KohGh5vTWhCv9yTmdG9Z8oza/3tuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFI6fXON;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F2606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8F2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFI6fXON
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3863db981d4so3729479eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795406946; x=1796011746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtiPrcBfsD5mFuSC2CFNcDeCfcErC12Atx3v0TnNNw8=;
        b=uFI6fXON+Sl/Kx9AN7hdZ7oul1UiRTqjvT0Ci+D3lQhJ5VzJs2Hhn9Q+FnlfFPLY4S
         CFBTocoquxvAyN3Nih8zMGcj4WAFVv3Q47IwKlCvt9if4pys2+Ds2xZ6mecan6K+7jVP
         rrd4Np4H2y7d1P9o39XgdzJIga2H7zM5EZAQs6GablqppJdwYejshIndj9uTi7ig70la
         D5uxbjvjkzDI3c7LvBc6cTukEwsv9AGJAtfuUldP2t5pEuLqWHGlJK8aJ1Z3Y33yvAbS
         5UgAbbT5JZuSfKIdm8+5l3fhQf0d1RhTSI4k1MyUxeXVhaQWDebU2DGQdiwByjemnETw
         FAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406946; x=1796011746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtiPrcBfsD5mFuSC2CFNcDeCfcErC12Atx3v0TnNNw8=;
        b=aZn8XcbodsgVFwkFGgoOUiIF+er/Pb3ZhUdPQPz4+6VRn48BJpRxjnShODdaaK2a9u
         iD+zYS6AMpSS6GamMF7V4JqyTnCEw4qrQ9/504OQ027mrPBG3eIumOYjhaqKa+iiATvu
         KJM3+aTgRZeQzmA22VnbOsu4ZRgMye56F4ypJ5ntoen16ICQ4Mf6M5YEMs3Y5AuE4otJ
         px6Ag1Pa0y9lPsEp4LVKH8Q5Z83+Avzx05j+0NhDczJxwkTAwqEtvcEWsUrRCxxdS5fJ
         yQCKc3WnKPiexU1Rcna5gZ7xw3kehsEyHDZKGwTIoySySbJDb3G9tcwRJMPFYdLMHwbR
         5rxQ==
X-Forwarded-Encrypted: i=1; AL+hErGg3RcZPLbUEiiKClUL8w/FB57W4zz4k1/Jvgwc1MdKhq+ZguCftQvD1U0k+rWn8Mzik6Yu8Z2Ak7/5Lgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y155v9ke+37LfByspRMo9byKsOzxCH8uhRzJ4YDeTYEdCLWJe
	pKUVyMwUtmaHu4MISPsSjMmrpaaCImrwz0R+GF1Q+fFr2HQmRVM01Vj3
X-Gm-Gg: AZFdTZdmo7+S2wnbqXGogciM9qdlDdTEKFsjQXO70NP7UaCeraPOu9D2DkKqkosFKp9
	OmhjF+Zi9ay+Curnx98fo+wA0gj0ZbUBNe1LuuwDZ7HHiIcAgQdxW5csmDLCOY4XbwVNM27XbGS
	WkIUleMxvP+qaUBUjgZiks1tZlq5r4Q7EJaH+zwGINmwvq8RGwY4nlkapON81NTYPvBX4zCsOJT
	Rs+XSxmbRBniGRt6e9NL+Kspb3XDmFQVwIg/iOGiQLzkXGroBV59LAfopZBQ64sH9z5oBf41KWV
	AEi+l8Z/6gY/sSLjifSE2q2xnv+SEw/YXhVchV75kWDSsiL4Kxqch+wAKZ1vHv8lyE0v7d4pNup
	5e8Xne/ZPQPj9rmGKML/7I9kZjvZBfg4zBj0wNEWX6XuLG77z4ZoPdyYJ+jNj/IWX++pdxa4vax
	vfK1Lzqn47KOWC9co9ul/Z3Fe24u1sRUS61XhbuLrQB7ZTl0LMCZ1fQsc8OIo6BAJ75MjlXAXXB
	jnt30dPb4SMmmLVCBuTUdpwyTHmy6sVGmDVPTtdzkLwcHGet0U5h/i3tvblp/jCZ/r4EB08B8W3
	x7upIhozwbAJvMWVyFLbAEo7sZQVgkOu/wls1y0UP3odEBhzM0EXVaEnebvpFcNLXmY=
X-Received: by 2002:a05:7301:6486:b0:378:1191:43ca with SMTP id 5a478bee46e88-3863f1355b2mr7829460eec.18.1795406945611;
        Sun, 22 Nov 2026 20:09:05 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm33451547eec.21.2026.11.22.20.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:09:05 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jun Yang <junvyyang@tencent.com>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/1] sctp: fail the association when the INIT-ACK cannot be processed
Date: Mon, 23 Nov 2026 13:08:59 +0900
Message-ID: <179539544818.3016044.13738712075053349592@gmail.com>
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

When processing an INIT-ACK fails to allocate memory, the association
stays AUTH capable with a NULL association key, and close() with
SO_LINGER {1, 0} then takes a reference on that NULL key. As Xin
suggested, the patch processes the INIT-ACK and sets up the key
directly in sctp_sf_do_5_1C_ack() and fails the association if either
step fails.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v3:
- Pass the error to SCTP_CMD_INIT_FAILED with SCTP_PERR(), like the
  other callers; SCTP_U16() made sparse warn about the __be16 value
  (netdev CI).
v2: https://lore.kernel.org/netdev/179514851805.604157.8527055700821138420@gmail.com/
- Process the INIT-ACK in sctp_sf_do_5_1C_ack() as Xin suggested,
  instead of skipping AUTH in sctp_auth_send_cid(), and remove
  SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY.
v1: https://lore.kernel.org/netdev/179505710266.3511678.14017674052424733262@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, the reproducer from v1 no longer triggers the report.

Kyuwon Cho (1):
  sctp: fail the association when the INIT-ACK cannot be processed

 include/net/sctp/command.h |  4 ----
 net/sctp/sm_sideeffect.c   | 40 --------------------------------------
 net/sctp/sm_statefuns.c    | 15 +++++++++++---
 3 files changed, 12 insertions(+), 47 deletions(-)

-- 
2.43.0

