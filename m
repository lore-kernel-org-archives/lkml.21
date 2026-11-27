Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774968;
	b=A0yy+sToJaab2Rbbj4Co6GNbkgwsjKYaIlBlCz2R2KxEX8aneVCut1svXLZFpj8GUMtU
	 wDY1NzB0kEPlhj/HcGFibGLWC3o3LhbMvgSJwv7B8EPrXEixYV7YqFO39iNeuZ7SoFkkb
	 /z7FK6YK3yIsgsVXY0hZIA00gXOUBKSGZ3u2YbWezefbq5EbRcgNeYuL3OCR0PD7yPC+d
	 SU47R+uxXIPFKlqC4ABgngI9PBmuU2r4Tfqs71uFwKLx5HI2J6ahEOmlCjDs1oU0e8M6p
	 0WULPIt3suYyYy1EIwNz3yO7V6K/7FbZ/uI3HwjGyNOTcCkRFViK1s4eCBz6CaOMr7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7jTZ/KAYP4zd4AjB9WmJy6KqD+4+vtAh077IXDg85bs=;
	b=XnS665AYkQii59XJBqctGfKTvWe3fmB/yWlyYR4f6kdL5uBnHCuxhTnhC1SRsb67vFIl
	 TyFJGIXaJDgH+VgOMenaoEAZYCwlLi2OS0E4Rx/UVjwNzUspYE3DsCF5KXSpybDu02ORb
	 i9SDt8NNxHunOUn5BvAtjbEG36lAR0SC4+X2GDX/8k6a2vKixOHH9Rl+1MpRNLOnANkZQ
	 tSBorYMbaMSEfC/mqAm4hmvv3NAOXMRqyi/g0U+K7DQ4tQX53GzcJesonnDbi/gtRKYQb
	 q0j1f6TqSwgd4Oao793Yeft2Fsa0w6e9J323KSZByQkr241AUJNI4lmXyIealEysWMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFPPTm63;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB7606A685
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDBB7606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFPPTm63
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so10686756a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774966; x=1796379766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jTZ/KAYP4zd4AjB9WmJy6KqD+4+vtAh077IXDg85bs=;
        b=BFPPTm63qo/CUmMUDO1sfX5o0I/6GwrjKcaJEq+rQWc+u3CQzW7axT4++sgiLHziHA
         lUiWtEHkhcq7ZCXOkv7AgWNa40ikJRDt6AJJaZOP13WNhfen5KIC22dJyGBbxHrqQsPl
         nriNVshxLF/yFFNUeCEVs5HqtcN+Jd1Fgkotx0M9QHnw2VDeV/UewNqSZZ59gv9irx3A
         2c3hZqPiO3L83M2EAE642cxPNtJpQpGL+f0LD0DGgQYYzfedsvIFik/zrA3F5dKx/IlL
         CmIr2VkXUGRh1asp3QgZlIAPuFNZIBd+CkzRAvo7XZWBVX806S/hOhZkPdh9j3jreGzI
         KvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774966; x=1796379766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jTZ/KAYP4zd4AjB9WmJy6KqD+4+vtAh077IXDg85bs=;
        b=XuIwXRrvHo48OmW7D1WHZWnAMnw0B/4zrUCybGWU1pNpIDDAdPyypKK79diiezsd/K
         fHRfIQMuSD/oaJxAkF2yxxZScraoGBQaK3BJKCbP3gY2bwXzw1B0Oyc9tHwYix4ZfZFg
         syPQDhPuuymiZJl/GTBOHVX7DUlHCr/czw889D2dQQHsJYuqWaX5UngL48eYu2C4guGQ
         uWrw4QwdIix122wClm+6hD35YaDcI0k38v/bpA8qxQL1OP6H2rZdqosbqfvMh8fZ5tyc
         4n3JGjKEV7b12ZkFRk0yvXIMr083YghU78AlzDTrInRCEXtS6hWZxqX/CBV2JKQ0JC60
         mT1g==
X-Forwarded-Encrypted: i=1; AL+hErFljR7wNNcRkcTs09y9Yankcry5Z393KePNEmUCv/FSRqvY999bTxmNsxm4DM7K52ndcYNSnK4EUOTvrc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A/0cwKx8DJ4A4zhwLIBIAjvo0sbUp9cepoZWyLBOz5N3Lxw03
	/PKKAfnfHx9V/ven5KyBIwQXZD3Is8hzigT3TOhbMkVVDKWBGrWf72AX
X-Gm-Gg: AZFdTZfcLY9B8RyzipgxDScp3Cfzhd2ZeSWx69OR0iWGjjdmPbCECcHz7noc1gpVxiI
	PuAccCzVo85+TMvVQbvGPtHld9NUcS2ibrfgd23lRWfC42tz213OTTJ4fS7mWeUe7n60cklJnrY
	Gb9UCETX2vGqDmggBxBqjopu2idEeq1Or2NdUupHYT++ObTSEnf3HA/sFVuJ9jpIAz97V+T9glX
	j+CnA3uezj2cyMGEtZMHOqL8PjnOQFz2m3EDyvmY46xgZTZl1TdFDbeRyCk7Nk2hWSR8scN1VnX
	w5cCn0k5R4rjybCKY/rcYY5Wll7WyYAwDj54zZdyXfTD07Jl0GBKknsDufnUg4c0uNMeXBydW/O
	9TLgUVik0xBXVP5L00r1GQA2ZTnCGBGdRk2SsLpLpETXf9aFk4+aVONJEJIfm43x/sLAzj6OX8/
	avB+OTvpdUT4MfcrVY17Qnd5h2Q/6MGfSTm7zHe/PenHLwYupmHq6tfyPB9h+YTW5c1IO9L4cBl
	QJWwGs3tQDTu+ZBu0iYD6tMwoVK5DRLB6HOazTlwdM11GgJl8NOg4lRaTTKZOnHTFfDJC2f7p4b
	eFpTRWqgUkK2dvJS7DgrxJwnx4Xc9tNFz6kX9p1BLh920MMe
X-Received: by 2002:a05:6402:1e90:b0:6b7:245a:a509 with SMTP id 4fb4d7f45d1cf-6ba37ebe297mr15514613a12.40.1795774965920;
        Fri, 27 Nov 2026 02:22:45 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm10886407a12.9.2026.11.27.02.22.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:45 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] wireguard: free receive queue packets on peer removal, and test it
Date: Fri, 27 Nov 2026 12:22:41 +0200
Message-ID: <20261127102243.49405-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Removing a peer while its receive queue is busy can leave packets on
the per-peer receive queue. Each of them holds a keypair and a peer
reference, so the peer and the keypair are never freed. Patch 1 frees
what is left; patch 2 adds the test Jason asked for in the v1 thread to
netns.sh.

Tested on net e9e45fcb6 with the WireGuard selftest VM (x86_64 KVM):

  both patches, 4 vCPUs:                  pass
  both patches, NR_CPUS=1:                pass
  both patches, NR_CPUS=1, 200 removals:  pass, nothing leaked
  patch 2 only, NR_CPUS=1:                fail, a peer and a keypair
                                          "merely created"

Changes in v3:
- Patch 1: purge rx_queue only. The tx_queue purge in v2 could run
  beside a transmit_packet_work that was queued during the second
  flush, as the Sashiko review pointed out, and it was not needed: the
  leak is on rx_queue. The older comment in peer_remove_after_dead() is
  updated, the subject follows, and the commit message says how the bug
  was found.
- Patch 2: CONFIG_LOG_BUF_SHIFT is 21 instead of 20, which covers the
  worst case of the loop; the commit message says that NR_CPUS=1 is the
  configuration that checks for the leak.
- Rebased on current net.

v2: https://lore.kernel.org/netdev/20261126094722.73025-1-apasichnik9@gmail.com/
v1: https://lore.kernel.org/netdev/20261003201625.4572-1-apasichnik9@gmail.com/

Andrii Pasichnyk (2):
  wireguard: peer: free packets left on the receive queue on removal
  wireguard: selftests: remove a peer under load

 drivers/net/wireguard/peer.c                  | 25 +++++++++++++++++--
 tools/testing/selftests/wireguard/netns.sh    | 14 +++++++++++
 .../selftests/wireguard/qemu/kernel.config    |  2 +-
 3 files changed, 38 insertions(+), 3 deletions(-)


base-commit: e9e45fcb6d39bee9325e6a7dca72bd14e82760f3
-- 
2.43.0

