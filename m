Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704785;
	b=RYZUbhvmXHUaybof74H5HGwAD1J6C/U58jCRaEsFRrf+VnVQ/yR+DZ1n1MgRoPUj9cJu
	 /mVapdZqWaxhriOKwaceYOqe0rTjNYJeasGavR5w0ZK8EFB5yBB7HpchiSoc3JFUPU/Z6
	 0Wx+BKNzBXjKcH/MXUMMyaFE/NF3sLXcdxCZgdgMICZsC5wNK3avcnDP8Skjvc+mVb2El
	 GGXZCTZCJqBE6LCZ5WHWvt1Jo2vcnJnsPedESpvNEWnkw97cMN8NehTaeP+X8uSRACfSV
	 xm7xFruxDOCoURPtsEWzhD+kGgT6ow1j3Fdidi51u+QFyqm3aFrASg+Fm25qoUjHgBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=L3L0Ub8N0gUUtY/O7U7dLEItaB3jvAIkFWpIo7dlmSA=;
	b=a4VIWmOjavKNi1FaZom/amcMcXs2mlcUXes96VQIV1ULA1Jw+WJWjjhfSmNpoASqBe0V
	 TKQ/AXiJcZ0yWY/S3GF1yXug2yJWrfdiROr1oT6zrlvnMaDFhZwqEFFMZqCjcNuTGb0iA
	 PpRHSBiLtVtsQSg2T3ZjYCFozklkN+fay+8WFZOu5HAnvGXBKAVzL4NkFG71qGTCOjNq0
	 BwcWqYbsu1dOyAl5/XpvMmZmNwJoG3861f1hTaxTZICs/wxhV0kwhBcxTSm8GEEhg/sCs
	 1JVsCS3Os/xrBE2lQkfj8OUwcT7mVjzvHKUjab3vOjZTexZ9AMyx0R2fLAMTyPm9S/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=HGRFlyh2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F37606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F37606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=HGRFlyh2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso65790855e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795704782; x=1796309582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3L0Ub8N0gUUtY/O7U7dLEItaB3jvAIkFWpIo7dlmSA=;
        b=HGRFlyh2d9KEfwVpxGR63vAFRjUn7LCT76XddXpd/AphaWgsNXdxCk6xaUfSz2ia/H
         IHH/qupTme7cFNHftGDYDG3XS/fBKXPsN2KYGRKifIPqGOJYwz9MvZy4IkCGs1zPGfxb
         07Gp1rl1mBnxxr9p5zf53/i4CE5S9QxiCCwxEGHYcFvru+pzab9aWyoaVDeB5sq1Q9Y3
         AwWpFSIFbkhabOzqUURFFV9he//u39wG7BDgzs0UqP5og9YsHY/iHeSGzB2UfwjcZFXq
         x+PTXCU7IhVLTeJtTbx0YfxVu/7G8iKbf1Roxu2RI2RnU56pJPW8MASef//JEIDINYV5
         KwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704782; x=1796309582;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3L0Ub8N0gUUtY/O7U7dLEItaB3jvAIkFWpIo7dlmSA=;
        b=wIsBkVW9mSN2dBOZGn4U2aiAE11DjyRURual09w0SF0wdY5zCfdD9/Sa8e+nAqT8mP
         4zH6DKApiHwbRwwCBj+L/2CrZIVMLdhF69sspzoY6buBlpNuo8+Cp7FlLgx3XhSYZWF4
         NH8y8IYlnQzzMbMMxqKHMKQfaPyjUDNxwVSHWJeJWsXvCxFxxzQY75XwGPAnaxAV5sgh
         Z7nKFdLSS8hIvg8DFnShvd08bgGhlW37qRv3SjZsvLZE4/xihTTw/veLqwaocqfc/5ol
         v5z58esLD/9zZdjw4gXHh/Plhozzw171G8EBVZYZJvIJhsd2iAwR7GeKGDNshMmcTpyq
         cyfg==
X-Forwarded-Encrypted: i=1; AL+hErF4iuh5ktAFafzmFRgT04yg6HCBTQVEuzOa4A7b9pe0kM//r4fg6Xs2EGN6+2FP1V23jlrHJxDAJ7VAA+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BFb4GhPTyvycWYIvUWiY+DYQ4OV/QpqGXXznKWunfgzumEBBj
	Yt9QYo9c5mX4N9wDazLMXTMqW27vSxt9L7p055cRsiirurpfExd19T8SH/sceY+VULyX4iZJbe2
	Eg4QVmGDb0w==
X-Gm-Gg: AZFdTZdH2P1U6h19ILTle/laVM/PzxiBA/zZzYU84fvO5fhhuOsEhPa0g6bIz0uoP+s
	eflqlJBG329lSm3QdBlEyXCQzZYSS8zU9axJgwPReE7HIgKoZ/ovdDdIb07yz9VUMMaPymmmQPh
	KYfr/Vzn3yMMMZUV2TDgDBhkd5tDnViUw73+8XsX4gGZdDQyxfqnNm8ChlGnoBg5BbaKiO2P2bb
	8pKlvaTLXzvfY2RYXQHZoxQh70eDPQnbnEmEnr5NPQVEgQy57e6SDY/gIsplgGFmu9SbIWEqvRM
	YnzInIiFU/mEpUsDJyCbSdfPvL2F/BVez7hyroEd1KYzEQ+F/SfOGEftUo2pgPToqSG8Y8s2ByW
	no6nJd/tYpBqnQYmwc81Do9D4eSDbOSwFLfnnTjEIKdR0pdFnv8rBI23PPBqBYIPRlekU+Djbl3
	Q11K/S3BIQg7ERbRyOTXkQvc2TqG9qZ1gzkAaNJR+RDuTpalVho2Wx4qxclDA1kxjykgmTYFELL
	/doIuqIA2cUuAgIzzl9/qRvla6Z+YB0j9Z4nJFNXkrMNDpYW3Mk7BIgkF02GxwyBXkr4M8CkZVu
	sXGjzGDCRByEKhV9QzTlCTbSZpBQIQvKsqfZY/eSQrI3cfKztpOF4x/dwj4yZcAHHxH5HiLjsA=
	=
X-Received: by 2002:a05:600c:c086:b0:4bb:a5e1:8288 with SMTP id 5b1f17b1804b1-4bba5e1b76amr87718865e9.6.1795704782235;
        Thu, 26 Nov 2026 06:53:02 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm356445905e9.1.2026.11.26.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:53:00 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 0/4] drbd: assorted fixes for discard limits, bitmap IO and resize
Date: Thu, 26 Nov 2026 15:52:53 +0100
Message-ID: <20261126145257.592085-1-christoph.boehmwalder@linbit.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jens,

a few DRBD fixes for for-7.5/block:

- Assume a capable peer for the discard limit before the first handshake,
  so devices stacked on top of DRBD don't latch the 4 MiB limit.
- Fix a lost bitmap-work wakeup on weakly ordered CPUs (seen on aarch64)
  that froze application IO until the connection timed out.
- Two resize fixes: don't silently truncate the device after rejecting a
  too small peer, and refuse implicit shrinks on resize unless an explicit
  size is given.

Lars Ellenberg (4):
  drbd: assume a capable peer for the discard limit before the handshake
  drbd: fix lost bitmap-work wakeup on weakly ordered CPUs
  drbd: resize: do not silently "truncate" the effective size
  drbd: refuse to shrink on resize unless an explicit size is requested

 drivers/block/drbd/drbd_int.h      |  3 +++
 drivers/block/drbd/drbd_main.c     |  8 ++++++++
 drivers/block/drbd/drbd_nl.c       | 22 ++++++++++++----------
 drivers/block/drbd/drbd_receiver.c |  5 +++++
 4 files changed, 28 insertions(+), 10 deletions(-)


base-commit: 64e3fd6772bd8621a751fb916274be2f2dee3a16
-- 
2.56.0

