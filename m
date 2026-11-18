Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032837;
	b=Fg/XB9ReMzOijoYtG+erBZF+kD/y3AWbM/Ixl/WQ999s/2IQCap23aaXaIEAjIPl0L73
	 N+1UCAyhvmN4RzI12a2+fP9uTLSMvgV6UHyTjZFmCU+w4aOPHiVwW4B43acObUaQRoBa6
	 kHp91Jiu9SLcVRvTxOUe5YxHmcs2EaJblInGn7/iyqf+2SVNtb27amHpGjOYpvAKAJTyN
	 Ew/0NCkmfDKJkglWqr80eNS9sf0Dj01DKelHqmouKB9+9Qt7hwQDdw152p7dQD15hnuOS
	 9cTrqmmFQPYp48wQgA1WgehAhnz3LFzHiZgxzrg6XJnKhPxkWcmTk7x/TrFybnQz7ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032837;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mqEoSsDLRwiTtXF4QHzskVicsJt/6mayXvEhwI8woOU=;
	b=zvpM6/nhd3RXgu0D3wLtSIu4ck3/4K99rMIPedcsjxE20WMcEy8tIhopzBvFUX+hhGF4
	 ZHp22mzgCQfSZ4Qq+HbjsvLElVz53UiuhaajS4DgftCCfeAGALzngOZ67GYvgInOFvwRq
	 GurPH9ZChXqUEoNaLY33lI61/wsdyNS9lDY76yNxe8HdISi498gjgE0Otqtm0tng3ALVf
	 k6raFe5+iAGw+Jw4Iz97+CbztHtfZba9iXb2jsdfGTEcn/XAScLimM1Ocr6vBy0dgzY3D
	 APKnRlmNBCAqEDp4074NBTIdDbhF78g93CSFmGSmVRrV4yVfze3GlQ5GLbN5DEaSVJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EsALQCsu;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C906760A262E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C906760A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EsALQCsu
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-ccca948203aso1048737a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032836; x=1795637636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqEoSsDLRwiTtXF4QHzskVicsJt/6mayXvEhwI8woOU=;
        b=BnM3wWPDS0XPiHeCnhc8w9RQannDfgnlAhRb1C1+nxG7wFSGcRltnPfzFAoZ3p9AzF
         wm/WHGo5/oahSlfZSBoozCNi8dash5fVdJXNgD6jORiVz9YC/rQJaXx++moZ9uakb8Lp
         q0ctE9coGzl2J7eocxRq2Q3vQLsxkXaO1Cw8f7+/bre+PGlfa1mldZSNCvcji8FN/foA
         t0I6IZWIwvV8UEFusjlhlT4eJjNlAly8saIYpZrsVaugG1U7WK4D7HbPKCkoPCCXj8tj
         BtDahZzR5pQ/jTncslQX60O0Xfavb7Pj3xFaaJS3ZxrdyIF5/gMeAiiOx5Nf8LGtXpNh
         wUkg==
X-Forwarded-Encrypted: i=1; AL+hErFLYmUBxeU3GfEDWbwgvkmiIcnb3E8YqTI/SQy9+maaLxeAxeDdBqScXyJjE3nq8rNhs/NaefPHCH4IkGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NoM/zbGSliO6lOCvfCiz7pmxITFH9WziB+G5O9OXSVLZfjXI/
	kfGysTIxBGUvba79LSZvYEBpUaZKkgCNzruW7yL6/BAAH6avp6nbR1sFlB73uft/Yf34LhrVSyi
	Wmfo8LY9yNO+K/cdp10lwrn4gcb5E7lJdf6kgetNeT79Xug/TzCgOo8PirPG/IKaOP8uTRetjJa
	9AO8ipdceQNk7YvKjEA+b3+xzDh0x3xN+NsatTPkizKZkUssYsy0bV//LR9rdUhQg+nNX0XTvF7
	D4Pq4bSSf6U3CO2ttpkA/j4
X-Gm-Gg: AZFdTZeIW2ek8TWlnmMv4gWB6sNLtkW3m1QypDwZEio5GLgh3o0C9t+vcx98MgU65EK
	/6I5r5DzPC/fx0IRD4CqBSk2Al5mPs5cS5tuOSYKel8IO0Lr3fhLcknk8RCX4fq5atBghY2voMu
	VEyMx/b9mExpA4Tv3oqd9RfmzUe9mKeow6sWPwbEOs9sLSP5s3yOvBu/2X4KoY51EFtDaY7dQxa
	463dkjUJlTDf+fiD5bC8u6A1Pm8V0YIe22sYowB8RmHnSOzpa6pnSGeQ+J4wGC7K8d3Z5ybEWr/
	mSJ18JBRh0HTRGiQZj5ugd8qxmkwBIPDZtDi3xBk+hqxjas8/aO1rnA4Aif/TvcaJSoSvUSCrqV
	aMVCI0cStHMdLMZvtkE6ztlCa9HfD+E2fO0G+choWvP0B7lBziw32If9omubO9gY9s0rVBtayTg
	mMSkelAgTP3nK2EQFUC8KzrI/LLhxH+w6RFK1nrUcc
X-Received: by 2002:a17:90b:52:b0:3b3:ba43:54c3 with SMTP id 98e67ed59e1d1-3b3d07c61d4mr3250562a91.33.1795032836130;
        Wed, 18 Nov 2026 12:13:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6a9aed7sm399637a91.4.2026.11.18.12.13.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92114c1e352so21184176d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032835; x=1795637635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqEoSsDLRwiTtXF4QHzskVicsJt/6mayXvEhwI8woOU=;
        b=EsALQCsuXxhjbc0jqsPBQ6PY9AW7CUvHgg1WNFYHBdp3+Og8jxPxQ5hA8y1U4b72Y7
         7uPr8RyKF+Wd802sl5mW5dhHhacdP3515QnUN/OfZ2kUbIu1czYlJZYqgejHkoW3rRYn
         KFpqZ+gkZMWULEQXh6Igba9wdIX3gLZToMuIA=
X-Forwarded-Encrypted: i=1; AL+hErGMuPTE/RlQ7nv61hmEu1lgHx4Wqg5XKVsZwztV3FVumubWgDp6as3KP69P4jExApFAjaL4jmSi0ExClWU=@vger.kernel.org
X-Received: by 2002:ac8:5ac2:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-55d5a622c5fmr62137741cf.48.1795032834587;
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
X-Received: by 2002:ac8:5ac2:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-55d5a622c5fmr62137191cf.48.1795032834127;
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:53 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH net 2/4] netfilter: flowtable: restore the GRE conntrack timeout on teardown
Date: Wed, 18 Nov 2026 12:12:48 -0800
Message-ID: <20261118201250.2075007-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
References: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
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

flow_offload_add() sets the timeout of the conntrack entry to NF_CT_DAY
for every offloaded flow, and the GC keeps extending it for GRE too.
flow_offload_fixup_ct() only restores the conntrack timeout of TCP and
UDP flows when the flow is torn down, so an offloaded GRE entry which does
not see any other packet on the slow path stays for up to a day instead
of expiring after the GRE conntrack timeout.

Restore the GRE timeout, replied or unreplied, as for UDP. GRE has no
offload timeout of its own, flow_offload_get_timeout() uses the default
flowtable timeout for it, so use that one when the flow expired.

Fixes: 4e8d9584d154 ("netfilter: flowtable: Support GRE")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 2aa2647ed9df..051b15aecd89 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -237,6 +237,18 @@ static void flow_offload_fixup_ct(struct flow_offload *flow)
 		timeout = READ_ONCE(tn->timeouts[state]);
 		expired = nf_flow_has_expired(flow);
 		offload_timeout = READ_ONCE(tn->offload_timeout);
+#ifdef CONFIG_NF_CT_PROTO_GRE
+	} else if (l4num == IPPROTO_GRE) {
+		const struct nf_gre_net *tn = nf_gre_pernet(net);
+		enum gre_conntrack state =
+			test_bit(IPS_SEEN_REPLY_BIT, &ct->status) ?
+			GRE_CT_REPLIED : GRE_CT_UNREPLIED;
+
+		timeout = READ_ONCE(tn->timeouts[state]);
+		expired = nf_flow_has_expired(flow);
+		/* GRE has no offload timeout: see flow_offload_get_timeout(). */
+		offload_timeout = NF_FLOW_TIMEOUT;
+#endif
 	} else {
 		return;
 	}
-- 
2.53.0

