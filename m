Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218866;
	b=hAieO2IaRBl/yeMHnYZ3A4GD+cE2FwQn/o2CaWzqKUEMnFAMXc458lIMMI1I2Wwt6Xnt
	 os8L4tFn7SdGp/4vkCt2p4gJjkMQrtdQXxA1A6aS1TgwcEZG3tdQrSTN7RrxO25afEC3r
	 Quka27zyM6KiJPO1slZ7I9zeu+4lEpEz5gN3Xst35+HdBhIDot8ox0drrrrngYJRjJiD9
	 2zqAMeVjsDZMQWSwI29nNhv44o3vsusyxjaEZ89GqwU4IdBGq+sGf7hXoJ6TQbSySVJ+b
	 8Bhp/ucdt8qbS5S/VsG9QUWxu8UOVlIhNCwiR3wWMCddz6hZ57Q5vyt9vvzbkYGmc5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7DqEQVPhr6GusklbRo0OOnhzJ3BLe/1hpOgbosdDgc0=;
	b=kLMFHzGH79+Er9ei5YRYGhMOiPzdsmkLoMUu507nerWaeBLRuddc9+uZRgN6clVF6Kbg
	 xKkXdesn9xEivM/BLFkhAd3qjahuemt9vkqwcqiaG8tfgNHYgAG9u3uRH9CIQQ3vFTT3N
	 9xQPECs20rcmsKF6MvXonJwJQOCFIe0Q7uRMESa9kG1AnXqWBgdKJlAqjhHFs19IExhEl
	 SUVlFabjnAlSPbmHcd/bvjx+wLr4bgKGZxvMgEtNrTRwPtw2uhF4QyYgeUJwUOP3+B2V0
	 5LESWamHKAtg0s2AVZTzU4RWwg2fUJcqv1eYU+rk7fKrBo7DwqLEIgUtn4RDh+bDZAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKhq0UOe;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB9606A6BA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77AB9606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKhq0UOe
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13126405e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218857; x=1795823657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DqEQVPhr6GusklbRo0OOnhzJ3BLe/1hpOgbosdDgc0=;
        b=qKhq0UOe0Qr2kxLEutjuUqpHAhrmC9Dqv3mB07Hf00AC98Ax8lIaMxr8zNBLDU/E4E
         mXzB8JthOrW9YmCtE0y2jdUaIPsWArhdL55i7ckNMG1WjkNiz7MHODhxNBZ8Ng7VcnGC
         RbqzhhCCqfPTbus9VFMiXzypMmdB63oB8vU1xvcnAn0zqSfwMEdduF+QjijZjJkCdjkK
         Yr911Tnget0k2LKUwmPIIdmoye6tRpRX4a3K66A4mE3u2Yk1xWn1CEciU41lgfLwXOeJ
         bOh5IkQgQYugP19L0ZkLSEPQN/DJMP82NhzswkfKB7+/fbGzigN2Sx7B9kuowQe7wT2r
         149A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218857; x=1795823657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DqEQVPhr6GusklbRo0OOnhzJ3BLe/1hpOgbosdDgc0=;
        b=pRuN1dwbNatSwzlOpLqK5rTY+vI2RszDk2Gg66/uVQDYmFx6RXgWzSWwURJDFM25Pb
         AU08ykQBYbLGr+vYqxHYOPpu/GZ10P+XEJlxK1MzfXMfyecVpUgKjl0PrBbbX1RCTX0G
         Yq6ijxBb8gZ3BwDCWzgs966KcdutRyiBGc32oAxhqBSKiWKD2ibFvweED+KfSZndUCkx
         DC2f+tUB3fCN9NLH4REA4ZuDi1DVCIBbXLfXQk53Ma877sIEQtV/rkklY/MLOzHaxy8N
         +HADguJ+qzdWo0UQbgnS7TUwGjDuEx8VZas256nRf6Z60nIZ6LZGgEWOoZN5f6yQiW7k
         afVQ==
X-Forwarded-Encrypted: i=1; AL+hErE0rkA2/np5l9R30JYkk35je/1t6QPKAuRni8uw+yNm5dH4zXef0BmOp1dDBtYxW69DvuIBDPrj9XQ0qgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EWR6h60V/i56AgqRZ8nYHyOx0dIkibKcJ3iNxrAjs3XihV5zw
	4zeFMtc0LUMZSeDFaVJRyvrYOwRDHxLw85g+O08c91RudNTO0+/Pd1g=
X-Gm-Gg: AYBFou1PLnStzwZu1rXXPTaxc31meJFtacq40tTj/dZZ2TLi1iG1d5aNsoHtxRDQCcy
	v+Wrre/N7LuuyrcS9V983dY1gpqXSLXzCNiGZpk9ew2CF/Zuq8lE+K0eCnlC95bqao0/+708Nq1
	GacJkMIsg/MHAhJlc8hiI3zbkIYdl3jQFkMoqzvy0JPJLoplTZsKuXhG6h2Nbf3mFTlFsRJuoP9
	IkHWqYjMiARsfZHQPytKVz3znI08Wx2AZEJZqpqzG9CcpdG+IyQsBdLhFgh4Wr82skiZmls2KqW
	MwsJhKXZVy/rzR/Cn5lcuD1g0LUmjJhC4KMaew4vCcZCS+/uS4AB+VsaFuT1kxcVWbFVeI/RR2O
	kcIShMSO38bP5v00/etGQQPDvjesLhFqVM4BdAMJvr9NF8KQrsPnbYxkdVWbcV7u/34rSL8dS8E
	1GsDRMTUYlQM3WMNVDuHDL2oicX2Ovi79Qbc2MSVjHL740ST2Ufhxv7hllP7UeXCg8rN0JF8z4y
	eIQsxwo1aCcohamGvgoqXmXAOABhJpgUYpTfvJxAHIdNtvaNGV8COe5/XXfVCQXZ/irJsFc8n8J
	36q9CxzLHAiTa4k=
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr115640335e9.6.1795218856735;
        Fri, 20 Nov 2026 15:54:16 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm29426445e9.2.2026.11.20.15.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:54:16 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	Paul Fertser <fercerpav@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 net 0/2] net/ncsi: fix RCU list entry lifetime on package and channel removal
Date: Fri, 20 Nov 2026 23:54:05 +0000
Message-ID: <20261120235407.1911365-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

The NCSI package/channel/device removal paths call list_del_rcu()
followed by immediate kfree().  This races with concurrent readers
(primarily the unprivileged NCSI_CMD_PKG_INFO netlink handler) that
walk the same lists with list_for_each_entry_rcu() but never enter
an RCU read-side critical section.

Patch 1 adds the missing rcu_read_lock()/rcu_read_unlock() to the
reader paths so kfree_rcu() on the write side has matching readers
to wait for.

Patch 2 defers the free side: channels use call_rcu() with a
callback that also frees filter sub-allocations, packages and the
device structure use kfree_rcu_mightsleep(), and the work is
quiesced before packages are removed.

Pre-existing issues noted by sashiko-bot review -- dangling
active_channel/hot_channel/preferred_channel pointers, unquiesced
per-request timers, and the ftgmac100 unregister ordering -- are not
addressed here.  They affect the overall NCSI teardown design and
are better handled in a dedicated series.

Tristan Madani (2):
  net/ncsi: add missing rcu_read_lock to netlink and device list walks
  net/ncsi: defer free of removed list entries to an RCU grace period

 net/ncsi/internal.h     |  1 +
 net/ncsi/ncsi-manage.c  | 39 ++++++++++++++++++++++++---------------
 net/ncsi/ncsi-netlink.c | 32 +++++++++++++++++++++-----------
 3 files changed, 46 insertions(+), 26 deletions(-)

---

Changes in v2:
- Rework as a 2-patch series fixing both reader and writer sides
  instead of a single patch that only fixed the writer side
- Add rcu_read_lock() on the reader side: ncsi_find_dev(),
  ncsi_write_package_info(), ncsi_pkg_info_all_nl() (sashiko-bot)
- Defer channel sub-allocation frees (mac_filter.addrs,
  vlan_filter.vids) to the RCU callback so readers cannot follow
  stale pointers during the grace period (sashiko-bot)
- Move disable_work_sync() before package removal in
  ncsi_unregister_dev() so the work function is quiesced before
  any structures are freed (sashiko-bot)
- Fix Fixes: tag hash from 2d283bdd5b20 to 2d283bdd079c
  ("net/ncsi: Resource management") (sashiko-bot)
- Include discovery method per sashiko-bot request

-- 
2.47.3
