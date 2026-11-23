Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428478;
	b=E9hi2Td9GRhRNBVu7jCEssBNhKAOaveqTZRl3TnYexQSf8LrVgA4f3WZNFgOSEizuQo6
	 kj5qMfT7vXBp8DJsGRFKAO+yUCxf8Jd47/NmqWA7cbDJgRL00SJcYTvPgbZwgUCi0RwBR
	 608BCaKgSJc5talOrzTp5jZiAPaV2ERaclJS6ZHqcIgG/3e8FmtSIUuYQbuWHqqblI5cG
	 V+sNaSyFVeMmtm/mnQpWB3jyJdyRCjqY/1Zhwt3q4PoRI74BNuoH2C3comAX27lTq44iN
	 c0rDAgFirOrPpNSTdDOBc8LYMWlDzFHITn+G2jTF+hN3Hs48LJxTI1pMH35/K0GRvGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428478;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=qp8AGd60G0fwr6K2rygdNI5NkaIRDQZvwIb0BjBfWEQ=;
	b=4TPN9OTlznE8pMZgvvY3RadR40QwUh8IwjGUMJ9w6qsBsYuzE3RkLq04XkOFEbiRIlv4
	 u8IB3T5+7Z/aSmaXOKopzL+aw0zSWFs4QaaqCwvCNf65hLhpF1ln32h8pkvoYZ7pGqUID
	 Yi5lcSmPs5174Hedgoi3ceb8ILVfdHmd8pUEEy0O12srVxJuICN7PZ8qp9ehNLuKvnZmI
	 5Jniw8CxtafwhJkPJx3gSunACwsex0uRJrC14+mRN/JQ70MGQF4HnYssRJAW7N1kiYue/
	 mdM8clwmQ0UTKN+WmaeR9vAOwJP3cwJn45wFRyfHm8tYs/7ccYpRgoa6PtWBtvPtNhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=I7VoXzwt;
	arc=none smtp.remote-ip=209.85.217.97
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAD3606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAD3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=I7VoXzwt
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7a6e560f580so1994829137.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428477; x=1796033277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qp8AGd60G0fwr6K2rygdNI5NkaIRDQZvwIb0BjBfWEQ=;
        b=cwOaPCugN7BsrTrtk3f5Zr/NaPbbooK63K+f5K2aSpKwXqFqR38W42VSdJFP7Xa6mz
         fr7CwjXRCwELy4MWM6pEGyZs+ClDchbsJWVvPYrBfltqhzna58w8XYUrKWZ7IMslhogP
         EV1TP2wN13yxpZBh8JEt3pzNmiQkJL9F1v0xVtCqvkYBKM5hPErVAlkDW/rwgCwGxPzk
         7Q+wDtcD9+rU15r48W3SD811dRLRxtx2ERyAYAgwQZr6vUbPdp3id1auMe5iBRgM0/Nh
         B7lYg00yg0n4pqzUoNJd3Vyn08kVMGtUxtAJ+D6z6k5StvnFErkdM8KqGcQzyBifDrXK
         gygw==
X-Forwarded-Encrypted: i=1; AL+hErFk+htQCAF7Websd2qmWzsrxugh0sk1AhVFLt3G4Ro7bl73mbCOVnxARCLKepGkKPmEEmUWbCN4MKGy+ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z93WS6QvDVpYEt5U9iiBvTyNo8HKU4jXzCZ+lYBCMaUnrhFus6M
	A1u0QglZigalrr0xuHOBAUHMEsmSZghzxxk7CnQlwk8Q7/vnd5bMqkj50jO8O/xmKNdLZA4SNO4
	4nQycrlT3mkP6OCmtbLLkgGCbXUJiTWflyEzPRMib4HZ3QMT/p49x5wExSvhiWPUMva8hq1Cztd
	lF/CRCzL1K6UAaXwa+/KFGVmZseHsWn4Scbn9F1o9IFBLGC7PIp+RoEOq25EgzYRYiZeyez24XT
	/GcQBYXUJZFeIxOtw==
X-Gm-Gg: AZFdTZfiJplLbxM7Kq4wWGR8g2D1aD47r6s9R65iSs93/oJ5J3nCV2vpPJ8cOofqEy9
	jSw8sPlpvw3NNeu39tk3UfmggLyUagJAlrM4GxCoXCP+EnIY1qwR8K/SJh3nHdO+e8Mexd1Yly3
	oJFcWKe46NtoAhr/GQIsbMRfUGg5CH04qnQiGSe/XP5ARMWaHC5KZ//SoXqOLK2dzj+4YHT4sJ1
	qmkLgb+RRkW2oMyDTQZ9oRYDATtZokbFpp15lWDdQtLRH1/kk1zt+V+0WZBE6nwq0xQxEEiQ6X8
	3HfKA/9x3HiCciAbV7kthJOc+kfBEnD1MNYBLJRfklWrT9QoppTvP1C1tGxmmoZ6o7M+1/n9h82
	vJKabOHYp3zlFERhKPNuBTEybrqs2lykIHGGmH4lC16VVK36P5zkQK4llrcKuc+9tUJKOpmAJ/6
	N97WKgU64nbAF/bqNV+vyVLREuB8vRHSlZNSWo
X-Received: by 2002:a05:6102:26c7:b0:7d2:7be1:271f with SMTP id ada2fe7eead31-7d7395b6953mr5233399137.31.1795428476691;
        Mon, 23 Nov 2026 02:07:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e18453bsm1101783241.17.2026.11.23.02.07.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:07:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so1586009eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428475; x=1796033275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qp8AGd60G0fwr6K2rygdNI5NkaIRDQZvwIb0BjBfWEQ=;
        b=I7VoXzwtQlg5pmB5087pm38P1xTQpX5rXeL2rUffdJo9sTiMDtu0Y1lPsJ0+VY8hsS
         XX0Be/MKn2HVzjXXFO7algLoR6FvPsoIfzjly9031q93RuDL6T/B9Vxr7YOFwF4s8VES
         YylM+zNq0OaGHJbKc/eNUGfyyYXUUH4aTSN/M=
X-Forwarded-Encrypted: i=1; AL+hErFCC+KeG6VhtS4+0ytVaRUDNCbPoji+ZzOneZ7oWtksYOjtl26xpAvVpIU4Kqh0rM/BnD731tMrsT3XymA=@vger.kernel.org
X-Received: by 2002:a05:693c:65c1:b0:386:9cae:abef with SMTP id 5a478bee46e88-3869caeeec6mr7677507eec.36.1795428475357;
        Mon, 23 Nov 2026 02:07:55 -0800 (PST)
X-Received: by 2002:a05:693c:65c1:b0:386:9cae:abef with SMTP id 5a478bee46e88-3869caeeec6mr7677483eec.36.1795428474712;
        Mon, 23 Nov 2026 02:07:54 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:54 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v9 00/10] add features to bnge
Date: Mon, 23 Nov 2026 15:37:36 +0530
Message-ID: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,

This series adds ntuple filter, RSS context, and flow steering
support to bnge driver.
Patch 1 is a pure refactor (no functional change) that relocates the
filter and VNIC related code into the appropriate files. Patch 7 drops
the refcount usage from L2 filters, also with no functional change.
The subsequent patches then add the ethtool commands for configuring 
ntuple flows and RSS contexts.

Thanks,
Vikas

v8-v9:
    - Addressed valid comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com

v7-v8:
    - Addressed valid comments from Sashiko
      https://sashiko.dev/#/patchset/20261114074742.1484603-1-vikas.gupta%40broadcom.com	

v6-v7:
    - Addressed valid comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106093524.838341-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20261106093524.838341-1-vikas.gupta%40broadcom.com

v5->v6:
    - Addressed comments from Sashiko
      https://sashiko.dev/#/patchset/20261103123651.442893-1-vikas.gupta%40broadcom.com
    - Fix inline keyword use in C file.

v4->v5:
    - Addressed comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928061307.1172344-1-vikas.gupta%40broadcom.com

v3->v4:
    - Addressed comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917064548.773334-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20260917064548.773334-1-vikas.gupta%40broadcom.com
    - The patch count drops to 10 now that the HSI patches have been merged.

v2->v3:
   - Build fix.
   - Addressed comments from Sashiko
    https://sashiko.dev/#/patchset/20260908093053.2596020-1-vikas.gupta%40broadcom.com
    Below Sashiko comments are not valid:
     Patch-8: 
                Comment under bnge_toeplitz().
                 Explanation: bnge_toeplitz() is not used for aRFS.
     Patch-9:
                Comment regarding bnge_clear_usr_fltrs().
                 Explanation:
                  Both bnge_clear_usr_fltrs() (only invoked while the
                  interface is down) and bnge_grxclsrule() execute
                  under the netdev instance lock, so they are
                  serialized and never touch the filter list at the 
                  same time.
      Patch-10: 
                Comment "Does this direct dereference of the MAC
                header need a linearization ...".
                 Explanation: ndo_rx_flow_steer runs on the RX path
                after eth_type_trans(), which already accesses and
                pulls the Ethernet header.

                Comment Related to bnge_cfg_ntp_filters().
                 Explanation:
                   bnge_cfg_ntp_filters() runs from bnge_sp_task(),
                   which holds the netdev instance lock while executing.
v1->v2:
   - Build fixes.
   - Addressed comments from Sashiko
   https://sashiko.dev/#/patchset/20260814011435.194631-1-vikas.gupta%40broadcom.com

Vikas Gupta (10):
  bnge: restructure VNIC and filter code
  bnge: add NTUPLE/ARFS VNIC
  bnge: add helper functions for multi RSS contexts
  bnge: add RXFH ethtool support
  bnge: add ethtool support to manage RSS contexts
  bnge: remove refcount from L2 filter
  bnge: add NTUPLE filter infrastructure
  bnge: add NTUPLE filter support in ethtool
  bnge: add aRFS flow steering ndo support
  bnge: add cpu_rmap support for IRQ affinity

 drivers/net/ethernet/broadcom/bnge/Makefile   |    4 +-
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   28 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1140 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  839 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  137 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  192 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |    9 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  560 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  163 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  379 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3279 insertions(+), 363 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

