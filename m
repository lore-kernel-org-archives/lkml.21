Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408187;
	b=ZOTBjRl7z1veJHrERBXiELmgYX6q8XIEpmuHXQV6cUEzdqXIhwTpzJ2Tf+9IFpkwf+f/
	 RVWF/DLF5PQ50pipsXOoxb/ooK5sUH6oBCyTRjTixEktwuRqf4cKiTC4Lvby00wI1WI9t
	 8UkMO8wP6IqTKsUAJHBRPZ0onzn5gpHncxQIRTTrwEH+APSJ3Mu3w1+AMUHWz1GUAHbwD
	 nZpYqJ2TFAB1BEaHNl3I4zJWu9QIlO2UCadcpJskC94vuz70922MfEybijZODtEQNXfEs
	 hKaeudm0VdPBkz9Lgbd9gYJgwCQn/l8cSHOp3oGEgwt8tqY/LYJ/upHeLB2x8k6kDOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uLMnyfwDcXeZXg//v+DD9Q7sPFzFL3MyagznzzULhMA=;
	b=PmbjJRGPWvfqlocSBzMbdeIrsTBRmkEx4Fa0LSj/J7obPLHvcvkPz4BEfyVYsidPD45t
	 S5Ofa3LlVST/ud8Ub8l9QCOB2mx/UoBi18BPqYXztxss38qmjKCiqpvIOOsKRFg3JkJxV
	 hBhCZPNjShIN5tjItCvTAJEgjX3IXrBi7G5tqKyD/D5NPyXju9A1Q5L1SPXVYPZsfrDjw
	 cliMtbdIOyhZn0nD02vBnZ47qjPUYOdH7tUYMXsHP0RHXxuAQj5wSVKvAkg50H8N07kLh
	 drfFRru41frz0kxAERiRcZUcpI1xxchjlPZ9DuUmbRB5mTzgKpNSAq17Nl4XTfc3DTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWdtccDT;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA1606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCA1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWdtccDT
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-382f4710a17so4922678eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408186; x=1796012986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLMnyfwDcXeZXg//v+DD9Q7sPFzFL3MyagznzzULhMA=;
        b=DWdtccDT6iZEW9tiBn8SidTw/gGq4Elp7wIOV1zeHWPE3GIgA/far/hcqTjp9XvGvz
         xQEcBvEUClWNlb7m5npBVa0x5g/RnMCcHjdFh4IxMl4q3agcQHtsw/FBQkMvpQ1pGWE7
         AneWs1K669TpL3zQZlBipDBosbfDttiXHAjVEkCnPlcgKDklHSHaJ6UZ+o1zdY5egaEr
         kfVAWMOmsFjLkr1c6RiBltT/FmMFtYxO3ndr37GaSLHnKM1f03ax7677wxPAWloQpEDu
         LnnbFo1CQfc610ArsE3Ql5VrbTlTI8lzmP3gnkgw4C2yMw1/U1Bmlto8nkPJBe63S+18
         Pyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408186; x=1796012986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLMnyfwDcXeZXg//v+DD9Q7sPFzFL3MyagznzzULhMA=;
        b=GcpTHmmD3WNx85yIGjxbGScGWv7TSsfftMujjk7zKPwHjrdpDSQ6faJifWQio3ZPgk
         cSbUiV+5U0FkDt/ewuF1vD0ZYEZPGX9CbgUXiu2+hC+C2hEzceF0ZXuFUW5Qg9xSgecL
         Wh8CpujA3LgxdcVswGJw0DmoG+Y6f+G3tUvLmrosY+3Zfmcj7Mf0/1byAgkn/bIjvOWL
         DNBb/1KYZ5n4lRD51pyYE4hq5MMdpvzUmEmCvxfthsU6TxbhPQSwmrgKefw6NsAt4vY1
         NFZaGHTZ/ArTCMJYHyRG3kNQaiEW3D77VWN3Y32mw3tgb3aDG/3AAldypjgUi2Pwizf2
         umqg==
X-Forwarded-Encrypted: i=1; AL+hErFZwEwwlBlV2NXUvy/CJlzryBrFvLX17+yWfmmAp9iFMV8aJkR4VRfHTAIgLHS5DL/R8yrCLCtV0A+m0b8=@vger.kernel.org
X-Gm-Message-State: APuU4Z96gsChu1E4iQqjvJN2YN9c8gdWFj1Z93gL6ldn1Ae5Xnnc3Ua+
	foyFk9WpqKRiGNlxLN5pkeQ/Tq30iIbl+W0gDO23nA6apaZ6iELbkBufJ799N3FE
X-Gm-Gg: AZFdTZefoKpCo5H/X5M+cHLiMJUaFwBn6ScMh2QeCTU/+h+D+K6ysLv7decxhDPGaM+
	D2BU64QI3zsf1SPmlQGNLVxrSfwLeFNng41y/m8FKbJWjwA1toafla8lvmWohUi46lPKgX9gwuB
	LIqWhtSrZiO7pP9yWs+GK6LLr+T3vyxXXHXkFeIT4uYNRd1/X6LopFKiIH+qybAnCWgy17DB/XM
	hXLlY3AsYhpPUrcRa7qUmQHJOe6C4nlN/j/eSuPwNtIRrjTKWGIsutAa/S2VS6yIInZpIL4ICV7
	NgVILeNn0qbHqNVK07p8JPrPmEjlbXUTQQHfscButRe/jyLk375vIa0HVi24JL470NKyHn49/03
	Kg8inaDOIp9xAjXXT1V34SphNxKEeS3oSibDQMWgHHOJNRViiIxLuZizBFgjJSebfPapPmctWok
	RRDOoqBc9erGBzqjjsu58xH62Nh7TNFTLp+RXzY8Rq9Bdc80D2jhFAl2Ec07S16B+ePNJFIkvO4
	mhAjY1x7KO2HnxkQUE3epPPkmWsPbFpvLW9pOYeYJ0WTWkwN8Jc+NxcgZPhOFIw77wxzveMQB1h
	rL/bVIqSWdclhIOw6glK9BPr4HVEDfy3N96M3i5Nlf7k7/YFwHBRisPy1rMgb9sSxPo=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr12237050eec.22.1795408186322;
        Sun, 22 Nov 2026 20:29:46 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm33562090eec.22.2026.11.22.20.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:45 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 0/1] xfrm: free the policies already cloned when a socket clone fails
Date: Mon, 23 Nov 2026 13:29:41 +0900
Message-ID: <179540803323.3139700.5340002553684152759@gmail.com>
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

When cloning a listener's second socket policy fails in sk_clone(),
the clone of the first one is leaked until its namespace goes away,
where xfrm_policy_fini() warns. The patch deletes the policies cloned
so far before __xfrm_sk_clone_policy() returns the error.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v2:
- Check the new socket's own slot instead of reading the parent's slot
  again, which a concurrent setsockopt() on the listener can change
  (Sashiko review).
- Send the patch inline, with its own changelog.
v1: https://lore.kernel.org/netdev/179505710269.3511679.8893709762919027206@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, the reproducer from v1 no longer triggers the warning.

Kyuwon Cho (1):
  xfrm: free the policies already cloned when a socket clone fails

 net/xfrm/xfrm_policy.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.43.0

