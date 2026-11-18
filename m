Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968901;
	b=pyyLPGz6Y8O8LiuPKsDyiX8XMKwMp8iiqYN1s42LR/QXTwNyG8mC8zbHpXsuZN4A5nlf
	 0idSO7LvmrIyiM8IKdsB3pg3ZUnWGuZrT+qHcfrOF/etfLzXfUrZdCwh0MnAyNu3rX8cr
	 2YLwWI4HW1zkiwsgf0PMJpB7E68HIWY4HPRHZGO/fASDuy6w5odCbiCSotCm1KIaEgY7V
	 8O34bHe/WAMGgz7zmQPw507NakpgkCqfT2QINd88Mq9ftHYxSy0T4u8cW0rq1jLt68hfR
	 koj9lX44OvSQAgiiutfSjSy5r8/YIChqh3xepPtiFm+LhgK+aJ4fYygIhtiHwHEBE3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bBM1tckyz85/mFdKRLmUacT5H4u3cjM1OdFw/h4C7tI=;
	b=U2VVoIkaIg0KehYn4GO9Z9KO+l9uHWVqPiBFvjkc4kbCsQDejE2C28LUZHdrMCsKbEpC
	 4pgURYJdFSsaNTKOmwjBb4RHdnDsrp1NQvXGLPMsFtaHjCQLxxbpCdBsUWA675RDa3wj5
	 80kDFQn9TF+hNKz/yvFAiBCkIQeBqUsaymvB0qQJaZAc0mqaa7/GVNFFddEA9mlY7SvBg
	 h2d6QlbkQruQX1wHCQY7xQTAAVyKppcI/BR3MyoF8HbXNt+NWc9+PK0kVEPJ+sLbipZVT
	 w8hRVzdfRl7J0+X/rkwsB+bRYFFYVZi8mSygnPv4WJwVmHkVi36VlnSsZFg6ZeW4H+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfnD6CrD;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B47606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B47606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfnD6CrD
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2efd824d492so2079955ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794968900; x=1795573700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBM1tckyz85/mFdKRLmUacT5H4u3cjM1OdFw/h4C7tI=;
        b=IfnD6CrDsAMUkk3Wmlw79A10NLxrndNMXRede91i+PMYlQ6UxlCc/wEKS86x2VRcBs
         ELbpQgwL4eS3jvxLIlVe03/VbCpjs85zTmBawmM7kkJqUY6TsT0ABq1gnL0Jo3V3TKUf
         f274JqEjdeGqoFuZfDkrM2+WIMXd2L/rMxga5asPktqPWuegCJVV/3soYR/vFI7MgsvR
         6oRAJWiIMzODUrRZeYyfyrwX4yMwDGS8kz82Kp+ovKFydYPachZjICuqDlK5dZly0H1D
         R/TRCRA3Lms2UKmFtyXhpQVzWPLPoNg3nONno6ebKgXoeXy9ySWd6MNYSJWotAomKgr9
         4uOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968900; x=1795573700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBM1tckyz85/mFdKRLmUacT5H4u3cjM1OdFw/h4C7tI=;
        b=ExTUDPLA+YetdIdwUiideodIH1cgeV0UGq1cEWNXkl66vN21WJn2MVenEGqlgv+g5a
         j1R3YvW8b8m6xw/SHm482M1+9IE8cg7qCXHpOu/bb9L6J9FWTMndHzz8saxAXlyQcQWE
         ZRX58/WoPAph2RvCv5aE/QQ3xB1Ib91fyttTXJLwQrl9cTx2sP/8q0ul65+iEYuexTbT
         hoAFCq2z/ksfUVS2VkXSG11QD3VWL0ZNhCecQjFkmX0v2el9H2rM1ASoMC03+XH48E4C
         PGHaSvwv0Pvp2vSnM8IqHF8LUzkridZ3P9UHBpZ6wF78M+AkTNvRHXSkQRlfPLlfgpKN
         D78g==
X-Forwarded-Encrypted: i=1; AL+hErH9QVMfSLLOzgYiRNBQfAdWZAQt5iTIvw1ecAK98f7XKjar8/5aDO0xJ0J7ONiorjwEt6oQUDnSsqdJtW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ajR69iOh/1591Z/BYQxk/+Htqo3aXgKGWKr1YjRmedXzjvI3Q
	q63z7u2KcmPmVPPFJt+1KkQ/0n3w6nomZwztvvMQCJh5WZkjIvKazsoW
X-Gm-Gg: AZFdTZcN9mvQWtIYNjzrr/Ymkd2lqpDZpcFceQONXJmfrU9HGOtqXgcGjsSefTBBF1K
	HS2K5rSmIzH7GOJLsYZBhZuohAkDI7IWQI7xdCDBHYAoCkN9YPaIAGnvnYfC8QxFqzZh92L0x+f
	0jbc9T9tkNVxndelvPrs4WTaV6vdEAR76y/Je7OGN/NIdeSxFUvjziAXdR7WNq2t9s56HEdM4I2
	RlXSBR+aEcuZc3l9PQgglhPxtA4j2hgV8kksWYTasBNvLEiMkjB6rpSWlkLQIVbEVg6NRYa9mpE
	mpGIkNog7skO7hMOC23FQVPBZ4KwlCCcFCY5DTRSNyPaSpeKWzKLd3giR3Mg0Usia/FIA6i3TZp
	/gUeVuxBB9+10dEQLOKv1axn/vKjC/Bf1Kq+ihMp9Yt8LwSWyKqivklpD8MVuAt8PCg67Mwb2Kf
	91PTDSeFG/wpZgQwDuNGFzbgF5LKb0gzLFuiSKHul4bzybc7PRdht0aovAv8opNhYnltxX8uCWK
	NpDPegJoL+xryU/f3eZzepmOHEYrtFKPVWygnl476BVFtQOBwFawqK1sSD6OjqSEvxTAWg6L2fJ
	uelwEgHhQ+QFSTa07uf5vn234QY8GUjLf79KKsELqbLUzqUp3yOoNYixZD8ipikElLhYdf4cneH
	L1bzKjG5MU0eUBrrBbSq1zi4=
X-Received: by 2002:a17:903:32d1:b0:2e8:18ca:5f46 with SMTP id d9443c01a7336-2eff72e6095mr11400325ad.14.1794968899679;
        Tue, 17 Nov 2026 18:28:19 -0800 (PST)
Received: from message.eml ([2a09:bac1:76e0:450::21f:e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff617f8cesm4756605ad.27.2026.11.17.18.28.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:28:19 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>,
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] tcp: roccet: fix idle restart on RTO
Date: Wed, 18 Nov 2026 10:28:11 +0800
Message-ID: <20261118022813.9778-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Patch 1/2 skips the idle restart when packets are outstanding, so an
RTO retransmission no longer overwrites the snd_ssthresh preserved by
roccet_state(TCP_CA_Loss).  Patch 2/2 adds a packetdrill test.

v1:
https://lore.kernel.org/all/20261114141315.19007-1-zhiqizhangg@gmail.com/

Eric's review:
https://lore.kernel.org/all/CAL4WiiohBWs_BteL4o__osD6cPTXrBBPa-P7faV=acTaF_4g3w@mail.gmail.com/

Changes since v1:
- Make the changelog precise about when the idle restart is reached:
  with TLP the first RTO is affected; without TLP the first RTO can
  escape and the second RTO is always affected.
- Limit the claimed effect to tp->snd_ssthresh.  roccet_state() calls
  roccet_reset(), so ca->state is already LAUNCH and last_max_cwnd is
  already 0 when roccet_cwnd_event_tx_start() runs; the idle restart
  only overwrites snd_ssthresh.
- Shorten the comment to the style used in the file.
- Add the packetdrill test from Eric as 2/2, and enable
  CONFIG_TCP_CONG_ADVANCED plus CONFIG_TCP_CONG_ROCCET in the
  packetdrill config (ROCCET is only visible with advanced congestion
  control enabled).

Patch 2/2 is based on a test written by Eric Dumazet.  A variant with
tcp_early_retrans=0 (no TLP) fails at the second RTO only.

Testing: Eric ran the packetdrill test in 2/2 (it fails at the first RTO
without 1/2 and passes with it).  The netem reproducer from v1 still
shows snd_ssthresh being preserved during the RTO with this series.

AI assistance:

- DeepSeek (deepseek-flash) generated the code change in 1/2.
- I wrote the netem reproducer and the documentation, and reviewed the
  code.  The packetdrill test in 2/2 was written by Eric Dumazet.
- DeepSeek was used to polish the wording.

Thanks Eric for the review and the packetdrill test.


Zhiqi Zhang (2):
  tcp: roccet: do not restart from idle on RTO retransmission
  selftests: net: packetdrill: add ROCCET RTO test

 net/ipv4/tcp_roccet.c                         |  8 ++-
 .../testing/selftests/net/packetdrill/config  |  2 +
 .../net/packetdrill/tcp_roccet_rto.pkt        | 63 +++++++++++++++++++
 3 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt

-- 
2.54.0 (Apple Git-157)


