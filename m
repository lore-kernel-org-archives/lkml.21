Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607694;
	b=m6ZIMqpXi67OK/scZnZZWoHLwipcxoew/8E1mw5usarzXl3wBaLhUQo+F7cob9htEl5w
	 7oKdelrdXvsHTRg4Nv8c1HTM63dYef9ikXglxwwr/EOJu4Lw9sa+9WyvMwpLCO0U0XNOL
	 nSyGjTruChTc5matyOLu+dR3aUW4OMUy2tVHYdH7edUFUWJV3/kYJsEUzaD4AnZZ7Yg23
	 tFzc9JmJaeeAo4hXkJv9Am2MSkz3KxW2/KJWW0ZenzgWoDsj8PGb/UleeKD6FEmmdSKwN
	 G/RmmWkYmFQInqtWZC4C3CgOww6EGfMM82PiJsXPq5EF7vrl57eeZ3hhMIEWuQXgtSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607694;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=j1lK+KL8jsRcbhgEh1ZN2hINijxdBHiLPsRycSS2iUo=;
	b=eDa1KZBxojWDre2AzXMPFgp9vDdhubNrnIPQfRNLA/XO1AC/deCx6HXQ679ephlszhuE
	 gPCl9yU/i2yfh1hmN/MUJXqVvfNNretg3wUOKdWciRVqQFkE8a43lOjm0crfqy3AEpxtb
	 BX2fl2IPsmuhvBkBZWWKXjSQXMEa5/ZEIHVNtBgRIDdzc396OUIXgoPcaeWo9122RXDJB
	 X2E4UOOB4HS2o6jWRyVST8RJmIszEwNdNRdSYtAMwONlbQCeIqNbjbm8YE7MYW5tdALfc
	 fJlZ+EP6Oa/3CYQrMngc8b5hXyo48Gat2/bxifs0u/vpdnTDcrA3lezKr1wMdb/FCtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="LbQ/GscB";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4504606A684
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4504606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LbQ/GscB
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso2564250a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607693; x=1796212493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j1lK+KL8jsRcbhgEh1ZN2hINijxdBHiLPsRycSS2iUo=;
        b=qb25vMqGXgV9ofNr6EpTz7MxVZzIPgmPG1kcBNEhGHBh78lIASvOw7qLBgzskb7cne
         jiGK5/4r3bXbgK4aVqjmkMOHlFenk3wRRCHNDB556nPxy64lkNXvh3hTZOMYc5IU8iC2
         zFF2Navtsb+y9CDO3u7o79g/tW9D/fOM0t8WCNSYHzGR+/Sbf9gezVvGBMbgH2Zb09RP
         zAeapXFfk7LKHuAu3t8vEZxPeSOuRU+wCnac2GT0qGtWI9V6BV9Cy3yERULLeTbNOCCK
         GUPzAIwm4wuTiMqB74td7oz+9o7AjbbCuFOZuXXkq5K0yz7p+rUSdr5dNdVrCYTG/m/d
         axNQ==
X-Forwarded-Encrypted: i=1; AL+hErE6P11Odxtn4eUHcS9Eww3hqaErDB6kKu6ivzm44UHz2eqBt2DCCrk5hwcffq7j2wDDmzs5+x4j29MYSLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IG9KFHQTkYFH4wPtXTX0DzFMxQTB7hAsZhv7amSV3jiKSzPMs
	D213T9fsT9Axx+uOK0FOYdNhJUd2hzcLlChS92GJvmu70BNUzVQZtk4CxntCzHKsk82vEHI5nss
	Zo0ilM9Y5a0gt+I/s5EbI36LW5drzNzvUbScX/3DESe1u6klrrddRV5i1admCWCdOgqDSjcWeoL
	ItiVkZJJQWYy/h77NdM42zSpOrIPhAaobHWruxwxwf9otHP1rjlmQve/qhdrF6Eg9e/jMgiBRN7
	tUsOJFmqHNTJiYm/A==
X-Gm-Gg: AZFdTZf47umkQf1GDRdsrscLtau/Zsk2je2dytH/K+HnX++zAcwi6jbzcbC8f8rrFPA
	QovoxT76I7jahNfKnkuGx9azl+3pF88GHdPIp7m8BwJXh5EwxW+S2wkIAB1aOYbK6REsCF96xAP
	Lf3YMjh1MsmpXZYuhsFgK0clOrLXgjElSDlvOQGcY9qp2O+E8t7W9xJUgP7JjAIqKQ+TcptHV00
	tusSEzc6wia6sv69f3RZONOSuQJpCFIUFnevPCG1ZL5PpFjjPnTO/RrKpgWTOCKEo7XmGziwKot
	bzAaP8C0tgpg4tffAbhs1FMU4MpsaA05/+HjHhuuO+h5JvlM5M0otyxpuAAP3SOcvQZ1LUbki/S
	yKFiBEWGRw2zGB+eWCM18AaTx6ejLETHdjkyZdunO2/u4U7PdED4fPLLadhH/8agt0yxQYZ0qCV
	oPNzxQXEBEIURlTcFlja7cAGskFqbVLyOtx698
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b41c8fed4bmr14791189a91.31.1795607693124;
        Wed, 25 Nov 2026 03:54:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42005a1a1sm12430256a91.0.2026.11.25.03.54.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:54:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so8089652eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607691; x=1796212491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1lK+KL8jsRcbhgEh1ZN2hINijxdBHiLPsRycSS2iUo=;
        b=LbQ/GscBZW03uEFVwxEmtF5TL7kc0O/4yYuH9y3XXIC8pYuMVgBsiUcm7enoZdqgGm
         q703WFe30CHd5Lm4CJ7BCrcz9mCb+EuA6mMJkBgJPVP1Qp+P/CO4LpOGOKw3GNVgpkKJ
         IqaseVwv5mrkOPs+ywob3xtsidoNtdenD1if0=
X-Forwarded-Encrypted: i=1; AL+hErF3ML5Toma1IqaMbQLa7BRJKAxmvFLyr46YkEoVAffHDgFtEJnWYckPnTXrRJgVmo+PKnDZzqmCKLrynOk=@vger.kernel.org
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr18499560eec.24.1795607691451;
        Wed, 25 Nov 2026 03:54:51 -0800 (PST)
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr18499531eec.24.1795607690750;
        Wed, 25 Nov 2026 03:54:50 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:50 -0800 (PST)
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
Subject: [PATCH net-next v10 00/10] add features to bnge
Date: Wed, 25 Nov 2026 17:24:24 +0530
Message-ID: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
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

v9-v10:
    - Addressed valid comments from Sashiko
      https://sashiko.dev/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com

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
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  574 ++++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  164 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    3 +-
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  379 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3294 insertions(+), 365 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

