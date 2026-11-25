Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574215;
	b=5SrQmAdaxkO/m1HeIebmnSg4N30wMbpoFJlCwJDISsfU+JeUdjx9YDCDhLeXCttyLhRO
	 gQx7+pH+tkZXUPxDOK4P7mXS8rIf52FDv4jnvFLJ3zT2PFkBOod80uhp8VZmxq6nwttd3
	 CU0CuFY+DJj9wdEbffEa53/ElmZ67RJ/nNLGVcMl9CAuLGHKg8shgvCracARIyS98WL/e
	 cXYZ0qsMuxEgoUhg4/J+5kyPoWP0xUt9ZXfocXAIbK9i9XesLh59tByYmURk3pUeqUkps
	 tpOQCtfSyJfpxtH/jlDArd346x9lbNliHoS8hoeVob7Qv/i4KiTClIDyOuGyoJaP5EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vWY5PUY4KfOiqJ2qOGPYj99Y/AHpB1RWqszHGNr+0xo=;
	b=NWk7rfq4zH3xYIvKq50W6FwrFaLWAZ3tBk5+jymfNvV/Cb5b2Hm7pdPREVqSiceLfbuw
	 QXkWe55wcgYhaOqX5/LIgujslydxuXhZl+mVWqeLhxW/mBvutu1A2j8DMKwTaxucc9kgf
	 DtcN0cnPbclv0+tcbIjVjK2/QCZhjXS/t75AuUKwsPm3p15xfsh6/3si7YwaoKTjCLq2S
	 ZCMMVtCrGXoCI4CABJsALLxJaVroK0yl3dAMrZdnuCxh+nmH1omikFNwfKqIDP3PrbzA/
	 8BH/FVc2Nutc40znzJVWDMhAAhgUQFyWnaKoSl9QA2U8SmxxOqTK5NGKDrQ4nKpuW3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKQHalZd;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2B9606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F2B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKQHalZd
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb628232d2so2859154a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574214; x=1796179014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWY5PUY4KfOiqJ2qOGPYj99Y/AHpB1RWqszHGNr+0xo=;
        b=xKQHalZdJ6ZNynwBxhbPZ6v28J2vCpSQO3QiW4t+lfKxVlX9KVl2WbGmreLmh2JH5L
         yOLZWCcs6cwkBoL3BTi38iPcu2Gvvyf7Y8rEDkuRi/bBR69kN5pyqlVt1GlUpwWpmcjJ
         q5BKzgU+5n9SIzymPO74CwL+u7H3z8e3IwsYl5qUtpgevklwVvZlfxOzF3Yypat/GqZu
         5O8p/L65VcIdpL2h7Wy0Qqxtx+ki7HPPAA9gr6/mhNE+IT959YaUvgjfKZLokTgLaR2A
         NLMCL/ecSevMhzGK83W0bCxjlrgkr4dcnKdML0M16vdJ3WLCXn15qHsTAUxDVR8zwcDM
         pz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574214; x=1796179014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWY5PUY4KfOiqJ2qOGPYj99Y/AHpB1RWqszHGNr+0xo=;
        b=cuUDFFQ2L7NfSJSOvlm4UwYEDfPUMWYkHrIbRQdPIi5KaWpN5tyAtEtNwt1VNf4HXm
         hXGh8aTyyazCd1SokimeftDETCOCaRW+kkKRkCf+c7dd+bAq/JMbbUmHmnKeGajw5Z2u
         2YnJ+MfX14rgOOLwLQ+d3L6W62zjo1R4cKT3fcAl8lbCRmgVD4NdhUDMh6M9cHE5uufB
         4L9FbZL7v9uVlA9r5kPhBOio0ccsLFuSAWpE2fMeBMD1K2Nu5p3QOiGeZLNygc0YOX++
         31IAL28jTuPPRiSX+JFflg1A3VXf4y2mQxkGXsdzI6dkcVWP7d3A1sFA7XLi6yL/P61m
         bPKg==
X-Forwarded-Encrypted: i=1; AL+hErHu/llPP4uTCi1Iz9qp4IuuTX1A/wDqVRMU0qXO8xgOdP1E1fgf3vBwav7qC+gVXb2BhchBNfjT8qjxZyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s9emvR1yN3e0ilXffXkDStWxYYp+cdNB+JXbJh0VTSJGkzwdu
	M4QPJqMC6fH4ZbmYq+qKwo3A61k79UnWkGF18BnuoHdnRBFPu4f7U8qE
X-Gm-Gg: AZFdTZe5+DXzvRsEbamj5CVVD/VsY0RdCnyYpfC3z34mGFoGy2KX3iiXAuGKGEVSFTF
	Cel1Y0nMtdwG7/+Z/6bu9ZgB+SwlMx+fVk2LvYd2LxO/yea+fxYXuIfkd94zvRjs2N0pYQQ5Gcv
	a57fJpRJnMB8A0zgtYSu+vwgGnh+v8To5UsIvY3xTmgh2ZZY/N3SJ9ioHLI2WESeL1j0AvqE1xI
	TK9EQTGizug7HyeIMJvRWc0G4ZmtAOz5IgwqAXZl17xxYurTqHFsntB+xTUZftARot4sr7/f2RS
	TtuJ1S2lCyjymtkjWltUar3rXGS8A3Ol6UBCejfl6sRDigkLx3zSRKxUYzplQTsL98V/wgzgR2l
	zID616I0+0Lo9QZZFSwQEKc9teA/QmLvx3ipyiESEtWMVYmzRkMSmkZLHn/U0Jp/1MdmwGpdhH7
	PzF3GvHMH6Aj4WlUKf5Qgo4/9oG66Yb2P6+IIkQEVrGtLEm6hhQFo29zBBEqs6e4Q5jTEy9cgFy
	2Dh9M1ISY/6fwWAkKWr+DuUy5QEToqVvSxmdOfq+3gOQOuwhVHY6izl8iDgIz+9wXisd+WunXzY
	KJRY7SQLKFl42UGZqpHpRXEy18lgPvsODyEiUq8gvh1QuUOqsC4wiRc24xvSDL3kDnw=
X-Received: by 2002:a05:6a20:a126:b0:3e2:7a05:6bda with SMTP id adf61e73a8af0-4014d963fe0mr18125416637.43.1795574214549;
        Tue, 24 Nov 2026 18:36:54 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm7294885b3a.23.2026.11.24.18.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:36:54 -0800 (PST)
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
Subject: [PATCH net v4 0/1] sctp: fail the association when the INIT-ACK cannot be processed
Date: Wed, 25 Nov 2026 11:36:49 +0900
Message-ID: <cover.1795572890.git.kyuwoncho18@gmail.com>
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

From: ChoKyuWon <kyuwoncho18@gmail.com>

When processing an INIT-ACK fails, the association stays AUTH capable
with a NULL association key, and close() with SO_LINGER {1, 0} then
takes a reference on that NULL key. As Xin suggested, the patch
processes the INIT-ACK and sets up the key directly in
sctp_sf_do_5_1C_ack() and aborts the association if either step fails.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v4:
- Free err_chunk and abort with sctp_stop_t1_and_abort() on both
  failure paths, which also sets sk_err and counts the abort (Xin, and
  the Sashiko review).
- Say in the commit message that an INIT-ACK from a peer that is ASCONF
  capable but not AUTH capable now aborts the association at once too.
v3: https://lore.kernel.org/netdev/179539544818.3016044.13738712075053349592@gmail.com/
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

 net/sctp/sm_statefuns.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

-- 
2.43.0

