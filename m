Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985389;
	b=k0peICP1Vm+FAckUzrxH2/SJvYLboSeeJlsm7Ip7bbLpdUHn5861NMZjyYEqZDu3QY92
	 QpSsEmYfSOW7s/qNK3Syq40jB2qdDYrIL/3TNuCxvggQZQRjW1iyyKokWEZQr1L194Csc
	 ZSVBdXSZMi4yGKp9HEFAyW9hsAzNTGwEI30Stoh49Hk6kvg3XhmZ6pZr2Z+wVa1M2puwz
	 pHFxw1Ze/DPDwij4VBAeS7ItpQGFKPQG0NEFEX5eipb+Ns8xllN6kju9yjxhuPvRZOC9C
	 EghsEJv1qrMN4hPENYr1ywbpv7gc6uv35GNoVWIvSsNAKqLAZHtDNsnL/q4iylTqCkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985389;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=R1SiC+CmYkm+IcXfzWSyxKFk+upyTEMQGSq3i64NDbk=;
	b=oC/NbVHzidav3Q5rjrgGG/wTalMObz6hOBpmw5x62A2GWeafZdSNXXJ7V8tCXxAlqqkj
	 TxumuQVGe4Xefm0Xql+oLQqOpV/2LqEgJ3+r7kfPMGkC1P6nSxVkrjjYNbxEwF+gTwsxG
	 sC4xTUkcWmLJFf9COgplRY4fxMBTXW4YYpFII2+wq05EuC0Oxg67E4IdXmnrLiPtSq/cL
	 nrwL6f2eeEbRHhpw1FQUrD74hrkTZHYjarpA8U6k/IyijimIoPVuG+exPNvwzUZdWrlIC
	 sW7Kz5mErPCgE51mhjSlpdZP+gBYVxXW0TigHTVAs2rLJbyjGerq927vLmog84Xwzlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sellers.id.au;
	spf=fail smtp.mailfrom=sellers.id.au;
	dkim=pass header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=FbW470EA;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECECC606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECECC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=FbW470EA
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id TUDDxV6WPRiNxTZhExfHCS; Wed, 18 Nov 2026 07:03:08 +0000
Received: from just2044.justhost.com ([173.254.29.206])
	by cmsmtp with ESMTPS
	id TZhDxt9MG8cn4TZhDxElRR; Wed, 18 Nov 2026 07:03:07 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6afd4dac
 a=pynxHT4M0AVwz8ROpNtnNw==:117 a=tbVZtiplu92VKpH45hjydQ==:17
 a=zJRp6_cAMcgA:10 a=QzMiS2WfBm8A:10 a=11JzboO8rzxrq4yt9xYA:9
 a=sW6rCsXrbcaOzks2YK80:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sellers.id.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R1SiC+CmYkm+IcXfzWSyxKFk+upyTEMQGSq3i64NDbk=; b=FbW470EAqCjdVxA092sUY+xdNn
	marfmfJ+SrMh+enZG5hTL+CcDCwX3jhdRjGDLWFoVHD/Eq+dLrnO78RH9msYtIWjqVoUD9Et7tqle
	FgXLnz8MpGZiKW87ubTEwqGodOioZlhKHJDyFNlY43IA0fE6xSRdnG5iOGQrdxeH7BN+t3k0xfcie
	vTiQJuGcdv6oi3iL6azho+xo4qS9SMaOfu5tfyEvCKA8ArV9udnzL91/MRNSP2c9CYrsnG937XPGt
	jjtXGgqd7k5LxZB6fRX0eRa8RSLvDTxCDilJ4PbLGmLe1DXh6ID3zUsVOXGA0RaOfW4i1P896PC+3
	4wpEogcA==;
Received: from n110-32-20-158.rdl21.qld.optusnet.com.au ([110.32.20.158]:46974 helo=localhost.localdomain)
	by just2044.justhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <dean@sellers.id.au>)
	id 1xTZhC-00000002TMc-2QNn;
	Wed, 18 Nov 2026 00:03:06 -0700
From: Dean Sellers <dean@sellers.id.au>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dean Sellers <dean@sellers.id.au>
Subject: [PATCH 0/2] pinctrl: sx150x: OSCIO fix and block register transfers
Date: Wed, 18 Nov 2026 18:02:57 +1100
Message-ID: <20261118070259.2557570-1-dean@sellers.id.au>
X-Mailer: git-send-email 2.43.0
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - just2044.justhost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sellers.id.au
X-BWhitelist: no
X-Source-IP: 110.32.20.158
X-Source-L: No
X-Exim-ID: 1xTZhC-00000002TMc-2QNn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: n110-32-20-158.rdl21.qld.optusnet.com.au (localhost.localdomain) [110.32.20.158]:46974
X-Source-Auth: dean@sellers.id.au
X-Email-Count: 1
X-Org: HG=bhshared_jh;ORG=bluehost;
X-Source-Cap: cmVhbHN0cjE7cmVhbHN0cjE7anVzdDIwNDQuanVzdGhvc3QuY29t
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM40ULlmkgeH3Yv3/kpQfp4GxBh4syoh55pJcHv7kQ8pXTzYlkLcTQKkW2NUQ2rr1BtD4jprVTZLuu5u4cp63sexZrwAV82WFmsaKk7anIPSuiG8caBq
 ttHin2rPKMsDCqmE9XYruPk9u8ENhrnQPRYcm9RXtYkrqmPcnQjYpZWMha0b7R4sRnlllBSkNXObFHpkHRu7AggZskhQlE8NVUY=

Two changes to the SX150x driver, from bring-up of an SX1509Q-based
board.

Patch 1 stops sx150x_gpio_oscio_set() from writing the whole of
RegClock. That write set the fOSC source in RegClock[6:5] to 00, which
the datasheet documents as disabling the LED driver, keypad engine and
debouncer.

Patch 2 moves 16- and 32-bit registers in one i2c block transfer on the
789 models, relying on the register auto-increment that RegMisc[1]
enables by default. This halves the number of transfers on the
interrupt path.

Testing: these were developed and tested on an SX1509Q on a 5.15-based
kernel. I no longer have access to that hardware, so the versions here,
rebased onto pinctrl devel, are compile-tested only (x86_64
allmodconfig, W=1). Any testing on SX1508/SX1509 hardware would be
welcome.

The rebase onto mainline and the changelogs were prepared with help
from Claude (Anthropic); the code changes are my original work.

Dean Sellers (2):
  pinctrl: sx150x: don't clobber the oscillator source when driving
    OSCIO
  pinctrl: sx150x: move wide registers in a single block transfer

 drivers/pinctrl/pinctrl-sx150x.c | 55 ++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 3 deletions(-)


base-commit: 95ebc96dcb373d7d278625fc91e602c839f1f388
-- 
2.43.0

