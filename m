Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514900;
	b=lWWe58jhS2aQ0G7lgVIhST/lnLd7BSmscwTSPrSJKnNuGSSngtphoJ2iulg2f8uAdM/O
	 ZIRj2x11LjjW++xZq/Q+gR2abxachOFGK/f9cNOJyt+nPASOiTXgkNFvEMdMJlWpt4X7j
	 BcGw6pE087Sg19HuSDsZmGGqsntvSP4onneRZOKckTRrraKEkYymRUipWK2M8pbG9a2Iw
	 vLuaczHUqaIGMvlkFF8fR4iQ7NBlkXUrZRGyFUYFTttBji3weF02N6LY1gI8OVC+Eqxo4
	 Azt96Nj4iwBX1ISnMSdSR+jgmj795/qqPMCtN/VbvtQCT5yK/LKheRQMvIq8AAIM05g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514900;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=2kR+AtKBdq8y6iVbWORBPJQjt4HuMFIisprY6swBHsQ=;
	b=1wFAUsJ9ViFMxAsVfTub02lHkX4w7ysd0V4F6NwhQxRnKP7JJXeDcVENM1OJF2UdJLvP
	 0TFy57oaVXaXd7sLkfZn3HNeOfS9d0jMx9BbMf2e2xMkADrd/ca3Hzh1aW9tMqlqPg/uV
	 OlkggisOUoRXMLc/cCD/oWcp4hF65k6ecoKORTT7ikKhF60YT4qUrmPJ6+O9oJCebqAN+
	 fzeh+u+MSE1P4v+2RPJnECRXUHfEAOYxOefi0fOlg1aU4jSQ4pQTdiml7d2GJ0qcd4E2A
	 xdrhljYp6vaDFGtB7gyyTdMKeCYfqztI9ajkEMEXoGwKxLvQVinwLq+aCzbm0x9/L/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HSdvmux9;
	arc=none smtp.remote-ip=209.85.160.226
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E4606A681
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417E4606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HSdvmux9
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-5366ae57896so45098441cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514897; x=1796119697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2kR+AtKBdq8y6iVbWORBPJQjt4HuMFIisprY6swBHsQ=;
        b=oj0vz4GLoaGU5WItPqP/O5+TJe5iIPTHH2BN9aRyq4kHrDxbUyqJs77l3adzf4fjlL
         T0CpnE0M5H7i4mudwnQOJWy3+BoTl96ycPrAlmpx4VUxbkVGR3NECd4japzTPeFEObSh
         pK/GhSBNUMJUEYYisGHlPu16EqtBD6c5ovVD3SNSMryCyDKrXFY9zGZMWed+YKuTzGQz
         uRGZS7k/HvlxUougZDE8aR2LBav1axa278bHrl96NATbeUFcPlczjielZCUstA5Um37t
         U0ZfDKPuJBp0gyYWURX1DKq2TafBFf62Z1n32hYeo/yqOw89vYahE0zO3RVzFfblGG6u
         JdGQ==
X-Forwarded-Encrypted: i=1; AL+hErGf7UC3YznmQAlaCxT5rqO9TdcdRMx+8M78to56MhvbjAXY7qHsUD5yh31wcWAZ4+eKbcPDb8ebXMnJhJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6truKyNcVvVRiRFtfdePL4jY7TwtElj9Wr6l42B+z/gOKA6Ua
	U1WILNeNAq/Z+Cj/5BCWCCmSV7cqW48ch+rQTUq1G2z/1EtL2JMsFN8V6dolf+k8/plD0la0LXe
	wenXD47K76nlKEblVEGCVS3A8SP1p1iJGRhJqUKHfzkmprst1/Ggx/hex7Qg0LVlJMZOWb3m1Ud
	iJHK201YdZc85rBOXm1eOUIR8AePyeTi52nX3r+IuacD+lmiFJbFu4Ors3pOJfEWXEfQV/HSIFG
	P3KQ+W6gMN3kvoqr+HdLChLvDpAlQ==
X-Gm-Gg: AZFdTZf6wS+jxeTo0b+42525mMs5MePgzPtKCb77DuD4fMoeLZz6sIMdxEz0r0CQ5lz
	UpSuku4afkDaFK0hgWZhem5qezDBwsZZPjzp6D/ECC7QkdnF/a4PMU2HOOSeUQZ7PYS8hlgp58M
	EbYc+coSUrtbBB2Ddbvi3NxE49Yn3weQSEtq0/TaC2h2mVdKZoiXI26gjgM0rmJb5EYeWIdOy1y
	0MREg3P5bFtMM6yXkHAdLwzR5Xd2Uv8QD7PLKj0CFV5XX2pFQFCThzkMe9etFRDxmnN6vMpAx09
	upn9RHE7qwfvAp1DYCMWpAH5UQm+6gJDrOl/GTTGvseqr65ZxS75xjLeb25PEjF6OBHHs/7AbBI
	eXxyGP/987i93YpsIsjtHBcwXUR5hzfqRdctsKTT36vUPhaQOAw2lZD3M+V82ALxva+NGzShhek
	39WRSEaX+apzK3RwlQD2kVZTVfrG1k8dMLLHUV8I1+AmBRzA==
X-Received: by 2002:a05:622a:2587:b0:535:f1b:68e5 with SMTP id d75a77b69052e-55d76a89d19mr266603041cf.44.1795514897035;
        Tue, 24 Nov 2026 02:08:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-55d7888010bsm1062911cf.46.2026.11.24.02.08.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:08:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6149426eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795514894; x=1796119694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kR+AtKBdq8y6iVbWORBPJQjt4HuMFIisprY6swBHsQ=;
        b=HSdvmux9LO4hjYlvoM7zoyiJsfybCw9nHmSArUCyXoZ4h4iv9Kpgjz9Cavij+CKbps
         Z3wa4vJZLt9P92RINQvqvkW5wlRXwQtVjiIKz+REWqOZcjFBUSjZBtD3hvYxk1yuhuzl
         WetOcjYr9wCt3BeGUtHxc6EpcqPo6MLAJD9JI=
X-Forwarded-Encrypted: i=1; AL+hErEFT+K1UWmj9XC8uvjya0A9Y+0hmovbEfixZLx72ucqa4VZ1WCX9qfzJGHAjfsJpYS41JGAdahNsxxOy3s=@vger.kernel.org
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr13497717eec.31.1795514894480;
        Tue, 24 Nov 2026 02:08:14 -0800 (PST)
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr13497688eec.31.1795514893697;
        Tue, 24 Nov 2026 02:08:13 -0800 (PST)
Received: from H10-S2 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm49931870eec.26.2026.11.24.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:08:13 -0800 (PST)
From: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	bhargava.marreddy@broadcom.com,
	ajit.khaparde@broadcom.com,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Subject: [PATCH net-next 0/2] bnge: Add ethtool register dump support
Date: Tue, 24 Nov 2026 04:07:49 -0600
Message-ID: <20261124100751.179270-1-ramakrishna.koduri@broadcom.com>
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

This patch series adds ethtool register dump support (`ethtool -d`) for
the Broadcom BNGE Ethernet driver by implementing the `.get_regs` and
`.get_regs_len` ethtool callbacks.

The dump support covers:
- PXP registers
- PCIe signal integrity and PCIe Latency Histogram statistics
- Adaptive QoS TX and RX MBUF registers

Ramakrishna Koduri (2):
  bnge: Add HSI definitions for register dump
  bnge: Add support for ethtool -d register dump

 drivers/net/ethernet/broadcom/bnge/bnge.h     |   9 +
 .../net/ethernet/broadcom/bnge/bnge_core.c    |   3 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 168 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_ethtool.h |  19 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    | 178 +++++++++++++++++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |   5 +
 include/linux/bnge/hsi.h                      | 149 +++++++++++++++
 7 files changed, 530 insertions(+), 1 deletion(-)

-- 
2.52.0

