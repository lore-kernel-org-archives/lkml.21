Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640478;
	b=sJbsnAer68UssH7zzhaKwcTWlCo04UcD6Q7sWh/08my1hzIlCi9IwWqDnvcKXBxUO/XI
	 w8cqfO2F28SmeVs+n1FXKaQ/fvgpY92d02F9jmq6MLGNcQmHB+MHTsZuZ4geUmLWxxH1F
	 J9Z1OF83eh+Z07egTITWasLSPDXLCg6MGRJoihospGTWtYKNpP1Xt1xQe2JGjb727VPys
	 KIHXivPtu/jcOtFpBNS6mwdLrAw4gPqxzyphRaWD9l3mP+uTtpuahpB2t8qUPDvuH8bqJ
	 kOoY496aFdP6yJaDvpglGFAXU6o2+DlyAhZQDUsNhXwUBFW1c0QHtF3M0/Bf5IFI6JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LnswTU2/YWk3r53uyQA8ripkBB7cIY1V54pcLpAT4Q0=;
	b=p8HjBs/ZyvMpqDdJ+TZye+aiwDBmNEghxF0AbQCPZoPhy1ABaqp/7JyvcgApVpz7vIFu
	 epjjj5d8YkrkCKpYXyaKUXV0fpRlbqFVUC+cin4KUkybSHGz7t/Po+4JyxUBxUZ3rB6IA
	 UnwKqI1GElLlPZg49RfGbMTPDUiYth0UU6kZFiclhIGlqlbqJe1XrMYo5ajbITkvEBDlC
	 qnqKD/t3hCV2TiQ0D8/gHu/GnDYC26QthSrRaLbsDXBqbRgnEbeQXxoNdgGTGaa0XxILS
	 6OdlKwIeSCCGvn3TD2hEfVR9znQtDt4DpULM6KfA39TxjlrSA4bREB8qz4AYq6ZqXMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="felOtV/b";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDB6606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDB6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=felOtV/b
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869865a304so339100eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640477; x=1796245277; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnswTU2/YWk3r53uyQA8ripkBB7cIY1V54pcLpAT4Q0=;
        b=felOtV/b3pbMZH5MzHu4ojI73i81tNEsMTtGcov8A7zdeN+muYBMAgeFIL6P4VO1zE
         L5hwDCatCHGPDJiatNQWiZfpYOuDR9OMbToDw8mQzyLSn7vUEtLW/xrSriH73mXbEqJT
         RhAKVbBKvpBnLI4kiG5dTV45JyOmqk36HA0hyGH87JxdUGwa8TYkfuK1a5TeXhp58Rks
         R8IjkiEdfCWp+7yRNbq7r3k1xpMemCYn5aI4636LsLMgl6lQJyFBwEGYLxgcKCWriq1j
         kiQn92WdMbB3QCdZDdl1YgFK/mvGiICw6jNQU9TdwJDC/PLoxwuYViIrGrSi99fKrxfP
         BdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640477; x=1796245277;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnswTU2/YWk3r53uyQA8ripkBB7cIY1V54pcLpAT4Q0=;
        b=Egx8RHntcRAsX4UH3wpIUT1sdPcIUYPdV8uv2d5SqedUzsUXSjCTjQOZxTsJHI3bu3
         SIkuwf6NHPu4IwmyzVrVgKZU9t5HCKRvwaH3v/CensD0UtuINI4f4m7703xQfZcBW92Z
         zrlpVy1Qyh6UhgSZecNYvVx/l5zkae6GnIw9qu/6QdmIzuYPSBzWONW+CYdetZ5+9K0V
         cqsTu6exTWD35BpeOI9j2Zs42ZUP7dK8aOzUw6mPqVGx6HeTpy8ARKFxhEjkf0zuf2Rr
         HH4c0Wb1rKHcVXwKYVttyFDGAYWEeFXzTofmkG/BKpj3CjDARuOCCTlxI+MsnbeiFsks
         DGTg==
X-Forwarded-Encrypted: i=1; AL+hErEMaR/gW3MND/tjENkSSUULWmM+mkbYhi+LS+hDA4QYnTsuXql6HVOACfft0zN/jDqJsutGRBwcbmRhqA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aqJfG4ApAU2+GGa2J0kyPdW9Svop1erjfntcNjyqzhMuuECb6
	Fvq0UKYTCaOugzKBCzozxyOqRYHGgWLOiUKSsXtSUsMidvgi3sboZv6KnwMXYUVwvc25xPOGR4+
	K4g==
X-Received: from dycue8.prod.google.com ([2002:a05:7300:88:b0:343:520f:7a80])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:880b:20b0:386:b025:1e1e
 with SMTP id 5a478bee46e88-386b02522d2mr10999574eec.16.1795640475439; Wed, 25
 Nov 2026 13:01:15 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:35 +0000
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
Message-ID: <20261125210038.1277960-1-elkin@google.com>
Subject: [PATCH wireless 0/3] wifi: mwifiex: fix UAF and ext scan TLV bounds checks
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (3):
  wifi: mwifiex: fix UAF after skb_realloc_headroom() in bridged RX
  wifi: mwifiex: check TLV header size in ext scan report
  wifi: mwifiex: validate ext scan event envelope and TLV lengths

 drivers/net/wireless/marvell/mwifiex/scan.c   | 30 ++++++++++++-------
 .../net/wireless/marvell/mwifiex/uap_txrx.c   | 13 +++++---
 2 files changed, 29 insertions(+), 14 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

