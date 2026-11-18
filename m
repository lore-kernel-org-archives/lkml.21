Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043423;
	b=1jYznV5etpAUtbQE+jvMCY5AwL807eOm8o6xqqpg12L838OiuNDdF7CbnOqwScvT1hxa
	 6PbC4GgQVIMW6wIFTfsKGjbvM3CGSfoYR71o+f79MFvTHDS/59jUgx6CzKlIsZ9jTq9r9
	 zpfJL2x+TaLbBiHjIX7aC2Ymc1tf1ItJJdEJj/MQxkRw8siKIAzrGY9POtAQowzP1dt+s
	 OmlQKoP8FQmEmCqanX1dv7oN87zObn1o1fSAXs8rhl/Ch/cweKhtALrLLQe5fiqLEId3r
	 XqlPlkRWoIshS3HfJQAdFyPJcZmFnGMYvaoIn76Fq2M1tsUmjMDB7htGcyWhzfIex+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W6XTHCprcloAxf+RgZnW+JkwJvcVboDJBn2bQ3d9asI=;
	b=YReoxmcaLsSVob0+SsepcJr8xVFHOaWtVdaNptai9oFv2cvanT4xzQen6UifMQGcN8hz
	 Xq58UHp/wWtxOoL5MbbZo9gQb3x2PCCZC9Zfi5dtjjyE4cXNkc6EAHjq75QYMmbUy8LZF
	 lY5+p2WICLhnCaIm5wKJm1eMLSr1IHoUYkGghVmow1NONesZU/dkGAPz3XTOiVTK5rwYl
	 lZai0MefJ5gJoknQhzLyYQRBWiI8O36voUWy29nUJZIcYhn570Efrep/M8Qip4gWZJSP/
	 dQjUqBzvxGt/IKGYGwXObOWMIsrZjadVuH9Y/PnXrv8twIlVLJ9d4162BBqSEu8Stzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=4+KyR5BH;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD029606A951
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD029606A951
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=4+KyR5BH
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jVHPp1vlVz1XMlX4;
	Wed, 18 Nov 2026 23:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1795043418; x=1797635419; bh=W6XTHCprcloAxf+RgZnW+JkwJvcVboDJBn2
	bQ3d9asI=; b=4+KyR5BH4S9i+Y5EmMvjJikCK7GRr6AGI+5Bsc3Klz4cVVLgX43
	pWsKAhVfJ1FCd0LTDGbzpGfEy0sviiu62LjXzsJEAHi3y6t7+60Qh43VGMtSL0sE
	GoEISMoSvNZ+14a+YLnOD66H3SYB0g9oJ1uqoEaZfV2BY2aRf+CWvmqtD1rdgSjj
	0OLbYrcWhXTwM5EGzjbQb/a1i9moPkHbXMhmNMCNivmdJYNuaBkn5zNOW/ZBG5G4
	TwWiWBOifSXoJvGwRWl3l+ulOVHXQRMvB6lqPn8HZ364hsHfY3ZmKkuTqCkNtY0S
	n2RXqftCVqkTzI4oWjqQnQANCcx2iW0/GIA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Q8htp_JPl8Mn; Wed, 18 Nov 2026 23:10:18 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jVHPk1rNkz1XLQ9s;
	Wed, 18 Nov 2026 23:10:18 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 0/3] Fix three Clang context analysis issues
Date: Wed, 18 Nov 2026 15:09:56 -0800
Message-ID: <cover.1795043161.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter and Marco,

This patch series includes three context analysis fixes:
- bit_spinlock: Surround the bitnum argument and macro expansion in
  __bitlock() with parentheses to avoid operator precedence issues.
- cleanup: Mark __free() helper functions generated by DEFINE_FREE() as
  __context_unsafe() because cleanup expressions that unlock trigger
  Clang thread-safety false positives.
- srcu: Guard the __srcu_read_lock_must_hold() call in srcu_dereference_c=
heck()
  with const_true(!(c)) so update-side callers satisfying the lockdep con=
dition
  do not fail context analysis.

Please consider this patch series for the next merge window.

Thanks,

Bart.

Changes compared to v3:
- Reworked patch 3/3 such that __srcu_read_lock_must_hold() remains in
  srcu_dereference_check().

Changes compared to v2:
- Split out only the three standalone context analysis fixes (v2 patches
  1, 2, and 4) into this series.
- Dropped the lockdep and RCU assertion behavior changes (v2 patches
  8-14: lockdep_assume_*(), lockdep_assume_in_rcu_*(), and removing
  context assumptions from lockdep_assert_held*() and
  lockdep_assert_in_rcu_*()), as agreed in the review discussion [2].
- Dropped the preparatory __must_hold*() annotation patches (v2 patches
  5-7) and the tracing branch profiling Kconfig patch (v2 patch 3) from
  this series.
- Updated the commit message of "cleanup: Disable context analysis for
  __free() helpers" with concrete examples of __free() unlock helpers
  in response to review feedback.
- Rebased onto current mainline.

Bart Van Assche (3):
  bit_spinlock: Fix the __bitlock() definition
  cleanup: Disable context analysis for __free() helpers
  srcu: Make the srcu_dereference_check() reader lock check conditional

 include/linux/bit_spinlock.h |  2 +-
 include/linux/cleanup.h      |  6 ++++--
 include/linux/srcu.h         | 13 +++++++++++--
 3 files changed, 16 insertions(+), 5 deletions(-)

