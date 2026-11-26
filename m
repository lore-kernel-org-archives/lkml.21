Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686452;
	b=bQsflNBmFagW5m+yT17u8LIGovC0xsovqHBo2HYcix9LtL0SlE261CfK1K9a/y4WOoZ4
	 rA1Yzh980TA0fbw4fcPoiUHLz22JKRslD7sWEapROfebnpyoTUjunhdF8IuC8V+wVFkgh
	 Hu0fZXZdvy6hcU66q4ib/JnFz/D9GbhIWmv7awfFzSKObKB3S+Ep8hNdghaHJ5pQ/Nw5j
	 rOmCK0TAR9Ukk325mQWkPyYFzL2TtZ2wVSQrCgRCPDBnBhHLLSzaPihakORGayfQqTy+3
	 pIvkIFReojIQLRCX0hgzd1KyXky1QqafqbUchJJDeJrQ8INnCEVadvlnrEa2jd6wsXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XpcFE5yH6jbDnsuHPatF5o9jlPyNmnuNxlmeldGFfP8=;
	b=pwsDefd5/j+K7RLv7UwE21+87HHj5fRh9Elut9ovNvn/fwjyUncbkRT1ZIiGKhlWewiW
	 K82i9tGCThABNG7kUE2WNaSl1gyQSZ2SVZcCeTQ8cM3aaUsGtd27DQmXDdzDPBhlEokz4
	 UbvtJ+7+B5LNQP/pfO1OLSRydzWbymBOi0Wnq15nCieZrdkijRT1pwXdQB+evbOWC3WrV
	 H+dEm4IiT8CSEFFGYF71GCayh98u9LI56DQvebZ+uFaydWWMJ2MNn6X1HbmSwIn0ZBiVe
	 Iy73xrZXRsa1ytp0Cit4nI6diryWWPFeK/1D/UuhyAwROIeU+QhxwQqOTxdyPke8zVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pz1I274b;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA68606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BA68606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pz1I274b
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c516a192844so684047666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686449; x=1796291249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XpcFE5yH6jbDnsuHPatF5o9jlPyNmnuNxlmeldGFfP8=;
        b=pz1I274bb3JaDemNqdR/CM9tzxoYeezTS5nspEjuTcafiXkOaJI/fb/2vnsSbPj4My
         SvvEZ7qer5UbPKQ5Byb9/P7ZnOOmKBxO6K4R243EX4v6+VT8IHfPWE1FM9l+2clwjVfY
         Bm5RE5HL3QgzksJR1Bf5FumtfQL46zsoSpW6KBrzDWpkKCdh0q7qRj/A56ZAUcICyjCA
         Yar5CS3AxxByziQampabUDCXhYQwEbJPS7c9fKtDQttD5Z04b++4noYTZ0ICA+YZw35I
         2rDfb4MHI4fEf2CzHl0JlnjMM+tpg7/cv56aFbGENgheb3yrwo23tbefAX7d1rS7GfFl
         6i+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686449; x=1796291249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpcFE5yH6jbDnsuHPatF5o9jlPyNmnuNxlmeldGFfP8=;
        b=sDAlRxb1t0f6Gi9y9AGuKd5CmeOR0CEfpSKx3/dC+GTrIY2eNzt28QhdR+wYdtztVo
         EvBgpxedjrkbKh2rd6Xi12lBOtwowJuNkId9bHTGLyUR4LxnL7xtilB+AhcRYfiNGScT
         lgzZjjG/BXwtnkxTgOtDhs4sBuTUU354Fh0Rj4Js06RYge6iKa+K9SakwtwBjsW6oPMO
         bhFQMI+FDk4fbqZmsgNielyVMXPgLIfl8pW0Ux7rCOCKGXFKnyw8nCwTuTkhKs3bDS52
         IIO5gNGr5dFRGW2BrKtvOcXvHzsaRiVPQwrOQKkOkKJOnYee+DgrPKOBvKEkPq+l0Ytc
         4Ehg==
X-Forwarded-Encrypted: i=1; AL+hErE1YJYINdYbuszS3nZM0if4jurC/1BuiKUwBnFtbVQZLz8K3qIWkc1eNKrPbvEY+n+R6e0o6ca+9PsOrKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HGi7ZzOoYh+e4cclpMD0BtHbk40oEOiv4jJkNf3QxSrIx2Ugf
	GcWNrLubDhZsiHy0NY9V2hRS9i/Ak4jZ9Cj94JFri24Lejd/u8C7euzY
X-Gm-Gg: AZFdTZdKB2iJn75cNHk9N7wdy/6QmzD1dBXMM8gCK/mFghoVgCYS4jO6s4VMSoN4y75
	sPPVshxwuKjqQ7qfnsX7Go6iMPt7LMA+66SnyDOyBtzEEwXIAmFaBIohq7ZMY+gYEWHrp6OJJKc
	LMVcWhLrvqoXGiZZ9QZv16BrwhEwrOWqm3wKLoHQPXx+XDtNpupRJguEM95eJl1Sw4I2e/M3jSB
	Z1v5hzPYxUx6hOJiH2PkDFjBSSOmVvAO1jmMuXEwaFopXxMK//+LsXtaZYHqYcHCQZ7N/0ozTul
	F76qStlA+wzSiss4vsDVKHdV4Pz6js9/LCrNHSAxz/+IHntBYW+3ZXw7B7d7fKKkrXctETqn6XU
	xzyawSPJ3nCrKC1vzjByf9hYG0h6QEb/Sx3nYYSjq+yapFOxa0lHtaSke4V5GsxB2PL0zxNA8tI
	2WRyIX5wu+83bhlYi1sowMaBEJUcEONPnSQjdJ4XwMnAI0/3xr/Efgz6hbSHNPyl9C1M0ThOlvT
	tLANvpXb4D/Iu80gYEGM6JsviAxD1A2erlQP3yvbBq60nmY/Bj1bbLfYMB58ZqSMzUiMZaW8DMe
	nQgqkUEDuy0JnKxZJxOdCuiy7x8bknVO6MnAnx0u7xSzY35a
X-Received: by 2002:a17:907:3f1b:b0:c51:5547:1771 with SMTP id a640c23a62f3a-c5155471892mr1472031966b.13.1795686449194;
        Thu, 26 Nov 2026 01:47:29 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm727100666b.78.2026.11.26.01.47.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:47:28 -0800 (PST)
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
Subject: [PATCH net v2 0/2] wireguard: free queued packets on peer removal, and test it
Date: Thu, 26 Nov 2026 11:47:20 +0200
Message-ID: <20261126094722.73025-1-apasichnik9@gmail.com>
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

Removing a peer while its receive queue is busy can leave packets on the
per-peer queues. Each of them holds a keypair and a peer reference, so
the peer and the keypair are never freed. Patch 1 frees what is left;
patch 2 adds the test Jason asked for in the v1 thread to netns.sh.

Tested on net e50972666 with the WireGuard selftest VM (x86_64 KVM):

  both patches, 4 vCPUs:      pass
  both patches, NR_CPUS=1:    pass
  patch 2 only, NR_CPUS=1:    fail, 4 peers and 4 keypairs
                              "merely created" in 10 removals

Changes in v2:
- Patch 1: code unchanged. The reproduction paragraph in the commit
  message is corrected: the first reproducer only put load on the first
  removal of each run, so "5 in 2140" understated how often this
  happens. Under load it is 25-40% of removals with 1 vCPU.
- Patch 2: new, the netns.sh loop from my reply in the v1 thread plus
  the larger log buffer it needs.
- Rebased on current net.

v1: https://lore.kernel.org/netdev/20261003201625.4572-1-apasichnik9@gmail.com/

Andrii Pasichnyk (2):
  wireguard: peer: free packets left on the per-peer queues on removal
  wireguard: selftests: remove a peer under load

 drivers/net/wireguard/peer.c                  | 24 +++++++++++++++++++
 tools/testing/selftests/wireguard/netns.sh    | 14 +++++++++++
 .../selftests/wireguard/qemu/kernel.config    |  2 +-
 3 files changed, 39 insertions(+), 1 deletion(-)


base-commit: e509726660dd06ce107437aecf7c106c9d3fc1e7
-- 
2.43.0

