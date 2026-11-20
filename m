Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215584;
	b=t7otBT/6M8bDJwrJLgtMqJOWt9AN8XIAfBFeY65jiMEiWGohj6qnGVgSyTR+LqWQbu16
	 EZRjxsHk67S2ezMN7CcMdejqXNA0EDOe8eJe3BR4v3l+i3rIiqcrng3vnfCilJfLIjow1
	 dxAeIHxwmMfmO5/+idLvN+vScppFHwQFpzP4ui5xoAMdmc6homgf8hbgsknfOfrOaZ7q9
	 CRowseJGXAEehF+5sEAzCZJ5F3+QBfjO8Pp68qJ/mTUgMSFinxd5ssvXOUr9zIbTNPfF0
	 dwJdNKbJduJJOoiUR+ha1PJoZA8zG5/5h/Hdy9TzrlZtAcQh082SmO/bdm9i3kklIKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ee5wISoYwOc7Y9upCk7+nEDeErsMErXue2GBxhmncOo=;
	b=ONRkbW1Jv03R95kDWExOx01/KUerfaewU5VQFSdKKSOdaJfElVWM1VkiBsMYptqvavKr
	 MdFUw4kx9/wWX9iIUp9MHfGtoPuEfh02FEi7XkSjYFJqnDYExh4v/qvVYBjRI2TuKhrl5
	 EsAP2KBfpoya8PCP+X51GeF+8kdctg6230TaKWAk6CKL8g0mZ6Z0bCBK2gKvLwvFTYbOb
	 f6ao8MSF2fBQLOF23iGfVnnFtbpWUMLb/wqGbvG1XNOt8KkWTucYiwYHYOAk5SWTDqXFz
	 CUfagWdbJ4H0wIfcZygF50FOapCEiGPTV6bEYLdo1n64+AJyhk+xtJUg7qvbT5MJDcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgyag7Vl;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95D606A680
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E95D606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgyag7Vl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so14372485e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215582; x=1795820382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ee5wISoYwOc7Y9upCk7+nEDeErsMErXue2GBxhmncOo=;
        b=Wgyag7VlNwEQyOFpTOPV7cGFr5SQm+kr70UOqJjN5aYRoX6r/PCzOFGv5cESe327gK
         +W6dZgscQvFe9M3WhckhMG6WZNEU4iza1FaocSIOe33JTTw67qAnnOOnJF/oZLKKoDdo
         M2awmXP+e8XVDStJ1XV8RP0onDcqmMRhoF51e05MXzRjIBVd/IVWXMoH54GHzfnE0L+i
         ofbLJBQoTbyiZsnPscN2u/TjIFpYLnublajx8wekYTyFe3YDQHWcRIlZp4pcKLq/ELbi
         fQ/6t9cikUnBTVBqEZSleZQFKop1/niMwHYpOzM7Ixg407hdQy6bfsLkFNX8nW3paP3J
         e+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215582; x=1795820382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee5wISoYwOc7Y9upCk7+nEDeErsMErXue2GBxhmncOo=;
        b=IvjlHtVSxdZkIarRvDFQZK6iw/St6WJSVy46wm6VqS9WTXRiLgRDvUeFOAeMdebN96
         n7k2ToOMIqoXGg/n/KmolsMCg2uibQ+Oihp+fIlk6/EOcd1SxrpNmvVY5F7qfemtWAaN
         PeQU7V+cR2y+Q9+y/Ud3zqWc0nEDw0GJJpJBZDke820rY81QXKJDTzUh2/g8aNjMU1MN
         suwTzCyqav4IUDkYzFVEDBe/rMvtA5ZBn+qEHiaYKK6YaVeP6u1mH6isHpmqNvPxi1r7
         zzdC6TYAdvxDKtJui1lQzApw5ktcb0b4S79/Q3A8sqUi2kU8rsQzr7sh6a8dxCqOCdWA
         bFuQ==
X-Forwarded-Encrypted: i=1; AL+hErG0mVvymUuBVKoP1P2sktjmlNGmAtMXEz3TYknL4ksNT7o5I83oBZJgnkdCWM6uI6gqVzDFOTdsM+lfCyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wEQS2sUpTeU5YPsGC31KzWfgEXoifSyAnGviLp0Y62ZutoAoX
	BjTaTqqQTbRaoA1CEoft/pAWs0QuVyPG/SbiCzEurFG5piyti+UKx53ZIDpB
X-Gm-Gg: AYBFou10ven0+fdYjICAHBy/9Pgc8NHO1pNvUhDYrJRBgpOy6PPFO6X5R1UqhazsFc9
	Hy9DPUsgk804kD6UEQ8q3UPeryAHkZ3OVcGsVgprmk+1r3/uf8i3v7vjU0APDBdjkZgHf8meqnW
	OpR5ykXrNQD24qgCaVD6/mReSv7Gh++biURa1552yakYJepw5b+0x563gtYDhhDnsmimnGIwH34
	Etf6DzOp8f+goLb3OjUlEvzB9aRMGVOV4zygzXLo8Hu0L09ULvyNrRM17RGV9KYxojTAw5Z8+H0
	rjOFHZ5BOzRlGvdsJfRsxmxjyhzUkrVbWtlwjm4yi5JchXQ+zS4W97glHIqNmXp8wf+INnMzHVq
	fPbfRHbUW58Dtm9X+6QORrmm3UQ5Kvnj2oinb2RZq3csLNnaYN8b4p4Pd7eQjyT+Mp9be2eE/OY
	J9JH1hd+B0gRm+vtAK7iSpmKfv0WEeZ4wHpBjzP/d89Jn4TKhnnio0bYKpxmpzk/jamxqsAOtvx
	nynNvOvFO3i9ulcxSBficsi0VRrQLXq5qOrH4bh58D97pBvn6gvR/HbnTw93tMmvuxWmfC4snfN
	1Wubn2OfUWPtQGTsyvZB3Y1L+3Pk
X-Received: by 2002:a05:600c:a08b:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb88922c52mr96824465e9.13.1795215582473;
        Fri, 20 Nov 2026 14:59:42 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm128863475e9.2.2026.11.20.14.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:59:42 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 0/2] wifi: nxpwifi: firmware response validation fixes
Date: Fri, 20 Nov 2026 22:59:31 +0000
Message-ID: <20261120225933.1148680-1-tristan@talencesecurity.com>
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

The nxpwifi driver trusts several size fields from firmware responses
without validating them against actual buffer lengths. This series
adds bounds checks to prevent reads past the buffer when firmware
provides inflated sizes.

Changes in v2:
- Dropped the HE capability TLV length patch (was 1/3), superseded by
  commit f17e2eda1630a ("wifi: nxpwifi: bound the TLV lengths in the
  11AX_CFG response")
- Patch 2/2: moved the response size check after timer_delete_sync()
  so the command timer is properly cancelled before the early return,
  as pointed out by Jeff Chen

Tristan Madani (2):
  wifi: nxpwifi: validate ext_scan buf_size against event buffer length
  wifi: nxpwifi: validate command response size against buffer length

 drivers/net/wireless/nxp/nxpwifi/cmdevt.c | 14 ++++++++++++++
 drivers/net/wireless/nxp/nxpwifi/scan.c   |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.47.3
