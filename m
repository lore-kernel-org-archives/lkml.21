Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678128;
	b=ggaznmdzxg8j9FK4wL4GDiuB75w2823w4tERTG3cUamY8REgEniJSD/eK+6B/65pmIIu
	 mlTTlpnf1S59L/Wme+UXbq/q/K4LKMOkHuRyFWtmRWr3nTW0yyU9dfRJsf9i4UH3wwC8W
	 +ds4SczJ056cJPxp+aL5ZvS624PJVK5HA9HQrxXjlo56CNQsYOxU+r/WOSHNEZejN19Ko
	 3j7+dJKxJsf/zVLyJ3rg3XNT6FO/3fBN6TaeDGs0+1+kUzPkp60FGTce+GvguOk8cxDPB
	 v6bwLYHKTLOUecauZ5Y8qvozoLyofHIFW6lgpTJgYiUEBoU2WTpY/5htZs4nFrFT4Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=METJgUWTWcnOb2elGJk6Moe2jqeiarxjcpi8RUUfpFI=;
	b=4y7TGWqCZ4DbWwXA4R+FimzHAi3VMEWik4eM/Foj6sYUnm1OrrAqK+/Y0lq/m4ZTzKBp
	 qv7OUtHnAvjPgCxAGOeEDLGT6vMzlzWt4l+1ILQZBRh3sbnm/kvMJcmMzwWL3/rlbNr/H
	 zLiGb8qeGgg+WXRz3H3Ofjx37raDcGpr8tcqjIjWdy/zDBNIAnjWLxmapznSZVXonSVd8
	 YxuPHsACEksAF9nOcKx7NS2jUHfGs0pR7xvLKHJEaCbnAff/PDNHXOml/M8T8+4W9g28x
	 7Z4PbxHglRUCiUCg9Kopk5QwxTSw/9syy6iZYID6u80dvCNeE3tXUzCLLYpwfB+JECA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXV0pYAu;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9808606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9808606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXV0pYAu
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso2643398a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678127; x=1796282927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=METJgUWTWcnOb2elGJk6Moe2jqeiarxjcpi8RUUfpFI=;
        b=QXV0pYAuSzP+aTEMZEfFjKGJmUpnCcSJW61IV7dDyY6np2JCpEps5Ge7KkQCPUlfqN
         fU3m86r0IAiZPt/5rmXAuYDmrXBbBe9za1JsfbrYIC+45RNNYGGUfrpZ9G+iomLmYD4i
         hwn1YXEDSVjOkelQgF0ij1pmbZjtat2eB4KwIcQ34Tll1WgqEp0+NpmVE+ft7D1IDrK0
         lg/pZ2xF7kHPl3CLCKZWHcYpIVKV7Ab2d+gXGR/eYGoLZ7DhGaiWGVOwHotet96oJNlx
         aRk7JDTxUbUZrzyBYiKGK/Kpg5Edw5Pl51QZgVPdLzCgKvn91s6VsxmYmANwEsfCwPuq
         4yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678127; x=1796282927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=METJgUWTWcnOb2elGJk6Moe2jqeiarxjcpi8RUUfpFI=;
        b=MwaswR8PfwFo8Tm7GHjFpkorbXXgfPv1n7CVI9MTa6Ojbm7q4ZKc9OCksIrSa/18P+
         H7Hdf/j51JVzgFZNQiWlL67sMFCm5vHM8wkRL9uhv3JLygkU+BuTUf0ca0wi+Kv4+Vsb
         890i40+4HZ4UbcDz5ixZcdk5aXS2DIOy5xclIuiniqw3emLZK/TUfZxbz3vyye+y4oGL
         wOQddkkdfPvge7uXYS4TEGqMIh2TtvrR4AvJQZZ6DA7X70iToLMtSrAecy0XIvWTENLn
         Egm1pdtIltMROMAxCZ9v3QJmgnroCCL1dhfCJZ3wKMnOPGsMP+mF8hRX5ynQArg1eUAB
         zjiw==
X-Forwarded-Encrypted: i=1; AL+hErH5e2Bs94D3Ekq0EchPjnQqfadurFG7h6UPfaYqqbd9JsC9inCjbUBSgS/zjnWcHCXUReTofp2GGoopyOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PedJKFN2Paxko9uXyBbp0ipik/jvo55WQqiCP8o+y7ku6MXDp
	0xXTEplnDwTEEKTZmpw8JIolvCAMaguWMA7iQcP4eqE8idRNHHIejyyY
X-Gm-Gg: AZFdTZcYVKwOcaw6ERMqdx2DbGxgdfSl+vIfoewbkiYVgQ+oytFANR3JDx80iRAs0nr
	nSOxdFQfg1VH0eYSzGOVhBuf3SxjbSmtjdtlZkqb5aYDXFnSqJtpqnvd/6CDrE5OJCPQ8CVkGqD
	vm0funVWS4gdD1hcxzh2+A83OYh5WHh7XDIsEbprXlA9DOwZ8N5Rjkk2gqxHa9NDFANoLkrn8dX
	onBE3DFxNlIfPQCVs5wdqbG4bMy/NaqM7cHKk7jm6QKBP1bTRqQgG3Ne+ebL0ps9HxbwHp845EN
	TRDL8hmgnHvGUm3mmW+kpkVt/unh21QMWnGclFwFLkYcn4zVREbmmAzM397jo85ayQB6nw2AdQK
	9/01pbImgdJ6BvxrPXC5sW4T/tg7HJ6sl9yk0qoKxAXhS4WT2L0vXDQa21mj0ues4j5AH+Yfw6L
	R3vJePyFukhEz4VsP5TR9zbkBl5ytAVAsuq0qt+YvBUBxj7wWJ6bxLGv6lb3ZNbKOgWmheaETku
	A1P5fOQR0FAShcuEe62ZYRMdoHf2mVuUDMC46wRullZUxAhsrxyuorqon8Tn2g5TgtZ506CYxgd
	JN0cK88vaHM6ygWGplnhPcSE3UnIF0Y56PdO95Y+6U/u1hdbwfP8EglTiLr+zuFTVdRBdU21b21
	An3hKuoMq6StjjfQoAeYy7TV499rttg8EdICcrFi9Jg4=
X-Received: by 2002:a17:90b:5109:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b41c953f98mr20801256a91.49.1795678127110;
        Wed, 25 Nov 2026 23:28:47 -0800 (PST)
Received: from localhost.localdomain ([240e:46d:2300:827:b108:4552:5e9:4319])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm14772112a91.0.2026.11.25.23.28.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 23:28:46 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v3 0/2] livepatch: Reduce tasklist_lock contention
Date: Thu, 26 Nov 2026 15:28:27 +0800
Message-ID: <20261126072829.97792-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Patch #1 fixes a pre-existing issue on PREEMPT_RT, which patch #2 relies on
Patch #2 reduces the lock contention in the livepatch transition

Changes:

v2->v3:
- fixes a pre-existing issue on RT (sashiko-bot)

v2: https://lore.kernel.org/live-patching/20261123024119.16154-1-laoar.shao@gmail.com/

v1->v2:
- improve further by skipping the second pass if the first pass fail
  (Josh)
- fix race between klp_try_complete_transition() and
  klp_copy_process() (sashiko-bot)

v1: https://lore.kernel.org/live-patching/20261117130848.65142-1-laoar.shao@gmail.com/

Yafang Shao (2):
  livepatch: Protect the per-CPU stack buffer in klp_check_stack()
  livepatch: Avoid blocking tasklist_lock too long

 kernel/livepatch/transition.c | 74 ++++++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 15 deletions(-)

-- 
2.52.0

