Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552898;
	b=ene+/c3PiElMjfKErZZ863K0d5eUKltz0weXh9GWRVCAKWRpgC8UGc699WXYiJBAnsjQ
	 dKXAcwKj6atmnLB2yE9hxdyTos8ESkGr55xthZiEq/xxy880aw4qPkHztwd/blfqitYV4
	 JCVcEES1/VIbK+efPW6oTpya8ewjZ9Hvfc6hwDejlxfWZwvyC6MW5WhLR+idcOP9YMtDI
	 JbnertlKwsCyYO+diVLm4XIX3zxnzWijGmZlAINuVdmx7MiEEN2i692Zl0/e/KKF4lTf6
	 f0g4p7YHyWKmZv/CobTDWw8nRv7SHyLAcF4tcW4pMzpr51v7uzpyS2BdREvj8Zp85gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3DhUhcSQvV2ZZs3cPK/rSqn6Ww2SQvg5LbDKPoW2lNk=;
	b=0EjD/AbK0ZBjbbXJX/OUfqZlANn0I906V4JLWI3U8m47tvPfO4RJTl9ZiZH5rnGdTs6Z
	 oSAHmizIVKL9XDhU9+WBp8fs3CSvznUEJJkbJA32dEiOL9/HES0+AxvtLLFUoUbj2qoeU
	 g9L5lfhPhXIqXd4NaJ62opAOQUqk/HhnyhL8QWOQfwULZrkko0NssXbG3cZo5w05gei4J
	 L9y2LNe+TnL+vCaT38pNL9PRAFHUp2F+oV1um6+cNrb6S/Ljmq9CfUq3SN3mioFr0QpSk
	 Vla2aK8Y9cuc3P1vYEbJl+t8NewSJPN23PCNX38omXI7xhQZpHo2wGEI3xz8RfaH87A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UV8FkLQf;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045A0606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 045A0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UV8FkLQf
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so8369701c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795552897; x=1796157697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3DhUhcSQvV2ZZs3cPK/rSqn6Ww2SQvg5LbDKPoW2lNk=;
        b=UV8FkLQf3SQDapCvbv2mLKMjtHyRZzZn8pl9FYH0dyojDc4xtJ3fJB2KQCeqYQwHqJ
         X8MKaRXxo8WtCFfSozQ/wvbKZ2apuy8W0hnG5kkt+6/rvhLeZscSo8tXyQpi8OZ882Ob
         1B2qMGTCKW5JfSTqhXObS2fbW7ztgz9ctwZPraainBGFgmcclun3YBGdo7kAPhjYh/Zt
         lP67ONDgPu0jfWIVeOdHutx/D3lcYO5+vfUiP0KPaZnJgNssCoN8dGOg8xqHmDFGTWNs
         8Xy8hb2gLsiBLJi6NSsu9cz4zqeIFv0aa28QhErTmKzL4y1snaq7b6Ku9z52g0tzIeFM
         7Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552897; x=1796157697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DhUhcSQvV2ZZs3cPK/rSqn6Ww2SQvg5LbDKPoW2lNk=;
        b=SUY3rma+Fee8k7d5FHfZ4uwkU8VBUEZEalCNLcYdvqyyD/ni5ne3/zknNMIbDSC4aS
         6bgmt6cgEm4Xa+0ZLr6GG5OG+F5zdZBX98CXKb9SoKmaWED+7wN2+5GIb9T5pBhTu8Dr
         nm5bILITGEFyJhT2CsXLI7/DnVPwoEewxJExEnVo2eUvF5iPYxRlK9L2Vvdc5Pf6ojPK
         MgTY9aLU5/HAqO3ggcIXvhIfOzm4RwEUt6mU/FEGQmEjPpJFKO1v9V3Zby2/vO3SXBou
         l5VVjf87sd+LEoSvlp7HsU1BN1vgnWsfr9uQiVcfJIU2S6/DWh6Y/cPSPwMrX7pTZI+K
         zNgw==
X-Forwarded-Encrypted: i=1; AL+hErEFPFPgZt1rbCh+6Z8mU61JM232LGH5ESq8VecqJSMI7SxuU6BAGuxAQ0hQzYjfQeeG0CF3YO74w5lJhyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ln5IPHFqM3mrXgb4fvd8ARhmCK7Ft9zG1eZcl/rGXdp7qEVFH
	BMa/08q7iPnghIjiJGwkKSPIRD4oMRgAWXSMHy4NgnR1poNqXjrqFrO/
X-Gm-Gg: AZFdTZcpeVa6v29/b1Tww0jN+IEhQhkEYiocmLlFlNx6zEtdHS6bIPHw9XIQ1kZcmZ8
	nko8ZECL3PJPtyqXEW8WUJ0gg90e5LbP4ZKdYZgn2/fu3P1Hpcvhl3f7CWTo53hlfZ+GY1YLWyK
	fq4k8tIYNrcAINFFg5DomFG0M14i4BG1gnl1YPvKBRJUrnY7/Ao+WXjWJn5CyfpTcsaLiRRTtHp
	lMRYq/bRazykahC1pwjbp+t2OciQKH/pp7HzSAGBpU/iIjTifUfCVQE8UdPHPIMP6649Masysb+
	8IuyN/joCfb4JGPhjGuv0lwwXyhs2HLnnRRBBxpMp8q+nk8YWM9fD8vldZo5M8wh2hZFNoPAITv
	yzUsQ1mt2kIuWgbrR4u3RkW4o/bXx6ZqRvT30fffnmOz43F8b+lN0EiEzQ/Tfvz0uVh6Hk93ZRp
	6MUlUFy6zakoBR6VxoncN6FjAlTl9O0GSau5U+C7W9u0lUlMWUvufZFuu/SUZcTn1IcuVVuoPot
	WZo2CTyeGZYpIa9cx7mBr/A2pQBjsbimdfs37d2WBDZSsIxGq4Q9nAad5uyFFr0UHo40AVYoJBk
	3Y6AEjzW03N4mbr2qghFD8bXtoWdqehA7barUiAQb5tmALqMpndBkg==
X-Received: by 2002:a05:701a:cc95:20b0:144:fa57:c617 with SMTP id a92af1059eb24-1b5568f1200mr14664558c88.34.1795552897107;
        Tue, 24 Nov 2026 12:41:37 -0800 (PST)
Received: from omarchy ([122.186.156.30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm54214420c88.14.2026.11.24.12.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:41:36 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Marius Cristea <marius.cristea@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] iio: adc: Use guard(mutex) to manage locks
Date: Wed, 25 Nov 2026 02:10:52 +0530
Message-ID: <20261124204054.85634-1-vaibhav.chahar26@gmail.com>
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

Thank you for reviewing my sloppy v2 of this series and giving feedback

Convert the mcp3564 and palmas_gpadc ADC drivers from manual
mutex_lock()/mutex_unlock() pairs to guard(mutex) to simplify error
handling.

Changes in v3:
- mcp3564: Use of guard(mutex) across all paths. (Dropping __func__
  from dev_dbg() calls will follow in a separate patch.)
- palmas_gpadc: Make helper function palmas_gpadc_read_raw_locked() so
  palmas_gpadc_read_done() always runs before unlocking safely.

Changes in v2: 
- Patch 1 (mcp3564): Wrap switch cases containing guard() in braces,
  add blank lines around guard() calls, and clean up the commit message.
- Patch 2 (palmas_gpadc): New patch converting palmas_gpadc calls to 
  guard(mutex).

Vaibhav Chahar (2):
  iio: adc: mcp3564: Use guard() to manage mutex
  iio: adc: palmas_gpadc: Use guard(mutex) to manage locks

 drivers/iio/adc/mcp3564.c      |  97 +++++++++++++++--------------
 drivers/iio/adc/palmas_gpadc.c | 110 +++++++++++++--------------------
 2 files changed, 96 insertions(+), 111 deletions(-)

-- 
2.56.0

